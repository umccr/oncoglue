CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.interop_indexsummarymain (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `lane` INT,
  `reads_tot` DOUBLE,
  `reads_pf` DOUBLE,
  `pct_identified` DOUBLE,
  `cv` DOUBLE,
  `pct_identified_min` DOUBLE,
  `pct_identified_max` DOUBLE
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
