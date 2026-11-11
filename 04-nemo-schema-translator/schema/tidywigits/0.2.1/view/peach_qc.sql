CREATE OR REPLACE VIEW tidywigits.v_peach_qc AS
SELECT *
FROM tidywigits.peach_qc
WHERE regexp_like("$path", 'peach_qc\.parquet$')
;
