CREATE OR REPLACE VIEW tidywigits.v_purple_puritytsv AS
SELECT *
FROM tidywigits.purple_puritytsv
WHERE regexp_like("$path", 'purple_puritytsv\.parquet$')
;
