CREATE OR REPLACE VIEW tidywigits.v_isofox_retintron AS
SELECT *
FROM tidywigits.isofox_retintron
WHERE regexp_like("$path", 'isofox_retintron\.parquet$')
;
