CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.neo_predictions (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `ne_id` INT,
  `variant_type` STRING,
  `variant_info` STRING,
  `gene_name` STRING,
  `aa_up` STRING,
  `aa_novel` STRING,
  `aa_down` STRING,
  `peptide_count` DOUBLE,
  `tpm_source` STRING,
  `rna_frags` DOUBLE,
  `rna_depth` DOUBLE,
  `tpm_up` DOUBLE,
  `tpm_down` DOUBLE,
  `tpm_expected` DOUBLE,
  `tpm_raw_effective` DOUBLE,
  `tpm_effective` DOUBLE,
  `tpm_cancer_up` DOUBLE,
  `tpm_cancer_down` DOUBLE,
  `tpm_pancancer_up` DOUBLE,
  `tpm_pancancer_down` DOUBLE,
  `nmd_min` DOUBLE,
  `nmd_max` DOUBLE,
  `coding_bases_length_min` DOUBLE,
  `coding_bases_length_max` DOUBLE,
  `fused_intron_length` DOUBLE,
  `skipped_donors` DOUBLE,
  `skipped_acceptors` DOUBLE,
  `transcripts_up` STRING,
  `transcripts_down` STRING,
  `variant_cn` DOUBLE,
  `cn` DOUBLE,
  `subclonal_likelihood` DOUBLE
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
