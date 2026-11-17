CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.neo_scores (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `ne_ids` STRING,
  `variant_type` STRING,
  `variant_info` STRING,
  `gene` STRING,
  `allele` STRING,
  `peptide` STRING,
  `flank_up` STRING,
  `flank_down` STRING,
  `score` DOUBLE,
  `rank` DOUBLE,
  `likelihood` DOUBLE,
  `likelihood_rank` DOUBLE,
  `exp_likelihood` DOUBLE,
  `exp_likelihood_rank` DOUBLE,
  `tpm_effective` DOUBLE,
  `recog_sim` DOUBLE,
  `other_allele_recog_sim` DOUBLE,
  `allele_cn` DOUBLE,
  `allele_disrupted` STRING
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
