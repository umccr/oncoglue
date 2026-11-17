CREATE OR REPLACE VIEW tidywigits.v_sigs_allocation AS
SELECT *
FROM tidywigits.sigs_allocation
WHERE regexp_like("$path", 'sigs_allocation\.parquet$')
;
