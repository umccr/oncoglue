CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_vissvdata (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `cluster_id` STRING,
  `chain_id` STRING,
  `sv_id` STRING,
  `type` STRING,
  `resolved_type` STRING,
  `is_synthetic` STRING,
  `chr_start` STRING,
  `chr_end` STRING,
  `pos_start` DOUBLE,
  `pos_end` DOUBLE,
  `orient_start` DOUBLE,
  `orient_end` DOUBLE,
  `info_start` STRING,
  `info_end` STRING,
  `junction_cn` DOUBLE,
  `in_double_minute` STRING
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
