CREATE OR REPLACE VIEW tidywigits.v_purple_germdeltsv AS
SELECT *
FROM tidywigits.purple_germdeltsv
WHERE regexp_like("$path", 'purple_germdeltsv\.parquet$')
;
