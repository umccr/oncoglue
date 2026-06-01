import csv
import os

from dotenv import load_dotenv

load_dotenv()

MANIFEST_CSV = os.environ['MANIFEST_CSV']
TIDYWIGITS_IMAGE_TAG = os.environ['TIDYWIGITS_IMAGE_TAG']

if __name__ == '__main__':
    print('#!/usr/bin/env bash')
    print('set -euo pipefail')
    print('\n')

    print('date')
    print('echo ----------------')
    print('echo')

    with open(MANIFEST_CSV, 'r') as f:
        rows = csv.DictReader(f)
        # i = 1
        for row in rows:
            # if i > 2: break
            prid = row['portal_run_id']
            cmd = f'time docker compose run -q --rm tidywigits tidywigits.R tidy -f parquet -d ./data/input/{prid} -o ./data/output/tidywigits/{TIDYWIGITS_IMAGE_TAG}/{prid} --ulid --prefix_include --input_id {prid}'

            print(cmd)
            print('echo')
            # i += 1

    print('echo ----------------')
    print('date')
