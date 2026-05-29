CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.purple_puritytsv (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `purity` DOUBLE,
  `norm_factor` DOUBLE,
  `fit_score` DOUBLE,
  `diploid_proportion` DOUBLE,
  `ploidy` DOUBLE,
  `gender` STRING,
  `status` STRING,
  `polyclonal_proportion` DOUBLE,
  `purity_min` DOUBLE,
  `purity_max` DOUBLE,
  `ploidy_min` DOUBLE,
  `ploidy_max` DOUBLE,
  `diploid_proportion_min` DOUBLE,
  `diploid_proportion_max` DOUBLE,
  `somatic_penalty` DOUBLE,
  `whole_genome_duplication` STRING,
  `ms_indels_per_mb` DOUBLE,
  `ms_status` STRING,
  `tml` DOUBLE,
  `tml_status` STRING,
  `tmb_per_mb` DOUBLE,
  `tmb_status` STRING,
  `tmb_sv` DOUBLE,
  `run_mode` STRING,
  `targeted` STRING
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
