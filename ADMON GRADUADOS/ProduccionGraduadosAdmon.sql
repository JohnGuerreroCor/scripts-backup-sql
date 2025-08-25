--************************--
--****SITEMA GRADUADOS****--
--************************--


/*
 * 
 * TABLAS NO USADAS EN EL ESQUEMA GRADUADOS 
 * DE LA BASE DE DATOS ACADEMIA_3000
 * 
 * */
DROP TABLE graduado.aud_inscripcion_graduado;
DROP TABLE graduado.aud_inscripcion_intento ;
DROP TABLE graduado.inscripcion_graduado;
DROP TABLE graduado.inscripcion_graduado_tipo;
DROP TABLE graduado.inscripcion_intento;
 

--CREACIÓN DEL MÓDULO GRADUADOS ADMINISTRADOR
INSERT INTO dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Graduado Administrador', 'Módulo administrador para los estamentos graduados y egresados', getDate(), 1);

INSERT INTO dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Egresados Web', 'Módulo que permite la actualización de datos para el egresado y la correspondiente actualización del estado en la tabla de estudiante, lo que permite generar la liquidación de derechos de grado.', getDate(), 1);

INSERT INTO dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Graduado Web', 'Módulo que permite la actualización de datos para el gradaudo y diligenciar la encuesta de seguimiento.', getDate(), 1);

-------------------------
--TABLAS Y DISPARADORES--
-------------------------

--TABLA INICIO DE SESION GRADUADO
CREATE TABLE graduado.inicio_sesion_graduado (
	isg_codigo int IDENTITY(1,1) NOT NULL,
	mod_codigo int NOT NULL,
	id varchar(20) NOT NULL,
	isg_token varchar(100) NOT NULL,
	isg_intento int NULL,
	cise_codigo int NULL,
	isg_ip varchar(100) NULL,
	isg_fecha_generacion datetime DEFAULT getdate() NULL,
	isg_fecha_expira datetime NULL,
	isg_fecha_fin_sesion datetime NULL,
	CONSTRAINT inicio_sesion_graduado_PK PRIMARY KEY (isg_codigo),
	CONSTRAINT inicio_sesion_graduado_FK_estado_inicio_sesion FOREIGN KEY (cise_codigo) REFERENCES token.codigo_inicio_sesion_estado(cise_codigo),
	CONSTRAINT inicio_sesion_graduado_FK_modulo FOREIGN KEY (mod_codigo) REFERENCES dbo.modulo(mod_codigo)
);

--TABLA AMBITO
CREATE TABLE graduado.ambito ( 
	amb_codigo int IDENTITY(1,1) NOT NULL,
	amb_nombre varchar(200) NULL,
	amb_estado int DEFAULT 1 NULL,
	CONSTRAINT ambito_PK PRIMARY KEY (amb_codigo)
);

INSERT INTO graduado.ambito (amb_nombre) VALUES('MUNICIPAL');
INSERT INTO graduado.ambito (amb_nombre) VALUES('DEPARTAMENTAL');
INSERT INTO graduado.ambito (amb_nombre) VALUES('REGIONAL');
INSERT INTO graduado.ambito (amb_nombre) VALUES('NACIONAL');
INSERT INTO graduado.ambito (amb_nombre) VALUES('LATINOAMERICANO');
INSERT INTO graduado.ambito (amb_nombre) VALUES('INTERNACIONAL');

--TABLA COMPETENCIA ESCALA
CREATE TABLE graduado.competencia_escala (
	coe_codigo int IDENTITY(1,1) NOT NULL,
	coe_nombre varchar(100) NOT NULL,
	coe_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_escala_PK PRIMARY KEY (coe_codigo)
);

INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Muy Insatisfecho');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Insatisfecho');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Satisfecho');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Muy satisfecho');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Exponer las ideas por medios escritos.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Comunicar oralmente con claridad.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Persuadir y convencer a sus interlocutores.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Identificar y utilizar símbolos para comunicarse (lenguaje icónico, lenguaje no verbal, etc).');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Aceptar las diferencias y trabajar en contextos multiculturales.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Aprender y mantenerse actualizado.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Ser creativo e innovador.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Buscar, analizar, administrar y compartir información.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Crear, investigar y adoptar tecnología.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Diseñar e implementar soluciones con el apoyo de tecnología.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Identificar, plantear y resolver problemas.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Capacidad de abstracción, análisis y síntesis.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Comprender la realidad que lo rodea.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Asumir una cultura de convivencia.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Asumir responsabilidades y tomar decisiones.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Planificar y utilizar el tiempo de manera efectiva para lograr los objetivos planteados.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Utilizar herramientas informáticas especializadas (paquetes estadísticos, software de diseño, etc).');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Formular y ejecutar proyectos.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Trabajar en equipo para alcanzar metas comunes.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Trabajar de manera independiente sin supervisión permanente.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Aplicar valores y ética profesional en el desempeño laboral.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Adaptarse a los cambios y trabajar en contextos nuevos y diversos.');
INSERT INTO graduado.competencia_escala (coe_nombre, coe_estado) VALUES('Trabajar bajo presión.');

--TABLA COMPETENCIA TIPO
CREATE TABLE graduado.competencia_tipo (
	cot_codigo int IDENTITY(1,1) NOT NULL,
	cot_nombre varchar(255) NOT NULL,
	cot_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_tipo_PK PRIMARY KEY (cot_codigo)
); 

INSERT INTO graduado.competencia_tipo (cot_nombre) VALUES('COMPETENCIAS GENERALES');
INSERT INTO graduado.competencia_tipo (cot_nombre) VALUES('COMPETENCIAS LABORALES GENERALES');
INSERT INTO graduado.competencia_tipo (cot_nombre) VALUES('SATISFACCIÓN DE LAS COMPETENCIAS');

--TABLA COMPETENCIA PREGUNTA
CREATE TABLE graduado.competencia_pregunta (
	cop_codigo int IDENTITY(1,1) NOT NULL,
	cot_codigo int NOT NULL,
	cop_nombre varchar(255) NOT NULL,
	cop_orden int NOT NULL,
	cop_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT competencia_pregunta_PK PRIMARY KEY (cop_codigo),
	CONSTRAINT competencia_pregunta_FK_competencia_tipo FOREIGN KEY (cot_codigo) REFERENCES graduado.competencia_tipo(cot_codigo)
);

INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Crear, investigar y adoptar tecnología.', 10);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Identificar, plantear y resolver problemas.', 12);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Comprender la realidad que lo rodea.', 14);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Asumir una cultura de convivencia.', 15);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Asumir responsabilidades y tomar decisiones.', 16);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Planificar y utilizar el tiempo de manera efectiva para lograr los objetivos planteados.', 17);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Formular y ejecutar proyectos.', 19);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Trabajar en equipo para alcanzar metas comunes.', 20);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Aplicar valores y ética profesional en el desempeño laboral.', 22);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Trabajar bajo presión.', 24);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Exponer las ideas por medios escritos.', 1);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Comunicar oralmente con claridad.', 2);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Persuadir y convencer a sus interlocutores.', 3);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Aceptar las diferencias y trabajar en contextos multiculturales.', 5);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Aprender y mantenerse actualizado.', 7);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Ser creativo e innovador.', 8);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Buscar, analizar, administrar y compartir información.', 9);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Identificar y utilizar símbolos para comunicarse (lenguaje icónico, lenguaje no verbal, etc).', 4);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Capacidad de abstracción, análisis y síntesis.', 13);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Utilizar herramientas informáticas especializadas (paquetes estadísticos, software de diseño, etc).', 18);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Trabajar de manera independiente sin supervisión permanente.', 21);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Utilizar herramientas informáticas básicas (procesadores de texto, hojas de cálculo, correo electrónico, etc).', 6);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(1, 'Diseñar e implementar soluciones con el apoyo de tecnología.', 11);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(2, 'Adaptarse a los cambios y trabajar en contextos nuevos y diversos.', 23);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(3, 'De acuerdo con la contribución de la institución que lo formó, ¿cuál de las competencias considera la más fuerte?', 25);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(3, 'De acuerdo con la contribución de la institución que lo formó, ¿cuál de las competencias considera la más débil?', 26);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(3, '¿Cuál de las competencias considera que ha sido la más útil en su trayectoria laboral?', 27);
INSERT INTO graduado.competencia_pregunta (cot_codigo, cop_nombre, cop_orden, cop_estado) VALUES(3, '¿Cuál de las competencias considera que ha sido la menos útil en su trayectoria laboral?', 28);

