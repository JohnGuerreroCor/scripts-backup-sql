--*******************************--
--****GRADUADOS ADMINISTRADOR****--
--*******************************--

DROP TABLE academia3000_john.graduado.aud_inscripcion_graduado;
DROP TABLE academia3000_john.graduado.aud_inscripcion_intento ;
DROP TABLE academia3000_john.graduado.inscripcion_graduado;
DROP TABLE academia3000_john.graduado.inscripcion_graduado_tipo;
DROP TABLE academia3000_john.graduado.inscripcion_intento;
 

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Graduado Administrador', 'Módulo administrador para el estamento graduados', getDate(), 1);

select * from modulo m order by m.mod_codigo desc

-------------------------
--TABLAS Y DISPARADORES--
-------------------------

--TABLA DATOS COMPLEMENTARIOS
--CREATE TABLE academia3000_john.graduado.datos_complementarios (
	dac_codigo int IDENTITY(1,1) NOT NULL,
	est_codigo char(11) NOT NULL,
	dac_trabajo_grado varchar(200) NULL,
	dac_perfil_profesional varchar(MAX) NULL,
	dac_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_datos_complementarios PRIMARY KEY (dac_codigo),
	CONSTRAINT datos_complementarios_FK_estudiante FOREIGN KEY (est_codigo) REFERENCES academia3000_john.dbo.estudiante(est_codigo)
);

select * from academia3000_john.graduado.datos_complementarios dc 

select * from carnetizacion.usuario_carnet_digital_login ucdl 

