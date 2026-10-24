CREATE OR REPLACE VIEW tidywigits.v_cobalt_gcmedbuckets AS
SELECT *
FROM tidywigits.cobalt_gcmedbuckets
WHERE regexp_like("$path", 'cobalt_gcmedbuckets\.parquet$')
;
