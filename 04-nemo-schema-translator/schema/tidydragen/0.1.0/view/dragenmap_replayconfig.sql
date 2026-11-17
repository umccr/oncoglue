CREATE OR REPLACE VIEW tidydragen.v_dragenmap_replayconfig AS
SELECT *
FROM tidydragen.dragenmap_replayconfig
WHERE regexp_like("$path", 'dragenmap_replayconfig\.parquet$')
;
