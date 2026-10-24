CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.lilac_qc (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `status` STRING,
  `score_margin` DOUBLE,
  `next_solution_alleles` STRING,
  `median_base_quality` DOUBLE,
  `hla_y_allele` STRING,
  `discarded_indels` DOUBLE,
  `discarded_indel_max_frags` DOUBLE,
  `discarded_alignment_fragments` DOUBLE,
  `a_low_coverage_bases` DOUBLE,
  `b_low_coverage_bases` DOUBLE,
  `c_low_coverage_bases` DOUBLE,
  `a_types` DOUBLE,
  `b_types` DOUBLE,
  `c_types` DOUBLE,
  `total_fragments` DOUBLE,
  `fitted_fragments` DOUBLE,
  `unmatched_fragments` DOUBLE,
  `uninformative_fragments` DOUBLE,
  `hla_y_fragments` DOUBLE,
  `percent_unique` DOUBLE,
  `percent_shared` DOUBLE,
  `percent_wildcard` DOUBLE,
  `unused_amino_acids` DOUBLE,
  `unused_amino_acid_max_frags` DOUBLE,
  `unused_haplotypes` DOUBLE,
  `unused_haplotype_max_frags` DOUBLE,
  `somatic_variants_matched` DOUBLE,
  `somatic_variants_unmatched` DOUBLE
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
