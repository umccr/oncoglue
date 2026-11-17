CREATE OR REPLACE VIEW tidydragen.v_dragenmap_gcbias AS
SELECT *
FROM tidydragen.dragenmap_gcbias
WHERE regexp_like("$path", 'dragenmap_gcbias\.parquet$')
;
