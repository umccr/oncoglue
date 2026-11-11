CREATE OR REPLACE VIEW tidywigits.v_cobalt_ratiopcf AS
SELECT *
FROM tidywigits.cobalt_ratiopcf
WHERE regexp_like("$path", 'cobalt_ratiopcf\.parquet$')
;
