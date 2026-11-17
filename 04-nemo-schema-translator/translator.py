import os
from pathlib import Path

import pyarrow as pa
import pyarrow.parquet as pq
from ruamel.yaml import YAML
from dotenv import load_dotenv

load_dotenv()

# ---

# Initialize the YAML object
yaml = YAML()
yaml.default_flow_style = False
yaml.sort_keys = False

# Explicitly match pretty print format `yq -I2 -P '.' models/dcl/raw_vault/alignments/_schema.yml`
# mapping indentation = 2, sequence (list) indentation = 4, dash offset = 2
yaml.indent(mapping=2, sequence=4, offset=2)

# ---

# Mandatory environment variables
NEMO_IMAGE_TAG = os.environ['NEMO_IMAGE_TAG']
NEMO_WORKFLOW = os.getenv('NEMO_WORKFLOW', 'wigits')

# ---

# Landing zone bucket structure - See https://github.com/umccr/infrastructure-unimelb/issues/4

# Intentionally fixed bucket name as we share and keep track of the output schema in the public repo
lz_bucket = 's3://derived-secondary-data-123456789123-ap-southeast-2-an'

# One database and key prefix per workflow, matching the batch operator datalake prefixes. Keeping
# them separate also avoids a clash, as both workflows produce a `metadata` table.
LANDING_ZONES = {
    'wigits': {'pkg': 'tidywigits', 'dbname': 'tidywigits', 'key_prefix': 'tidywigits/v1'},
    'dragen': {'pkg': 'tidydragen', 'dbname': 'tidydragen', 'key_prefix': 'tidydragen/v1'},
}
assert NEMO_WORKFLOW in LANDING_ZONES, f"NEMO_WORKFLOW must be one of: {', '.join(LANDING_ZONES)} (got '{NEMO_WORKFLOW}')"

# Optional environment variables that could be overridden
lz_dbname = os.getenv('LZ_DBNAME', LANDING_ZONES[NEMO_WORKFLOW]['dbname'])
lz_key_prefix = os.getenv('LZ_KEY_PREFIX', LANDING_ZONES[NEMO_WORKFLOW]['key_prefix'])
lz_base = f'{lz_bucket}/{lz_key_prefix}'

# Intentional fixed structure to 03-nemo-batch-operator output convention
base_dir = Path(f'../03-nemo-batch-operator/data/output/nemo/{NEMO_IMAGE_TAG}/{NEMO_WORKFLOW}')

# Parsing package of the workflow. Output is versioned by this, as it defines the tables and
# columns; the nemo-image tag can change without any change to them.
PKG = LANDING_ZONES[NEMO_WORKFLOW]['pkg']


# ---

def load_metadata(run_dir: Path) -> dict:
    """Reads the metadata of a run, with the metadata table itself added to its parquet files."""

    metadata_file = Path(run_dir, 'metadata.parquet')
    arrow_tbl = pq.read_table(metadata_file).to_pylist()
    assert len(arrow_tbl) == 1, f"expected 1 row in {metadata_file}, got {len(arrow_tbl)}"

    metadata = arrow_tbl[0]

    # Add metadata table
    metadata['files'].append(
        {
            "tbl": "metadata",
            "prefix": "metadata",
            "fout": "metadata.parquet",
        }
    )

    return metadata


def collect_schemas(runs_dir: Path) -> tuple[str, dict[str, pa.Schema]]:
    """Builds one schema per table across all runs, as no single run has every table or column.

    Returns the package version of the runs too, which must be the same for all of them.
    """

    run_dirs = sorted(d for d in runs_dir.glob('*') if d.is_dir())
    assert len(run_dirs) > 0, f"no runs found in {runs_dir}"

    versions = set()
    tbl_schemas = {}
    for run_dir in run_dirs:
        metadata = load_metadata(run_dir)
        versions.update(p['version'] for p in metadata['pkg_versions'] if p['name'] == PKG)

        for file in metadata['files']:
            tbl_name = file.get('tbl_name', file.get('tbl'))  # handle legacy
            outpath = Path(run_dir, file.get('outpath', file.get('fout')))  # handle legacy
            tbl_schemas.setdefault(tbl_name, []).append(pq.read_schema(outpath))

    assert len(versions) == 1, f"expected one {PKG} version in {runs_dir}, got {sorted(versions)}"

    # column order is first seen, a type conflict between runs raises an error
    return versions.pop(), {tbl: pa.unify_schemas(schemas) for tbl, schemas in tbl_schemas.items()}


