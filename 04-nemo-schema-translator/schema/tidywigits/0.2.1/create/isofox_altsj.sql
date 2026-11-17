CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.isofox_altsj (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `gene_id` STRING,
  `gene_name` STRING,
  `chrom` STRING,
  `sj_start` DOUBLE,
  `sj_end` DOUBLE,
  `type` STRING,
  `frag_count` DOUBLE,
  `dp_start` DOUBLE,
  `dp_end` DOUBLE,
  `region_start` STRING,
  `region_end` STRING,
  `bases_start` STRING,
  `bases_end` STRING,
  `trans_start` STRING,
  `trans_end` STRING,
  `nearest_start_exon` DOUBLE,
  `nearest_end_exon` DOUBLE,
  `init_read_id` STRING
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
