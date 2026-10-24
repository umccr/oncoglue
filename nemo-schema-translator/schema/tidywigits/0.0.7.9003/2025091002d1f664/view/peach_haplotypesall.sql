CREATE OR REPLACE VIEW tidywigits.v_peach_haplotypesall AS
SELECT *
FROM tidywigits.peach_haplotypesall
WHERE regexp_like("$path", 'peach_haplotypesall\.parquet$')
;
