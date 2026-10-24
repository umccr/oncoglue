CREATE OR REPLACE VIEW tidywigits.v_peach_events AS
SELECT *
FROM tidywigits.peach_events
WHERE regexp_like("$path", 'peach_events\.parquet$')
;
