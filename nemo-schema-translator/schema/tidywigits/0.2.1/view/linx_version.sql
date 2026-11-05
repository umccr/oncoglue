CREATE OR REPLACE VIEW tidywigits.v_linx_version AS
SELECT *
FROM tidywigits.linx_version
WHERE regexp_like("$path", 'linx_version\.parquet$')
;
