CREATE OR REPLACE VIEW tidywigits.v_linx_visgeneexon AS
SELECT *
FROM tidywigits.linx_visgeneexon
WHERE regexp_like("$path", 'linx_visgeneexon\.parquet$')
;
