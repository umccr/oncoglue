CREATE OR REPLACE VIEW tidydragen.v_interop_indexsummarymain AS
SELECT *
FROM tidydragen.interop_indexsummarymain
WHERE regexp_like("$path", 'interop_indexsummarymain\.parquet$')
;
