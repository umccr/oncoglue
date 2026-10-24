CREATE OR REPLACE VIEW tidywigits.v_esvee_assemblephased AS
SELECT *
FROM tidywigits.esvee_assemblephased
WHERE regexp_like("$path", 'esvee_assemblephased\.parquet$')
;
