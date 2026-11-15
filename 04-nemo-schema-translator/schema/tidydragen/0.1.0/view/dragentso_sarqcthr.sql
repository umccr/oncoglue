CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarqcthr AS
SELECT *
FROM tidydragen.dragentso_sarqcthr
WHERE regexp_like("$path", 'dragentso_sarqcthr\.parquet$')
;
