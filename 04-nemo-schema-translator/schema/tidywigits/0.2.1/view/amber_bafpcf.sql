CREATE OR REPLACE VIEW tidywigits.v_amber_bafpcf AS
SELECT *
FROM tidywigits.amber_bafpcf
WHERE regexp_like("$path", 'amber_bafpcf\.parquet$')
;
