CREATE OR REPLACE VIEW tidywigits.v_neo_predictions AS
SELECT *
FROM tidywigits.neo_predictions
WHERE regexp_like("$path", 'neo_predictions\.parquet$')
;
