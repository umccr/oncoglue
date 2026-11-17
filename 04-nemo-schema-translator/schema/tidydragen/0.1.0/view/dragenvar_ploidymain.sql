CREATE OR REPLACE VIEW tidydragen.v_dragenvar_ploidymain AS
SELECT *
FROM tidydragen.dragenvar_ploidymain
WHERE regexp_like("$path", 'dragenvar_ploidymain\.parquet$')
;
