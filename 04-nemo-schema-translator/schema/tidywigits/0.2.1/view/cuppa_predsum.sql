CREATE OR REPLACE VIEW tidywigits.v_cuppa_predsum AS
SELECT *
FROM tidywigits.cuppa_predsum
WHERE regexp_like("$path", 'cuppa_predsum\.parquet$')
;
