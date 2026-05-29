import glob
import os

import boto3
from botocore.exceptions import ClientError
from dotenv import load_dotenv

load_dotenv()

# Mandatory environment variables
RUN_ID = os.environ['RUN_ID']
TIDYWIGITS_IMAGE_TAG = os.environ['TIDYWIGITS_IMAGE_TAG']
MODE = os.environ['MODE']
LZ_BUCKET = os.environ['LZ_BUCKET']
LZ_DBNAME = os.environ['LZ_DBNAME']
ATHENA_WORKGROUP = os.environ['ATHENA_WORKGROUP']
REGION_NAME = os.environ['REGION_NAME']
DRY_RUN = os.environ.get('DRY_RUN', 'true')

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


if __name__ == '__main__':

    if not database_exists(LZ_DBNAME):
        print(f"Database {LZ_DBNAME} does not exist.")
        if DRY_RUN == 'false':
            exit(1)
        input("Press Enter to continue...")

    # intentionally hardcoded to depends on the schema translator output structure
    schemas = f'../tidywigits-schema-translator/schema/tidywigits/{TIDYWIGITS_IMAGE_TAG}/{RUN_ID}/{MODE}/*.sql'

    for schema in glob.glob(schemas):
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

        print('-' * 32)

    if DRY_RUN == 'true':
        print("DRY RUN - no queries executed")
