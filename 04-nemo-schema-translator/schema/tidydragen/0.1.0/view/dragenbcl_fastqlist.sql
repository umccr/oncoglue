CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_fastqlist AS
SELECT *
FROM tidydragen.dragenbcl_fastqlist
WHERE regexp_like("$path", 'dragenbcl_fastqlist\.parquet$')
;
