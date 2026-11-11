CREATE OR REPLACE VIEW tidywigits.v_bamtools_genecvgmain AS
SELECT *
FROM tidywigits.bamtools_genecvgmain
WHERE regexp_like("$path", 'bamtools_genecvgmain\.parquet$')
;
