CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.cider_blastn (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `cdr3_seq` STRING,
  `cdr3_aa` STRING,
  `match_type` STRING,
  `gene` STRING,
  `functionality` STRING,
  `p_ident` DOUBLE,
  `seq_length` DOUBLE,
  `align_start` DOUBLE,
  `align_end` DOUBLE,
  `align_gaps` DOUBLE,
  `align_evalue` DOUBLE,
  `align_bitscore` DOUBLE,
  `ref_strand` STRING,
  `ref_start` DOUBLE,
  `ref_end` DOUBLE,
  `ref_contig` STRING,
  `ref_seq` STRING
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
