CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_adaptercyclemetrics AS
SELECT *
FROM tidydragen.dragenbcl_adaptercyclemetrics
WHERE regexp_like("$path", 'dragenbcl_adaptercyclemetrics\.parquet$')
;
