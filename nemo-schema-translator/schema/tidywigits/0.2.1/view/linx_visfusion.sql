CREATE OR REPLACE VIEW tidywigits.v_linx_visfusion AS
SELECT *
FROM tidywigits.linx_visfusion
WHERE regexp_like("$path", 'linx_visfusion\.parquet$')
;
