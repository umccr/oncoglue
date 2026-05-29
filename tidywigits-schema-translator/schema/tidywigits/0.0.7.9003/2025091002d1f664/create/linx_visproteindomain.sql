CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_visproteindomain (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `cluster_id` STRING,
  `transcript` STRING,
  `chrom` STRING,
  `start` STRING,
  `end` STRING,
  `info` STRING
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
