CREATE OR REPLACE VIEW tidywigits.v_bamtools_genecvgcvg AS
SELECT *
FROM tidywigits.bamtools_genecvgcvg
WHERE regexp_like("$path", 'bamtools_genecvgcvg\.parquet$')
;
