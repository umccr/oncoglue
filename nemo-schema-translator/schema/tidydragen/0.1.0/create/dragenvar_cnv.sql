CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragenvar_cnv (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `bases_in_ref_genome` DOUBLE,
  `cov_alignment_avg_over_genome` DOUBLE,
  `n_alignment` DOUBLE,
  `n_filt_tot` DOUBLE,
  `n_filt_tot_pct` DOUBLE,
  `n_filt_dup` DOUBLE,
  `n_filt_dup_pct` DOUBLE,
  `n_filt_mapq` DOUBLE,
  `n_filt_mapq_pct` DOUBLE,
  `n_filt_unmap` DOUBLE,
  `n_filt_unmap_pct` DOUBLE,
  `coverage_mad` DOUBLE,
  `gene_scaled_mad` DOUBLE,
  `median_bin_count` DOUBLE,
  `n_target_intervals` DOUBLE,
  `n_samp_norm` DOUBLE,
  `n_seg` DOUBLE,
  `n_amp` DOUBLE,
  `n_del` DOUBLE,
  `n_amp_pass` DOUBLE,
  `n_amp_pass_pct` DOUBLE,
  `n_del_pass` DOUBLE,
  `n_del_pass_pct` DOUBLE,
  `sex_karyotype` STRING,
  `sex_genotyper_confidence` DOUBLE,
  `pmad` DOUBLE,
  `outlier_baf_fraction` DOUBLE,
  `purity_tumor` DOUBLE,
  `cov_diploid` DOUBLE,
  `ploidy_overall` DOUBLE,
  `homozygosity_index` DOUBLE
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
