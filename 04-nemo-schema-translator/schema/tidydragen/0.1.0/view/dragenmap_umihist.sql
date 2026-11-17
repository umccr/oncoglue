CREATE OR REPLACE VIEW tidydragen.v_dragenmap_umihist AS
SELECT *
FROM tidydragen.dragenmap_umihist
WHERE regexp_like("$path", 'dragenmap_umihist\.parquet$')
;
