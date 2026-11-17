CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarsnv AS
SELECT *
FROM tidydragen.dragentso_sarsnv
WHERE regexp_like("$path", 'dragentso_sarsnv\.parquet$')
;
