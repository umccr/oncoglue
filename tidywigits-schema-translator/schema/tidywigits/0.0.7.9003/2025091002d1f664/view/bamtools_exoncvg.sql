CREATE OR REPLACE VIEW tidywigits.v_bamtools_exoncvg AS
SELECT *
FROM tidywigits.bamtools_exoncvg
WHERE regexp_like("$path", 'bamtools_exoncvg\.parquet$')
;
