CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarqc AS
SELECT *
FROM tidydragen.dragentso_sarqc
WHERE regexp_like("$path", 'dragentso_sarqc\.parquet$')
;
