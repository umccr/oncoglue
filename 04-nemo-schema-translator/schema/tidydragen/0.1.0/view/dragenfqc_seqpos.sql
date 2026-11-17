CREATE OR REPLACE VIEW tidydragen.v_dragenfqc_seqpos AS
SELECT *
FROM tidydragen.dragenfqc_seqpos
WHERE regexp_like("$path", 'dragenfqc_seqpos\.parquet$')
;