--TABLA HISTORIAL LABORAL
--CREATE TABLE academia3000_john.graduado.historial_laboral (
	hil_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	hil_cargo varchar(100) NOT NULL,
	hil_funcion varchar(100) NOT NULL,
	hil_empresa varchar(100) NOT NULL,
	hil_fecha_inicio date NOT NULL,
	hil_fecha_fin date NULL,
	hil_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_historial_laboral PRIMARY KEY (hil_codigo),
	CONSTRAINT historial_laboral_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

select * from academia3000_john.graduado.historial_laboral hl 


--TABLA IDIOMA
--CREATE TABLE academia3000_john.graduado.idioma (
	idi_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	idi_idioma varchar(50) NOT NULL,
	idi_conversacion int NOT NULL,
	idi_escritura int NOT NULL,
	idi_lectura int NOT NULL,
	idi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_idioma PRIMARY KEY (idi_codigo),
	CONSTRAINT idioma_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

select * from academia3000_john.graduado.idioma i 


--TABLA MEMBRESIA
--CREATE TABLE academia3000_john.graduado.membresia (
	mem_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NULL,
	mem_institucion varchar(255) NULL,
	mem_tipo varchar(255) NULL,
	mem_ambito bigint NULL,
	mem_titulo varchar(255) NULL,
	mem_descripcion varchar(255) NULL,
	mun_codigo int NULL,
	mem_fecha datetime NULL,
	mem_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_membresia PRIMARY KEY (mem_codigo),
	CONSTRAINT membresia_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT membresia_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES academia3000_john.dbo.municipio(mun_codigo)
);


--TABLA PROGRAMAS INFORMATICOS
--CREATE TABLE graduado.graduado.programas_informaticos (
	pri_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	pri_programa char(50) NOT NULL,
	pri_manejo int NOT NULL,
	pri_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_membresia PRIMARY KEY (pri_codigo),
	CONSTRAINT programas_informaticos_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);


--TABLA SOPRTE FECHA EXPEDICION
--CREATE TABLE academia3000_john.graduado.soporte_fecha_expedicion (
	sfe_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	sfe_nombre varchar(200) NULL,
	sde_fecha_creacion date DEFAULT getdate() NOT NULL,
	sfe_estado int DEFAULT 1 NOT NULL,
	sfe_ruta int NOT NULL,
	CONSTRAINT firma_digital_PK PRIMARY KEY (fid_codigo),
	CONSTRAINT firma_digital_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);


---------------------------------------------------------------SEGUNDA SECCIÓN FORMULARIO DE SEGUIMIENTO

--TABLA COMPETENCIA
--CREATE TABLE academia3000_john.graduado.competencia (
	com_codigo int IDENTITY(1,1) NOT NULL,
	com_nombre varchar(255) NOT NULL,
	com_orden int NOT NULL,
	com_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_pkey PRIMARY KEY (com_codigo)
);

--TABLA COMPETENCIA ESCALA EVALUACION
--CREATE TABLE academia3000_john.graduado.competencia_escala_evaluacion (
	cee_codigo int IDENTITY(1,1) NOT NULL,
	cee_nombre varchar(100) NOT NULL,
	cee_estado int DEFAULT 1 NOT NULL, 
	CONSTRAINT competencia_escala_evaluacion_pkey PRIMARY KEY (cee_codigo)
);

--TABLA COMPETENCIA EVALUACION
--CREATE TABLE academia3000_john.graduado.competencia_evaluacion (
	coe_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	coe_competencia int NULL,
	coe_evaluacion int NULL,
	coe_fecha_hora datetime DEFAULT getdate() NULL,
	CONSTRAINT PK_competencia_evaluacion PRIMARY KEY (coe_codigo),
	CONSTRAINT competencia_evaluacion_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

--TABLA HISTORIAL ACADÉMICO
--CREATE TABLE academia3000_john.graduado.historial_academico (
	hia_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	hia_titulo varchar(255) NOT NULL,
	nia_codigo int NOT NULL,
	hia_institucion varchar(255) NOT NULL,
	mun_codigo int NOT NULL,
	hia_fecha_inicio date NOT NULL,
	hia_fecha_fin date NULL,
	hia_finalizado int NOT NULL,
	hia_estado int DEFAULT 1 NOT NULL, 
	CONSTRAINT historial_academico_PK PRIMARY KEY (hia_codigo),
	CONSTRAINT historial_academico_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT historial_academico_FK_nivel_academico FOREIGN KEY (nia_codigo) REFERENCES academia3000_john.dbo.nivel_academico(nia_codigo),
	CONSTRAINT historial_academico_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES academia3000_john.dbo.municipio(mun_codigo)
);

select * from academia3000_john.graduado.historial_academico ha 
inner join persona p on ha.per_codigo = p.per_codigo 
inner join nivel_academico na on ha.nia_codigo = na.nia_codigo 
left join pais pa on ha.hia_pais = pa.pai_codigo 
left join departamento d on pa.pai_codigo = d.pai_codigo 
left join municipio m on d.dep_codigo = m.dep_codigo 
where p.per_identificacion = 


---------------------------------------------Situación laboral
--TABLA SITUACION LABORAL PREGUNTA
--CREATE TABLE academia3000_john.graduado.situacion_laboral_pregunta (
	slp_codigo int IDENTITY(1,1) NOT NULL,
	slp_nombre varchar(255) NOT NULL,
	slp_orden int NULL,
	slp_estado int DEFAULT 1 NULL,
	CONSTRAINT situacion_laboral_pregunta_PK PRIMARY KEY (slp_codigo)
);


--TABLA SITUACION LABORAL ESCALA
--CREATE TABLE academia3000_john.graduado.situacion_laboral_escala (
	sle_codigo int IDENTITY(1,1) NOT NULL,
	slp_codigo int NOT NULL,
	sle_respuesta varchar(200) NOT NULL,
	sle_estado int DEFAULT 1 NULL,
	CONSTRAINT situacion_laboral_escala_PK PRIMARY KEY (sle_codigo),
	CONSTRAINT situacion_laboral_escala_FK_situacion_laboral_pregunta FOREIGN KEY (slp_codigo) REFERENCES academia3000_john.graduado.situacion_laboral_pregunta(slp_codigo)
);

--TABLA SITUACION LABORAL RESPUESTA
--CREATE TABLE academia3000_john.graduado.situacion_laboral_respuesta (
	slr_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	slp_codigo int NOT NULL,
	sle_codigo int NOT NULL,
	slr_fecha date DEFAULT getdate() NULL,
	CONSTRAINT situacion_laboral_respuesta_PK PRIMARY KEY (slr_codigo),
	CONSTRAINT situacion_laboral_respuesta_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT situacion_laboral_respuesta_FK_situacion_laboral_pregunta FOREIGN KEY (slp_codigo) REFERENCES academia3000_john.graduado.situacion_laboral_pregunta(slp_codigo),
	CONSTRAINT situacion_laboral_respuesta_FK_situacion_laboral_escala FOREIGN KEY (sle_codigo) REFERENCES academia3000_john.graduado.situacion_laboral_escala(sle_codigo)
);


select * from academia3000_john.graduado.situacion_laboral_respuesta


select slr.slr_codigo, slr.per_codigo, slr.slp_codigo, slp.slp_nombre, slr.sle_codigo, sle.sle_respuesta, slr.slr_fecha from academia3000_john.graduado.situacion_laboral_respuesta slr 
left join persona p on slr.per_codigo = p.per_codigo 
left join academia3000_john.graduado.situacion_laboral_pregunta slp on slr.slp_codigo = slp.slp_codigo 
left join academia3000_john.graduado.situacion_laboral_escala sle on slr.sle_codigo = sle.sle_codigo 
where p.per_identificacion = '1075282351'


---------------------------------------------Expectativas de Capacitación y Formación
--TABLA EXPECTATIVAS CAPACITACION PREGUNTA
--CREATE TABLE academia3000_john.graduado.expectativas_capacitacion_pregunta (
	ecp_codigo int IDENTITY(1,1) NOT NULL,
	ecp_nombre varchar(255) NOT NULL,
	ecp_orden int NULL,
	ecp_estado int DEFAULT 1 NULL,
	CONSTRAINT expectativas_capacitacion_pregunta_PK PRIMARY KEY (ecp_codigo)
);
INSERT INTO academia3000_john.graduado.expectativas_capacitacion_pregunta
(ecp_nombre, ecp_orden)
VALUES('¿Tiene interés en continuar su proceso de formación académica?', 1);
INSERT INTO academia3000_john.graduado.expectativas_capacitacion_pregunta
(ecp_nombre, ecp_orden)
VALUES('¿A qué nivel de formación académica aspira?', 2);
INSERT INTO academia3000_john.graduado.expectativas_capacitacion_pregunta
(ecp_nombre, ecp_orden)
VALUES('¿Puede indicar el área de conocimiento en la que desearía cursar estudios?', 3);

select * from academia3000_john.graduado.expectativas_capacitacion_pregunta

--TABLA EXPECTATIVAS CAPACITACION ESCALA
--CREATE TABLE academia3000_john.graduado.expectativas_capacitacion_escala (
	ece_codigo int IDENTITY(1,1) NOT NULL,
	ecp_codigo int NOT NULL,
	ece_respuesta varchar(255) NULL,
	ece_estado int DEFAULT 1 NULL,
	CONSTRAINT expectativas_capacitacion_escala_PK PRIMARY KEY (ece_codigo),
	CONSTRAINT expectativas_capacitacion_escala_FK_expectativas_capacitacion_pregunta FOREIGN KEY (ecp_codigo) REFERENCES academia3000_john.graduado.expectativas_capacitacion_pregunta(ecp_codigo),
);
select * from graduado.expectativas_capacitacion_escala ece where ece.ecp_codigo = and ece.ece_estado = 1

--TABLA EXPECTATIVAS CAPACITACION RESPUESTA
--CREATE TABLE academia3000_john.graduado.expectativas_capacitacion_respuesta (
	ecr_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	ecp_codigo int NOT NULL,
	ece_codigo int NOT NULL,
	ecr_fecha date DEFAULT getdate() NULL,
	CONSTRAINT expectativas_capacitacion_respuesta_PK PRIMARY KEY (ecr_codigo),
	CONSTRAINT expectativas_capacitacion_respuesta_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT expectativas_capacitacion_respuesta_FK_expectativas_capacitacion_pregunta FOREIGN KEY (ecp_codigo) REFERENCES academia3000_john.graduado.expectativas_capacitacion_pregunta(ecp_codigo),
	CONSTRAINT expectativas_capacitacion_respuesta_FK_expectativas_capacitacion_escala FOREIGN KEY (ece_codigo) REFERENCES academia3000_john.graduado.expectativas_capacitacion_escala(ece_codigo)
);

select * from academia3000_john.graduado.expectativas_capacitacion_respuesta ecr 
select count(*) from academia3000_john.graduado.expectativas_capacitacion_respuesta ecr 


select ecr.ecr_codigo, ecr.per_codigo, ecr.ecp_codigo, ecp.ecp_nombre, ecr.ece_codigo, ece.ece_respuesta, ecr.ecr_fecha from academia3000_john.graduado.expectativas_capacitacion_respuesta ecr 
left join persona p on ecr.per_codigo = p.per_codigo 
left join academia3000_john.graduado.expectativas_capacitacion_pregunta ecp on ecr.ecp_codigo = ecp.ecp_codigo 
left join academia3000_john.graduado.expectativas_capacitacion_escala ece on ecr.ece_codigo = ece.ece_codigo 
where p.per_identificacion = '1075303330' or ecp.ece_estado = 1



---------------------------------------------Distinciones y reconocimientos

--TABLA MENCION Y RECONOCIMIENTO
CREATE TABLE academia3000_john.graduado.mencion_reconocimiento (
	mer_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	mer_institucion varchar(255) NULL,
	mer_tipo varchar(255) NULL,
	amb_codigo int NOT NULL,
	mer_titulo varchar(255) NULL,
	mer_descripcion varchar(255) NULL,
	mun_codigo int NOT NULL,
	mer_fecha date DEFAULT getdate() NULL,
	mer_estado int DEFAULT 1 NULL,
	CONSTRAINT mencion_reconocimiento_PK PRIMARY KEY (mer_codigo),
	CONSTRAINT mencion_reconocimiento_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT mencion_reconocimiento_FK_ambito FOREIGN KEY (amb_codigo) REFERENCES academia3000_john.graduado.ambito(amb_codigo),
	CONSTRAINT mencion_reconocimiento_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES academia3000_john.dbo.municipio(mun_codigo)
);

--TABLA AMBITO
CREATE TABLE academia3000_john.graduado.ambito ( 
	amb_codigo int IDENTITY(1,1) NOT NULL,
	amb_nombre varchar(200) NULL,
	amb_estado int DEFAULT 1 NULL,
	CONSTRAINT ambito_PK PRIMARY KEY (amb_codigo)
);

select * from academia3000_john.graduado.ambito a 

INSERT INTO academia3000_john.graduado.ambito
(amb_nombre)
VALUES('MUNICIPAL');
INSERT INTO academia3000_john.graduado.ambito
(amb_nombre)
VALUES('DEPARTAMENTAL');
INSERT INTO academia3000_john.graduado.ambito
(amb_nombre)
VALUES('REGIONAL');
INSERT INTO academia3000_john.graduado.ambito
(amb_nombre)
VALUES('NACIONAL');
INSERT INTO academia3000_john.graduado.ambito
(amb_nombre)
VALUES('LATINOAMERICANO');
INSERT INTO academia3000_john.graduado.ambito
(amb_nombre)
VALUES('INTERNACIONAL');


select * from academia3000_john.graduado.mencion_reconocimiento mr 
inner join persona p on mr.per_codigo = p.per_codigo 
inner join graduado.ambito a on mr.amb_codigo = a.amb_codigo 
inner join municipio m on mr.mun_codigo = m.mun_codigo 
where p.per_identificacion = '1075247796'


select * from persona p where p.per_codigo = 57607


select * from egresado_estadistica ee 


---------------------------------------------Satisfacción con la Formación

--TABLA COMPETENCIA TIPO
--CREATE TABLE academia3000_john.graduado.competencia_tipo (
	cot_codigo int IDENTITY(1,1) NOT NULL,
	cot_nombre varchar(255) NOT NULL,
	cot_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_tipo_PK PRIMARY KEY (cot_codigo)
); 

INSERT INTO academia3000_john.graduado.competencia_tipo
(cot_nombre)
VALUES('Competencias Generales');

INSERT INTO academia3000_john.graduado.competencia_tipo
(cot_nombre)
VALUES('Competencias Laborales Generales');

INSERT INTO academia3000_john.graduado.competencia_tipo
(cot_nombre)
VALUES('Satisfacción de las Competencias');


select * from academia3000_john.graduado.competencia_tipo ct


--TABLA COMPETENCIA PREGUNTA
--CREATE TABLE academia3000_john.graduado.competencia_pregunta (
	cop_codigo int IDENTITY(1,1) NOT NULL,
	cot_codigo int NOT NULL,
	cop_nombre varchar(255) NOT NULL,
	cop_orden int NOT NULL,
	cop_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_pregunta_PK PRIMARY KEY (cop_codigo),
	CONSTRAINT competencia_pregunta_FK_competencia_tipo FOREIGN KEY (cot_codigo) REFERENCES academia3000_john.graduado.competencia_tipo(cot_codigo)
);

select * from academia3000_john.graduado.competencia_pregunta cp where cp.cot_codigo = 2 ORDER by cop_orden asc

--TABLA COMPETENCIA ESCALA
--CREATE TABLE academia3000_john.graduado.competencia_escala (
	coe_codigo int IDENTITY(1,1) NOT NULL,
	coe_nombre varchar(100) NOT NULL,
	coe_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_escala_PK PRIMARY KEY (coe_codigo)
);

INSERT INTO academia3000_john.graduado.competencia_escala
(coe_nombre)
VALUES('Muy Insatisfecho');

INSERT INTO academia3000_john.graduado.competencia_escala
(coe_nombre)
VALUES('Insatisfecho');

INSERT INTO academia3000_john.graduado.competencia_escala
(coe_nombre)
VALUES('Satisfecho');

INSERT INTO academia3000_john.graduado.competencia_escala
(coe_nombre)
VALUES('Muy satisfecho');

select * from academia3000_john.graduado.competencia_escala ce

--TABLA COMPETENCIA RESPUESTA
--CREATE TABLE academia3000_john.graduado.competencia_respuesta (
	cor_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	cop_codigo int NOT NULL,
	coe_codigo int NOT NULL,
	cor_fecha date DEFAULT getdate() NULL,
	CONSTRAINT competencia_respuesta_PK PRIMARY KEY (cor_codigo),
	CONSTRAINT competencia_respuesta_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT competencia_respuesta_FK_competencia_pregunta FOREIGN KEY (cop_codigo) REFERENCES academia3000_john.graduado.competencia_pregunta(cop_codigo),
	CONSTRAINT competencia_respuesta_FK_competencia_escala FOREIGN KEY (coe_codigo) REFERENCES academia3000_john.graduado.competencia_escala(coe_codigo)
	
);

select * from academia3000_john.graduado.competencia_respuesta cr 
inner join persona p on cr.per_codigo = p.per_codigo 
inner join academia3000_john.graduado.competencia_pregunta cp on cr.cop_codigo = cp.cop_codigo 
inner join academia3000_john.graduado.competencia_escala ce on cr.coe_codigo = ce.coe_codigo 
where p.per_identificacion = '1075303330' and cp.cot_codigo = 1 order by cp.cop_orden 







---------------------------------------------------------------SEGUNDA SECCIÓN FORMULARIO DE EGRESADOS

CREATE TABLE academia3000_john.graduado.datos_complementarios (
	dac_codigo int IDENTITY(1,1) NOT NULL,
	est_codigo char(11) NOT NULL,
	dac_modalidad_grado varchar(200) NULL,
	dac_perfil_profesional varchar(MAX) NULL,
	dac_fecha date DEFAULT getdate() NULL,
	CONSTRAINT datos_complementarios_PK PRIMARY KEY (dac_codigo),
	CONSTRAINT datos_complementarios_FK_estudiante FOREIGN KEY (est_codigo) REFERENCES academia3000_john.dbo.estudiante(est_codigo)
);


select * from academia3000_john.graduado.datos_complementarios dc order by dc.dac_codigo  desc


--PROGRAMAS INFORMÁTICOS --- habilidades informaticas

CREATE TABLE academia3000_john.graduado.habilidad_informatica_dominio (
	hid_codigo int IDENTITY(1,1) NOT NULL,
	hid_nombre varchar(100) NOT NULL,
	hid_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT habilidad_informatica_dominio_PK PRIMARY KEY (hid_codigo)
);

INSERT INTO academia3000_john.graduado.habilidad_informatica_dominio
(hid_nombre)
VALUES('EXCELENTE');
INSERT INTO academia3000_john.graduado.habilidad_informatica_dominio
(hid_nombre)
VALUES('BUENO');
INSERT INTO academia3000_john.graduado.habilidad_informatica_dominio
(hid_nombre)
VALUES('REGULAR');

select * from academia3000_john.graduado.habilidad_informatica_dominio hid 


CREATE TABLE academia3000_john.graduado.habilidad_informatica (
	hai_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	hai_nombre_programa char(100) NOT NULL,
	hid_codigo int NOT NULL,
	hai_estado int DEFAULT 1 NOT NULL
	CONSTRAINT habilidad_informatica_PK PRIMARY KEY (hai_codigo),
	CONSTRAINT habilidad_informatica_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT habilidad_informatica_FK_habilidad_informatica_dominio FOREIGN KEY (hid_codigo) REFERENCES academia3000_john.graduado.habilidad_informatica_dominio(hid_codigo)
);

select * from graduado.habilidad_informatica hi 
inner join persona p on hi.per_codigo = p.per_codigo 
inner join graduado.habilidad_informatica_dominio hid on hi.hid_codigo = hid.hid_codigo 
where p.per_identificacion = '1075295175'


--------------------------------IDIOMAS
CREATE TABLE academia3000_john.graduado.idioma_dominio (
	idd_codigo int IDENTITY(1,1) NOT NULL,
	idd_nombre varchar(100) NOT NULL,
	idd_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT idioma_dominio_PK PRIMARY KEY (idd_codigo)
);

INSERT INTO academia3000_john.graduado.idioma_dominio
(idd_nombre)
VALUES('EXCELENTE');
INSERT INTO academia3000_john.graduado.idioma_dominio
(idd_nombre)
VALUES('BUENO');
INSERT INTO academia3000_john.graduado.idioma_dominio
(idd_nombre)
VALUES('REGULAR');
INSERT INTO academia3000_john.graduado.idioma_dominio
(idd_nombre)
VALUES('MALO');
INSERT INTO academia3000_john.graduado.idioma_dominio
(idd_nombre)
VALUES('DEFICIENTE');

select * from academia3000_john.graduado.idioma_dominio

--TALBA IDIOMA
CREATE TABLE academia3000_john.graduado.idioma (
	idi_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	idi_idioma varchar(50) NOT NULL,
	idi_conversacion int NOT NULL,
	idi_escritura int NOT NULL,
	idi_lectura int NOT NULL,
	idi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT idioma_PK PRIMARY KEY (idi_codigo),
	CONSTRAINT idioma_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

select * from academia3000_john.graduado.idioma


select i.idi_codigo, p.per_codigo, i.idi_idioma, idc.idd_codigo as conversacionCodigo, idc.idd_nombre as conversacion, ide.idd_codigo as escrituraCodigo, ide.idd_nombre as escritura, idl.idd_codigo as lecturaCodigo, idl.idd_nombre as lectura, i.idi_estado from academia3000_john.graduado.idioma i 
inner join persona p on i.per_codigo = p.per_codigo 
inner join graduado.idioma_dominio idc on i.idi_conversacion = idc.idd_codigo 
inner join graduado.idioma_dominio ide on i.idi_escritura = ide.idd_codigo 
inner join graduado.idioma_dominio idl on i.idi_lectura = idl.idd_codigo 
where p.per_identificacion = '1075295175'


--TABLA REGISTRO EDUCATIVO EGRESADO
CREATE TABLE academia3000_john.graduado.registro_educativo (
	ree_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	ree_titulo varchar(255) NOT NULL,
	nia_codigo int NOT NULL,
	ree_institucion varchar(255) NOT NULL,
	mun_codigo int NOT NULL,
	ree_fecha_fin date NOT NULL,
	ree_finalizado int NOT NULL,
	ree_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT registro_educativo_PK PRIMARY KEY (ree_codigo),
	CONSTRAINT registro_educativo_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT registro_educativo_FK_nivel_academico FOREIGN KEY (nia_codigo) REFERENCES academia3000_john.dbo.nivel_academico(nia_codigo),
	CONSTRAINT registro_educativo_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES academia3000_john.dbo.municipio(mun_codigo)
);

select * from academia3000_john.graduado.registro_educativo


select * from academia3000_john.graduado.registro_educativo re 
inner join persona p on re.per_codigo = p.per_codigo 
inner join nivel_academico na on re.nia_codigo = na.nia_codigo 
inner join municipio m on re.mun_codigo = m.mun_codigo 
where p.per_identificacion = '1075247796' order by re.ree_fecha_fin desc


--Datos complementarios
CREATE TABLE academia3000_john.graduado.datos_complementarios (
	dac_codigo int IDENTITY(1,1) NOT NULL,
	est_codigo char(11) NOT NULL,
	dac_modalidad_grado varchar(250) NULL,
	dac_perfil_profesional varchar(MAX) NULL,
	CONSTRAINT datos_complementarios_PK PRIMARY KEY (dac_codigo),
	CONSTRAINT datos_complementarios_FK_estudiante FOREIGN KEY (est_codigo) REFERENCES academia3000_john.dbo.estudiante(est_codigo)
);

select * from academia3000_john.graduado.datos_complementarios dc 

select top 1 * from academia3000_john.graduado.datos_complementarios dc 
inner join estudiante e on dc.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
where p.per_identificacion = '1018427697' order by e.est_codigo desc


--Experiencia laboral
CREATE TABLE academia3000_john.graduado.historial_laboral (
	hil_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	hil_cargo varchar(100) NOT NULL,
	hil_funcion varchar(100) NOT NULL,
	hil_empresa varchar(100) NOT NULL,
	hil_fecha_inicio date NOT NULL,
	hil_fecha_fin date NULL,
	hil_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT historial_laboral_PK PRIMARY KEY (hil_codigo),
	CONSTRAINT historial_laboral_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

select * from academia3000_john.graduado.historial_laboral hl
inner join persona p on hl.per_codigo = p.per_codigo 
where hl.hil_estado = 1 and p.per_identificacion = '1075247796'


--Encuesta Seguimiento Graduados
--CREATE TABLE academia3000_john.graduado.encuesta_seguimiento_graduado (
	esg_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	esg_fecha_registro date DEFAULT getdate() NOT NULL,
	esg_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT encuesta_seguimiento_graduado_PK PRIMARY KEY (esg_codigo),
	CONSTRAINT encuesta_seguimiento_graduado_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

--Encuesta Egresado
--CREATE TABLE academia3000_john.graduado.encuesta_egresado (
	ene_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	ene_fecha_registro date DEFAULT getdate() NOT NULL,
	ene_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT encuesta_egresado_PK PRIMARY KEY (ene_codigo),
	CONSTRAINT encuesta_egresado_FK_persona FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo)
);

select * from academia3000_john.graduado.encuesta_egresado ee 

select * from academia3000_john.graduado.encuesta_seguimiento_graduado esg 

select DISTINCT cr.per_codigo from academia3000_john.graduado.competencia_respuesta cr 

select e.per_codigo from academia3000_john.graduado.datos_complementarios dc 
inner join estudiante e on dc.est_codigo = e.est_codigo 

select * from academia3000_john.graduado.historial_laboral hl 
left join academia3000_john.graduado.encuesta_egresado ee on hl.per_codigo = ee.per_codigo 

-------------------------
-------CONSULTAS---------
-------------------------
select * from graduado.competencia_respuesta cr 
inner join persona p on cr.per_codigo = p.per_codigo 
inner join graduado.competencia_pregunta cp on cr.cop_codigo = cp.cop_codigo 
inner join graduado.competencia_escala ce on cr.coe_codigo = ce.coe_codigo 


---REPORTE SATISFACCION CON LA FORMACION

with resultado(per_codigo, per_nombre, cor_fecha,cop_codigo,coe_nombre)as(
select p.per_codigo,p.per_nombre, cr.cor_fecha,cp.cop_codigo, ce.coe_nombre from persona p
inner join graduado.competencia_respuesta cr on p.per_codigo = cr.per_codigo 
inner join graduado.competencia_pregunta cp on cr.cop_codigo = cp.cop_codigo 
inner join graduado.competencia_escala ce on cr.coe_codigo = ce.coe_codigo
where convert(Date, cr.cor_fecha) BETWEEN '2016-06-01' AND '2023-07-31' 
) select * from resultado pivot(max(coe_nombre) for cop_codigo in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28]))as pvt
order by cor_fecha asc

select * from graduado.competencia_respuesta cr 
select * from graduado.competencia_pregunta cp
select * from graduado.competencia_escala ce

---REPORTE SITUACIÓN LABORAL

with resultado(per_codigo, per_nombre, per_apellido, slr_fecha,slp_codigo,sle_nombre)as(
select p.per_codigo,p.per_nombre, p.per_apellido, slr.slr_fecha,slp.slp_codigo, sle.sle_respuesta from persona p
inner join graduado.situacion_laboral_respuesta slr on p.per_codigo = slr.per_codigo 
inner join graduado.situacion_laboral_pregunta slp on slr.slp_codigo = slp.slp_codigo 
inner join graduado.situacion_laboral_escala sle on slr.sle_codigo = sle.sle_codigo
where convert(Date, slr.slr_fecha) BETWEEN '2016-06-01' AND '2023-07-31' 
) select * from resultado pivot(max(sle_nombre) for slp_codigo in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10]))as pvt
order by slr_fecha asc

select * from academia3000_john.graduado.situacion_laboral_respuesta slr 
select * from academia3000_john.graduado.situacion_laboral_pregunta slp  
select * from academia3000_john.graduado.situacion_laboral_escala sle  

---REPORTE EXPECTATIVA Y CAPACITACION

with resultado(per_codigo, per_nombre, per_apellido, ecr_fecha, ecp_codigo, ece_respuesta)as(
select p.per_codigo,p.per_nombre, p.per_apellido, ecr.ecr_fecha, ecp.ecp_codigo, ece.ece_respuesta from persona p
inner join graduado.expectativas_capacitacion_respuesta ecr on p.per_codigo = ecr.per_codigo 
inner join graduado.expectativas_capacitacion_pregunta ecp on ecr.ecp_codigo = ecp.ecp_codigo 
inner join graduado.expectativas_capacitacion_escala ece on ecr.ece_codigo = ece.ece_codigo
where convert(Date, ecr.ecr_fecha) BETWEEN '2016-06-01' AND '2023-07-31' 
) select * from resultado pivot(max(ece_respuesta) for ecp_codigo in ([1],[2],[3]))as pvt
order by ecr_fecha asc

select * from academia3000_john.graduado.expectativas_capacitacion_respuesta ecr  
select * from academia3000_john.graduado.expectativas_capacitacion_pregunta ecp  
select * from academia3000_john.graduado.expectativas_capacitacion_escala ece  

select * from usuario_graduado_admin_login ugl where ugl.us in ('a1075303330','a1075261344')

-- REPORTE FORMACION ACADÉMICA
select * from graduado.historial_academico ha 
inner join persona p on ha.per_codigo = p.per_codigo 
inner join nivel_academico na on ha.nia_codigo = na.nia_codigo 
left join pais pa on ha.hia_pais = pa.pai_codigo 
left join departamento d on pa.pai_codigo = d.pai_codigo 
left join municipio m on d.dep_codigo = m.dep_codigo 
where convert(Date, ha.hia_fecha_fin) BETWEEN '2016-06-01' AND '2023-07-31' 

select * from academia3000_john.graduado.historial_academico ha  


-- RPORTE MENCION Y RECONOCIMIENTO

select * from graduado.mencion_reconocimiento mr 
inner join persona p on mr.per_codigo = p.per_codigo 
inner join graduado.ambito a on mr.amb_codigo = a.amb_codigo 
inner join municipio m on mr.mun_codigo = m.mun_codigo 
where convert(Date, mr.mer_fecha) BETWEEN '2016-06-01' AND '2023-07-31'

select * from encuestas.respuestas_cuestionarios rc 


select * from usuario_sibusco_restaurante_login usrl 



select * from plan_academico pa 
select * from periodo p 



select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where u.uaa_nombre like '%SOFTWARE%'

WHERE pe.per_nombre BETWEEN :inicio AND :fin  
AND pro.pro_codigo IN(SELECT * FROM dbo.Split(:pro_codigo,','))  AND (mat.mat_estado != 'I')  
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%' 
OR SUBSTRING(est.est_codigo, 1, 5) in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN :inicio AND :fin)) 
ORDER BY pe.per_año, pe.per_nombre,sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_nombre, u.uaa_nombre  




