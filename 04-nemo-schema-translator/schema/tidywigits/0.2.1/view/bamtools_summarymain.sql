CREATE OR REPLACE VIEW tidywigits.v_bamtools_summarymain AS
SELECT *
FROM tidywigits.bamtools_summarymain
WHERE regexp_like("$path", 'bamtools_summarymain\.parquet$')
;
