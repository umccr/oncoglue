CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.interop_summarymain (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `level` STRING,
  `yield` DOUBLE,
  `yield_projected` DOUBLE,
  `aligned_pct` DOUBLE,
  `error_rate` DOUBLE,
  `intensity_c1` DOUBLE,
  `pct_q30` DOUBLE,
  `pct_occupied` DOUBLE
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
