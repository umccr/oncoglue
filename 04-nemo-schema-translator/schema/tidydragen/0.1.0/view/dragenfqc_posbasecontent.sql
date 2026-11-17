CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_posbasecontent AS
SELECT *
FROM tidydragen.dragenfqc_posbasecontent
WHERE regexp_like("$path", 'dragenfqc_posbasecontent\.parquet$')
;
