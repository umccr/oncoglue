CREATE OR REPLACE VIEW tidywigits.v_neo_candidates AS
SELECT *
FROM tidywigits.neo_candidates
WHERE regexp_like("$path", 'neo_candidates\.parquet$')
;
