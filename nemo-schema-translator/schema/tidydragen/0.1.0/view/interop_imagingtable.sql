CREATE OR REPLACE VIEW tidydragen.v_interop_imagingtable AS
SELECT *
FROM tidydragen.interop_imagingtable
WHERE regexp_like("$path", 'interop_imagingtable\.parquet$')
;
