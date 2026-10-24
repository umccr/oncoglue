CREATE OR REPLACE VIEW tidywigits.v_bamtools_summarystats AS
SELECT *
FROM tidywigits.bamtools_summarystats
WHERE regexp_like("$path", 'bamtools_summarystats\.parquet$')
;
