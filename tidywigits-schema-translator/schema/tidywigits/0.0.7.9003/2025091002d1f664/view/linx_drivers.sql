CREATE OR REPLACE VIEW tidywigits.v_linx_drivers AS
SELECT *
FROM tidywigits.linx_drivers
WHERE regexp_like("$path", 'linx_drivers\.parquet$')
;
