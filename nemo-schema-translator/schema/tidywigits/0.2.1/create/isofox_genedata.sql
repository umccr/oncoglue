CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.isofox_genedata (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `gene_id` STRING,
  `gene_name` STRING,
  `chrom` STRING,
  `gene_length` INT,
  `intronic_length` INT,
  `transcript_count` INT,
  `gene_set_id` STRING,
  `spliced_fragments` INT,
  `unspliced_fragments` INT,
  `tpm_adj` DOUBLE,
  `tpm_raw` DOUBLE,
  `fit_residuals` DOUBLE,
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
