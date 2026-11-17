CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_posqual AS
SELECT *
FROM tidydragen.dragenfqc_posqual
WHERE regexp_like("$path", 'dragenfqc_posqual\.parquet$')
;
