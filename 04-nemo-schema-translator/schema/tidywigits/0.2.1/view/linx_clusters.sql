CREATE OR REPLACE VIEW tidywigits.v_linx_clusters AS
SELECT *
FROM tidywigits.linx_clusters
WHERE regexp_like("$path", 'linx_clusters\.parquet$')
;
