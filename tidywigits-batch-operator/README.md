# Tidywigits Batch Operator

The [tidywigits-operator](../tidywigits-operator) processes one run at a time. That is the intention. The main use case for the [tidywigits-operator](../tidywigits-operator) is to keep track of the scheme.

When you want to "batch" process several runs (often a cohort dataset), you can use the instructions below.

## Steps

Install [requirements.txt](requirements.txt).
```
pip install -r requirements.txt
```

Use the Data Mart to prepare the manifest. See the [manifest.example.csv](manifest.example.csv).

This could go from a simple lookup query to a complex query depending on which data you want to process.

Here are the starter examples:
```sql
select * from mart.output where prefix like '%/oncoanalyser-wgts-dna/%';
select * from mart.output where prefix like '%/oncoanalyser-wgts-dna/%' and cohort_id = '<FILL>';
select * from mart.output where prefix like '%/oncoanalyser-wgts-dna/%' and bucket = '<FILL>';
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

Pull the docker image.
```
docker compose pull
```

You can either stage the data or mount the data. Choose one.

For example, if you are running on an EC2 instance, the [mount-s3](https://www.google.com/search?q=mount-s3) would look like this:
```
mount-s3 --read-only --allow-other s3://project-data-X1111111111Y-us-southeast-9/byob-icav2/project-name/analysis/oncoanalyser-wgts-dna/ ./data/input
```

For example, to sync the data from S3 to the local directory.
```
aws s3 sync --no-progress $(ONCOANALYSER_WGTS_DNA_SRC) $(ONCOANALYSER_WGTS_DNA_DST) \
		--exclude "*.bam" \
		--exclude "*.bam.bai" \
		--exclude "*.vcf.gz" \
		--exclude "*.vcf.gz.tbi" \
		--exclude "*.vcf" \
		--exclude "*.circos" \
		--exclude "*.png" \
		--exclude "*.err" \
		--exclude "*.out" \
		--exclude "*.run" \
		--exclude "*.sh" \
		--exclude ".nextflow/*"
```

Run the generator script.
```
python gen.py > gen.sh
```

Then run the bash script.
```
bash gen.sh 2>&1 | tee gen.log
```
