CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.neo_candidates (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `ne_id` INT,
  `variant_type` STRING,
  `variant_info` STRING,
  `variant_cn` DOUBLE,
  `cn` DOUBLE,
  `subclonal_likelihood` DOUBLE,
  `gene_id_up` STRING,
  `gene_id_down` STRING,
  `gene_name_up` STRING,
  `gene_name_down` STRING,
  `chr_up` STRING,
  `chr_down` STRING,
  `orient_up` DOUBLE,
  `orient_down` DOUBLE,
  `aa_upstream` STRING,
  `aa_downstream` STRING,
  `aa_novel` STRING,
  `nmd_min` DOUBLE,
  `nmd_max` DOUBLE,
  `coding_bases_length_min` DOUBLE,
  `coding_bases_length_max` DOUBLE,
  `fused_intron_length` DOUBLE,
  `skipped_donors` DOUBLE,
  `skipped_acceptors` DOUBLE,
  `transcripts_up` STRING,
  `transcripts_down` STRING,
  `aa_wildtype` STRING,
  `coding_base_up_pos_start` DOUBLE,
  `coding_base_up_pos_end` DOUBLE,
  `coding_bases_up` STRING,
  `coding_base_cigar_up` STRING,
  `coding_base_down_pos_start` DOUBLE,
  `coding_base_down_pos_end` DOUBLE,
  `coding_bases_down` STRING,
  `coding_base_cigar_down` STRING
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
