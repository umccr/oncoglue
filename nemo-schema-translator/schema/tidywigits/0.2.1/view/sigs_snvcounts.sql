CREATE OR REPLACE VIEW tidywigits.v_sigs_snvcounts AS
SELECT *
FROM tidywigits.sigs_snvcounts
WHERE regexp_like("$path", 'sigs_snvcounts\.parquet$')
;
