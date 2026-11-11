CREATE OR REPLACE VIEW tidywigits.v_isofox_fusionspass AS
SELECT *
FROM tidywigits.isofox_fusionspass
WHERE regexp_like("$path", 'isofox_fusionspass\.parquet$')
;
