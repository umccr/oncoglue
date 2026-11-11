# Nemo Schema Translator

This module auto-translates (generates) the nemo parquet output into [Athena EXTERNAL TABLE schema](schema) and dbt model schema for downstream data warehouse to consume.

It makes table semantics for Athena query engine or any compatible query engine like Trino, Presto, Redshift, etc.

## Prerequisites

* Requires parquet output from the [batch operator module](../03-nemo-batch-operator). The schema is built from every run under `data/output/nemo/{NEMO_IMAGE_TAG}/{NEMO_WORKFLOW}/`, as no single run has all the tables or columns. Include each type of run you want covered.

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

Hit make run target to run the translator, once per workflow.
```
make run NEMO_WORKFLOW=wigits
make run NEMO_WORKFLOW=dragen
```

Each workflow has its own Athena database, and output goes to `schema/{package}/{package version}/`, e.g. `schema/tidywigits/0.2.1/`. The version comes from the run metadata, as the package defines the tables and columns, not the nemo-image tag. All runs must have the same package version.

| Workflow | Package and database | Key prefix      |
| -------- | -------------------- | --------------- |
| `wigits` | `tidywigits`         | `tidywigits/v1` |
| `dragen` | `tidydragen`         | `tidydragen/v1` |

Table names come from the run metadata, not from the parquet file names, so sample prefixes (`L2600743_`) aren't part of them. If a column has different types across runs, the translator stops with an error.
