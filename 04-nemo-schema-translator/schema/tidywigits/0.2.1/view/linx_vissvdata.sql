CREATE OR REPLACE VIEW tidywigits.v_linx_vissvdata AS
SELECT *
FROM tidywigits.linx_vissvdata
WHERE regexp_like("$path", 'linx_vissvdata\.parquet$')
;
