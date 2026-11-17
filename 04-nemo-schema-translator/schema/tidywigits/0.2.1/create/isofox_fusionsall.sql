CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.isofox_fusionsall (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `fusion_id` STRING,
  `valid` STRING,
  `chr_up` STRING,
  `pos_up` DOUBLE,
  `orient_up` STRING,
  `gene_id_up` STRING,
  `gene_name_up` STRING,
  `strand_up` STRING,
  `junc_type_up` STRING,
  `coverage_up` DOUBLE,
  `max_anchor_length_up` DOUBLE,
  `trans_data_up` STRING,
  `chr_down` STRING,
  `pos_down` DOUBLE,
  `orient_down` DOUBLE,
  `gene_id_down` STRING,
  `gene_name_down` STRING,
  `strand_down` DOUBLE,
  `junc_type_down` STRING,
  `coverage_down` DOUBLE,
  `max_anchor_length_down` DOUBLE,
  `trans_data_down` STRING,
  `sv_type` STRING,
  `total_frags` DOUBLE,
  `split_frags` DOUBLE,
  `realigned_frags` DOUBLE,
  `discordant_frags` DOUBLE,
  `related_spliced_ids` STRING,
  `cohort_count` DOUBLE,
  `read_type` STRING,
  `init_read_id` STRING
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
