CREATE OR REPLACE VIEW tidywigits.v_teal_tellength AS
SELECT *
FROM tidywigits.teal_tellength
WHERE regexp_like("$path", 'teal_tellength\.parquet$')
;
