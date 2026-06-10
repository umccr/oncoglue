CREATE OR REPLACE VIEW tidywigits.v_purple_somhist AS
SELECT *
FROM tidywigits.purple_somhist
WHERE regexp_like("$path", 'purple_somhist\.parquet$')
;
