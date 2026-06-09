CREATE OR REPLACE VIEW tidywigits.v_cobalt_gcmedsample AS
SELECT *
FROM tidywigits.cobalt_gcmedsample
WHERE regexp_like("$path", 'cobalt_gcmedsample\.parquet$')
;
