CREATE OR REPLACE VIEW tidywigits.v_bamtools_summary_dp AS
SELECT *
FROM tidywigits.bamtools_summary_dp
WHERE regexp_like("$path", 'bamtools_summary_dp\.parquet$')
;
