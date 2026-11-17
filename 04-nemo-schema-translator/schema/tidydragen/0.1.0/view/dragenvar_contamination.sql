CREATE OR REPLACE VIEW tidydragen.v_dragenvar_contamination AS
SELECT *
FROM tidydragen.dragenvar_contamination
WHERE regexp_like("$path", 'dragenvar_contamination\.parquet$')
;
