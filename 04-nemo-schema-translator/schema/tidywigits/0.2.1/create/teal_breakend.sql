CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.teal_breakend (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `position` DOUBLE,
  `orientation` DOUBLE,
  `cg_rich` STRING,
  `filter` STRING,
  `in_tumor` STRING,
  `in_germline` STRING,
  `distance_to_telomere` DOUBLE,
  `max_telomeric_length` DOUBLE,
  `max_anchor_length` DOUBLE,
  `tumor_sr_tel_dp_tel` DOUBLE,
  `tumor_sr_tel_dp_no_tel` DOUBLE,
  `tumor_sr_tel_no_dp` DOUBLE,
  `tumor_sr_no_tel_dp_tel` DOUBLE,
  `tumor_dp_tel_no_sr` DOUBLE,
  `tumor_total_support` DOUBLE,
  `tumor_mapq` DOUBLE,
  `germ_sr_tel_dp_tel` DOUBLE,
  `germ_sr_tel_dp_no_tel` DOUBLE,
  `germ_sr_tel_no_dp` DOUBLE,
  `germ_sr_no_tel_dp_tel` DOUBLE,
  `germ_dp_tel_no_sr` DOUBLE,
  `germ_total_support` DOUBLE,
  `germ_mapq` DOUBLE
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
