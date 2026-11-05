#!/usr/bin/env bash
set -euo pipefail


date
echo ----------------
echo
mkdir -p ./data/output/nemo/0.1.2/dragen/197010065f553aa6
time docker compose run -q --rm nemo-sync sync -w dragen -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/dragen-wgts-dna/197010065f553aa6/ -d ./input/dragen/197010065f553aa6
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/197010065f553aa6 -o ./output/nemo/0.1.2/dragen/197010065f553aa6 --ulid --prefix_include --input_id 197010065f553aa6
echo
mkdir -p ./data/output/nemo/0.1.2/dragen/197010070c451946
time docker compose run -q --rm nemo-sync sync -w dragen -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/dragen-tso500-ctdna/197010070c451946/ -d ./input/dragen/197010070c451946
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/197010070c451946 -o ./output/nemo/0.1.2/dragen/197010070c451946 --ulid --prefix_include --input_id 197010070c451946
echo
mkdir -p ./data/output/nemo/0.1.2/dragen/19701007100a522a
time docker compose run -q --rm nemo-sync sync -w dragen -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/dragen-wgts-dna/19701007100a522a/ -d ./input/dragen/19701007100a522a
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/19701007100a522a -o ./output/nemo/0.1.2/dragen/19701007100a522a --ulid --prefix_include --input_id 19701007100a522a
echo
mkdir -p ./data/output/nemo/0.1.2/wigits/19701007162c0dc4
time docker compose run -q --rm nemo-sync sync -w wigits -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna/19701007162c0dc4/ -d ./input/wigits/19701007162c0dc4
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/19701007162c0dc4 -o ./output/nemo/0.1.2/wigits/19701007162c0dc4 --ulid --prefix_include --input_id 19701007162c0dc4
echo
mkdir -p ./data/output/nemo/0.1.2/wigits/19701007193c0726
time docker compose run -q --rm nemo-sync sync -w wigits -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna/19701007193c0726/ -d ./input/wigits/19701007193c0726
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/19701007193c0726 -o ./output/nemo/0.1.2/wigits/19701007193c0726 --ulid --prefix_include --input_id 19701007193c0726
echo
mkdir -p ./data/output/nemo/0.1.2/wigits/1970100723876db8
time docker compose run -q --rm nemo-sync sync -w wigits -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna-rna/1970100723876db8/ -d ./input/wigits/1970100723876db8
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/1970100723876db8 -o ./output/nemo/0.1.2/wigits/1970100723876db8 --ulid --prefix_include --input_id 1970100723876db8
echo
echo ----------------
date
