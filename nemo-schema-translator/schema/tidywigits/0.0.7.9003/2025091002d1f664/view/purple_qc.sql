CREATE OR REPLACE VIEW tidywigits.v_purple_qc AS
SELECT *
FROM tidywigits.purple_qc
WHERE regexp_like("$path", 'purple_qc\.parquet$')
;
