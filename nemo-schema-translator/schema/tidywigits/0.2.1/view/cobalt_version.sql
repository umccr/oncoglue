CREATE OR REPLACE VIEW tidywigits.v_cobalt_version AS
SELECT *
FROM tidywigits.cobalt_version
WHERE regexp_like("$path", 'cobalt_version\.parquet$')
;
