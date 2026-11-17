#!/usr/bin/env bash
set -euo pipefail


date
echo ----------------
echo
mkdir -p ./data/output/nemo/0.1.6/dragen/197010065f553aa6
time docker compose run -q --rm nemo-sync s3sync -w dragen -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/dragen-wgts-dna/197010065f553aa6/ -d ./input/dragen/197010065f553aa6
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/197010065f553aa6 -o ./output/nemo/0.1.6/dragen/197010065f553aa6 --ulid --prefix_include --input_id 197010065f553aa6
echo
mkdir -p ./data/output/nemo/0.1.6/dragen/197010070c451946
time docker compose run -q --rm nemo-sync s3sync -w dragen -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/dragen-tso500-ctdna/197010070c451946/ -d ./input/dragen/197010070c451946
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/197010070c451946 -o ./output/nemo/0.1.6/dragen/197010070c451946 --ulid --prefix_include --input_id 197010070c451946
echo
mkdir -p ./data/output/nemo/0.1.6/dragen/19701007100a522a
time docker compose run -q --rm nemo-sync s3sync -w dragen -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/dragen-wgts-dna/19701007100a522a/ -d ./input/dragen/19701007100a522a
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/19701007100a522a -o ./output/nemo/0.1.6/dragen/19701007100a522a --ulid --prefix_include --input_id 19701007100a522a
echo
mkdir -p ./data/output/nemo/0.1.6/wigits/19701007162c0dc4
time docker compose run -q --rm nemo-sync s3sync -w wigits -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna/19701007162c0dc4/ -d ./input/wigits/19701007162c0dc4
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/19701007162c0dc4 -o ./output/nemo/0.1.6/wigits/19701007162c0dc4 --ulid --prefix_include --input_id 19701007162c0dc4
echo
mkdir -p ./data/output/nemo/0.1.6/wigits/19701007193c0726
time docker compose run -q --rm nemo-sync s3sync -w wigits -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna/19701007193c0726/ -d ./input/wigits/19701007193c0726
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/19701007193c0726 -o ./output/nemo/0.1.6/wigits/19701007193c0726 --ulid --prefix_include --input_id 19701007193c0726
echo
mkdir -p ./data/output/nemo/0.1.6/wigits/1970100723876db8
time docker compose run -q --rm nemo-sync s3sync -w wigits -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna-rna/1970100723876db8/ -d ./input/wigits/1970100723876db8
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/1970100723876db8 -o ./output/nemo/0.1.6/wigits/1970100723876db8 --ulid --prefix_include --input_id 1970100723876db8
echo
mkdir -p ./data/output/nemo/0.1.6/dragen/197010088bc8aee5
time docker compose run -q --rm nemo-sync s3sync -w dragen -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/primary/261007_A01052_0328_BHCLJGDSXG/197010088bc8aee5/ -d ./input/dragen/197010088bc8aee5
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/197010088bc8aee5 -o ./output/nemo/0.1.6/dragen/197010088bc8aee5 --ulid --prefix_include --input_id 197010088bc8aee5
echo
mkdir -p ./data/output/nemo/0.1.6/dragen/197010071ebf137f
time docker compose run -q --rm nemo-sync s3sync -w dragen -s s3://pipeline-prod-cache-123456789123-ap-southeast-2/byob-icav2/production/analysis/bclconvert-interop-qc/197010071ebf137f/ -d ./input/dragen/197010071ebf137f
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/197010071ebf137f -o ./output/nemo/0.1.6/dragen/197010071ebf137f --ulid --prefix_include --input_id 197010071ebf137f
echo
echo ----------------
date