with resultado(rcu_codigo, slr_fecha, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.rcu_fecha, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 11
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([190],[191],[192],[193],[194],[195],[196],[197],[198],[199],[200],[201],[202],[203],[204],[205],[206],[207],[208],[209],[210],[211],[212],[213],[214],[215])) as pvt


select * from graduado.historial_laboral hl
inner join persona p on hl.per_codigo = p.per_codigo
left join academia3000_john.graduado.encuesta_egresado ee on hl.per_codigo = ee.per_codigo 
where hl.hil_estado = 1 and convert(Date, ee.ene_fecha_registro) BETWEEN '2023-10-17' AND '2023-10-17' 


select * from graduado.datos_complementarios dc 
left join estudiante e on dc.est_codigo = e.est_codigo 
left join persona p on e.per_codigo = p.per_codigo 
left join programa po on e.pro_codigo = po.pro_codigo 
left join uaa u on po.uaa_codigo = u.uaa_codigo 
left join graduado.encuesta_egresado ee on p.per_codigo = ee.per_codigo 
where convert(Date, ee.ene_fecha_registro) BETWEEN '2023-10-17' AND '2023-10-17' 


Exec vinculacion_actual '38943401', 0

select count(*) from persona p 

select * from nivel_academico na 

select * from snies_nbc sn 

