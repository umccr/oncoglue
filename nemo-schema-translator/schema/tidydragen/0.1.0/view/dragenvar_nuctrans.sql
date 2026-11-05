CREATE OR REPLACE VIEW tidydragen.v_dragenvar_nuctrans AS
SELECT *
FROM tidydragen.dragenvar_nuctrans
WHERE regexp_like("$path", 'dragenvar_nuctrans\.parquet$')
;
