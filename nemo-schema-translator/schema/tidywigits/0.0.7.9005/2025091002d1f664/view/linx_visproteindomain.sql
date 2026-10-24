CREATE OR REPLACE VIEW tidywigits.v_linx_visproteindomain AS
SELECT *
FROM tidywigits.linx_visproteindomain
WHERE regexp_like("$path", 'linx_visproteindomain\.parquet$')
;
