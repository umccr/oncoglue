# OncoGlue

OncoGlue – Frontline ETL for Pipeline Result Data Warehouse

## Tidywigits Operator User Guide

Use Case:
The tidywigits can write to multiple data sinks. In this repo, we only focus on "parquet" output and how to organise the data in a way that is easy to track and query in the Cloud Datalake setup fashion.

There are multiple modules for operating tidywigits in this repo. The operation stages are separated but interconnected like episodes. Depends on your use case, it is organised in a manner that gradually goes through these modules (or episodes) to achieve the desired result, or you get the idea on tailoring your operation needs.

Try in the following order. You can stop at any point of the exploration.

* Episode 1: [tidywigits-operator](tidywigits-operator) _(I am just curious how tidywigits works.)_
* Episode 2: [tidywigits-batch-operator](tidywigits-batch-operator) _(I have a couple of datasets to process.)_
* Episode 3: [tidywigits-schema-translator](tidywigits-schema-translator) _(I want to keep track of schema and translate to other formats like Trino/Presto like Athena query engine, dbt, YAML, CSV formats.)_
* Episode 4: [tidywigits-schema-migrator](tidywigits-schema-migrator) _(Run the tidywigits migration in bulk.)_
* Episode 5: [tidywigits-datalake-maker](tidywigits-datalake-maker) _(I want to make datalake from tidywigits output.)_

Though the modules are written in mind with Cloud provider-agnostic, but there are subtle references to AWS S3 buckets. You can correlate to your Cloud environment storage counterpart.

We do have development in progress for AWS specific infrastructure setup for operationalising Tidywigits in routine workflow run setting. This involves leveraging EventBridge event subscription, AWS SQS queue and AWS Lambda function mechanisms. We will update to this section once the initial development is ready. Please reach us out for progress meantime, if any.

## Development

Create a Python virtual environment (any method) and install the dev toolchain [requirements](requirements.txt).

See [README_DEV.md](README_DEV.md) for more _comprehensive_ setup details.

```
conda activate oncoglue
make install
make check
```
