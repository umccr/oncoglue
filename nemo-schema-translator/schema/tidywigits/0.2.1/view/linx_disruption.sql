CREATE OR REPLACE VIEW tidywigits.v_linx_disruption AS
SELECT *
FROM tidywigits.linx_disruption
WHERE regexp_like("$path", 'linx_disruption\.parquet$')
;
