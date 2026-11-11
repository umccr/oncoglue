CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragencov_metricsmain (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `bases_aligned_tot` DOUBLE,
  `bases_aligned_in_region` DOUBLE,
  `bases_aligned_in_region_pct` DOUBLE,
  `cov_alignment_avg` DOUBLE,
  `cov_uniformity_pct_gt02mean` DOUBLE,
  `cov_uniformity_pct_gt04mean` DOUBLE,
  `cov_x_median_ign0` DOUBLE,
  `cov_y_median_ign0` DOUBLE,
  `cov_mt_avg` DOUBLE,
  `cov_auto_avg` DOUBLE,
  `cov_auto_median` DOUBLE,
  `cov_mean_median_auto_ratio` DOUBLE,
  `reads_aligned_tot` DOUBLE,
  `reads_aligned_in_region` DOUBLE,
  `reads_aligned_in_region_pct` DOUBLE,
  `cov_x_avg` DOUBLE,
  `cov_y_avg` DOUBLE
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
