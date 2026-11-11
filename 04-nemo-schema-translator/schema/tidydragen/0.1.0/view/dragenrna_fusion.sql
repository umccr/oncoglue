CREATE OR REPLACE VIEW tidydragen.v_dragenrna_fusion AS
SELECT *
FROM tidydragen.dragenrna_fusion
WHERE regexp_like("$path", 'dragenrna_fusion\.parquet$')
;
