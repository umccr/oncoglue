import argparse
import csv
import os

from dotenv import load_dotenv

load_dotenv()

MANIFEST_CSV = os.environ['MANIFEST_CSV']
NEMO_IMAGE_TAG = os.environ['NEMO_IMAGE_TAG']

# nemo workflow per analysis type, matched against the manifest `prefix`
WORKFLOWS = {
    'oncoanalyser-wgts-dna': 'wigits',
    'dragen-wgts-dna': 'dragen',
}


def workflow_for(prefix: str) -> str:
    for analysis, workflow in WORKFLOWS.items():
        if f'/{analysis}/' in f'/{prefix}':
            return workflow
    raise ValueError(f'no nemo workflow for prefix: {prefix}')


def datalake_prefix_for(workflow: str) -> str:
    # e.g. DATALAKE_PREFIX_WIGITS; one per workflow so they don't share a datalake prefix
    key = f'DATALAKE_PREFIX_{workflow.upper()}'
    prefix = os.getenv(key)
    if not prefix:
        raise ValueError(f'{key} not set in .env (needed for {workflow} rows)')
    return prefix


def tidy_cmds(prid: str, workflow: str, src: str) -> list[str]:
    indir = f'input/{workflow}/{prid}'
    outdir = f'output/nemo/{NEMO_IMAGE_TAG}/{workflow}/{prid}'
    # container paths are relative to working_dir /app; host paths to ./data (see compose.yml)
    sync = f'time docker compose run -q --rm nemo-sync sync -w {workflow} -s {src} -d ./{indir}'
    tidy = f'time docker compose run -q --rm nemo tidy -w {workflow} -f parquet -d ./{indir} -o ./{outdir} --ulid --prefix_include --input_id {prid}'
    return [f'mkdir -p ./data/{outdir}', sync, tidy]


def push_cmds(prid: str, workflow: str, execute: bool) -> list[str]:
    # datalake.py derives the target path from the tidy metadata.parquet (ULID output_id)
    flags = '--execute --verify' if execute else ''
    push = (
        f'DATALAKE_PREFIX={datalake_prefix_for(workflow)} '
        f'NEMO_OUTPUT_DIR=./data/output/nemo/{NEMO_IMAGE_TAG}/{workflow} '
        f'python datalake.py --run-id {prid} {flags}'
    )
    return [push.rstrip()]


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generate a batch script from the manifest')
    parser.add_argument('--push', action='store_true', help='Push tidy output to the datalake (gen_sync.sh) instead of sync + tidy (gen.sh)')
    parser.add_argument('--dryrun', action='store_true', help='With --push: only print the aws s3 sync commands')
    args = parser.parse_args()

    print('#!/usr/bin/env bash')
    print('set -euo pipefail')
    print('\n')

    print('date')
    print('echo ----------------')
    print('echo')

    with open(MANIFEST_CSV, 'r') as f:
        rows = csv.DictReader(f)
        for row in rows:
            prid = row['portal_run_id']
            workflow = workflow_for(row['prefix'])
            if args.push:
                cmds = push_cmds(prid, workflow, execute=not args.dryrun)
            else:
                cmds = tidy_cmds(prid, workflow, f"s3://{row['bucket']}/{row['prefix']}")

            for cmd in cmds:
                print(cmd)
            print('echo')

    print('echo ----------------')
    print('date')
