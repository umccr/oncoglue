CREATE OR REPLACE VIEW tidydragen.v_dragenvar_hethom AS
SELECT *
FROM tidydragen.dragenvar_hethom
WHERE regexp_like("$path", 'dragenvar_hethom\.parquet$')
;
