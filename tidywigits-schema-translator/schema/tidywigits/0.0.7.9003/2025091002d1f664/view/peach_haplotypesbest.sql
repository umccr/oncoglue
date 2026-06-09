CREATE OR REPLACE VIEW tidywigits.v_peach_haplotypesbest AS
SELECT *
FROM tidywigits.peach_haplotypesbest
WHERE regexp_like("$path", 'peach_haplotypesbest\.parquet$')
;
