CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_breakends (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `bnd_id` STRING,
  `sv_id` STRING,
  `is_start` STRING,
  `gene` STRING,
  `transcript_id` STRING,
  `canonical` STRING,
  `gene_orientation` STRING,
  `disruptive` STRING,
  `reported_disruption` STRING,
  `undisrupted_cn` DOUBLE,
  `region_type` STRING,
  `coding_type` STRING,
  `biotype` STRING,
  `exonic_basephase` DOUBLE,
  `next_splice_exon_rank` DOUBLE,
  `next_splice_exon_phase` DOUBLE,
  `next_splice_distance` DOUBLE,
  `total_exon_count` DOUBLE,
  `exon_up` DOUBLE,
  `exon_down` DOUBLE
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
