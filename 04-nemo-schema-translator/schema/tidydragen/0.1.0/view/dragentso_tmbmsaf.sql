CREATE OR REPLACE VIEW tidydragen.v_dragentso_tmbmsaf AS
SELECT *
FROM tidydragen.dragentso_tmbmsaf
WHERE regexp_like("$path", 'dragentso_tmbmsaf\.parquet$')
;
