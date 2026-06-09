CREATE OR REPLACE VIEW tidywigits.v_esvee_assembleassembly AS
SELECT *
FROM tidywigits.esvee_assembleassembly
WHERE regexp_like("$path", 'esvee_assembleassembly\.parquet$')
;
