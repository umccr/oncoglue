CREATE OR REPLACE VIEW tidywigits.v_virusinterpreter_annotated AS
SELECT *
FROM tidywigits.virusinterpreter_annotated
WHERE regexp_like("$path", 'virusinterpreter_annotated\.parquet$')
;
