CREATE OR REPLACE VIEW tidywigits.v_isofox_altsj AS
SELECT *
FROM tidywigits.isofox_altsj
WHERE regexp_like("$path", 'isofox_altsj\.parquet$')
;
