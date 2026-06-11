CREATE OR REPLACE VIEW tidywigits.v_bamtools_flagstats AS
SELECT *
FROM tidywigits.bamtools_flagstats
WHERE regexp_like("$path", 'bamtools_flagstats\.parquet$')
;
