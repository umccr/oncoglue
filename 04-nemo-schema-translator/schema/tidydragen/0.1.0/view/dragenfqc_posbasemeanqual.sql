CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_posbasemeanqual AS
SELECT *
FROM tidydragen.dragenfqc_posbasemeanqual
WHERE regexp_like("$path", 'dragenfqc_posbasemeanqual\.parquet$')
;
