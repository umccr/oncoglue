CREATE OR REPLACE VIEW tidywigits.v_bamtools_coverage AS
SELECT *
FROM tidywigits.bamtools_coverage
WHERE regexp_like("$path", 'bamtools_coverage\.parquet$')
;
