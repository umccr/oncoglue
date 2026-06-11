CREATE OR REPLACE VIEW tidywigits.v_cobalt_gcmed_buckets AS
SELECT *
FROM tidywigits.cobalt_gcmed_buckets
WHERE regexp_like("$path", 'cobalt_gcmed_buckets\.parquet$')
;
