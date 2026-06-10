CREATE OR REPLACE VIEW tidywigits.v_purple_cnvgenetsv AS
SELECT *
FROM tidywigits.purple_cnvgenetsv
WHERE regexp_like("$path", 'purple_cnvgenetsv\.parquet$')
;