# ---

def pyarrow_to_athena_type(dtype):
    if pa.types.is_string(dtype):
        return "STRING"
    elif pa.types.is_int32(dtype):
        return "INT"
    elif pa.types.is_int64(dtype):
        return "BIGINT"
    elif pa.types.is_float32(dtype):
        return "FLOAT"
    elif pa.types.is_float64(dtype):
        return "DOUBLE"
    elif pa.types.is_boolean(dtype):
        return "BOOLEAN"
    elif pa.types.is_timestamp(dtype):
        return "TIMESTAMP"
    elif pa.types.is_date(dtype):
        return "DATE"
    elif pa.types.is_binary(dtype):
        return "BINARY"

    # ARRAY / LIST
    elif pa.types.is_list(dtype):
        element_type = pyarrow_to_athena_type(dtype.value_type)
        return f"ARRAY<{element_type}>"

    # STRUCT
    elif pa.types.is_struct(dtype):
        fields = [
            f"{field.name}: {pyarrow_to_athena_type(field.type)}"
            for field in dtype
        ]
        return f"STRUCT<{', '.join(fields)}>"

    raise ValueError(f"Unsupported type: {dtype}")


def pyarrow_to_dcl_type(dtype):
    if pa.types.is_string(dtype):
        return "VARCHAR"
    elif pa.types.is_int32(dtype):
        return "BIGINT"
    elif pa.types.is_int64(dtype):
        return "BIGINT"
    elif pa.types.is_float32(dtype):
        return "FLOAT"
    elif pa.types.is_float64(dtype):
        return "DOUBLE"
    elif pa.types.is_boolean(dtype):
        return "BOOLEAN"
    elif pa.types.is_timestamp(dtype):
        return "TIMESTAMP"
    elif pa.types.is_date(dtype):
        return "DATE"
    elif pa.types.is_binary(dtype):
        return "BINARY"

    elif pa.types.is_list(dtype):
        return f"ARRAY<{pyarrow_to_dcl_type(dtype.value_type)}>"

    elif pa.types.is_struct(dtype):
        fields = [
            f"{field.name}: {pyarrow_to_dcl_type(field.type)}"
            for field in dtype
        ]
        return f"STRUCT<{', '.join(fields)}>"

    raise ValueError(f"Unsupported type: {dtype}")


def pyarrow_to_athena(schema: pa.Schema):
    """Converts a pyarrow schema to a list of column definitions."""

    cols = []
    for field in schema:
        # Handle complex types recursively if needed
        dtype = pyarrow_to_athena_type(field.type)
        cols.append(f"`{field.name}` {dtype}")

    return ",\n  ".join(cols)


def pyarrow_to_csv(schema: pa.Schema):
    """Converts a pyarrow schema to a list of column definitions."""

    cols = []
    for field in schema:
        # Handle complex types recursively if needed
        dtype = pyarrow_to_dcl_type(field.type)
        cols.append(f"{field.name}, {dtype.lower()}")

    return "\n".join(cols)


def pyarrow_to_dict(schema: pa.Schema, tbl_name: str):
    """Converts a pyarrow schema to a list of column definitions."""

    columns = []
    for field in schema:
        # Handle complex types recursively if needed
        dtype = pyarrow_to_dcl_type(field.type)

        columns.append(
            {
                'name': field.name,
                'data_type': dtype.lower(),
            }
        )

    rd = {
        'models': [
            {
                'name': tbl_name,
                'columns': columns
            }
        ]
    }

    return rd


def pyarrow_to_dcl(schema: pa.Schema, tbl_name: str):
    """Converts a pyarrow schema to a list of column definitions."""

    columns = []

    # Add the DCL satellite structure
    _relationships = {
        'relationships': {
            'arguments': {
                'to': "ref('link_library_workflow_run')",
                'field': 'library_workflow_run_hk'
            }
        }
    }
    dcl_sat_cols = [
        {
            'name': 'library_workflow_run_hk',
            'data_type': 'varchar(64)',
            'data_tests': [
                'not_null',
                _relationships
            ]
        },
        {
            'name': 'load_date',
            'data_type': 'date',
        },
        {
            'name': 'hash_diff',
            'data_type': 'varchar(64)',
        },
        {
            'name': 'record_source',
            'data_type': 'varchar(255)',
        },
        {
            'name': 'last_seen_datetime',
            'data_type': 'timestamp',
        },
        {
            'name': 'batch_id',
            'data_type': 'varchar(26)',
        },
        {
            'name': 'batch_date',
            'data_type': 'date',
        },
    ]

    columns.extend(dcl_sat_cols)

    for field in schema:
        # skip fields
        if field.name in ['input_id', 'input_pfix', 'input_prefix', 'output_id']:
            continue

        # Handle complex types recursively if needed
        dtype = pyarrow_to_dcl_type(field.type)

        columns.append(
            {
                'name': field.name,
                'data_type': dtype.lower(),
            }
        )

    rd = {
        'version': 2,
        'models': [
            {
                'name': 'sat_' + tbl_name,
                'data_tests': [
                    {
                        'dbt_utils.unique_combination_of_columns': {
                            'arguments': {
                                'combination_of_columns': [
                                    'library_workflow_run_hk',
                                    'load_date',
                                    'hash_diff',
                                ]
                            }
                        }
                    }
                ],
                'columns': columns
            }
        ]
    }

    return rd


