CREATE OR REPLACE VIEW tidywigits.v_virusbreakend_vcfsummary AS
SELECT *
FROM tidywigits.virusbreakend_vcfsummary
WHERE regexp_like("$path", 'virusbreakend_vcfsummary\.parquet$')
;
