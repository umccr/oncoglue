CREATE OR REPLACE VIEW tidywigits.v_bamtools_summary_stats AS
SELECT *
FROM tidywigits.bamtools_summary_stats
WHERE regexp_like("$path", 'bamtools_summary_stats\.parquet$')
;
