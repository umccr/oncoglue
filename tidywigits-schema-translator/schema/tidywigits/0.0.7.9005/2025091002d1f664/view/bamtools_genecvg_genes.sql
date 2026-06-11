CREATE OR REPLACE VIEW tidywigits.v_bamtools_genecvg_genes AS
SELECT *
FROM tidywigits.bamtools_genecvg_genes
WHERE regexp_like("$path", 'bamtools_genecvg_genes\.parquet$')
;
