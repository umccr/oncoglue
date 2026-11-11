CREATE EXTERNAL TABLE IF NOT EXISTS tidydragen.dragenmap_time (
  `input_id` STRING,
  `input_prefix` STRING,
  `output_id` STRING,
  `total_runtime` DOUBLE,
  `time_loading_reference` DOUBLE,
  `time_aligning_reads` DOUBLE,
  `time_duplicate_marking` DOUBLE,
  `time_sorting_and_marking_duplicates` DOUBLE,
  `time_dragstr_calibration` DOUBLE,
  `time_saving_map_align_output` DOUBLE,
  `time_processing_depth_of_coverage` DOUBLE,
  `time_variant_calling` DOUBLE,
  `time_partitioning` DOUBLE,
  `time_umi_read_collapsing_and_remapping` DOUBLE,
  `time_sorting` DOUBLE,
  `time_partial_reconfiguration` DOUBLE,
  `time_calculating_target_counts` DOUBLE,
  `time_normalizing_case_sample` DOUBLE,
  `time_performing_segmentation` DOUBLE,
  `time_generating_cnv_calls` DOUBLE,
  `time_generating_cnv_track_files` DOUBLE,
  `time_structural_variant_calling` DOUBLE,
  `time_calculating_tmb` DOUBLE,
  `time_performing_hrd_segment_merging` DOUBLE,
  `time_calculating_hrd_score` DOUBLE,
  `time_correcting_gc_bias` DOUBLE,
  `time_generating_cnv_model_input` DOUBLE,
  `time_fitting_cnv_model` DOUBLE,
  `time_annotating_outputs` DOUBLE,
  `time_running_msi` DOUBLE,
  `time_running_targeted_caller` DOUBLE,
  `time_running_targeted_vcf_reporter` DOUBLE,
  `time_loading_gene_annotations` DOUBLE,
  `time_aligning_anchored_reads` DOUBLE,
  `time_merging_anchored_reads` DOUBLE,
  `time_running_gene_fusion_event_generation` DOUBLE,
  `time_running_gene_fusion_filter` DOUBLE,
  `time_collecting_rna_counts` DOUBLE,
  `time_optimizing_rna_quantification` DOUBLE
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
