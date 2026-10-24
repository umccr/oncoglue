# OncoGlue

OncoGlue – Frontline ETL for Pipeline Result Data Warehouse

## Nemo Operator User Guide

**Use Case:**

In this repo we focus on the parquet output from [nemo][nemo]'s
[tidywigits][tidywigits] and [tidydragen][tidydragen] tools, and how to organise
the data in a way that is easy to track and query in the **Cloud Datalake**
setup fashion.

There are multiple modules for operating nemo in this repo. The operation stages
are separate but interconnected, like episodes. Depending on your use case, they
are organised so that you gradually work through the modules (or episodes) to
achieve the desired result, or get the idea on how to tailor them to your
operation needs. The episodes assume you have minimal or no _Cloud Data
Engineering_ experience, and gradually introduce the concepts and techniques as
you follow the modules.

Try in the following order. You can stop at any point of the exploration.

- Episode 1: [nemo-operator](nemo-operator) _(I am just curious how nemo
  works.)_
- Episode 2: [nemo-query-examples](nemo-query-examples) _(I want to query it
  over nemo output parquet files.)_
- Episode 3: [nemo-batch-operator](nemo-batch-operator) _(I have a couple of
  datasets to process.)_
- Episode 4: [nemo-schema-translator](nemo-schema-translator) _(I want to keep
  track of schema and translate to other formats like Trino/Presto/Athena query
  engine, dbt, YAML, CSV formats.)_
- Episode 5: [nemo-schema-migrator](nemo-schema-migrator) _(Run the nemo
  migration in bulk.)_
- Episode 6: [nemo-datalake-maker](nemo-datalake-maker) _(I want to make
  datalake from nemo output.)_

Although the modules are written to be Cloud provider-agnostic, there are subtle
references to AWS S3 buckets. You can map these to your own Cloud environment's
storage counterpart.

**Automation:**

The aforementioned episodes are intentionally ad-hoc in nature, for _exploration
and educational_ purposes. We do have further development in progress for a more
advanced approach, with an AWS-specific infrastructure setup to automate nemo
operation in a routine workflow-run setting. This involves leveraging AWS Cloud
mechanisms such as:

- EventBridge event subscription for Oncoanalyser pipeline completion events,
- Sending the workflow output tidying task request into an AWS SQS queue, and
- Invoking nemo deployed as an AWS Lambda function.

We will update this section once the initial automation development is ready.
Please reach out to us for progress in the meantime, if any.

## Development

Create a Python virtual environment (any method) and install the dev toolchain
[requirements](requirements.txt).

See [README_DEV.md](README_DEV.md) for more _comprehensive_ setup details.

```
conda activate oncoglue
make install
make check
```

[nemo]: https://github.com/tidywf/nemo
[tidywigits]: https://github.com/tidywf/tidywigits
[tidydragen]: https://github.com/tidywf/tidydragen
