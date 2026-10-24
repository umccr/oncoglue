CREATE OR REPLACE VIEW tidywigits.v_cobalt_ratiomed AS
SELECT *
FROM tidywigits.cobalt_ratiomed
WHERE regexp_like("$path", 'cobalt_ratiomed\.parquet$')
;
