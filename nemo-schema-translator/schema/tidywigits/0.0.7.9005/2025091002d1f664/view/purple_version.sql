CREATE OR REPLACE VIEW tidywigits.v_purple_version AS
SELECT *
FROM tidywigits.purple_version
WHERE regexp_like("$path", 'purple_version\.parquet$')
;
