CREATE OR REPLACE VIEW tidywigits.v_amber_qc AS
SELECT *
FROM tidywigits.amber_qc
WHERE regexp_like("$path", 'amber_qc\.parquet$')
;
