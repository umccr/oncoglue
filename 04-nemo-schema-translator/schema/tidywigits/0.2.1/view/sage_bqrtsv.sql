CREATE OR REPLACE VIEW tidywigits.v_sage_bqrtsv AS
SELECT *
FROM tidywigits.sage_bqrtsv
WHERE regexp_like("$path", 'sage_bqrtsv\.parquet$')
;
