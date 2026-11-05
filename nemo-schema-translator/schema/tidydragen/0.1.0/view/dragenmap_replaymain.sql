CREATE OR REPLACE VIEW tidydragen.v_dragenmap_replaymain AS
SELECT *
FROM tidydragen.dragenmap_replaymain
WHERE regexp_like("$path", 'dragenmap_replaymain\.parquet$')
;
