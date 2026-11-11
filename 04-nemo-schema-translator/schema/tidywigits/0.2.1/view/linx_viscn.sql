CREATE OR REPLACE VIEW tidywigits.v_linx_viscn AS
SELECT *
FROM tidywigits.linx_viscn
WHERE regexp_like("$path", 'linx_viscn\.parquet$')
;
