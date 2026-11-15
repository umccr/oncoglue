CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_topunknownbarcodes AS
SELECT *
FROM tidydragen.dragenbcl_topunknownbarcodes
WHERE regexp_like("$path", 'dragenbcl_topunknownbarcodes\.parquet$')
;
