CREATE OR REPLACE VIEW tidywigits.v_isofox_fusionsall AS
SELECT *
FROM tidywigits.isofox_fusionsall
WHERE regexp_like("$path", 'isofox_fusionsall\.parquet$')
;
