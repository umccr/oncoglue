CREATE OR REPLACE VIEW tidydragen.v_dragencov_metricsmain AS
SELECT *
FROM tidydragen.dragencov_metricsmain
WHERE regexp_like("$path", 'dragencov_metricsmain\.parquet$')
;
