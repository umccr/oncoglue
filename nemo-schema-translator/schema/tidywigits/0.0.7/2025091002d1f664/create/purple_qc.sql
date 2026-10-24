CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_qc (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `qc_status` STRING,
  `method` STRING,
  `cn_segments` INT,
  `cn_segments_unsupported` INT,
  `purity` DOUBLE,
  `gender_amber` STRING,
  `gender_cobalt` STRING,
  `deleted_genes` INT,
  `contamination` DOUBLE,
  `germline_aberrations` STRING,
  `mean_depth_amber` DOUBLE,
  `loh_percent` DOUBLE,
  `tinc_level` DOUBLE,
  `chimerism_percent` DOUBLE
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
