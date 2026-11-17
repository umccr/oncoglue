CREATE OR REPLACE VIEW tidywigits.v_neo_scores AS
SELECT *
FROM tidywigits.neo_scores
WHERE regexp_like("$path", 'neo_scores\.parquet$')
;
