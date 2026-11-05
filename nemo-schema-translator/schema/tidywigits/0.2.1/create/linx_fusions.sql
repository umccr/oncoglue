CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_fusions (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `breakendid5` STRING,
  `breakendid3` STRING,
  `name` STRING,
  `reported` STRING,
  `reported_type` STRING,
  `reportable_reasons` STRING,
  `phased` STRING,
  `likelihood` STRING,
  `chain_length` DOUBLE,
  `chain_links` DOUBLE,
  `chain_terminated` STRING,
  `domains_kept` STRING,
  `domains_lost` STRING,
  `skipped_exons_up` DOUBLE,
  `skipped_exons_down` DOUBLE,
  `fused_exon_up` DOUBLE,
  `fused_exon_down` DOUBLE,
  `gene_start` STRING,
  `gene_context_start` STRING,
  `transcript_start` STRING,
  `gene_end` STRING,
  `gene_context_end` STRING,
  `transcript_end` STRING,
  `junction_cn` DOUBLE
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
