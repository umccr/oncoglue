CREATE OR REPLACE VIEW tidywigits.v_esvee_prepfraglen AS
SELECT *
FROM tidywigits.esvee_prepfraglen
WHERE regexp_like("$path", 'esvee_prepfraglen\.parquet$')
;
