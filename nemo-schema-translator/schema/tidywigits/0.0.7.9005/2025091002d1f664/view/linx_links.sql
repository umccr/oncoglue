CREATE OR REPLACE VIEW tidywigits.v_linx_links AS
SELECT *
FROM tidywigits.linx_links
WHERE regexp_like("$path", 'linx_links\.parquet$')
;
