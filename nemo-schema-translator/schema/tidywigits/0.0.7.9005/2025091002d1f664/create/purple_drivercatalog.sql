CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_drivercatalog (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `chrom_band` STRING,
  `gene` STRING,
  `transcript` STRING,
  `is_canonical` STRING,
  `driver` STRING,
  `category` STRING,
  `likelihood_method` STRING,
  `driver_likelihood` DOUBLE,
  `missense` DOUBLE,
  `nonsense` DOUBLE,
  `splice` DOUBLE,
  `inframe` DOUBLE,
  `frameshift` DOUBLE,
  `biallelic` STRING,
  `cn_min` DOUBLE,
  `cn_max` DOUBLE
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
