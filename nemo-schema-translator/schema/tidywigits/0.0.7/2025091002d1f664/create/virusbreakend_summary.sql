CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.virusbreakend_summary (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `taxid_genus` STRING,
  `name_genus` STRING,
  `reads_genus_tree` INT,
  `taxid_species` STRING,
  `name_species` STRING,
  `reads_species_tree` INT,
  `taxid_assigned` STRING,
  `name_assigned` STRING,
  `reads_assigned_tree` INT,
  `reads_assigned_direct` INT,
  `reference` STRING,
  `reference_taxid` STRING,
  `reference_kmer_count` INT,
  `alternate_kmer_count` INT,
  `rname` STRING,
  `startpos` INT,
  `endpos` INT,
  `numreads` INT,
  `covbases` INT,
  `coverage` DOUBLE,
  `meandepth` DOUBLE,
  `meanbaseq` DOUBLE,
  `meanmapq` DOUBLE,
  `integrations` DOUBLE,
  `qc_status` STRING
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
