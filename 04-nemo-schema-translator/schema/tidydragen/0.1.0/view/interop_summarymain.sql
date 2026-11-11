CREATE OR REPLACE VIEW tidydragen.v_interop_summarymain AS
SELECT *
FROM tidydragen.interop_summarymain
WHERE regexp_like("$path", 'interop_summarymain\.parquet$')
;
