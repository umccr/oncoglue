CREATE OR REPLACE VIEW tidydragen.v_dragenvar_tmb AS
SELECT *
FROM tidydragen.dragenvar_tmb
WHERE regexp_like("$path", 'dragenvar_tmb\.parquet$')
;
