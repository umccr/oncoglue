CREATE OR REPLACE VIEW tidywigits.v_purple_somclonality AS
SELECT *
FROM tidywigits.purple_somclonality
WHERE regexp_like("$path", 'purple_somclonality\.parquet$')
;
