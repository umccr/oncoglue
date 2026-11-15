CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarsw AS
SELECT *
FROM tidydragen.dragentso_sarsw
WHERE regexp_like("$path", 'dragentso_sarsw\.parquet$')
;
