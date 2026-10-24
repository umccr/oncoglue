CREATE OR REPLACE VIEW tidywigits.v_linx_svs AS
SELECT *
FROM tidywigits.linx_svs
WHERE regexp_like("$path", 'linx_svs\.parquet$')
;
