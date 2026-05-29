import json
import os
from pathlib import Path

import pyarrow as pa
import pyarrow.parquet as pq
import yaml
from dotenv import load_dotenv

load_dotenv()

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

# depends on tidywigits version, metadata.json can be found in 2 locations
metadata_json = Path(base_dir, '_metadata/metadata.json')
if not metadata_json.exists():
    # fallback to old location
    metadata_json = Path(base_dir, 'metadata.json')

# ---

type_map_ddl = {
    pa.string(): "STRING",
    pa.int32(): "INT",
    pa.int64(): "BIGINT",
    pa.float64(): "DOUBLE",
    pa.float32(): "FLOAT",
    pa.bool_(): "BOOLEAN",
    pa.timestamp('ns'): "TIMESTAMP",
    pa.date32(): "DATE",
    pa.binary(): "BINARY"
}

type_map_dcl = {
    pa.string(): "VARCHAR",
    pa.int32(): "BIGINT",
    pa.int64(): "BIGINT",
    pa.float64(): "DOUBLE",
    pa.float32(): "FLOAT",
    pa.bool_(): "BOOLEAN",
    pa.timestamp('ns'): "TIMESTAMP",
    pa.date32(): "DATE",
    pa.binary(): "BINARY"
}


def pyarrow_to_athena(schema: pa.Schema):
    """Converts a pyarrow schema to a list of column definitions."""

    cols = []
    for field in schema:
        # Handle complex types recursively if needed
        dtype = type_map_ddl.get(field.type, "__STRING__")  # Default to string
        cols.append(f"`{field.name}` {dtype}")

    return ",\n  ".join(cols)


def pyarrow_to_csv(schema: pa.Schema):
    """Converts a pyarrow schema to a list of column definitions."""

    cols = []
    for field in schema:
        # Handle complex types recursively if needed
        dtype = type_map_dcl.get(field.type, "__STRING__")  # Default to string
        cols.append(f"{field.name}, {dtype.lower()}")

    return "\n".join(cols)


def pyarrow_to_dict(schema: pa.Schema, tbl_name: str):
    """Converts a pyarrow schema to a list of column definitions."""

    columns = []
    for field in schema:
        # Handle complex types recursively if needed
        dtype = type_map_dcl.get(field.type, "__STRING__")  # Default to string

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

    # Fixe DCL satellite structure
    dcl_sat_cols = [
        {
            'name': 'library_workflow_run_hk',
            'data_type': 'varchar(64)',
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
        if field.name in ['input_id', 'input_pfix', 'output_id']:
            continue

        # Handle complex types recursively if needed
        dtype = type_map_dcl.get(field.type, "__STRING__")  # Default to string

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

    os.makedirs(schema_out_create, exist_ok=True)
    os.makedirs(schema_out_drop, exist_ok=True)
    os.makedirs(schema_out_csv, exist_ok=True)
    os.makedirs(schema_out_yml, exist_ok=True)
    os.makedirs(schema_out_dcl, exist_ok=True)

    with open(metadata_json) as f:
        metadata = json.load(f)
        par_files = metadata['files']

        tables = set()

        # Add metadata table
        # tables.add('metadata')
        # par_files.append(
        #     {
        #         "tbl_name": "metadata",
        #         "prefix": "metadata",
        #         "outpath": "metadata.parquet"
        #     }
        # )

        for file in par_files:
            tbl_name = file['tbl_name']
            tables.add(tbl_name)

            outpath = Path(base_dir, file['outpath'])
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

            ddl_sql_drop = f"""DROP TABLE IF EXISTS {lz_dbname}.{tbl_name};"""
            # print(ddl_sql_drop)

            with open(schema_out_drop + '/' + tbl_name + '.sql', 'w') as fod:
                fod.write(ddl_sql_drop)

            with open(schema_out_csv + '/' + tbl_name + '.csv', 'w') as fs:
                fs.write(pyarrow_to_csv(s))

            with open(schema_out_yml + '/' + tbl_name + '.yml', 'w') as fy:
                yaml.dump(pyarrow_to_dict(s, tbl_name), fy, default_flow_style=False, sort_keys=False)

            with open(schema_out_dcl + '/' + tbl_name + '.yml', 'w') as fc:
                yaml.dump(pyarrow_to_dcl(s, tbl_name), fc, default_flow_style=False, sort_keys=False)

        # print(len(tables))
        # print("-" * 32)

    for tbl in sorted(tables):
        print(tbl)

    with open(schema_out_base + '/' + 'tables.txt', 'w') as fot:
        fot.write("\n".join(sorted(tables)))

    sql_create_db = f"CREATE DATABASE IF NOT EXISTS {lz_dbname};"
    with open(schema_out_base + '/' + lz_dbname + '.sql', 'w') as fon:
        fon.write(sql_create_db)
