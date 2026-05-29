CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_svs (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `vcf_id` STRING,
  `sv_id` STRING,
  `cluster_id` STRING,
  `cluster_reason` STRING,
  `fragile_site_start` STRING,
  `fragile_site_end` STRING,
  `is_foldback` STRING,
  `linetype_start` STRING,
  `linetype_end` STRING,
  `junction_cn_min` DOUBLE,
  `junction_cn_max` DOUBLE,
  `gene_start` STRING,
  `gene_end` STRING,
  `local_topology_id_start` STRING,
  `local_topology_id_end` STRING,
  `local_topology_start` STRING,
  `local_topology_end` STRING,
  `local_ti_count_start` DOUBLE,
  `local_ti_count_end` DOUBLE
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
