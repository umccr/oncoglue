CREATE EXTERNAL TABLE IF NOT EXISTS tidywigits.linx_disruption (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `sv_id` STRING,
  `vcf_id` STRING,
  `chromosome_start` STRING,
  `chromosome_end` STRING,
  `position_start` DOUBLE,
  `position_end` DOUBLE,
  `orient_start` DOUBLE,
  `orient_end` DOUBLE,
  `type` STRING,
  `filter` STRING,
  `event` STRING,
  `qual_score` DOUBLE,
  `homology_sequence_start` STRING,
  `homology_sequence_end` STRING,
  `inexact_homology_start` DOUBLE,
  `inexact_homology_end` DOUBLE,
  `junction_cn` DOUBLE,
  `adjusted_af_start` DOUBLE,
  `adjusted_af_end` DOUBLE,
  `adjusted_copy_number_start` DOUBLE,
  `adjusted_copy_number_end` DOUBLE,
  `adjusted_copy_number_change_start` DOUBLE,
  `adjusted_copy_number_change_end` DOUBLE,
  `germline_fragments` DOUBLE,
  `germline_reference_fragments_start` DOUBLE,
  `germline_reference_fragments_end` DOUBLE,
  `tumor_fragments` DOUBLE,
  `tumor_reference_fragments_start` DOUBLE,
  `tumor_reference_fragments_end` DOUBLE,
  `insert_sequence` STRING,
  `insert_sequence_alignments` STRING,
  `insert_sequence_repeat_class` STRING,
  `insert_sequence_repeat_type` STRING,
  `gene` STRING,
  `cluster_id` STRING,
  `cluster_count` DOUBLE,
  `resolved_type` STRING,
  `linked_by_start` DOUBLE,
  `linked_by_end` DOUBLE,
  `cohort_frequency` DOUBLE
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
