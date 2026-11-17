CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragenbcl_runinfo (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `run_id` STRING,
  `run_number` INT,
  `flowcell` STRING,
  `instrument` STRING,
  `date` STRING,
  `read1_cycles` INT,
  `read2_cycles` INT,
  `index1_cycles` INT,
  `index2_cycles` INT,
  `lane_count` INT,
  `surface_count` INT,
  `swath_count` INT,
  `tile_count` INT,
  `flowcell_side` INT,
  `tile_naming_convention` STRING
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
