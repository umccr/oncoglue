CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.esvee_assemblealignment (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `assembly_ids` STRING,
  `assembly_info` STRING,
  `ref_info` STRING,
  `raw_seq_coords` STRING,
  `adj_seq_coords` STRING,
  `map_qual` DOUBLE,
  `cigar` STRING,
  `orientation` DOUBLE,
  `aligned_bases` DOUBLE,
  `score` DOUBLE,
  `flags` DOUBLE,
  `n_matches` DOUBLE,
  `xa_tag` STRING,
  `md_tag` STRING,
  `calc_align_length` DOUBLE,
  `mod_map_qual` DOUBLE,
  `dropped_on_requery` STRING,
  `linked_alt_alignment` STRING
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
