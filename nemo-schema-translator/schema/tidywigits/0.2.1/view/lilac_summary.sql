CREATE OR REPLACE VIEW tidywigits.v_lilac_summary AS
SELECT *
FROM tidywigits.lilac_summary
WHERE regexp_like("$path", 'lilac_summary\.parquet$')
;
