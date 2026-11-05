CREATE OR REPLACE VIEW tidydragen.v_dragenmap_fraglenhist AS
SELECT *
FROM tidydragen.dragenmap_fraglenhist
WHERE regexp_like("$path", 'dragenmap_fraglenhist\.parquet$')
;
