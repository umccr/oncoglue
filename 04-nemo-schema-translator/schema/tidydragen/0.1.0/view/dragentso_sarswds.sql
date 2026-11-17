CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarswds AS
SELECT *
FROM tidydragen.dragentso_sarswds
WHERE regexp_like("$path", 'dragentso_sarswds\.parquet$')
;
