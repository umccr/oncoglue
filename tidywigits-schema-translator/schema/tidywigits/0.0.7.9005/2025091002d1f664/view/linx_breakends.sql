CREATE OR REPLACE VIEW tidywigits.v_linx_breakends AS
SELECT *
FROM tidywigits.linx_breakends
WHERE regexp_like("$path", 'linx_breakends\.parquet$')
;
