CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_readlen AS
SELECT *
FROM tidydragen.dragenfqc_readlen
WHERE regexp_like("$path", 'dragenfqc_readlen\.parquet$')
;
