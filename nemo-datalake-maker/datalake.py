import glob
import io
import json
import os
from pathlib import Path

import pyarrow.json as paj
from dotenv import load_dotenv
from pyarrow import parquet as pq
from ulid import ULID

load_dotenv()

DATALAKE_BUCKET = os.environ['DATALAKE_BUCKET']
DATALAKE_PREFIX = os.environ['DATALAKE_PREFIX']
TIDYWIGITS_OUTPUT_DIR = os.environ['TIDYWIGITS_OUTPUT_DIR']


def make_lake():
    input_id = metadata['input_id']
    output_id = metadata['output_id']

    assert path.name == input_id, "input_id mismatch"

    # extract batch date from ULID
    batch_date = ULID.from_str(output_id).datetime.date()

    # construct target base datalake path
    target_base = f"s3://{DATALAKE_BUCKET}/{DATALAKE_PREFIX}/batch_date={batch_date}/portal_run_id={input_id}/batch_id={output_id}"

    print(f'aws s3 sync --no-progress {directory} {target_base}')


if __name__ == '__main__':

    base_dir = f'{TIDYWIGITS_OUTPUT_DIR}/*'

    # use glob to list all directories
    for directory in glob.glob(base_dir):
        # use Path to create a Path object
        path = Path(directory)
        # check if the path is a directory
        if path.is_dir():

            # look for the metadata file
            metadata_src = 'metadata.json'
            metadata_dst = '_metadata/metadata.json'
            metadata_par = 'metadata.parquet'

            metadata_path_src = Path(path / metadata_src)
            metadata_path_dst = Path(path / metadata_dst)
            metadata_path_par = Path(path / metadata_par)

            # Since tidywigits-0.0.7.9005, the `metadata.parquet` file is the default output format.
            # https://github.com/tidywf/tidywigits/issues/196
            if metadata_path_par.exists():
                metadata = pq.read_table(metadata_path_par).to_pylist()[0]

            # handle legacy json metadata
            else:

                # move metadata.json to _metadata/metadata.json if not done yet so
                if not metadata_path_dst.exists():
                    metadata_path_dst.parent.mkdir(parents=True, exist_ok=True)
                    metadata_path_src.rename(metadata_path_dst)

                with open(metadata_path_dst) as f:
                    metadata = json.load(f)

                    # convert to metadata.parquet if not done yet so
                    if not metadata_path_par.exists():
                        single_line = json.dumps(metadata).encode("utf-8")
                        meta_table = paj.read_json(io.BytesIO(single_line))
                        # print(table.schema)
                        pq.write_table(meta_table, metadata_path_par)

            make_lake()
