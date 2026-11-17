import glob
import os
import sys
import time

import boto3
from botocore.exceptions import ClientError
from dotenv import load_dotenv

load_dotenv()

# Mandatory environment variables
NEMO_WORKFLOW = os.getenv('NEMO_WORKFLOW', 'wigits')
assert NEMO_WORKFLOW in ('wigits', 'dragen'), f"NEMO_WORKFLOW must be one of: wigits, dragen (got '{NEMO_WORKFLOW}')"

# package version of the schema, e.g. SCHEMA_VERSION_WIGITS; one per workflow
SCHEMA_VERSION = os.environ[f'SCHEMA_VERSION_{NEMO_WORKFLOW.upper()}']
MODE = os.environ['MODE']
assert MODE in ('create', 'view', 'drop'), f"MODE must be one of: create, view, drop (got '{MODE}')"
LZ_BUCKET = os.environ['LZ_BUCKET']
assert LZ_BUCKET.startswith('s3://') and not LZ_BUCKET.endswith('/'), f"LZ_BUCKET must be s3://<bucket> with no trailing slash (got '{LZ_BUCKET}')"
ATHENA_WORKGROUP = os.environ['ATHENA_WORKGROUP']
REGION_NAME = os.environ['REGION_NAME']
DRY_RUN = os.environ.get('DRY_RUN', 'true')

# One package and database per workflow: tidywigits, tidydragen
LZ_DBNAME = f'tidy{NEMO_WORKFLOW}'

glue = boto3.client('glue', region_name=REGION_NAME)
athena = boto3.client('athena', region_name=REGION_NAME)


def database_exists(db_name):
    try:
        glue.get_database(Name=db_name)
        return True
    except ClientError as e:
        if e.response['Error']['Code'] == 'EntityNotFoundException':
            return False
        raise e


def wait_for_query(query_execution_id):
    """Waits for an Athena query to finish, as start_query_execution does not report failures."""

    while True:
        status = athena.get_query_execution(QueryExecutionId=query_execution_id)['QueryExecution']['Status']
        if status['State'] in ('SUCCEEDED', 'FAILED', 'CANCELLED'):
            return status
        time.sleep(1)


if __name__ == '__main__':

    if not database_exists(LZ_DBNAME):
        print(f"Database {LZ_DBNAME} does not exist.")
        if DRY_RUN == 'false':
            exit(1)
        input("Press Enter to continue...")

    # intentionally hardcoded to depends on the schema translator output structure
    schemas = f'../04-nemo-schema-translator/schema/{LZ_DBNAME}/{SCHEMA_VERSION}/{MODE}/*.sql'
    schema_files = sorted(glob.glob(schemas))
    assert len(schema_files) > 0, f"no schema files found: {schemas}"

    for schema in schema_files:
        print(schema)

        with open(schema, 'r') as fo:
            query = fo.read()

            if MODE == 'create':
                # replace translator hardcoded bucket name now
                query = query.replace('s3://derived-secondary-data-123456789123-ap-southeast-2-an', LZ_BUCKET)

            if DRY_RUN == 'true':
                print(query)

            if DRY_RUN == 'false':
                response = athena.start_query_execution(
                    QueryString=query,
                    QueryExecutionContext={
                        'Database': LZ_DBNAME
                    },
                    WorkGroup=ATHENA_WORKGROUP
                )
                query_execution_id = response['QueryExecutionId']
                print(f"Query started with ID: {query_execution_id}")

                status = wait_for_query(query_execution_id)
                if status['State'] != 'SUCCEEDED':
                    # queries are safe to re-run: create and drop use IF [NOT] EXISTS, view uses OR REPLACE
                    print(f"Query {status['State']}: {status.get('StateChangeReason', 'no reason given')}", file=sys.stderr)
                    exit(1)

        print('-' * 32)

    if DRY_RUN == 'true':
        print("DRY RUN - no queries executed")
