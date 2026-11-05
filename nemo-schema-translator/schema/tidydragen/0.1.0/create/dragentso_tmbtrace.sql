CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragentso_tmbtrace (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `chrom` STRING,
  `pos` DOUBLE,
  `ref` STRING,
  `alt` STRING,
  `vaf` DOUBLE,
  `dp` DOUBLE,
  `cytoband` STRING,
  `gene` STRING,
  `variant_type` STRING,
  `cosmic_ids` STRING,
  `max_cosmic_count` DOUBLE,
  `clinvar_ids` STRING,
  `clinvar_significance` STRING,
  `ac_gnomad_exome` DOUBLE,
  `ac_gnomad_genome` DOUBLE,
  `ac_1000g` DOUBLE,
  `max_db_ac` DOUBLE,
  `germline_filter_db` STRING,
  `germline_filter_proxi` STRING,
  `nonsynonymous` STRING,
  `within_valid_tmb_region` STRING,
  `included_in_tmb_numerator` STRING,
  `status` STRING,
  `protein_change` STRING,
  `cds_change` STRING,
  `exons` STRING,
  `consequence` STRING
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
