CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragenrna_quant (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `library_orientation` STRING,
  `genes_tot` DOUBLE,
  `transcripts_tot` DOUBLE,
  `genes_coding` DOUBLE,
  `transcript_cv_cov_median` DOUBLE,
  `cov_bias_5prime_median` DOUBLE,
  `cov_bias_3prime_median` DOUBLE,
  `genes_cov_gt1x` DOUBLE,
  `genes_cov_gt1x_pct` DOUBLE,
  `genes_cov_gt10x` DOUBLE,
  `genes_cov_gt10x_pct` DOUBLE,
  `genes_cov_gt30x` DOUBLE,
  `genes_cov_gt30x_pct` DOUBLE,
  `genes_cov_gt100x` DOUBLE,
  `genes_cov_gt100x_pct` DOUBLE,
  `frags_fwd_transcript` DOUBLE,
  `frags_fwd_transcript_pct` DOUBLE,
  `frags_rev_transcript` DOUBLE,
  `frags_rev_transcript_pct` DOUBLE,
  `frags_strand_mismatch` DOUBLE,
  `frags_strand_mismatch_pct` DOUBLE,
  `frags_strand_ambiguous` DOUBLE,
  `frags_strand_ambiguous_pct` DOUBLE,
  `frags_unknown_transcript` DOUBLE,
  `frags_unknown_transcript_pct` DOUBLE,
  `frags_intron` DOUBLE,
  `frags_intron_pct` DOUBLE,
  `frags_intergenic` DOUBLE,
  `frags_intergenic_pct` DOUBLE,
  `cov_fold_exons_all` DOUBLE,
  `cov_fold_introns` DOUBLE,
  `cov_fold_intergenic` DOUBLE,
  `cov_fold_exons_coding` DOUBLE
)
PARTITIONED BY (
    batch_date string
)
STORED AS PARQUET
LOCATION 's3://derived-secondary-data-123456789123-ap-southeast-2-an/tidydragen/v1'
TBLPROPERTIES (
    'projection.enabled'='true',
    'projection.batch_date.type'='date',
    'projection.batch_date.range'='2026-01-01,NOW',
    'projection.batch_date.format'='yyyy-MM-dd',
    'storage.location.template'='s3://derived-secondary-data-123456789123-ap-southeast-2-an/tidydragen/v1/batch_date=${batch_date}/'
);
