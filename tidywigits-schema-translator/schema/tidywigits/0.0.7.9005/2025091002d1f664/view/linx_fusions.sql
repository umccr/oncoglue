CREATE OR REPLACE VIEW tidywigits.v_linx_fusions AS
SELECT *
FROM tidywigits.linx_fusions
WHERE regexp_like("$path", 'linx_fusions\.parquet$')
;
