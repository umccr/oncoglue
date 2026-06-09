CREATE OR REPLACE VIEW tidywigits.v_bamtools_genecvggenes AS
SELECT *
FROM tidywigits.bamtools_genecvggenes
WHERE regexp_like("$path", 'bamtools_genecvggenes\.parquet$')
;
