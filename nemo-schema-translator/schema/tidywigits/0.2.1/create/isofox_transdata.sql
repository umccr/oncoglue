CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.isofox_transdata (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `gene_id` STRING,
  `gene_name` STRING,
  `transcript_id` STRING,
  `transcript_name` STRING,
  `exon_count` INT,
  `transcript_length` INT,
  `effective_length` INT,
  `fitted_fragments` DOUBLE,
  `raw_fitted_fragments` DOUBLE,
  `tpm_adj` DOUBLE,
  `tpm_raw` DOUBLE,
  `transcript_bases_covered` DOUBLE,
  `sj_supported` DOUBLE,
  `sj_supported_unique` DOUBLE,
  `sj_fragments_unique` DOUBLE,
  `non_sj_fragments_unique` DOUBLE,
  `fragments_discordant` DOUBLE,
  `low_map_quality_fragments` DOUBLE
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
