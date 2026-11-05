CREATE OR REPLACE VIEW tidydragen.v_dragentso_fusions AS
SELECT *
FROM tidydragen.dragentso_fusions
WHERE regexp_like("$path", 'dragentso_fusions\.parquet$')
;
