CREATE OR REPLACE VIEW tidywigits.v_chord_prediction AS
SELECT *
FROM tidywigits.chord_prediction
WHERE regexp_like("$path", 'chord_prediction\.parquet$')
;
