CREATE OR REPLACE VIEW tidywigits.v_bamtools_partitionstats AS
SELECT *
FROM tidywigits.bamtools_partitionstats
WHERE regexp_like("$path", 'bamtools_partitionstats\.parquet$')
;
