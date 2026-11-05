CREATE OR REPLACE VIEW tidydragen.v_dragenvar_sv AS
SELECT *
FROM tidydragen.dragenvar_sv
WHERE regexp_like("$path", 'dragenvar_sv\.parquet$')
;
