CREATE OR REPLACE VIEW tidywigits.v_isofox_transdata AS
SELECT *
FROM tidywigits.isofox_transdata
WHERE regexp_like("$path", 'isofox_transdata\.parquet$')
;
