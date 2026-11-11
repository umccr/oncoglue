CREATE OR REPLACE VIEW tidywigits.v_linx_drivercatalog AS
SELECT *
FROM tidywigits.linx_drivercatalog
WHERE regexp_like("$path", 'linx_drivercatalog\.parquet$')
;
