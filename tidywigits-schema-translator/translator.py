import json
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
RUN_ID = os.environ['RUN_ID']
TIDYWIGITS_IMAGE_TAG = os.environ['TIDYWIGITS_IMAGE_TAG']

# Intentional fixed structure to tidywigits-operator output convention
base_dir = f'../tidywigits-operator/data/output/tidywigits/{TIDYWIGITS_IMAGE_TAG}/{RUN_ID}/'
schema_out_base = f'schema/tidywigits/{TIDYWIGITS_IMAGE_TAG}/{RUN_ID}/'

# ---

# Landing zone bucket structure - See https://github.com/umccr/infrastructure-unimelb/issues/4

# Intentionally fixed bucket name as we share and keep track of the output schema in the public repo
lz_bucket = 's3://derived-secondary-data-123456789123-ap-southeast-2-an'

# Optional environment variables that could be overridden
lz_dbname = os.getenv('LZ_DBNAME', 'tidywigits')
lz_key_prefix = os.getenv('LZ_KEY_PREFIX', 'tidywigits/v1')
lz_base = f'{lz_bucket}/{lz_key_prefix}'

# ---

# depends on tidywigits version, support loading metadata file from different locations
metadata_file = Path(base_dir, 'metadata.json')
if not metadata_file.exists():
    metadata_file = Path(base_dir, '_metadata/metadata.json')
if not metadata_file.exists():
    # fallback location
    metadata_file = Path(base_dir, 'metadata.parquet')
if not metadata_file.exists():
    # exhaustive fallback
    assert False, f"metadata file not found: {metadata_file}"

# check metadata file is parquet or json
par_files = []
if metadata_file.suffix == '.parquet':
    arrow_tbl = pq.read_table(metadata_file).to_pylist()
    assert len(arrow_tbl) == 1, f"expected 1 row in metadata.parquet, got {len(arrow_tbl)}"
    metadata = arrow_tbl[0]

    par_files = metadata['files']

    # Add metadata table
    par_files.append(
        {
            "tbl": "metadata",
            "prefix": "metadata",
            "fout": "metadata.parquet",
        }
    )

elif metadata_file.suffix == '.json':
    with open(metadata_file) as f:
        metadata = json.load(f)
        par_files = metadata['files']

if len(par_files) == 0:
    assert False, f"no parquet files found in {metadata_file}"


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

    tables = set()

    for file in par_files:
        tbl_name = file.get('tbl_name', file.get('tbl'))  # handle legacy
        tables.add(tbl_name)
        outpath = Path(base_dir, file.get('outpath', file.get('fout')))  # handle legacy
        s: pa.Schema = pq.read_schema(outpath)
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

    for tbl in sorted(tables):
        print(tbl)

    with open(schema_out_base + '/' + 'tables.txt', 'w') as fot:
        fot.write("\n".join(sorted(tables)))

    sql_create_db = f"CREATE DATABASE IF NOT EXISTS {lz_dbname};"
    with open(schema_out_base + '/' + lz_dbname + '.sql', 'w') as fon:
        fon.write(sql_create_db)
