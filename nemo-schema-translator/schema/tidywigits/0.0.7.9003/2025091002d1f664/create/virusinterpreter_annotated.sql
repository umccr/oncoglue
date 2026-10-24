CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.virusinterpreter_annotated (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `taxid` STRING,
  `name` STRING,
  `qc_status` STRING,
  `integrations` DOUBLE,
  `interpretation` STRING,
  `percentage_covered` DOUBLE,
  `mean_coverage` DOUBLE,
  `expected_clonal_coverage` STRING,
  `reported` STRING,
  `blacklisted` STRING,
  `driver_likelihood` STRING
)
PARTITIONED BY (
    batch_date string
)
STORED AS PARQUET
LOCATION 's3://derived-secondary-data-123456789123-ap-southeast-2-an/tidywigits/v1'
TBLPROPERTIES (
    'projection.enabled'='true',
    'projection.batch_date.type'='date',
    'projection.batch_date.range'='2026-01-01,NOW',
    'projection.batch_date.format'='yyyy-MM-dd',
    'storage.location.template'='s3://derived-secondary-data-123456789123-ap-southeast-2-an/tidywigits/v1/batch_date=${batch_date}/'
);
