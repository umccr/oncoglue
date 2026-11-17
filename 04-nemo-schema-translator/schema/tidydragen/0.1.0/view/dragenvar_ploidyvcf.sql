CREATE OR REPLACE VIEW tidydragen.v_dragenvar_ploidyvcf AS
SELECT *
FROM tidydragen.dragenvar_ploidyvcf
WHERE regexp_like("$path", 'dragenvar_ploidyvcf\.parquet$')
;
