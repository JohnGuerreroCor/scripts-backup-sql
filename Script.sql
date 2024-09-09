select * from persona p 

-- 1032403318 Julian Artunduaga  31899 -- 182591 son 44 matriculados por registro.
-- 13820515 Fabio Rojas Lozada   5524   -- 182634 ninguna estudiante matriculado, 182591 
-- 5610249 Anay Lien Yanes       165563  
-- 7706067 Hector Leo Perdomo   24868 -- 182591

--
select * from evadoc_evaluacion ee where ee.eva_curso = 182591

select * from persona p where per_identificacion='7706067'

select a.cur_codigo, cal.cal_nombre  from agenda_periodo a
inner join curso c on a.cur_codigo = c.cur_codigo
inner join calendario cal on cal.cal_codigo= c.cal_codigo
where a.per_codigo=24868


select * from curso

select * from calendario where cal_codigo=229

select * from matricula_curso where cur_codigo=182591

select * from matricula where 