if __name__ == '__main__':

    pkg_version, tbl_schemas = collect_schemas(base_dir)
    tables = sorted(tbl_schemas)

    schema_out_base = f'schema/{PKG}/{pkg_version}/'
    schema_out_create = schema_out_base + 'create'
    schema_out_drop = schema_out_base + 'drop'
    schema_out_csv = schema_out_base + 'csv'
    schema_out_yml = schema_out_base + 'yml'
    schema_out_dcl = schema_out_base + 'dcl'
    schema_out_view = schema_out_base + 'view'

    os.makedirs(schema_out_create, exist_ok=True)
    os.makedirs(schema_out_drop, exist_ok=True)
    os.makedirs(schema_out_csv, exist_ok=True)
    os.makedirs(schema_out_yml, exist_ok=True)
    os.makedirs(schema_out_dcl, exist_ok=True)
    os.makedirs(schema_out_view, exist_ok=True)

    for tbl_name in tables:
        s: pa.Schema = tbl_schemas[tbl_name]
        # print(s)

        ddl_columns = pyarrow_to_athena(s)

        ddl_sql_create = f"""CREATE EXTERNAL TABLE IF NOT EXISTS {lz_dbname}.{tbl_name} (
  {ddl_columns}
)
PARTITIONED BY (
    batch_date string
)
STORED AS PARQUET
LOCATION '{lz_base}'
TBLPROPERTIES (
    'projection.enabled'='true',
    'projection.batch_date.type'='date',
    'projection.batch_date.range'='2026-01-01,NOW',
    'projection.batch_date.format'='yyyy-MM-dd',
    'storage.location.template'='{lz_base}/batch_date=${{batch_date}}/'
);
"""
        # print(ddl_sql_create)
        # print()
        # print("-" * 32)

        with open(schema_out_create + '/' + tbl_name + '.sql', 'w') as fo:
            fo.write(ddl_sql_create)

        ddl_sql_view = f"""CREATE OR REPLACE VIEW {lz_dbname}.v_{tbl_name} AS
SELECT *
FROM {lz_dbname}.{tbl_name}
WHERE regexp_like("$path", '{tbl_name}\\.parquet$')
;
"""
        with open(schema_out_view + '/' + tbl_name + '.sql', 'w') as fov:
            fov.write(ddl_sql_view)

        ddl_sql_drop = f"""DROP TABLE IF EXISTS {lz_dbname}.{tbl_name};"""
        # print(ddl_sql_drop)

        with open(schema_out_drop + '/' + tbl_name + '.sql', 'w') as fod:
            fod.write(ddl_sql_drop)

        with open(schema_out_csv + '/' + tbl_name + '.csv', 'w') as fs:
            fs.write(pyarrow_to_csv(s))

        with open(schema_out_yml + '/' + tbl_name + '.yml', 'w') as fy:
            yaml.dump(pyarrow_to_dict(s, tbl_name), fy)

        with open(schema_out_dcl + '/' + tbl_name + '.yml', 'w') as fc:
            fc.write("---\n")  # added yaml document divider between dumps
            yaml.dump(pyarrow_to_dcl(s, tbl_name), fc)

    # print(len(tables))
    # print("-" * 32)

    for tbl in tables:
        print(tbl)

    with open(schema_out_base + 'tables.txt', 'w') as fot:
        fot.write("\n".join(tables))

    sql_create_db = f"CREATE DATABASE IF NOT EXISTS {lz_dbname};"
    with open(schema_out_base + lz_dbname + '.sql', 'w') as fon:
        fon.write(sql_create_db)
