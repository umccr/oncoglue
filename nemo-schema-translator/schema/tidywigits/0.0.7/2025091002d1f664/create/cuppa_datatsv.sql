CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.cuppa_datatsv (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `sample_id` STRING,
  `data_type` STRING,
  `clf_group` STRING,
  `clf_name` STRING,
  `feat_name` STRING,
  `feat_value` DOUBLE,
  `cancer_type` STRING,
  `data_value` DOUBLE,
  `rank` DOUBLE,
  `rank_group` DOUBLE
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
