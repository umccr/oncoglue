CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_sarqc (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `contamination_score` DOUBLE,
  `median_exon_coverage` DOUBLE,
  `pct_exon_1000x` DOUBLE,
  `gene_scaled_mad` DOUBLE,
  `median_bin_count_cnv_target` DOUBLE,
  `total_pf_reads` DOUBLE,
  `mean_family_size` DOUBLE,
  `median_target_coverage` DOUBLE,
  `pct_chimeric_reads` DOUBLE,
  `pct_exon_500x` DOUBLE,
  `pct_exon_1500x` DOUBLE,
  `pct_read_enrichment` DOUBLE,
  `pct_usable_umi_reads` DOUBLE,
  `mean_target_coverage` DOUBLE,
  `pct_aligned_reads` DOUBLE,
  `pct_contamination_est` DOUBLE,
  `pct_target_04x_mean` DOUBLE,
  `pct_target_500x` DOUBLE,
  `pct_target_1000x` DOUBLE,
  `pct_target_1500x` DOUBLE,
  `pct_duplexfamilies` DOUBLE,
  `median_insert_size` DOUBLE,
  `max_somatic_af` DOUBLE,
  `pct_soft_clipped_bases` DOUBLE,
  `pct_q30_bases` DOUBLE,
  `msi_pct_unstable_sites` DOUBLE,
  `msi_sum_jsd` DOUBLE,
  `tmb_per_mb` DOUBLE,
  `tmb_coding_region_size_mb` DOUBLE,
  `tmb_somatic_coding_variants_count` DOUBLE
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
