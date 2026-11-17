CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_runinfo AS
SELECT *
FROM tidydragen.dragenbcl_runinfo
WHERE regexp_like("$path", 'dragenbcl_runinfo\.parquet$')
;
