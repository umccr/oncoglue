CREATE OR REPLACE VIEW tidywigits.v_bamtools_genecvg_cvg AS
SELECT *
FROM tidywigits.bamtools_genecvg_cvg
WHERE regexp_like("$path", 'bamtools_genecvg_cvg\.parquet$')
;
