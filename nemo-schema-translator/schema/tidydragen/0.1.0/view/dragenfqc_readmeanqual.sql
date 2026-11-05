CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_readmeanqual AS
SELECT *
FROM tidydragen.dragenfqc_readmeanqual
WHERE regexp_like("$path", 'dragenfqc_readmeanqual\.parquet$')
;
