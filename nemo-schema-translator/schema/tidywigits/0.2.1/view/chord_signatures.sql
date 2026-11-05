CREATE OR REPLACE VIEW tidywigits.v_chord_signatures AS
SELECT *
FROM tidywigits.chord_signatures
WHERE regexp_like("$path", 'chord_signatures\.parquet$')
;
