CREATE OR REPLACE VIEW tidydragen.v_dragentso_genecov AS
SELECT *
FROM tidydragen.dragentso_genecov
WHERE regexp_like("$path", 'dragentso_genecov\.parquet$')
;
