CREATE OR REPLACE VIEW tidywigits.v_cuppa_visdata AS
SELECT *
FROM tidywigits.cuppa_visdata
WHERE regexp_like("$path", 'cuppa_visdata\.parquet$')
;
