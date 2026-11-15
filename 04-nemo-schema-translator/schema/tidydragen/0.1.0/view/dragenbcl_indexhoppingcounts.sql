CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_indexhoppingcounts AS
SELECT *
FROM tidydragen.dragenbcl_indexhoppingcounts
WHERE regexp_like("$path", 'dragenbcl_indexhoppingcounts\.parquet$')
;
