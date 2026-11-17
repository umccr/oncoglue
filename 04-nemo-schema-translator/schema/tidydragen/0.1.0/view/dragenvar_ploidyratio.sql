CREATE OR REPLACE VIEW tidydragen.v_dragenvar_ploidyratio AS
SELECT *
FROM tidydragen.dragenvar_ploidyratio
WHERE regexp_like("$path", 'dragenvar_ploidyratio\.parquet$')
;
