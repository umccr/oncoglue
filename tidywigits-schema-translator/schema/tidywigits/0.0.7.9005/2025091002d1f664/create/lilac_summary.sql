CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.lilac_summary (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `allele` STRING,
  `ref_total` DOUBLE,
  `ref_unique` DOUBLE,
  `ref_shared` DOUBLE,
  `ref_wild` DOUBLE,
  `tumor_total` DOUBLE,
  `tumor_unique` DOUBLE,
  `tumor_shared` DOUBLE,
  `tumor_wild` DOUBLE,
  `rna_total` DOUBLE,
  `rna_unique` DOUBLE,
  `rna_shared` DOUBLE,
  `rna_wild` DOUBLE,
  `tumor_cn` DOUBLE,
  `somatic_missense` DOUBLE,
  `somatic_nonsense_or_frameshift` DOUBLE,
  `somatic_splice` DOUBLE,
  `somatic_synonymous` DOUBLE,
  `somatic_inframe_indel` DOUBLE
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
