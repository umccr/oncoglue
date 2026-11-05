CREATE OR REPLACE VIEW tidywigits.v_alignments_markdup AS
SELECT *
FROM tidywigits.alignments_markdup
WHERE regexp_like("$path", 'alignments_markdup\.parquet$')
;
