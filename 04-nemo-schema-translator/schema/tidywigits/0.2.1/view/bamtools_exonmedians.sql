CREATE OR REPLACE VIEW tidywigits.v_bamtools_exonmedians AS
SELECT *
FROM tidywigits.bamtools_exonmedians
WHERE regexp_like("$path", 'bamtools_exonmedians\.parquet$')
;
