CREATE OR REPLACE VIEW tidywigits.v_purple_drivercatalog AS
SELECT *
FROM tidywigits.purple_drivercatalog
WHERE regexp_like("$path", 'purple_drivercatalog\.parquet$')
;
