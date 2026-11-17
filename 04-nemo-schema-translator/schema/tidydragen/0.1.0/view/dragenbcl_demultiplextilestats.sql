CREATE OR REPLACE VIEW tidydragen.v_dragenbcl_demultiplextilestats AS
SELECT *
FROM tidydragen.dragenbcl_demultiplextilestats
WHERE regexp_like("$path", 'dragenbcl_demultiplextilestats\.parquet$')
;
