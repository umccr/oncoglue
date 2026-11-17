CREATE OR REPLACE VIEW tidydragen.v_dragencov_metricsbins AS
SELECT *
FROM tidydragen.dragencov_metricsbins
WHERE regexp_like("$path", 'dragencov_metricsbins\.parquet$')
;
