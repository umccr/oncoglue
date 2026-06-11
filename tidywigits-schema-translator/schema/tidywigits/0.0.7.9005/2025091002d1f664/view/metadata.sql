CREATE OR REPLACE VIEW tidywigits.v_metadata AS
SELECT *
FROM tidywigits.metadata
WHERE regexp_like("$path", 'metadata\.parquet$')
;
