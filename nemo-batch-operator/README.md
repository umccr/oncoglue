# Nemo Batch Operator

The [nemo-operator](../nemo-operator) processes one run at a time.
When you want to "batch" process several runs (often a cohort dataset), you can use the instructions below.

## Steps

Install [requirements.txt](requirements.txt).
```
pip install -r requirements.txt
```

Use the Data Mart to prepare the manifest. See the [manifest.example.csv](manifest.example.csv).

This could go from a simple lookup query to a complex query depending on which data you want to process.

Here are the starter examples. `portal_run_id` starts with the run date (`YYYYMMDD` + random suffix, e.g. `2026102379c97e37`), so a prefix match filters by date: `'202610%'` for October 2026, `'2026%'` for all of 2026.
```sql
select * from mart.output
where (prefix like '%/oncoanalyser-wgts-dna/%' or prefix like '%/dragen-wgts-dna/%')
  and portal_run_id like '202610%';

select * from mart.output
where (prefix like '%/oncoanalyser-wgts-dna/%' or prefix like '%/dragen-wgts-dna/%')
  and portal_run_id like '202610%'
  and cohort_id = '<FILL>';

select * from mart.output
where (prefix like '%/oncoanalyser-wgts-dna/%' or prefix like '%/dragen-wgts-dna/%')
  and portal_run_id like '202610%'
  and bucket = '<FILL>';
```

Prepare the environment variables and adjust where needed.
```
cp -v .env.example .env
cp -v manifest.example.csv manifest.csv
```

Prepare the directory layout.
```
make dir
```

Pull [nemo-image](https://github.com/tidywf/nemo-image) (bundles nemo + tidywigits + tidydragen).
```
make pull
```

We need an authenticated AWS session (the `nemo-sync` service mounts `~/.aws` and passes `AWS_PROFILE` etc. through).
```
export AWS_PROFILE=umccr-prod-operator
aws sso login
```

Run the generator script. The nemo workflow is derived from each manifest row's `prefix`
(`oncoanalyser-wgts-dna` → `wigits`, `dragen-wgts-dna` → `dragen`; see `WORKFLOWS` in [gen.py](gen.py)),
so one manifest can mix both. For each row, `gen.sh` runs `nemo sync` (stages only the files nemo parses,
from `s3://<bucket>/<prefix>` into `./data/input/<workflow>/<portal_run_id>/`) and then `nemo tidy`
into `./data/output/nemo/<NEMO_IMAGE_TAG>/<workflow>/<portal_run_id>/`.
```
make gen
# or: python gen.py > gen.sh
```

Then run the bash script.
```
bash gen.sh 2>&1 | tee gen.log
```

Push the tidy output to the datalake. Set `DATALAKE_BUCKET` and `DATALAKE_PREFIX_<WORKFLOW>` in `.env`
(one prefix per workflow in the manifest). `datalake.py` reads each run's `metadata.parquet` and syncs to
`s3://<DATALAKE_BUCKET>/<prefix>/batch_date=<date>/portal_run_id=<id>/batch_id=<output_id>`, then syncs
again to verify.
```
make gen-sync-dryrun && bash gen_sync.sh   # print the aws s3 sync commands only
make gen-sync && bash gen_sync.sh 2>&1 | tee gen_sync.log
```
