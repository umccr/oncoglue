CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_adaptermetrics AS
SELECT *
FROM tidydragen.dragenbcl_adaptermetrics
WHERE regexp_like("$path", 'dragenbcl_adaptermetrics\.parquet$')
;
