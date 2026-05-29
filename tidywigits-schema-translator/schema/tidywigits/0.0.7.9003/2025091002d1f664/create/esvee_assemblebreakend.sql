CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.esvee_assemblebreakend (
  `input_id` STRING,
  `input_pfix` STRING,
  `output_id` STRING,
  `id` STRING,
  `phase_group_id` STRING,
  `phase_set_id` STRING,
  `assembly_id` STRING,
  `mate_id` STRING,
  `assembly_info` STRING,
  `type` STRING,
  `chrom` STRING,
  `position` DOUBLE,
  `orientation` DOUBLE,
  `mate_chr` STRING,
  `mate_pos` DOUBLE,
  `mate_orient` DOUBLE,
  `length` DOUBLE,
  `inserted_bases` STRING,
  `homology` STRING,
  `confidence_interval` STRING,
  `inexact_offset` STRING,
  `qual` DOUBLE,
  `split_fragments` DOUBLE,
  `ref_split_fragments` DOUBLE,
  `disc_fragments` DOUBLE,
  `ref_disc_fragments` DOUBLE,
  `forward_reads` DOUBLE,
  `reverse_reads` DOUBLE,
  `sequence_length` DOUBLE,
  `segment_count` DOUBLE,
  `segment_index` DOUBLE,
  `sequence_index` DOUBLE,
  `aligned_bases` DOUBLE,
  `map_qual` DOUBLE,
  `score` DOUBLE,
  `adj_aligned_bases` DOUBLE,
  `avg_fragment_length` DOUBLE,
  `incomplete_fragments` DOUBLE,
  `breakend_qual` DOUBLE,
  `facing_breakend_ids` STRING,
  `alt_alignments` STRING,
  `insertion_type` STRING,
  `unique_frag_pos` DOUBLE,
  `closest_assembly` STRING,
  `non_primary_frags` DOUBLE
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
