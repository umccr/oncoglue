CREATE OR REPLACE VIEW tidydragen.v_metadata AS
SELECT *
FROM tidydragen.metadata
WHERE regexp_like("$path", 'metadata\.parquet$')
;