select i.idi_codigo, p.per_codigo, p.per_nombre, p.per_apellido, i.idi_idioma, idc.idd_codigo as conversacionCodigo, idc.idd_nombre as conversacion, ide.idd_codigo as escrituraCodigo, ide.idd_nombre as escritura, idl.idd_codigo as lecturaCodigo, idl.idd_nombre as lectura, i.idi_estado from academia3000_john.graduado.idioma i
inner join persona p on i.per_codigo = p.per_codigo
inner join graduado.idioma_dominio idc on i.idi_conversacion = idc.idd_codigo
inner join graduado.idioma_dominio ide on i.idi_escritura = ide.idd_codigo
inner join graduado.idioma_dominio idl on i.idi_lectura = idl.idd_codigo
left join academia3000_john.graduado.encuesta_egresado ee on i.per_codigo = ee.per_codigo 
where convert(Date, ee.ene_fecha_registro) BETWEEN '2023-10-17' AND '2023-10-17' 
order by p.per_codigo 

select * from academia3000_john.graduado.idioma i 

select * from graduado.habilidad_informatica hi
inner join persona p on hi.per_codigo = p.per_codigo 
inner join graduado.habilidad_informatica_dominio hid on hi.hid_codigo = hid.hid_codigo
left join graduado.encuesta_egresado ee on hi.per_codigo = ee.per_codigo 
where convert(Date, ee.ene_fecha_registro) between '2023-10-19' and '2023-10-19' and p.per_codigo = 108797
order by p.per_codigo 


