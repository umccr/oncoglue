CREATE OR REPLACE VIEW tidydragen.v_dragenrna_quant AS
SELECT *
FROM tidydragen.dragenrna_quant
WHERE regexp_like("$path", 'dragenrna_quant\.parquet$')
;