--TABLA COMPETENCIA RESPUESTA
CREATE TABLE graduado.competencia_respuesta (
	cor_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	cop_codigo int NOT NULL,
	coe_codigo int NOT NULL,
	cor_fecha date DEFAULT getdate() NULL,
	CONSTRAINT competencia_respuesta_PK PRIMARY KEY (cor_codigo),
	CONSTRAINT competencia_respuesta_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT competencia_respuesta_FK_competencia_pregunta FOREIGN KEY (cop_codigo) REFERENCES graduado.competencia_pregunta(cop_codigo),
	CONSTRAINT competencia_respuesta_FK_competencia_escala FOREIGN KEY (coe_codigo) REFERENCES graduado.competencia_escala(coe_codigo)
	
);

--TABLA DATOS COMPLEMENTARIOS
CREATE TABLE graduado.datos_complementarios (
	dac_codigo int IDENTITY(1,1) NOT NULL,
	est_codigo char(11) NOT NULL,
	dac_trabajo_grado varchar(200) NULL,
	dac_perfil_profesional varchar(MAX) NULL,
	dac_fecha date DEFAULT getdate() NULL,
	CONSTRAINT datos_complementarios_PK PRIMARY KEY (dac_codigo),
	CONSTRAINT datos_complementarios_FK_estudiante FOREIGN KEY (est_codigo) REFERENCES dbo.estudiante(est_codigo)
);


--TABLA EXPECTATIVAS CAPACITACION PREGUNTA
CREATE TABLE graduado.expectativas_capacitacion_pregunta (
	ecp_codigo int IDENTITY(1,1) NOT NULL,
	ecp_nombre varchar(255) NOT NULL,
	ecp_orden int NULL,
	ecp_estado int DEFAULT 1 NULL,
	CONSTRAINT expectativas_capacitacion_pregunta_PK PRIMARY KEY (ecp_codigo)
);
INSERT INTO graduado.expectativas_capacitacion_pregunta (ecp_nombre, ecp_orden) VALUES('¿Tiene interés en continuar su proceso de formación académica?', 1);
INSERT INTO graduado.expectativas_capacitacion_pregunta (ecp_nombre, ecp_orden) VALUES('¿A qué nivel de formación académica aspira?', 2);
INSERT INTO graduado.expectativas_capacitacion_pregunta (ecp_nombre, ecp_orden) VALUES('¿Puede indicar el área de conocimiento en la que desearía cursar estudios?', 3);

--TABLA EXPECTATIVAS CAPACITACION ESCALA
CREATE TABLE graduado.expectativas_capacitacion_escala (
	ece_codigo int IDENTITY(1,1) NOT NULL,
	ecp_codigo int NOT NULL,
	ece_respuesta varchar(255) NULL,
	ece_estado int DEFAULT 1 NULL,
	CONSTRAINT expectativas_capacitacion_escala_PK PRIMARY KEY (ece_codigo),
	CONSTRAINT expectativas_capacitacion_escala_FK_expectativas_capacitacion_pregunta FOREIGN KEY (ecp_codigo) REFERENCES graduado.expectativas_capacitacion_pregunta(ecp_codigo),
);

INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(1, 'No');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(1, 'Si');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(2, 'Diplomado');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(2, 'Especialización');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(2, 'Maestría');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(2, 'Doctorado');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Agronomía, veterinaria y afines');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Bellas artes');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Ciencias de la Educación');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Ciencias de la Salud');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Ciencias Sociales, Derechos y Ciencias Políticas');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Matemáticas y Ciencias Naturales');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Ingeniería');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Economía, Administración, Contaduría y Afines');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Humanidades y Ciencias Religiosas');
INSERT INTO graduado.expectativas_capacitacion_escala (ecp_codigo, ece_respuesta, ece_estado) VALUES(3, 'Arquitectura, Urbanismo y Afines');

--TABLA EXPECTATIVAS CAPACITACION RESPUESTA
CREATE TABLE graduado.expectativas_capacitacion_respuesta (
	ecr_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	ecp_codigo int NOT NULL,
	ece_codigo int NOT NULL,
	ecr_fecha date DEFAULT getdate() NULL,
	CONSTRAINT expectativas_capacitacion_respuesta_PK PRIMARY KEY (ecr_codigo),
	CONSTRAINT expectativas_capacitacion_respuesta_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT expectativas_capacitacion_respuesta_FK_expectativas_capacitacion_pregunta FOREIGN KEY (ecp_codigo) REFERENCES graduado.expectativas_capacitacion_pregunta(ecp_codigo),
	CONSTRAINT expectativas_capacitacion_respuesta_FK_expectativas_capacitacion_escala FOREIGN KEY (ece_codigo) REFERENCES graduado.expectativas_capacitacion_escala(ece_codigo)
);

--TABLA HABILIDAD INFORMATICA DOMINIO
CREATE TABLE graduado.habilidad_informatica_dominio (
	hid_codigo int IDENTITY(1,1) NOT NULL,
	hid_nombre varchar(100) NOT NULL,
	hid_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT habilidad_informatica_dominio_PK PRIMARY KEY (hid_codigo)
);

INSERT INTO graduado.habilidad_informatica_dominio (hid_nombre) VALUES('EXCELENTE');
INSERT INTO graduado.habilidad_informatica_dominio (hid_nombre) VALUES('BUENO');
INSERT INTO graduado.habilidad_informatica_dominio (hid_nombre) VALUES('REGULAR');
 

--TABLA HABILIDAD INFORMATICA
CREATE TABLE graduado.habilidad_informatica (
	hai_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	hai_nombre_programa char(100) NOT NULL,
	hid_codigo int NOT NULL,
	hai_estado int DEFAULT 1 NOT NULL
	CONSTRAINT habilidad_informatica_PK PRIMARY KEY (hai_codigo),
	CONSTRAINT habilidad_informatica_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT habilidad_informatica_FK_habilidad_informatica_dominio FOREIGN KEY (hid_codigo) REFERENCES graduado.habilidad_informatica_dominio(hid_codigo)
);

--TABLA HISTORIAL ACADÉMICO
CREATE TABLE graduado.historial_academico (
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
	CONSTRAINT historial_academico_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT historial_academico_FK_nivel_academico FOREIGN KEY (nia_codigo) REFERENCES dbo.nivel_academico(nia_codigo),
	CONSTRAINT historial_academico_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES dbo.municipio(mun_codigo)
);

--TABLA HISTORIAL LABORAL
CREATE TABLE graduado.historial_laboral (
	hil_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	hil_cargo varchar(100) NOT NULL,
	hil_funcion varchar(100) NOT NULL,
	hil_empresa varchar(100) NOT NULL,
	hil_fecha_inicio date NOT NULL,
	hil_fecha_fin date NULL,
	hil_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT historial_laboral_PK PRIMARY KEY (hil_codigo),
	CONSTRAINT historial_laboral_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo)
);

