CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_cnvgenetsv (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `start` DOUBLE,
  `end` DOUBLE,
  `gene` STRING,
  `cn_min` DOUBLE,
  `cn_max` DOUBLE,
  `somatic_regions` DOUBLE,
  `transcript_id` STRING,
  `is_canonical` STRING,
  `chrom_band` STRING,
  `regions_min` DOUBLE,
  `start_region_min` DOUBLE,
  `end_region_min` DOUBLE,
  `start_region_min_support` STRING,
  `end_region_min_support` STRING,
  `region_min_method` STRING,
  `cn_minor_allele_min` DOUBLE,
  `window_count_depth` DOUBLE,
  `gc_content` DOUBLE
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
