CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_cnvsomtsv (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `start` DOUBLE,
  `end` DOUBLE,
  `cn` DOUBLE,
  `baf_count` DOUBLE,
  `baf_observed` DOUBLE,
  `baf` DOUBLE,
  `start_segment_support` STRING,
  `end_segment_support` STRING,
  `method` STRING,
  `window_count_depth` DOUBLE,
  `gc_content` DOUBLE,
  `start_min` DOUBLE,
  `start_max` DOUBLE,
  `cn_minor_allele` DOUBLE,
  `cn_major_allele` DOUBLE
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
