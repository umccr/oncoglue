CREATE OR REPLACE VIEW tidydragen.v_dragencov_metricscumu AS
SELECT *
FROM tidydragen.dragencov_metricscumu
WHERE regexp_like("$path", 'dragencov_metricscumu\.parquet$')
;
