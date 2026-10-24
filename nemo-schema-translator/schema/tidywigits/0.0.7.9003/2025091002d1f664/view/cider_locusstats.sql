CREATE OR REPLACE VIEW tidywigits.v_cider_locusstats AS
SELECT *
FROM tidywigits.cider_locusstats
WHERE regexp_like("$path", 'cider_locusstats\.parquet$')
;
