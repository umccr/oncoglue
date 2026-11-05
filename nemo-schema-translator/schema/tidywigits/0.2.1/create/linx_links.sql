CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_links (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `cluster_id` STRING,
  `chain_id` STRING,
  `chain_index` STRING,
  `chain_count` DOUBLE,
  `lower_sv_id` STRING,
  `upper_sv_id` STRING,
  `lower_breakend_is_start` STRING,
  `upper_breakend_is_start` STRING,
  `chrom` STRING,
  `arm` STRING,
  `assembled` STRING,
  `traversed_sv_count` DOUBLE,
  `length` DOUBLE,
  `junction_cn` DOUBLE,
  `junction_cn_uncertainty` DOUBLE,
  `pseudogene_info` STRING,
  `ecdna` STRING
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
