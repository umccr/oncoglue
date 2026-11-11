CREATE OR REPLACE VIEW tidywigits.v_alignments_dupfreq AS
SELECT *
FROM tidywigits.alignments_dupfreq
WHERE regexp_like("$path", 'alignments_dupfreq\.parquet$')
;
