CREATE OR REPLACE VIEW tidydragen.v_interop_summaryreadlane AS
SELECT *
FROM tidydragen.interop_summaryreadlane
WHERE regexp_like("$path", 'interop_summaryreadlane\.parquet$')
;
