CREATE OR REPLACE VIEW tidywigits.v_esvee_assemblebreakend AS
SELECT *
FROM tidywigits.esvee_assemblebreakend
WHERE regexp_like("$path", 'esvee_assemblebreakend\.parquet$')
;
