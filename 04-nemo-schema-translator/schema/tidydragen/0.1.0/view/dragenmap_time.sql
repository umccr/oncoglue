CREATE OR REPLACE VIEW tidydragen.v_dragenmap_time AS
SELECT *
FROM tidydragen.dragenmap_time
WHERE regexp_like("$path", 'dragenmap_time\.parquet$')
;
