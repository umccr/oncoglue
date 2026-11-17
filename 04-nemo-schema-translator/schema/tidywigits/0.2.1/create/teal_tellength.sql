CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.teal_tellength (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sample_id` STRING,
  `type` STRING,
  `tel_length_raw` DOUBLE,
  `tel_length_final` DOUBLE,
  `fragments_full` DOUBLE,
  `fragments_c_rich_partial` DOUBLE,
  `fragments_g_rich_partial` DOUBLE,
  `reads_telomeric_total` DOUBLE,
  `purity` DOUBLE,
  `ploidy` DOUBLE,
  `dup_prop` DOUBLE,
  `dp_read_mean` DOUBLE,
  `dp_read_gc50` DOUBLE
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
