CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_readgc AS
SELECT *
FROM tidydragen.dragenfqc_readgc
WHERE regexp_like("$path", 'dragenfqc_readgc\.parquet$')
;
