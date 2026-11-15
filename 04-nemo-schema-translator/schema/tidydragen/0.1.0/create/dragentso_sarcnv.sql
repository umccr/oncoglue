CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_sarcnv (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `foldchange` DOUBLE,
  `qual` DOUBLE,
  `cn_type` STRING,
  `gene` STRING,
  `chrom` STRING,
  `start` DOUBLE,
  `end` DOUBLE
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
