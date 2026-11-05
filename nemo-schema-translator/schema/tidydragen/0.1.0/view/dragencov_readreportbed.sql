CREATE OR REPLACE VIEW tidydragen.v_dragencov_readreportbed AS
SELECT *
FROM tidydragen.dragencov_readreportbed
WHERE regexp_like("$path", 'dragencov_readreportbed\.parquet$')
;
