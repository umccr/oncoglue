CREATE OR REPLACE VIEW tidywigits.v_neo_isofusions AS
SELECT *
FROM tidywigits.neo_isofusions
WHERE regexp_like("$path", 'neo_isofusions\.parquet$')
;
