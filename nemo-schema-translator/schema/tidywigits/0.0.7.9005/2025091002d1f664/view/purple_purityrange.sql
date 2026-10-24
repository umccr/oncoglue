CREATE OR REPLACE VIEW tidywigits.v_purple_purityrange AS
SELECT *
FROM tidywigits.purple_purityrange
WHERE regexp_like("$path", 'purple_purityrange\.parquet$')
;
