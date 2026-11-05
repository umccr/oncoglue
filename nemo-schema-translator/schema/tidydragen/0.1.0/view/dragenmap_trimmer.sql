CREATE OR REPLACE VIEW tidydragen.v_dragenmap_trimmer AS
SELECT *
FROM tidydragen.dragenmap_trimmer
WHERE regexp_like("$path", 'dragenmap_trimmer\.parquet$')
;
