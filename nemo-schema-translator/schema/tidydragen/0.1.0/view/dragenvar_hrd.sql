CREATE OR REPLACE VIEW tidydragen.v_dragenvar_hrd AS
SELECT *
FROM tidydragen.dragenvar_hrd
WHERE regexp_like("$path", 'dragenvar_hrd\.parquet$')
;
