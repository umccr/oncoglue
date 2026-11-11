CREATE OR REPLACE VIEW tidydragen.v_dragencov_reportbedmain AS
SELECT *
FROM tidydragen.dragencov_reportbedmain
WHERE regexp_like("$path", 'dragencov_reportbedmain\.parquet$')
;
