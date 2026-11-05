CREATE OR REPLACE VIEW tidywigits.v_amber_homozygousregion AS
SELECT *
FROM tidywigits.amber_homozygousregion
WHERE regexp_like("$path", 'amber_homozygousregion\.parquet$')
;
