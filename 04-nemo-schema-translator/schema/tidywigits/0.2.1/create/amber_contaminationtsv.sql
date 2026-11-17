CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.amber_contaminationtsv (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `pos` INT,
  `ref` STRING,
  `alt` STRING,
  `dp_normal` INT,
  `refsup_normal` INT,
  `altsup_normal` INT,
  `dp_tumor` INT,
  `refsup_tumor` INT,
  `altsup_tumor` INT
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
