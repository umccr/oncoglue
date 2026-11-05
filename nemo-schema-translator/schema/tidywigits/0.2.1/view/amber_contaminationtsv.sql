CREATE OR REPLACE VIEW tidywigits.v_amber_contaminationtsv AS
SELECT *
FROM tidywigits.amber_contaminationtsv
WHERE regexp_like("$path", 'amber_contaminationtsv\.parquet$')
;
