CREATE OR REPLACE VIEW tidywigits.v_linx_vissegments AS
SELECT *
FROM tidywigits.linx_vissegments
WHERE regexp_like("$path", 'linx_vissegments\.parquet$')
;
