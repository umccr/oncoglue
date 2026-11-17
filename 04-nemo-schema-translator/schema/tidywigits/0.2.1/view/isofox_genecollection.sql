CREATE OR REPLACE VIEW tidywigits.v_isofox_genecollection AS
SELECT *
FROM tidywigits.isofox_genecollection
WHERE regexp_like("$path", 'isofox_genecollection\.parquet$')
;
