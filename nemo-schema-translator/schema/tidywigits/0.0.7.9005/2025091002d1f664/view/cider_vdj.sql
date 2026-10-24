CREATE OR REPLACE VIEW tidywigits.v_cider_vdj AS
SELECT *
FROM tidywigits.cider_vdj
WHERE regexp_like("$path", 'cider_vdj\.parquet$')
;
