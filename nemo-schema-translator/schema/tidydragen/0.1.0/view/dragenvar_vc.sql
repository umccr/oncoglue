CREATE OR REPLACE VIEW tidydragen.v_dragenvar_vc AS
SELECT *
FROM tidydragen.dragenvar_vc
WHERE regexp_like("$path", 'dragenvar_vc\.parquet$')
;
