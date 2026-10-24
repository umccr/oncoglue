CREATE OR REPLACE VIEW tidywigits.v_lilac_qc AS
SELECT *
FROM tidywigits.lilac_qc
WHERE regexp_like("$path", 'lilac_qc\.parquet$')
;
