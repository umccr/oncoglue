CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarmain AS
SELECT *
FROM tidydragen.dragentso_sarmain
WHERE regexp_like("$path", 'dragentso_sarmain\.parquet$')
;
