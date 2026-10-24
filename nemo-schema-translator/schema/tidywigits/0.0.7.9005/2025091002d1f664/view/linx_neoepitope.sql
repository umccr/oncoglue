CREATE OR REPLACE VIEW tidywigits.v_linx_neoepitope AS
SELECT *
FROM tidywigits.linx_neoepitope
WHERE regexp_like("$path", 'linx_neoepitope\.parquet$')
;
