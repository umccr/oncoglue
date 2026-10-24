CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_purityrange (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `purity` DOUBLE,
  `norm_factor` DOUBLE,
  `score` DOUBLE,
  `diploid_proportion` DOUBLE,
  `ploidy` DOUBLE,
  `somatic_penalty` DOUBLE
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
