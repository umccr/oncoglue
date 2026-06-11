CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.bamtools_flagstats (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `passed_or_failed` STRING,
  `total` DOUBLE,
  `primary` DOUBLE,
  `secondary` DOUBLE,
  `suppl` DOUBLE,
  `dup` DOUBLE,
  `primary_dup` DOUBLE,
  `mapped` DOUBLE,
  `primary_map` DOUBLE,
  `paired_in_seq` DOUBLE,
  `read1` DOUBLE,
  `read2` DOUBLE,
  `proper_pair` DOUBLE,
  `both_map` DOUBLE,
  `singletons` DOUBLE,
  `matemap_diff` DOUBLE,
  `matemap_diff_mapq5` DOUBLE,
  `mapped_pct` DOUBLE,
  `primary_map_pct` DOUBLE,
  `proper_pair_pct` DOUBLE,
  `singletons_pct` DOUBLE
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
