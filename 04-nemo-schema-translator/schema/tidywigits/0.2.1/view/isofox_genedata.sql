CREATE OR REPLACE VIEW tidywigits.v_isofox_genedata AS
SELECT *
FROM tidywigits.isofox_genedata
WHERE regexp_like("$path", 'isofox_genedata\.parquet$')
;
