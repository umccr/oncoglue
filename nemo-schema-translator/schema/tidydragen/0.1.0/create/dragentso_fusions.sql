CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_fusions (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sample` STRING,
  `name` STRING,
  `chr1` STRING,
  `pos1` DOUBLE,
  `chr2` STRING,
  `pos2` DOUBLE,
  `direction` STRING,
  `alt_depth` DOUBLE,
  `bp1_depth` DOUBLE,
  `bp2_depth` DOUBLE,
  `total_depth` DOUBLE,
  `vaf` DOUBLE,
  `gene1` STRING,
  `gene2` STRING,
  `contig` STRING,
  `filter` STRING,
  `is_cosmic_genepair` STRING,
  `fusion_directionality_known` STRING
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
