CREATE OR REPLACE VIEW tidywigits.v_bamtools_fraglength AS
SELECT *
FROM tidywigits.bamtools_fraglength
WHERE regexp_like("$path", 'bamtools_fraglength\.parquet$')
;
