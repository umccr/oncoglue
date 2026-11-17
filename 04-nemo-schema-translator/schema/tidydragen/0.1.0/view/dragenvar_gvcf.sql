CREATE OR REPLACE VIEW tidydragen.v_dragenvar_gvcf AS
SELECT *
FROM tidydragen.dragenvar_gvcf
WHERE regexp_like("$path", 'dragenvar_gvcf\.parquet$')
;
