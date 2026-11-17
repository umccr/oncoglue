CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_qualitytilemetrics AS
SELECT *
FROM tidydragen.dragenbcl_qualitytilemetrics
WHERE regexp_like("$path", 'dragenbcl_qualitytilemetrics\.parquet$')
;
