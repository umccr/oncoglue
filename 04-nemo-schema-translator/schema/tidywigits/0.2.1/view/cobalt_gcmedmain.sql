CREATE OR REPLACE VIEW tidywigits.v_cobalt_gcmedmain AS
SELECT *
FROM tidywigits.cobalt_gcmedmain
WHERE regexp_like("$path", 'cobalt_gcmedmain\.parquet$')
;
