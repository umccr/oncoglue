CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragenmap_gcmain (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `window_size` INT,
  `windows_valid` DOUBLE,
  `windows_discarded` DOUBLE,
  `gc_ref_avg` DOUBLE,
  `cov_global_mean` DOUBLE,
  `cov_norm_gc_0_19` DOUBLE,
  `cov_norm_gc_20_39` DOUBLE,
  `cov_norm_gc_40_59` DOUBLE,
  `cov_norm_gc_60_79` DOUBLE,
  `cov_norm_gc_80_100` DOUBLE,
  `at_dropout` DOUBLE,
  `gc_dropout` DOUBLE
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
