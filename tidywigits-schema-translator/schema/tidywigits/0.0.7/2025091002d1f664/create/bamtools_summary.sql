CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.bamtools_summary (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `tot_region_bases` DOUBLE,
  `tot_reads` DOUBLE,
  `dup_reads` DOUBLE,
  `dual_strand_reads` DOUBLE,
  `cov_mean` DOUBLE,
  `cov_sd` DOUBLE,
  `cov_median` DOUBLE,
  `cov_mad` DOUBLE,
  `lowmapq_pct` DOUBLE,
  `dup_pct` DOUBLE,
  `unpaired_pct` DOUBLE,
  `lowbaseq_pct` DOUBLE,
  `overlap_read_pct` DOUBLE,
  `cov_capped` DOUBLE
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