select * from graduado.encuesta_egresado ee where ee.per_codigo = 108797

select count(*) from graduado.encuesta_egresado ee


select * from graduado.registro_educativo re 
inner join persona p on re.per_codigo = p.per_codigo 
inner join nivel_academico na on re.nia_codigo = na.nia_codigo 
inner join municipio m on re.mun_codigo = m.mun_codigo 
left join graduado.encuesta_egresado ee on re.per_codigo = ee.per_codigo 
where convert(Date, ee.ene_fecha_registro) between '2023-10-19' and '2023-10-19'
order by p.per_codigo, re.ree_fecha_fin desc

select p.pro_codigo, u.uaa_nombre, u.uaa_nombre_corto, u.uaa_dependencia, u2.uaa_nombre as facultad, p.sed_codigo, s.sed_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
where s.sed_codigo = and p.nia_codigo = and u2.uaa_codigo =  and p.pro_estado = 1 and p.pro_registro_snies is not null and p.pro_registro_snies != '' order by u.uaa_nombre asc


select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797




select * from dbo.graduado_puesto_votacion gpv 

select * from dbo.sede s where s.sed_estado = 1

select * from nivel_academico_tipo nat 

select * from nivel_academico na where na.nia_estado = 1

select * from dbo.nivel_academico na where na.nia_estado = 1 and na.nat_codigo = 1

