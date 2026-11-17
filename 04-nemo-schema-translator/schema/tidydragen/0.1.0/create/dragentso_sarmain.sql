CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_sarmain (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sample_id` STRING,
  `analysis_date` STRING,
  `analysis_time` STRING,
  `analysis_run_name` STRING,
  `analysis_name` STRING,
  `schema_version` STRING,
  `library_type` STRING,
  `library_id` STRING,
  `analysis_completed` STRING
)
PARTITIONED BY (
    batch_date string
)
STORED AS PARQUET
LOCATION 's3://derived-secondary-data-123456789123-ap-southeast-2-an/tidydragen/v1'
TBLPROPERTIES (
    'projection.enabled'='true',
    'projection.batch_date.type'='date',
    'projection.batch_date.range'='2026-01-01,NOW',
    'projection.batch_date.format'='yyyy-MM-dd',
    'storage.location.template'='s3://derived-secondary-data-123456789123-ap-southeast-2-an/tidydragen/v1/batch_date=${batch_date}/'
);
