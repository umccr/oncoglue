CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.bamtools_partitionstats (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `pos_start` DOUBLE,
  `pos_end` DOUBLE,
  `total_reads` DOUBLE,
  `dup_reads` DOUBLE,
  `chim_reads` DOUBLE,
  `interpartition` DOUBLE,
  `unmap_reads` DOUBLE,
  `process_time` DOUBLE
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
