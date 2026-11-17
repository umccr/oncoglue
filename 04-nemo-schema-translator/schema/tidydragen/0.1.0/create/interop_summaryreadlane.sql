CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.interop_summaryreadlane (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `read` STRING,
  `lane` INT,
  `surface` INT,
  `tiles` INT,
  `density` DOUBLE,
  `density_sd` DOUBLE,
  `cluster_pf_pct` DOUBLE,
  `cluster_pf_pct_sd` DOUBLE,
  `legacy_phasing_rate` DOUBLE,
  `legacy_prephasing_rate` DOUBLE,
  `phasing_slope` DOUBLE,
  `phasing_offset` DOUBLE,
  `prephasing_slope` DOUBLE,
  `prephasing_offset` DOUBLE,
  `reads` DOUBLE,
  `reads_pf` DOUBLE,
  `pct_q30` DOUBLE,
  `yield` DOUBLE,
  `cycles_error` STRING,
  `aligned_pct` DOUBLE,
  `aligned_pct_sd` DOUBLE,
  `error_pct` DOUBLE,
  `error_pct_sd` DOUBLE,
  `error35_pct` DOUBLE,
  `error35_pct_sd` DOUBLE,
  `error75_pct` DOUBLE,
  `error75_pct_sd` DOUBLE,
  `error100_pct` DOUBLE,
  `error100_pct_sd` DOUBLE,
  `pct_occupied` DOUBLE,
  `pct_occupied_sd` DOUBLE,
  `intensity_c1` DOUBLE,
  `intensity_c1_sd` DOUBLE
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
