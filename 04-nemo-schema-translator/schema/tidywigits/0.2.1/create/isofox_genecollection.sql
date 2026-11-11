CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.isofox_genecollection (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `gene_set_id` STRING,
  `gene_count` DOUBLE,
  `chrom` STRING,
  `range_start` DOUBLE,
  `range_end` DOUBLE,
  `total_frags` DOUBLE,
  `duplicates` DOUBLE,
  `supporting_trans` DOUBLE,
  `unspliced` DOUBLE,
  `alt_sj` DOUBLE,
  `chimeric` DOUBLE,
  `low_map_qual` DOUBLE,
  `fwd_strand` DOUBLE,
  `rev_strand` DOUBLE,
  `genes` STRING
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
