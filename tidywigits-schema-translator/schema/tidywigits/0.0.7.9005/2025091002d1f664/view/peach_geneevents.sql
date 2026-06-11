CREATE OR REPLACE VIEW tidywigits.v_peach_geneevents AS
SELECT *
FROM tidywigits.peach_geneevents
WHERE regexp_like("$path", 'peach_geneevents\.parquet$')
;
