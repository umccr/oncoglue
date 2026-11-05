CREATE OR REPLACE VIEW tidydragen.v_dragentso_smallvariants AS
SELECT *
FROM tidydragen.dragentso_smallvariants
WHERE regexp_like("$path", 'dragentso_smallvariants\.parquet$')
;
