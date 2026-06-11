import argparse
import glob
import os
import subprocess
import sys
from pathlib import Path

from dotenv import load_dotenv
from pyarrow import parquet as pq
from ulid import ULID

load_dotenv()

DATALAKE_BUCKET = os.environ['DATALAKE_BUCKET']
DATALAKE_PREFIX = os.environ['DATALAKE_PREFIX']
TIDYWIGITS_OUTPUT_DIR = os.environ['TIDYWIGITS_OUTPUT_DIR']


def process_directory(path: Path, execute: bool, verify: bool) -> str:
    metadata_path = Path(path / 'metadata.parquet')

    metadata = pq.read_table(metadata_path).to_pylist()[0]

    input_id = metadata['input_id']
    output_id = metadata['output_id']

    assert path.name == input_id, f"input_id mismatch: dir={path.name} metadata={input_id}"

    # extract batch date from ULID
    batch_date = ULID.from_str(output_id).datetime.date()

    # construct target base datalake path
    target_base = f"s3://{DATALAKE_BUCKET}/{DATALAKE_PREFIX}/batch_date={batch_date}/portal_run_id={input_id}/batch_id={output_id}"

    sync_cmd = ["aws", "s3", "sync", "--no-progress", str(path), target_base]

    if execute:
        print(f"sync: {path} -> {target_base}")
        subprocess.run(sync_cmd, check=True)
        if verify:
            print(f"verify: {target_base}")
            subprocess.run(sync_cmd, check=True)
    else:
        print(f"aws s3 sync --no-progress {path} {target_base}")

    return target_base


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Push tidywigits output to datalake')
    parser.add_argument('--run-id', help='Process single RUN_ID directory only (default: all dirs in TIDYWIGITS_OUTPUT_DIR)')
    parser.add_argument('--execute', action='store_true', help='Execute aws s3 sync (default: dry-run print only)')
    parser.add_argument('--verify', action='store_true', help='Run sync a second time to verify completeness')
    args = parser.parse_args()

    if args.run_id:
        directory = Path(TIDYWIGITS_OUTPUT_DIR) / args.run_id
        if not directory.is_dir():
            print(f"ERROR: directory not found: {directory}", file=sys.stderr)
            sys.exit(1)
        process_directory(directory, args.execute, args.verify)
    else:
        for directory in glob.glob(f'{TIDYWIGITS_OUTPUT_DIR}/*'):
            path = Path(directory)
            if path.is_dir():
                process_directory(path, args.execute, args.verify)
