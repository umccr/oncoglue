# Tidywigits Schema Translator

This module auto-translates (generates) the tidywigits parquet output into [Athena EXTERNAL TABLE schema](schema) and dbt model schema for downstream data warehouse to consume.

It makes table semantics for Athena query engine or any compatible query engine like Trino, Presto, Redshift, etc.

## Prerequisites

* Requires one to run on a tidywigits output using the [operator module](../tidywigits-operator) and parquet files are being generated.

## Usage

Install Python dependencies if not done so.
```
pip3 install -r requirements.txt
```

Copy the example environment file and adjust it.
```
cp -v .env.example .env
```

Run diagnostics debug target.
```
make debug
```

Hit make run target to run the translator.
```
make run
```
