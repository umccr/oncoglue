CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.alignments_markdup (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `library` STRING,
  `unpaired_reads_examined` DOUBLE,
  `read_pairs_examined` DOUBLE,
  `secondary_or_supplementary_reads` DOUBLE,
  `unmapped_reads` DOUBLE,
  `unpaired_read_duplicates` DOUBLE,
  `read_pair_duplicates` DOUBLE,
  `read_pair_optical_duplicates` DOUBLE,
  `percent_duplication` DOUBLE,
  `estimated_library_size` DOUBLE
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
