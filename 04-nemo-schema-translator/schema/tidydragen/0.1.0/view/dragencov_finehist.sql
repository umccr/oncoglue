CREATE OR REPLACE VIEW tidydragen.v_dragencov_finehist AS
SELECT *
FROM tidydragen.dragencov_finehist
WHERE regexp_like("$path", 'dragencov_finehist\.parquet$')
;
