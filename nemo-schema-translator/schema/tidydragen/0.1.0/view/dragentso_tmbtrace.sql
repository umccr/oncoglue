CREATE OR REPLACE VIEW tidydragen.v_dragentso_tmbtrace AS
SELECT *
FROM tidydragen.dragentso_tmbtrace
WHERE regexp_like("$path", 'dragentso_tmbtrace\.parquet$')
;
