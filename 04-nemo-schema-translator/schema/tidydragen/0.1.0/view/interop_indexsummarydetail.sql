CREATE OR REPLACE VIEW tidydragen.v_interop_indexsummarydetail AS
SELECT *
FROM tidydragen.interop_indexsummarydetail
WHERE regexp_like("$path", 'interop_indexsummarydetail\.parquet$')
;
