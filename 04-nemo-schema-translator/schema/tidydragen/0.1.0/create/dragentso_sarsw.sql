CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_sarsw (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `software_display_name` STRING,
  `software_name` STRING,
  `software_version` STRING,
  `genome_build` STRING,
  `instance_name` STRING,
  `nirvana_software_version` STRING,
  `genome_assembly` STRING,
  `refseq_version` STRING
)
PARTITIONED BY (
    batch_date string
)
STORED AS PARQUET
LOCATION 's3://derived-secondary-data-123456789123-ap-southeast-2-an/tidydragen/v1'
TBLPROPERTIES (
    'projection.enabled'='true',
    'projection.batch_date.type'='date',
    'projection.batch_date.range'='2026-01-01,NOW',
    'projection.batch_date.format'='yyyy-MM-dd',
    'storage.location.template'='s3://derived-secondary-data-123456789123-ap-southeast-2-an/tidydragen/v1/batch_date=${batch_date}/'
);
