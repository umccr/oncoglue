CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.esvee_prepdiscstats (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `tot_reads` DOUBLE,
  `prep_reads` DOUBLE,
  `translocation` DOUBLE,
  `inv_lt_1k` DOUBLE,
  `inv_1_to_5k` DOUBLE,
  `inv_5_to_100k` DOUBLE,
  `inv_gt_100k` DOUBLE,
  `del_1_to_5k` DOUBLE,
  `del_5_to_100k` DOUBLE,
  `del_gt_100k` DOUBLE,
  `dup_1_to_5k` DOUBLE,
  `dup_5_to_100k` DOUBLE,
  `dup_gt_100k` DOUBLE
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
