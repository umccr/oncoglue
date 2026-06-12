# OncoGlue

OncoGlue – Frontline ETL for Pipeline Result Data Warehouse

## Tidywigits Operator User Guide

**Use Case:**

The tidywigits can write to multiple data sinks. In this repo, we only focus on "parquet" output and how to organise the data in a way that is easy to track and query in the **Cloud Datalake** setup fashion.

There are multiple modules for operating tidywigits in this repo. The operation stages are separated but interconnected like episodes. Depends on your use case, it is organised in a manner that gradually goes through these modules (or episodes) to achieve the desired result, or you get the idea on tailoring your operation needs. The episodes assume you have minimal or no experience with _Cloud Data Engineering_ knowledge but gradually learn the concepts and techniques by following the modules.

Try in the following order. You can stop at any point of the exploration.

* Episode 1: [tidywigits-operator](tidywigits-operator) _(I am just curious how tidywigits works.)_
* Episode 2: [tidywigits-query-examples](tidywigits-query-examples) _(I want to query it over tidywigits output parquet files.)_
* Episode 3: [tidywigits-batch-operator](tidywigits-batch-operator) _(I have a couple of datasets to process.)_
* Episode 4: [tidywigits-schema-translator](tidywigits-schema-translator) _(I want to keep track of schema and translate to other formats like Trino/Presto/Athena query engine, dbt, YAML, CSV formats.)_
* Episode 5: [tidywigits-schema-migrator](tidywigits-schema-migrator) _(Run the tidywigits migration in bulk.)_
* Episode 6: [tidywigits-datalake-maker](tidywigits-datalake-maker) _(I want to make datalake from tidywigits output.)_

Though the modules are written in mind with Cloud provider-agnostic, but there are subtle references to AWS S3 buckets. You can correlate to your Cloud environment storage counterpart.

**Automation:**

Aforementioned episodes^ are intentionally ad-hoc by nature for _exploration and educational_ purposes. We do have another development in progress for a more advanced approach with AWS specific infrastructure setup for automating Tidywigits operation for routine workflow run setting. This involves leveraging AWS Cloud technology mechanisms such as -- 
* EventBridge event subscription for Oncoanalyser pipeline event completion, 
* Sending workflow output result tidying task request into the AWS SQS queue and 
* Invoking tidywigits deployed in AWS Lambda function.

We will update to this section once the initial automation development is ready. Please reach us out for progress meantime, if any.

## Development

Create a Python virtual environment (any method) and install the dev toolchain [requirements](requirements.txt).

See [README_DEV.md](README_DEV.md) for more _comprehensive_ setup details.

```
conda activate oncoglue
make install
make check
```
