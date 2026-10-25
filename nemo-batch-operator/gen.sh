#!/usr/bin/env bash
set -euo pipefail


date
echo ----------------
echo
mkdir -p ./data/output/nemo/0.1.1/wigits/XXXX1015575349d5
time docker compose run -q --rm nemo-sync sync -w wigits -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna/XXXX1015575349d5/ -d ./input/wigits/XXXX1015575349d5
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/XXXX1015575349d5 -o ./output/nemo/0.1.1/wigits/XXXX1015575349d5 --ulid --prefix_include --input_id XXXX1015575349d5
echo
mkdir -p ./data/output/nemo/0.1.1/wigits/XXXX10156862eb1d
time docker compose run -q --rm nemo-sync sync -w wigits -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/oncoanalyser-wgts-dna/XXXX10156862eb1d/ -d ./input/wigits/XXXX10156862eb1d
time docker compose run -q --rm nemo tidy -w wigits -f parquet -d ./input/wigits/XXXX10156862eb1d -o ./output/nemo/0.1.1/wigits/XXXX10156862eb1d --ulid --prefix_include --input_id XXXX10156862eb1d
echo
mkdir -p ./data/output/nemo/0.1.1/dragen/XXXX1021b3d81578
time docker compose run -q --rm nemo-sync sync -w dragen -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/dragen-wgts-dna/XXXX1021b3d81578/ -d ./input/dragen/XXXX1021b3d81578
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/XXXX1021b3d81578 -o ./output/nemo/0.1.1/dragen/XXXX1021b3d81578 --ulid --prefix_include --input_id XXXX1021b3d81578
echo
mkdir -p ./data/output/nemo/0.1.1/dragen/XXXX1021c2aec4b6
time docker compose run -q --rm nemo-sync sync -w dragen -s s3://pipeline-prod-cache-503977275616-ap-southeast-2/byob-icav2/production/analysis/dragen-wgts-dna/XXXX1021c2aec4b6/ -d ./input/dragen/XXXX1021c2aec4b6
time docker compose run -q --rm nemo tidy -w dragen -f parquet -d ./input/dragen/XXXX1021c2aec4b6 -o ./output/nemo/0.1.1/dragen/XXXX1021c2aec4b6 --ulid --prefix_include --input_id XXXX1021c2aec4b6
echo
echo ----------------
date
