CREATE OR REPLACE VIEW tidywigits.v_esvee_prepjunction AS
SELECT *
FROM tidywigits.esvee_prepjunction
WHERE regexp_like("$path", 'esvee_prepjunction\.parquet$')
;
