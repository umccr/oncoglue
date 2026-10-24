CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.esvee_assembleassembly (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `id` STRING,
  `chrom` STRING,
  `junc_position` DOUBLE,
  `junc_orientation` DOUBLE,
  `junc_type` STRING,
  `ext_base_length` DOUBLE,
  `ref_base_position` DOUBLE,
  `ref_base_length` DOUBLE,
  `ref_base_cigar` STRING,
  `split_frags` DOUBLE,
  `ref_split_frags` DOUBLE,
  `disc_frags` DOUBLE,
  `ref_disc_frags` DOUBLE,
  `outcome` STRING,
  `phase_group_id` DOUBLE,
  `phase_group_count` DOUBLE,
  `phase_set_id` STRING,
  `phase_set_count` DOUBLE,
  `split_links` STRING,
  `facing_links` STRING,
  `sv_type` STRING,
  `sv_length` DOUBLE,
  `inserted_bases` STRING,
  `overlap_bases` STRING,
  `secondary_links` STRING,
  `junc_sequence` STRING,
  `ref_base_sequence` STRING,
  `insert_type` STRING,
  `ref_base_candidates` DOUBLE,
  `unmapped_candidates` DOUBLE,
  `assembly_info` STRING
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
