CREATE OR REPLACE VIEW tidydragen.v_dragenmap_metrics AS
SELECT *
FROM tidydragen.dragenmap_metrics
WHERE regexp_like("$path", 'dragenmap_metrics\.parquet$')
;
