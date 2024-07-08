
select * from graduado.graduado.hoja_vida_produccion hvp 
select count(*) from graduado.graduado.hoja_vida_produccion hvp --0
select * from graduado.graduado.hoja_vida_tipo_campo_produccion hvtcp
select count(*) from graduado.graduado.hoja_vida_tipo_campo_produccion hvtcp --0
select * from graduado.graduado.hoja_vida_tipo_produccion hvtp 
select count(*) from graduado.graduado.hoja_vida_tipo_produccion hvtp --0
select * from graduado.graduado.modalidad_grado mg 
select count(*) from graduado.graduado.modalidad_grado mg -- 0
select * from graduado.graduado.ocupacion_cargo oc 
select count(*) from graduado.graduado.ocupacion_cargo oc -- 0
select * from graduado.graduado.programa_area pa 
select count(*) from graduado.graduado.programa_area pa -- 0


-----------------------------------------------------
-------------TABLAS ENCUESTA EGRESADOS---------------
-----------------------------------------------------
select * from graduado.graduado.datos_complementarios dc where dc.est_codigo = '20171157616'
select count(*) from graduado.graduado.datos_complementarios dc -- 9368
select * from graduado.graduado.historial_academico ha where ha.per_codigo = 83865
select count(*) from graduado.graduado.historial_academico ha --954
select * from graduado.graduado.historial_laboral hl where hl.per_codigo = 108797
select count(*) from graduado.graduado.historial_laboral hl --3678
select * from graduado.graduado.idioma i  
select count(*) from graduado.graduado.idioma i  -- 3087
select * from graduado.graduado.programas_informaticos pi2 
select count(*) from graduado.graduado.programas_informaticos pi2 --5794


select * from graduado.graduado.datos_complementarios dc 


--Título Trabajo de Grado
--4. Perfil Profesional
select * from graduado.graduado.datos_complementarios dc


--3. Experiencia Laboral y/o Profesional
select * from graduado.graduado.historial_laboral hl where hl.per_codigo = 108797

--Idiomas que domina
select * from graduado.graduado.idioma i 

--2.Programas de informática que domina
select * from graduado.graduado.programas_informaticos pi2 WHERE pi2.pri_persona = 108797 





-----------------------------------------------------
-------TABLAS ENCUESTA SEGUIMIENTO GRADUADOS---------
-----------------------------------------------------
--Satisfacción con la Formación
select * from graduado.reportes.competencia c order by c.com_orden 
select * from graduado.reportes.competencia_escala_evaluacion cee 
select * from graduado.reportes.competencia_evaluacion ce 
select * from graduado.reportes.tipo_competencia tc 

--Expectativas de Capacitación y Formación
select * from graduado.reportes.expectativas_capacitacion ec 
select * from graduado.reportes.expectativas_capacitacion_escala_evaluacion ecee 
select * from graduado.reportes.expectativas_capacitacion_evaluacion ece where ece.per_codigo = 83865


--Situación Laboral
select * from graduado.reportes.situacion_laboral sl
select * from graduado.reportes.situacion_laboral_escala_evaluacion slee 
select * from graduado.reportes.situacion_laboral_evaluacion sle


select * from graduado.reportes.expectativas_capacitacion ec 
inner join graduado.reportes.expectativas_capacitacion_escala_evaluacion ecee on ec.exc_orden = ecee.ece_pregunta 

where 

select * from graduado.reportes.expectativas_capacitacion ec
inner join graduado.reportes.expectativas_capacitacion_escala_evaluacion ecee on ec.exc_orden = ecee.ece_pregunta 


select * from graduado.graduado.menbresia m where m.per_codigo = 83865
select count(*) from graduado.graduado.menbresia m -- 84






select * from graduado.reportes.competencia_evaluacion
select * from graduado.reportes.competencia c  






--TABLAS 12 CON REGISTROS 6
--VISTAS ESQUEMA GRADUADOS 0

--VISTAS DBO 
select * from graduado.dbo.encuestados e --NO FUNCIONA
select * from graduado.dbo.encuestadosCompetencias ec  --NO FUNCIONA


select * from graduado.reportes.competencia c  

select * from graduado.reportes.competencia_escala_evaluacion cee 

select * from graduado.reportes.competencia_evaluacion ce 


select * from graduado.reportes.expectativas_capacitacion_escala_evaluacion ecee 