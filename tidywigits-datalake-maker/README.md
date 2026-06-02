# Tidywigits Datalake Maker

After you have processed (tidied up) the data into parquet files, you can use this tool to move the data to the datalake bucket.

## Steps

Install the [requirements.txt](requirements.txt) dependencies.
```
pip install -r requirements.txt
```

Configure the environment variables [.env.example](.env.example) and adjust it.
```
cp -v .env.example .env
```

Run the Python script.
```
python datalake.py
```

It prints out the AWS S3 command for you to sync to the datalake bucket.

## Note

The datalake bucket structure follows the Centre (UMCCR/CCGCM) infrastructure convention.

See the discussion here – https://github.com/umccr/infrastructure-unimelb/issues/4
