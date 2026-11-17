CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.chord_prediction (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sample_id` STRING,
  `p_brca1` DOUBLE,
  `p_brca2` DOUBLE,
  `p_hrd` DOUBLE,
  `hr_status` STRING,
  `hrd_type` STRING,
  `remarks_hr_status` STRING,
  `remarks_hrd_type` STRING
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
