CREATE OR REPLACE VIEW tidydragen.v_dragenvar_microsat AS
SELECT *
FROM tidydragen.dragenvar_microsat
WHERE regexp_like("$path", 'dragenvar_microsat\.parquet$')
;