select * from dbo.nivel_academico na where na.nia_estado = 1 and na.nat_codigo = 2

select * from estudiante e 

select * from persona p where p.per_codigo = 87862

--COPETENCIAS GENERALES

select * from graduado.reportes.competencia c order by c.com_orden 
select * from graduado.reportes.competencia_escala_evaluacion cee 
select * from graduado.reportes.competencia_evaluacion ce where ce.per_codigo = 108797


select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join nivel_academico na on pr.nia_codigo = na.nia_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
left join municipio m on p.per_lugar_expedicion = m.mun_codigo 
where p.per_identificacion  = '1075303330' order by g.gra_fecha desc 

select * from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo pe on c.per_codigo = pe.per_codigo 
where p.per_identificacion = '1075226439' order by m.mat_codigo desc

select * from usuario_general ug 
where ug.up = 57003 and ug.istipo = 2 and ug.state = 1

select * from estudiante e where e.per_codigo = 108797

inner join estudiante e on ug.up = e.per_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 


select * from estudiante e 

select * from estudiante e where e.est_codigo = '20211193972'

INSERT INTO academia3000_john.graduado.soporte_fecha_expedicion
(per_codigo, sfe_nombre, sfe_ruta_archivo, sde_fecha_creacion, sfe_estado)
VALUES(NULL, NULL, NULL, NULL, NULL);

select * from tercero t 
select * from academia3000_john.graduado.soporte_fecha_expedicion sfe 

select * from persona p 

select * from estudiante e where e.per_codigo = 108797

select * from persona p where p.per_codigo = 108797

select * from graduado g where g.est_codigo = '20171157616'

select * from acreditacion.matriculados_acreditacion ma where ma.est_codigo = '20171157616'

select * from pais p 

select * from departamento d 
inner join pais p on d.pai_codigo = p.pai_codigo 
where d.pai_codigo = 

select * FROM municipio m
inner join departamento d on m.dep_codigo = d.dep_codigo 
inner join pais p on d.pai_codigo = p.pai_codigo 
where m.dep_codigo = 

select * from persona p where p.per_identificacion = ''

select * from encuestas.cuestionarios c 

