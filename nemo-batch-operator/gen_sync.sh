#!/usr/bin/env bash
set -euo pipefail


date
echo ----------------
echo
DATALAKE_PREFIX=tidydragen/v1 NEMO_OUTPUT_DIR=./data/output/nemo/0.1.2/dragen python datalake.py --run-id 197010065f553aa6 --execute --verify
echo
DATALAKE_PREFIX=tidydragen/v1 NEMO_OUTPUT_DIR=./data/output/nemo/0.1.2/dragen python datalake.py --run-id 197010070c451946 --execute --verify
echo
DATALAKE_PREFIX=tidydragen/v1 NEMO_OUTPUT_DIR=./data/output/nemo/0.1.2/dragen python datalake.py --run-id 19701007100a522a --execute --verify
echo
DATALAKE_PREFIX=tidywigits/v1 NEMO_OUTPUT_DIR=./data/output/nemo/0.1.2/wigits python datalake.py --run-id 19701007162c0dc4 --execute --verify
echo
DATALAKE_PREFIX=tidywigits/v1 NEMO_OUTPUT_DIR=./data/output/nemo/0.1.2/wigits python datalake.py --run-id 19701007193c0726 --execute --verify
echo
DATALAKE_PREFIX=tidywigits/v1 NEMO_OUTPUT_DIR=./data/output/nemo/0.1.2/wigits python datalake.py --run-id 1970100723876db8 --execute --verify
echo
echo
echo ----------------
date
