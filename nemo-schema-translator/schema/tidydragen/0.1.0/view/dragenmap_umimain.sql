CREATE OR REPLACE VIEW tidydragen.v_dragenmap_umimain AS
SELECT *
FROM tidydragen.dragenmap_umimain
WHERE regexp_like("$path", 'dragenmap_umimain\.parquet$')
;
