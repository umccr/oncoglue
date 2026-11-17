CREATE OR REPLACE VIEW tidydragen.v_dragenmap_gcmain AS
SELECT *
FROM tidydragen.dragenmap_gcmain
WHERE regexp_like("$path", 'dragenmap_gcmain\.parquet$')
;
