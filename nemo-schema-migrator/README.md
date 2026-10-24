# Tidywigits Schema Migrator

This module runs database migration for the tidywigits translator output Athena EXTERNAL TABLE [schema](../tidywigits-schema-translator/schema).

## Prerequisites

* Requires one to run on a tidywigits translator output schema using the [translator module](../tidywigits-schema-translator) and SQL files are being generated.

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

We need an authenticated AWS session. 
Use your usual way of AWS CLI setup to authenticate.

For example:
```
export AWS_PROFILE=unimelb-warehouse-prod-poweruser
aws sso login
```

Create the database if it does not exist.
```
make check
make create
```

Alternatively, you can log on to the AWS Athena console and create the database using the SQL script – [tidywigits.sql](../tidywigits-schema-translator/schema/tidywigits/0.0.7.9005/2025091002d1f664/tidywigits.sql).

Hit make run target to run the migration.
```
make run
```
