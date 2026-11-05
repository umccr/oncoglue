CREATE OR REPLACE VIEW tidydragen.v_dragencov_reportbedcumu AS
SELECT *
FROM tidydragen.dragencov_reportbedcumu
WHERE regexp_like("$path", 'dragencov_reportbedcumu\.parquet$')
;
