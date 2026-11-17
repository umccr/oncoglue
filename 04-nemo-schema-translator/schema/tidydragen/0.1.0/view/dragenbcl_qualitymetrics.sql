CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_qualitymetrics AS
SELECT *
FROM tidydragen.dragenbcl_qualitymetrics
WHERE regexp_like("$path", 'dragenbcl_qualitymetrics\.parquet$')
;
