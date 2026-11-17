CREATE OR REPLACE VIEW tidywigits.v_purple_cnvsomtsv AS
SELECT *
FROM tidywigits.purple_cnvsomtsv
WHERE regexp_like("$path", 'purple_cnvsomtsv\.parquet$')
;
