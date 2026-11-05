CREATE OR REPLACE VIEW tidywigits.v_teal_breakend AS
SELECT *
FROM tidywigits.teal_breakend
WHERE regexp_like("$path", 'teal_breakend\.parquet$')
;
