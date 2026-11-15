CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_demultiplexstats AS
SELECT *
FROM tidydragen.dragenbcl_demultiplexstats
WHERE regexp_like("$path", 'dragenbcl_demultiplexstats\.parquet$')
;
