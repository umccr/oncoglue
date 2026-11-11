CREATE OR REPLACE VIEW tidydragen.v_dragenvar_cnv AS
SELECT *
FROM tidydragen.dragenvar_cnv
WHERE regexp_like("$path", 'dragenvar_cnv\.parquet$')
;
