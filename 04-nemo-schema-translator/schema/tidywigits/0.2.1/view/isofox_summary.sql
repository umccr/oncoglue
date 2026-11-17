CREATE OR REPLACE VIEW tidywigits.v_isofox_summary AS
SELECT *
FROM tidywigits.isofox_summary
WHERE regexp_like("$path", 'isofox_summary\.parquet$')
;
