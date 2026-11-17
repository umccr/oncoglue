CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.isofox_summary (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sample_id` STRING,
  `qc_status` STRING,
  `frag_tot` DOUBLE,
  `frag_dup` DOUBLE,
  `frag_spliced_pct` DOUBLE,
  `frag_unspliced_pct` DOUBLE,
  `frag_alt_pct` DOUBLE,
  `frag_chimeric_pct` DOUBLE,
  `spliced_gene_count` DOUBLE,
  `read_length` DOUBLE,
  `frag_length_5th` DOUBLE,
  `frag_length_50th` DOUBLE,
  `frag_length_95th` DOUBLE,
  `enriched_gene_pct` DOUBLE,
  `median_gc_ratio` DOUBLE,
  `forward_strand_pct` DOUBLE
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