--DATOS PERSONALES
select top 1 p.per_codigo, p.tii_codigo, ti.tii_nombre, p.per_identificacion, p.per_apellido, p.per_nombre, 
p.per_genero, p.per_estado_civil, ec.esc_nombre, p.grs_codigo, gs.grs_nombre, p.per_fecha_nacimiento, 
p1.pai_codigo as pai_nacimiento_codigo, p1.pai_nombre as pai_nacimiento, d1.dep_codigo as dep_nacimiento_codigo, d1.dep_nombre as dep_nacimiento, p.per_lugar_nacimiento as mun_nacimiento_codigo, m1.mun_nombre as mun_nacimiento, 
p2.pai_codigo as pai_expedicion_codigo, p2.pai_nombre as pai_expedicion, d2.dep_codigo as dep_expedicion_codigo, d2.dep_nombre as dep_expedicion, p.per_lugar_expedicion as mun_expedicion_codigo, m2.mun_nombre as mun_expedicion, 
p.per_fecha_expedicion, p.per_email, p.per_pagina_personal, p.per_telefono_fijo, p.per_telefono_movil, 
p.per_pais_residencia as pai_residencia_codigo, p3.pai_nombre as pai_residencia, p.per_departamento_residencia as dep_residencia_codigo, d3.dep_nombre as dep_residencia, p.per_lugar_residencia as mun_residencia_codigo, m3.mun_nombre as mun_residencia, 
p.per_barrio, p.per_direccion_residencia, sfe.sfe_ruta_archivo as sopore_expedicion 
from persona p 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join estado_civil ec on p.per_estado_civil = ec.esc_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
left join municipio m1 on p.per_lugar_nacimiento = m1.mun_codigo 
left join municipio m2 on p.per_lugar_expedicion = m2.mun_codigo 
left join municipio m3 on p.per_lugar_residencia = m3.mun_codigo 
left join departamento d1 on m1.dep_codigo = d1.dep_codigo 
left join departamento d2 on m2.dep_codigo = d2.dep_codigo
left join departamento d3 on m3.dep_codigo = d3.dep_codigo
left join pais p1 on d1.pai_codigo = p1.pai_codigo 
left join pais p2 on d2.pai_codigo = p2.pai_codigo 
left join pais p3 on d3.pai_codigo = p3.pai_codigo 
left join graduado.soporte_fecha_expedicion sfe on p.per_codigo = sfe.per_codigo
where p.per_identificacion = '1075303330' order by sfe.sfe_codigo desc



select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo
inner join programa pr on e.pro_codigo = pr.pro_codigo
inner join nivel_academico na on pr.nia_codigo = na.nia_codigo
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
inner join sede s on pr.sed_codigo = s.sed_codigo
left join municipio m on p.per_lugar_expedicion = m.mun_codigo
where p.per_identificacion  = '1075303330' order by g.gra_fecha desc

select * from acreditacion.campo_amplio ca where ca.cam_estado = 1


select * from acreditacion.graduados_acreditacion ga 
where ga.per_identificacion = '1075303330'

select * from persona p 

select * from snies_genero sg 


select * from estado_civil ec where SNIES_codigo is not null

select* from grupo_sanguineo gs where gs.grs_estado = 1

select * from persona p where p.per_codigo = 108797

select * from sgd.documento d 

select * from tipo_id ti 


select * from persona p 



UPDATE dbo.persona
SET per_telefono_movil=:, per_telefono_fijo=:, per_email=:, per_pagina_personal=:
WHERE per_codigo=:;


UPDATE dbo.persona
SET per_direccion_residencia=:direccion, per_lugar_residencia=:pais, per_departamento_residencia=:departamento, per_pais_residencia=:municipio, per_barrio=:barrio  
WHERE per_codigo=:codigo;

UPDATE dbo.persona
SET per_lugar_expedicion=:municipio, per_fecha_expedicion=:FechaExpedicion
WHERE per_codigo=:codigo;

select * from uaa u where u.uaa_nombre like '%facultad%' and u.uaa_dependencia = 385

select p.pro_codigo, u.uaa_nombre, u.uaa_nombre_corto, u.uaa_dependencia, u2.uaa_nombre as facultad, p.sed_codigo, s.sed_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
where u2.uaa_codigo = 21 and p.pro_estado = 1 and p.pro_registro_snies is not null and p.pro_registro_snies != '' order by u.uaa_nombre asc


select * from programa p where p.pro_titulo_otorgado like '%INGEN%'

select top 20 * from periodo p order by p.per_codigo desc 

WITH resultado(anio, periodo, sed_nombre, nat_nombre, nia_nombre, dependencia_codigo, dependencia, pro_codigo,
        pro_registro_snies, uaa_nombre, est_codigo, ese_nombre, mat_estado, cal_nombre, per_nombre, per_apellido,
        per_estrato, per_genero, tii_nombre, per_identificacion, per_email_interno, pla_codigo, pla_total_creditos,
        creditos_aprobados, mti_nombre) AS (
        SELECT pe.per_año AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, u2.uaa_codigo AS dependencia_codigo,
                u2.uaa_nombre AS dependencia, pro.pro_codigo, pro.pro_registro_snies, u1.uaa_nombre, est.est_codigo, ese.ese_nombre, mat.mat_estado,
                cal.cal_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero, tii.tii_nombre, per.per_identificacion, per.per_email_interno,
                pla.pla_codigo, pla.pla_total_creditos, (
                        SELECT
                                SUM(creditos_aprobados)
                        FROM
                                creditos_aprobados_por_calendario
                        WHERE
                                est_codigo = est.est_codigo
                                AND mat_codigo <= mat.mat_codigo
                                AND pla_codigo = pla.pla_codigo
                ) AS creditos_aprobados,
                mti.mti_nombre
        FROM
                estudiante est WITH (NOLOCK)
                LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo
                INNER JOIN matricula mat WITH (NOLOCK) ON est.est_codigo = mat.est_codigo
                INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo
                INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo
                INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo
                INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo
                INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo
                INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo
                INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo
                INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
                INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo
                INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo
                INNER JOIN plan_estudiante ple WITH (NOLOCK) ON est.est_codigo = ple.est_codigo
                INNER JOIN plan_academico pla WITH (NOLOCK) ON ple.pla_codigo = pla.pla_codigo
                LEFT JOIN matricula_tipo mti WITH(NOLOCK) ON mat.mat_tipo = mti.mti_codigo
                LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo
        WHERE
                pe.per_nombre BETWEEN :inicio
                AND :inicio
                AND ple.ple_estado = 1
                AND mat.mat_estado = 'A'
                AND pro.pro_codigo IN(
                        SELECT
                                *
                        FROM
                                dbo.Split(:pro_codigo, ',')
                )
)
SELECT
        *
FROM
        resultado
