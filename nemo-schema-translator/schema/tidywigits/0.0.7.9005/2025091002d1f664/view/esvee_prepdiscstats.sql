CREATE OR REPLACE VIEW tidywigits.v_esvee_prepdiscstats AS
SELECT *
FROM tidywigits.esvee_prepdiscstats
WHERE regexp_like("$path", 'esvee_prepdiscstats\.parquet$')
;
