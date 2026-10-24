CREATE OR REPLACE VIEW tidywigits.v_esvee_assemblealignment AS
SELECT *
FROM tidywigits.esvee_assemblealignment
WHERE regexp_like("$path", 'esvee_assemblealignment\.parquet$')
;
