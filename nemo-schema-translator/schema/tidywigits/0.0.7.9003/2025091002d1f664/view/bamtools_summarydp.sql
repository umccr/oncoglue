CREATE OR REPLACE VIEW tidywigits.v_bamtools_summarydp AS
SELECT *
FROM tidywigits.bamtools_summarydp
WHERE regexp_like("$path", 'bamtools_summarydp\.parquet$')
;