WHERE
        creditos_aprobados >= pla_total_creditos
        AND est_codigo NOT IN (
                SELECT
                        gra.est_codigo
                FROM
                        graduado gra WITH (NOLOCK)
                WHERE
                        gra.est_codigo = est_codigo
                        AND YEAR(gra.gra_fecha) <= anio
                        AND MONTH(gra.gra_fecha) <= CASE
                                SUBSTRING(periodo, LEN(periodo), 1)
                                WHEN '1' THEN '6'
                                ELSE '12'
                        END
        )
ORDER BY anio, periodo, sed_nombre, nat_nombre, nia_nombre, dependencia, uaa_nombre
        
        
select * from periodo p

select * from uaa_cargo uc 

select * from uaa_personal up where up.per_codigo = 71823

select * from 

select * from persona p where p.per_identificacion = '1075252037'

select * from sede s 

select * from academia3000_john.graduado.competencia_respuesta cr 

select * from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 



with resultado(per_codigo, per_nombre, per_apellido, cor_fecha,cop_codigo,coe_nombre)as( 
select p.per_codigo, p.per_nombre, p.per_apellido, cr.cor_fecha, cp.cop_codigo, ce.coe_nombre from persona p 
inner join graduado.competencia_respuesta cr on p.per_codigo = cr.per_codigo 
inner join graduado.competencia_pregunta cp on cr.cop_codigo = cp.cop_codigo 
inner join graduado.competencia_escala ce on cr.coe_codigo = ce.coe_codigo 
) select * from resultado pivot(max(coe_nombre) for cop_codigo in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28]))as pvt 
order by cor_fecha desc 

select * from persona p 

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797

--****************************************************************--
----------------------TASA DE GRADUACIÓN----------------------------
--****************************************************************--

---PERIODOS CON PRIMIPAROS
SELECT pe.per_nombre, count(*) as matriculados FROM matricula mat WITH (NOLOCK)   
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo   
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo   
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo   
INNER JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo   
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo   
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
INNER JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo   
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo   
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo  
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo  
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo  
LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo   
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo    
WHERE pe.per_nombre BETWEEN '19701' AND '20242'  
AND pro.pro_codigo IN(229,427,533)  AND (mat.mat_estado != 'I')  
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%' 
OR SUBSTRING(est.est_codigo, 1, 5) in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN '19701' AND '20242')) 
GROUP by pe.per_nombre
ORDER BY pe.per_nombre desc

--ESTUDIANTES PRIMIPAROS POR PERIODOS
SELECT pe.per_nombre, est.est_codigo FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo   
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo   
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo   
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
INNER JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo   
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo   
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo  
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo  
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo  
LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo   
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo    
WHERE pro.pro_codigo IN(SELECT * FROM dbo.Split(533,','))  AND (mat.mat_estado != 'I')  
AND pro.pro_codigo IN(SELECT * FROM dbo.Split(533,','))  AND (mat.mat_estado != 'I')  
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%' 
OR SUBSTRING(est.est_codigo, 1, 5) in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN '19701' AND '20241')) 
GROUP by pe.per_nombre, est.est_codigo
ORDER BY pe.per_nombre desc


--pe.per_nombre BETWEEN '19701' AND '20241'
--in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN '19701' AND '20232'))

select * from periodo p 

---SEMESTRES POR PROGRAMA
select top 1 paa.pla_codigo, u.uaa_nombre_corto, paa.paa_semestre from plan_academico_asignatura paa 
inner join plan_academico pa on paa.pla_codigo = pa.pla_codigo 
inner join programa p on pa.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 533
group by paa.pla_codigo, u.uaa_nombre_corto, paa.paa_semestre
order by paa.paa_semestre desc 




select p2.per_nombre, g.est_codigo from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
join periodo p2 on g.gra_fecha >= p2.per_fecha_inicio and g.gra_fecha <= p2.per_fecha_fin
where p.pro_codigo = 418 and p2.per_nombre = '20232'
---------------------------------------------------------------------------------------------




SELECT * from persona p where p.per_codigo = 108797


EXEC [graduado].[ActualizarPersonaDatosResidenciaGraduado] 
    @CodPersona = 123,          -- Reemplaza con el ID de la persona
    @Per_Pais_Residencia = 1,   -- Reemplaza con el ID del país de residencia
    @Per_Departamento_Residencia = 2,  -- Reemplaza con el ID del departamento de residencia
    @Per_Lugar_Residencia = 3,  -- Reemplaza con el ID del lugar de residencia
    @Per_Direccion_Residencia = 'Calle Falsa 123',  -- Reemplaza con la dirección de residencia
    @Per_Barrio = 'Centro'      -- Reemplaza con el nombre del barrio
    
    
    UPDATE academia3000_john.dbo.persona SET per_identificacion=N'000', tii_codigo=5, per_libreta_militar=N'', per_apellido=N'APELLIDO APELLIDO', per_nombre=N'WILBERG ARTURO', per_genero=N'M', per_lugar_expedicion=1124, per_fecha_expedicion=NULL, per_fecha_nacimiento='1905-06-16', per_direccion_residencia=N'Calle 5 #18-33', per_telefono_movil=N'3XX-XXXXXXX', per_telefono_fijo=N'8XXXXXX', per_estado_civil=N'8', per_lugar_nacimiento=1124, per_lugar_residencia=905, per_departamento_residencia=19, per_pais_residencia=21, per_barrio=N'Calixto Leiva', per_estrato=1, eps_codigo=176, eta_codigo=3, per_numero_afiliacion_eps=N'null', per_ips_sisben=NULL, per_id_cotizante=NULL, per_beneficiario_ley1081=NULL, per_familiar_direccion=N'XX', per_familiar_nombre=N'Nombre', per_familiar_telefono=N'8XXXXXX', per_familiar_lugar_residencia=1124, per_email=N'guerrerocordobajohn@gmail.com', per_email_interno=N'john.guerrero@usco.edu.co', enviar_correo=NULL, per_pagina_personal=N'PaginaPersonal', grs_codigo=8, per_estado=1, nat_codigo=NULL, reg_codigo=NULL, per_razon_social=NULL, per_identificacion_dup=NULL, per_cedula=NULL, per_tarjeta=NULL, per_codigo_postal=NULL, per_pasaporte=NULL, per_huella=NULL, per_fecha_registro=NULL, per_codigo_pais_hecaa=NULL, per_fecha_actualizacion=NULL, lenguaNativa=NULL, eps_par_codigo=NULL, era_codigo=NULL, evt_codigo=NULL, per_municipio_procedencia=NULL, zor_codigo=NULL, scs_codigo=NULL, per_email_alterno=NULL WHERE per_codigo=1;