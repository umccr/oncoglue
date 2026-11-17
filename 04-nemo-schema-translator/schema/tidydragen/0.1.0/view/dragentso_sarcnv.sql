CREATE OR REPLACE VIEW tidydragen.v_dragentso_sarcnv AS
SELECT *
FROM tidydragen.dragentso_sarcnv
WHERE regexp_like("$path", 'dragentso_sarcnv\.parquet$')
;
