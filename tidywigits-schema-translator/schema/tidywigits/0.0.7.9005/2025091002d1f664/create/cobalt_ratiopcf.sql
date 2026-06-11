CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.cobalt_ratiopcf (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sample_id` STRING,
  `chrom` STRING,
  `arm` STRING,
  `start_pos` DOUBLE,
  `end_pos` DOUBLE,
  `n_probes` INT,
  `mean` DOUBLE
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
