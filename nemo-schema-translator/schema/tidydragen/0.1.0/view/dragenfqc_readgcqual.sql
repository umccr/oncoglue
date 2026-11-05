CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_readgcqual AS
SELECT *
FROM tidydragen.dragenfqc_readgcqual
WHERE regexp_like("$path", 'dragenfqc_readgcqual\.parquet$')
;
