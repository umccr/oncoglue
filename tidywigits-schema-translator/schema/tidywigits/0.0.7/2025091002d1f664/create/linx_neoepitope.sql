CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_neoepitope (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `gene_id_up` STRING,
  `gene_name_up` STRING,
  `chrom_up` STRING,
  `pos_up` DOUBLE,
  `orientation_up` DOUBLE,
  `sv_id_up` STRING,
  `gene_id_down` STRING,
  `gene_name_down` STRING,
  `chrom_down` STRING,
  `pos_down` DOUBLE,
  `orientation_down` DOUBLE,
  `sv_id_down` STRING,
  `junc_cn` DOUBLE,
  `cn` DOUBLE,
  `insert_seq` STRING,
  `chain_length` DOUBLE,
  `transcripts_up` STRING,
  `transcripts_down` STRING
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
