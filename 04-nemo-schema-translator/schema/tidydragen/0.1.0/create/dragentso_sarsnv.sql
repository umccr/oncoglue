CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_sarsnv (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `pos` DOUBLE,
  `ref` STRING,
  `alt` STRING,
  `af` DOUBLE,
  `qual` DOUBLE,
  `dp_tot` DOUBLE,
  `dp_alt` DOUBLE,
  `variant_type` STRING,
  `hgvsg` STRING,
  `transcript` STRING,
  `source` STRING,
  `biotype` STRING,
  `codons` STRING,
  `aminoacids` STRING,
  `cdnapos` STRING,
  `cdspos` STRING,
  `exons` STRING,
  `proteinpos` STRING,
  `geneid` STRING,
  `hgnc` STRING,
  `consequence` STRING,
  `hgvsc` STRING,
  `hgvsp` STRING,
  `iscanonical` STRING,
  `proteinid` STRING,
  `introns` STRING,
  `isjunctionpreserving` STRING
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
