CREATE OR REPLACE VIEW tidywigits.v_cobalt_gcmed_sample AS
SELECT *
FROM tidywigits.cobalt_gcmed_sample
WHERE regexp_like("$path", 'cobalt_gcmed_sample\.parquet$')
;
