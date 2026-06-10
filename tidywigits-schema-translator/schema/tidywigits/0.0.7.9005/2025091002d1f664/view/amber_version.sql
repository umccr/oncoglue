CREATE OR REPLACE VIEW tidywigits.v_amber_version AS
SELECT *
FROM tidywigits.amber_version
WHERE regexp_like("$path", 'amber_version\.parquet$')
;
