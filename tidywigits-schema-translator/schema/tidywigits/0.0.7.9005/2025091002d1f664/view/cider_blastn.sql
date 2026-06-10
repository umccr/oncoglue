CREATE OR REPLACE VIEW tidywigits.v_cider_blastn AS
SELECT *
FROM tidywigits.cider_blastn
WHERE regexp_like("$path", 'cider_blastn\.parquet$')
;
