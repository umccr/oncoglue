CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_visfusion (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `cluster_id` STRING,
  `reportable` STRING,
  `gene_name_up` STRING,
  `transcript_up` STRING,
  `chr_up` STRING,
  `pos_up` STRING,
  `strand_up` STRING,
  `region_type_up` STRING,
  `fused_exon_up` STRING,
  `gene_name_down` STRING,
  `transcript_down` STRING,
  `chr_down` STRING,
  `pos_down` STRING,
  `strand_down` STRING,
  `region_type_down` STRING,
  `fused_exon_down` STRING
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
