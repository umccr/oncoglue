CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_germdeltsv (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `gene` STRING,
  `chrom` STRING,
  `chrom_band` STRING,
  `start_region` DOUBLE,
  `end_region` DOUBLE,
  `window_count_depth` DOUBLE,
  `start_exon` DOUBLE,
  `end_exon` DOUBLE,
  `detection_method` STRING,
  `status_germline` STRING,
  `status_tumor` STRING,
  `cn_germline` DOUBLE,
  `cn_tumor` DOUBLE,
  `filter` STRING,
  `cohort_frequency` DOUBLE,
  `reported` STRING
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
