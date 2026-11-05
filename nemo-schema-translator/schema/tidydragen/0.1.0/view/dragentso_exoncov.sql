CREATE OR REPLACE VIEW tidydragen.v_dragentso_exoncov AS
SELECT *
FROM tidydragen.dragentso_exoncov
WHERE regexp_like("$path", 'dragentso_exoncov\.parquet$')
;
