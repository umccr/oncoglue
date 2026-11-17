CREATE OR REPLACE VIEW tidydragen.v_dragencov_contigmean AS
SELECT *
FROM tidydragen.dragencov_contigmean
WHERE regexp_like("$path", 'dragencov_contigmean\.parquet$')
;