--TABLA IDIOMA DOMINIO
CREATE TABLE graduado.idioma_dominio (
	idd_codigo int IDENTITY(1,1) NOT NULL,
	idd_nombre varchar(100) NOT NULL,
	idd_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT idioma_dominio_PK PRIMARY KEY (idd_codigo)
);

INSERT INTO graduado.idioma_dominio (idd_nombre) VALUES('EXCELENTE');
INSERT INTO graduado.idioma_dominio (idd_nombre) VALUES('BUENO');
INSERT INTO graduado.idioma_dominio (idd_nombre) VALUES('REGULAR');
INSERT INTO graduado.idioma_dominio (idd_nombre) VALUES('MALO');
INSERT INTO graduado.idioma_dominio (idd_nombre) VALUES('DEFICIENTE');

--TABLA IDIOMA
CREATE TABLE graduado.idioma (
	idi_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	idi_idioma varchar(50) NOT NULL,
	idi_conversacion int NOT NULL,
	idi_escritura int NOT NULL,
	idi_lectura int NOT NULL,
	idi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT idioma_PK PRIMARY KEY (idi_codigo),
	CONSTRAINT idioma_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo)
);

--TABLA MENCION RECONOCIMIENTO
CREATE TABLE graduado.mencion_reconocimiento (
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
	CONSTRAINT mencion_reconocimiento_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT mencion_reconocimiento_FK_ambito FOREIGN KEY (amb_codigo) REFERENCES graduado.ambito(amb_codigo),
	CONSTRAINT mencion_reconocimiento_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES dbo.municipio(mun_codigo)
);

--TABLA REGISTRO EDUCATIVO
CREATE TABLE graduado.registro_educativo (
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
	CONSTRAINT registro_educativo_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT registro_educativo_FK_nivel_academico FOREIGN KEY (nia_codigo) REFERENCES dbo.nivel_academico(nia_codigo),
	CONSTRAINT registro_educativo_FK_municipio FOREIGN KEY (mun_codigo) REFERENCES dbo.municipio(mun_codigo)
);

--TABLA SITUACION LABORAL PREGUNTA
CREATE TABLE graduado.situacion_laboral_pregunta (
	slp_codigo int IDENTITY(1,1) NOT NULL,
	slp_nombre varchar(255) NOT NULL,
	slp_orden int NULL,
	slp_estado int DEFAULT 1 NULL,
	CONSTRAINT situacion_laboral_pregunta_PK PRIMARY KEY (slp_codigo)
);

INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Trabaja en la actualidad?', 1);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿En qué sector trabaja?', 2);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Cuál es su rol o posición en esa actividad?', 3);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Es este su primer empleo?', 4);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Cuántos meses después de graduarse obtuvo su primer empleo?', 5);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Qué método o canal de búsqueda le permitió conseguir su empleo actual?', 6);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Qué tipo de contrato tiene con la empresa donde trabaja?', 7);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Cuál es la naturaleza de su actividad económica?', 8);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Qué tan relacionado está su empleo con la carrera que estudió?', 9);
INSERT INTO graduado.situacion_laboral_pregunta (slp_nombre, slp_orden, slp_estado) VALUES('¿Cuál es su rango salarial?', 10);

--TABLA SITUACION LABORAL ESCALA
CREATE TABLE graduado.situacion_laboral_escala (
	sle_codigo int IDENTITY(1,1) NOT NULL,
	slp_codigo int NOT NULL,
	sle_respuesta varchar(200) NOT NULL,
	sle_estado int DEFAULT 1 NULL,
	CONSTRAINT situacion_laboral_escala_PK PRIMARY KEY (sle_codigo),
	CONSTRAINT situacion_laboral_escala_FK_situacion_laboral_pregunta FOREIGN KEY (slp_codigo) REFERENCES graduado.situacion_laboral_pregunta(slp_codigo)
);

INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(1, 'No');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(1, 'Si');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(2, 'Público');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(2, 'Privado');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(3, 'Empleado de empresa particular.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(3, 'Empleado del gobierno.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(3, 'Trabajador independiente.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(3, 'Empresario/Empleador.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(3, 'Empleado de empresa familiar sin remuneración.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(4, 'No');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(4, 'Si');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(5, 'Ya  trabajaba.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(5, 'Menos de 3 meses.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(5, 'Entre 3 y 6 meses.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(5, 'Entre 7 y 12 meses.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(5, 'Más de 12 meses.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Medios de comunicación.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Bolsa de empleo de la institución donde estudió.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Otras bolsas de empleo.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Cajas de compensación, internet, head-hunters.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Redes sociales.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Familia, amigos, conocidos.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Servicio Público de Empleo (SPE) SENA.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(6, 'Contactos políticos.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(7, 'Contrato a término fijo.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(7, 'Contrato a término indefinido.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(7, 'Contrato de prestación de servicios.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(7, 'Otro tipo de contrato.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Agricultura, Ganadería, Caza y Silvicultura.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Pesca.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Explotación de Minas y Canteras.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Industrias Manufactureras.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Suministros de Electricidad, Gas y Agua.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Construcción.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Comercio; Reparación de Automotores, Motocicletas, Efectos Personales y Enseres Domésticos.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Hoteles y Restaurantes.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Transporte, Almacenamiento y Comunicaciones.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Intermediación Financiera.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Actividades Inmobiliarias de Alquiler y Empresariales de Alquiler.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Administración Pública y Defensa; Seguridad Social de Afiliación Obligatoria.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Educación.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Servicios Sociales y de Salud.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Otras Actividades de Servicios Comunitarios, Sociales y Personales.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Hogares Privados con Servicio Doméstico.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(8, 'Organizaciones y Órganos Extraterritoriales.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(9, 'Directamente relacionado.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(9, 'Indirectamente relacionado.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(9, 'Nada relacionado.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Menos de 1 salario mínimo legal vigente.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Entre 1 y 3 salarios mínimos legales vigentes.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Entre 4 y 6 salarios mínimos legales vigentes.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Entre 7 y 9 salarios mínimos legales vigentes.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Entre 10 y 12 salarios mínimos legales vigentes.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Entre 13 y 15 salarios mínimos legales vigentes.');
INSERT INTO graduado.situacion_laboral_escala (slp_codigo, sle_respuesta, sle_estado) VALUES(10, 'Más de 15 salarios mínimos legales vigentes.');

--TABLA SITUACION LABORAL RESPUESTA
CREATE TABLE graduado.situacion_laboral_respuesta (
	slr_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	slp_codigo int NOT NULL,
	sle_codigo int NOT NULL,
	slr_fecha date DEFAULT getdate() NULL,
	CONSTRAINT situacion_laboral_respuesta_PK PRIMARY KEY (slr_codigo),
	CONSTRAINT situacion_laboral_respuesta_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo),
	CONSTRAINT situacion_laboral_respuesta_FK_situacion_laboral_pregunta FOREIGN KEY (slp_codigo) REFERENCES graduado.situacion_laboral_pregunta(slp_codigo),
	CONSTRAINT situacion_laboral_respuesta_FK_situacion_laboral_escala FOREIGN KEY (sle_codigo) REFERENCES graduado.situacion_laboral_escala(sle_codigo)
);

--TABLA SOPORTE FECHA EXPEDICION
CREATE TABLE graduado.soporte_fecha_expedicion (
	sfe_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	sfe_nombre varchar(200) NULL,
	sfe_ruta_archivo int NOT NULL,
	sde_fecha_creacion date DEFAULT getdate() NOT NULL,
	sfe_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT soporte_fecha_expedicion_PK PRIMARY KEY (sfe_codigo),
	CONSTRAINT soporte_fecha_expedicion_FK_persona FOREIGN KEY (per_codigo) REFERENCES dbo.persona(per_codigo)
);