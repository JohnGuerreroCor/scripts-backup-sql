select * from persona p where p.per_codigo = 108797;

select * from 

--TABLA DONDE SE ALOJAN LOS TÉRMINOS Y CONDICIONES
select * from dbo.terminos_condiciones tc;

--TABLA DONDE SE REGISTRA LA ACEPTACIÓN DE TÉRMINOS
select top 50 at.aute_codigo, p.per_nombre, t.ter_nombre, p.per_apellido, t.ter_apellido1, t.ter_apellido2, p.per_identificacion, t.ter_identificacion, at.aute_fecha_creacion, m.mod_nombre from dbo.autorizacion_terminos at 
left join dbo.tercero t on at.ter_codigo = t.ter_codigo 
left join dbo.persona p on at.per_codigo = p.per_codigo 
inner join dbo.modulo m on at.mod_codigo = m.mod_codigo
where convert(Date, at.aute_fecha_creacion) BETWEEN '' AND ''
order by at.aute_codigo asc


select at.aute_codigo, t.ter_nombre, t.ter_apellido1, t.ter_apellido2, t.ter_identificacion, at.aute_fecha_creacion, m.mod_nombre from dbo.autorizacion_terminos at 
left join dbo.tercero t on at.ter_codigo = t.ter_codigo 
left join dbo.persona p on at.per_codigo = p.per_codigo 
inner join dbo.modulo m on at.mod_codigo = m.mod_codigo order by at.aute_codigo asc

select * from dbo.autorizacion_terminos at where at.aute_codigo = 1412;
select * from dbo.tercero;
select * from dbo.persona;
select * from dbo.modulo;






--AUDITORIA TÉRMINOS Y CONDICIONES
select * from dbo.aud_terminos_condiciones atc;



--CONSULTAS HISTÓRICAS



--CREACIÓN ESQUEMA
CREATE SCHEMA protecciondatos;


--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Protección de Datos Administrador', 'Módulo administrador para la gestión de autorizaciones para el tratamiento de datos personales', getDate(), 1);

select * from modulo m order by m.mod_codigo desc

select * from grupo

--TABLA NORMA ENTIDAD TIPO
CREATE TABLE protecciondatos.normativa_entidad_tipo (
	net_codigo int IDENTITY(1,1) NOT NULL,
	net_nombre varchar(50) NOT NULL,
	net_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_normativa_entidad_tipo PRIMARY KEY (net_codigo)
);

INSERT INTO protecciondatos.normativa_entidad_tipo (net_nombre) VALUES('EXTERNA'),('INTERNA');

--TABLA NORMA ENTIDAD
CREATE TABLE protecciondatos.normativa_entidad (
	noe_codigo int IDENTITY(1,1) NOT NULL,
	noe_nombre varchar(500) NOT NULL,
	net_codigo int NOT NULL,
	noe_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_normativa_entidad PRIMARY KEY (noe_codigo),
	CONSTRAINT normativa_entidad_FK_normativa_entidad_tipo FOREIGN KEY (net_codigo) REFERENCES protecciondatos.normativa_entidad_tipo(net_codigo)
);

INSERT INTO protecciondatos.normativa_entidad (noe_nombre, net_codigo) VALUES
('PRESIDENCIA DE LA REPÚBLICA', 1),
('CONGRESO DE LA REPÚBLICA', 1),
('SENADO DE LA REPÚBLICA', 1),
('CÁMARA DE REPRESENTANTES', 1),
('MINISTERIO DE AGRICULTURA Y DESARROLLO RURAL', 1),
('MINISTERIO DEL TRABAJO', 1),
('MINISTERIO DE AMBIENTE Y DESARROLLO SOSTENIBLE', 1),
('MINISTERIO DE CULTURA', 1),
('MINISTERIO DE TRANSPORTE', 1),
('MINISTERIO DEL INTERIOR', 1),
('MINISTERIO DE DEFENSA NACIONAL', 1),
('MINISTERIO DE TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIONES', 1),
('MINISTERIO DE RELACIONES EXTERIORES', 1),
('MINISTERIO DE JUSTICIA Y DEL DERECHO', 1),
('MINISTERIO DEL DEPORTE', 1),
('MINISTERIO DE HACIENDA Y CRÉDITO PÚBLICO', 1),
('MINISTERIO DE SALUD Y PROTECCIÓN SOCIAL', 1),
('MINISTERIO DE COMERCIO, INDUSTRIA Y TURISMO', 1),
('MINISTERIO DE VIVIENDA, CIUDAD Y TERRITORIO', 1),
('MINISTERIO DE EDUCACIÓN NACIONAL', 1),
('MINISTERIO DE IGUALDAD Y EQUIDAD', 1),
('MINISTERIO DE CIENCIA, TECNOLOGÍA E INNOVACIÓN', 1),
('MINISTERIO DE MINAS Y ENERGÍA', 1),
('CONSEJO NACIONAL DE EDUCACIÓN SUPERIOR', 1),
('INSTITUTO COLOMBIANO PARA EL FOMENTO DE LA EDUCACIÓN SUPERIOR', 1),
('CORTE CONSTITUCIONAL', 1),
('RECTORÍA', 2),
('CONSEJO SUPERIOR UNIVERSITARIO', 2),
('CONSEJO ACADÉMICO UNIVERSITARIO', 2);


CREATE TABLE protecciondatos.normativa_tipo (
	not_codigo int IDENTITY(1,1) NOT NULL,
	not_nombre varchar(250) NOT NULL,
	not_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_normativa_tipo PRIMARY KEY (not_codigo),
);

INSERT INTO protecciondatos.normativa_tipo (not_nombre) VALUES
('ACUERDO'),
('RESOLUCIÓN'),
('COMUNICADO'),
('CONSTITUCIÓN'),
('LEY'),
('DECRETOS '),
('RESOLUCIÓN'),
('REGLAMENTO'),
('ORDENANZA'),
('CIRCULAR'),
('ACUERDO'),
('DIRECTIVA'),
('CÓDIGO'),
('COMUNICADO'),
('LINEAMIENTO'),
('OFICIO'),
('SENTENCIA'),
('NORMA TÉCNICA COLOMBIANA - NTC'),
('ACTO LEGISLATIVO'),
('AUTO'),
('CONCEPTO'),
('ESTATUTO'),
('LEY ESTATUTARIA'),
('LEY ORGÁNICA'),
('PROYECTO DE LEY'),
('PROVIDENCIA'),
('REGULACIÓN'),
('TUTELA');

CREATE TABLE protecciondatos.normativa_expide (
	nex_codigo int IDENTITY(1,1) NOT NULL,
	noe_codigo int NOT NULL,
	not_codigo int NOT NULL,
	nex_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_normativa_expide PRIMARY KEY (nex_codigo),
	CONSTRAINT normativa_expide_FK_normativa_entidad FOREIGN KEY (noe_codigo) REFERENCES protecciondatos.normativa_entidad(noe_codigo),
	CONSTRAINT normativa_expide_FK_normativa_tipo FOREIGN KEY (not_codigo) REFERENCES protecciondatos.normativa_tipo(not_codigo),
);


-- PRESIDENCIA DE LA REPÚBLICA
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(1, 5),  -- LEY
(1, 6),  -- DECRETO
(1, 12), -- DIRECTIVA
(1, 14); -- COMUNICADO

-- CONGRESO DE LA REPÚBLICA
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(2, 5),  -- LEY
(2, 19), -- ACTO LEGISLATIVO
(2, 23), -- LEY ESTATUTARIA
(2, 24), -- LEY ORGÁNICA
(2, 25); -- PROYECTO DE LEY

-- SENADO DE LA REPÚBLICA
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(3, 25); -- PROYECTO DE LEY

-- CÁMARA DE REPRESENTANTES
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(4, 25); -- PROYECTO DE LEY

-- MINISTERIOS
-- MINISTERIOS (Todos tienen las mismas competencias en términos de normativa)
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(5, 2), (5, 6), (5, 10), (5, 12), (5, 14),  -- Min. Agricultura
(6, 2), (6, 6), (6, 10), (6, 12), (6, 14),  -- Min. Trabajo
(7, 2), (7, 6), (7, 10), (7, 12), (7, 14),  -- Min. Ambiente
(8, 2), (8, 6), (8, 10), (8, 12), (8, 14),  -- Min. Cultura
(9, 2), (9, 6), (9, 10), (9, 12), (9, 14),  -- Min. Transporte
(10, 2), (10, 6), (10, 10), (10, 12), (10, 14),  -- Min. Interior
(11, 2), (11, 6), (11, 10), (11, 12), (11, 14),  -- Min. Defensa
(13, 2), (13, 6), (13, 10), (13, 12), (13, 14),  -- Min. Relaciones Exteriores
(14, 2), (14, 6), (14, 10), (14, 12), (14, 14),  -- Min. Justicia
(15, 2), (15, 6), (15, 10), (15, 12), (15, 14),  -- Min. Deporte
(16, 2), (16, 6), (16, 10), (16, 12), (16, 14),  -- Min. Hacienda
(17, 2), (17, 6), (17, 10), (17, 12), (17, 14),  -- Min. Salud
(18, 2), (18, 6), (18, 10), (18, 12), (18, 14),  -- Min. Comercio
(19, 2), (19, 6), (19, 10), (19, 12), (19, 14),  -- Min. Vivienda
(20, 2), (20, 6), (20, 10), (20, 12), (20, 14),  -- Min. Educación
(21, 2), (21, 6), (21, 10), (21, 12), (21, 14),  -- Min. Igualdad y Equidad
(22, 2), (22, 6), (22, 10), (22, 12), (22, 14),  -- Min. Ciencia y Tecnología
(23, 2), (23, 6), (23, 10), (23, 12), (23, 14); -- Min. Minas y Energía

-- CORTE CONSTITUCIONAL
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(26, 17), -- SENTENCIA
(26, 28); -- TUTELA

-- CONSEJO NACIONAL DE EDUCACIÓN SUPERIOR (CESU)
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(24, 1),  -- ACUERDO
(24, 8);  -- REGLAMENTO

-- INSTITUTO COLOMBIANO PARA EL FOMENTO DE LA EDUCACIÓN SUPERIOR (ICFES)
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(25, 2),  -- RESOLUCIÓN
(25, 10); -- CIRCULAR

-- UNIVERSIDAD - ÓRGANOS INTERNOS
INSERT INTO protecciondatos.normativa_expide (noe_codigo, not_codigo) VALUES
(27, 1),  -- ACUERDO
(27, 2),  -- RESOLUCIÓN
(27, 8),  -- REGLAMENTO
(27, 10), -- CIRCULAR
(27, 12), -- DIRECTIVA
(27, 14), -- COMUNICADO
(28, 1),  -- ACUERDO
(28, 8),  -- REGLAMENTO
(28, 10), -- CIRCULAR
(28, 14), -- COMUNICADO
(29, 1),  -- ACUERDO
(29, 8),  -- REGLAMENTO
(29, 10), -- CIRCULAR
(29, 14); -- COMUNICADO

select nx.nex_codigo, nx.noe_codigo, e.noe_nombre, nx.not_codigo, nt.not_nombre, nx.nex_estado from protecciondatos.normativa_expide nx inner join protecciondatos.normativa_entidad e on nx.noe_codigo = e.noe_codigo inner join protecciondatos.normativa_tipo nt on nx.not_codigo = nt.not_codigo where nx.nex_estado = 1 and nx.noe_codigo = 6;

select * from protecciondatos.normativa_entidad ne;


select * from protecciondatos.normativa_entidad e
inner join protecciondatos.normativa_entidad_tipo net on e.net_codigo = net.net_codigo
where e.noe_estado = 1

--TABLA NORMATIVA MEDIO
CREATE TABLE protecciondatos.normativa_medio (
	nom_codigo int IDENTITY(1,1) NOT NULL,
	nom_nombre varchar(50) NOT NULL,
	nom_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_normativa_medio PRIMARY KEY (nom_codigo)
);

INSERT INTO protecciondatos.normativa_medio (nom_nombre) VALUES('DIGITAL'),('FÍSICO');

--TABLA NORMATIVA
CREATE TABLE protecciondatos.normativa (
	nor_codigo int IDENTITY(1,1) NOT NULL,
	nor_numero varchar(10) NOT NULL,
	nor_nombre varchar(500) NOT NULL,
	nex_codigo int NOT NULL,
	nom_codigo int NOT NULL,
	nor_url varchar(500) NULL,
	nor_anexo int NULL,
	nor_fecha_creacion date NOT NULL,
	nor_fecha_vigencia date NULL,
	nor_deroga int NOT NULL,
	nor_observacion varchar(2500) NULL,
	nor_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_normativa PRIMARY KEY (nor_codigo),
	CONSTRAINT normativa_FK_normativa_expide FOREIGN KEY (nex_codigo) REFERENCES protecciondatos.normativa_expide(nex_codigo),
	CONSTRAINT normativa_FK_normativa_medio FOREIGN KEY (nom_codigo) REFERENCES protecciondatos.normativa_medio(nom_codigo)
);


select * from protecciondatos.normativa n 
inner join protecciondatos.normativa_expide ne on n.nex_codigo = ne.nex_codigo
inner join protecciondatos.normativa_entidad e on ne.noe_codigo = e.noe_codigo
inner join protecciondatos.normativa_entidad_tipo net on e.net_codigo = net.net_codigo
inner join protecciondatos.normativa_tipo nt on ne.not_codigo = nt.not_codigo
inner join protecciondatos.normativa_medio nm on n.nom_codigo = nm.nom_codigo
where n.nor_estado = 1

CREATE TABLE protecciondatos.seccion_tipo (
	set_codigo int IDENTITY(1,1) NOT NULL,
	set_nombre varchar(250) NOT NULL,
	set_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_seccion_tipo PRIMARY KEY (set_codigo)
);

INSERT INTO protecciondatos.seccion_tipo (set_nombre)
VALUES
  ('CONSTANTE'),
  ('VARIABLE');

CREATE TABLE protecciondatos.seccion (
	sec_codigo int IDENTITY(1,1) NOT NULL,
	sec_nombre varchar(250) NOT NULL,
	sec_orden int NOT NULL,
	set_codigo int NOT NULL,
	sec_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_seccion PRIMARY KEY (sec_codigo),
	CONSTRAINT seccion_FK_seccion_tipo FOREIGN KEY (set_codigo) REFERENCES protecciondatos.seccion_tipo(set_codigo),
);

INSERT INTO protecciondatos.seccion (sec_nombre, sec_orden, set_codigo)
VALUES
  ('Marco Legal',1,1),
  ('Principios',2,1),
  ('Finalidades',3,1),
  ('Medios',4,1),
  ('Uso',5,1),
  ('Transmisión',6,1),
  ('Responsable',7,1),
  ('Datos Sensibles',8,1),
  ('Derechos del Titular',9,1),
  ('Reclamos',10,1),
  ('Política de privacidad',11,1),
  ('Autorización para compartir datos con proveedores de servicios de nube',12,1),
  ('Vigencia de la autorización',13,1),
  ('Objeto y Finalidades del Tratamiento',14,1),
  ('Consentimiento Expreso',15,2),
  ('Datos del Representante y del Menor',15,2),
  ('Declaración de Comprensión y Veracidad',16,2);

CREATE TABLE protecciondatos.item (
	ite_codigo int IDENTITY(1,1) NOT NULL,
	ite_contenido varchar(MAX) NOT NULL,
	sec_codigo int NOT NULL,
	ite_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_item PRIMARY KEY (ite_codigo),
	CONSTRAINT item_FK_seccion FOREIGN KEY (sec_codigo) REFERENCES protecciondatos.seccion(sec_codigo)
);

CREATE TABLE protecciondatos.autorizacion (
	aut_codigo int IDENTITY(1,1) NOT NULL,
	aut_titulo varchar(250) NOT NULL,
	nor_codigo int NOT NULL,
	aut_version varchar(10) NOT NULL,
	aut_descripcion varchar(2500) NOT NULL,
	aut_fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
	aut_anexo_requerido int NOT NULL,
	aut_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_autorizacion PRIMARY KEY (aut_codigo),
	CONSTRAINT autorizacion_FK_normativa FOREIGN KEY (nor_codigo) REFERENCES protecciondatos.normativa(nor_codigo),
);


CREATE TABLE protecciondatos.autorizacion_item (
	aui_codigo int IDENTITY(1,1) NOT NULL,
	aut_codigo int NOT NULL,
	ite_codigo int NOT NULL,
	aui_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_autorizacion_item PRIMARY KEY (aui_codigo),
	CONSTRAINT autorizacion_item_FK_autorizacion FOREIGN KEY (aut_codigo) REFERENCES protecciondatos.autorizacion(aut_codigo),
	CONSTRAINT autorizacion_item_FK_item FOREIGN KEY (ite_codigo) REFERENCES protecciondatos.item(ite_codigo),
);


CREATE TABLE dbo.sistema (
	sis_codigo int IDENTITY(1,1) NOT NULL,
	sis_nombre varchar(500) NOT NULL,
	sis_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_sistema PRIMARY KEY (sis_codigo)
);

INSERT INTO dbo.sistema (sis_nombre)
VALUES
  ('SISTEMA ACADÉMICO'),
  ('SISTEMA FINANCIERO Y ADMINISTRATIVO'),
  ('SISTEMA DE BIENESTAR UNIVERSITARIO'),
  ('SISTEMA DE GESTIÓN DOCUMENTAL'),
  ('SISTEMA DE GESTIÓN DE GRADUADOS'),
  ('SISTEMA USCO A LA MANO'),
  ('SISTEMA DE INVESTIGACIÓN Y PROYECCIÓN SOCIAL');

select * from dbo.sistema;

select * from dbo.modulo m ;

ALTER TABLE dbo.modulo
ADD mod_url varchar(1000) NULL;
ALTER TABLE dbo.modulo
ADD sis_codigo int CONSTRAINT modulo_FK_sistema FOREIGN KEY (sis_codigo) REFERENCES dbo.sistema(sis_codigo);
ALTER TABLE dbo.modulo
ADD mod_estado int DEFAULT 1 NOT NULL;


CREATE TABLE protecciondatos.autorizacion_modulo (
	aum_codigo int IDENTITY(1,1) NOT NULL,
	aut_codigo int NOT NULL,
	mod_codigo int NOT NULL,
	aum_activo int DEFAULT 1 NOT NULL,
	aum_objetivo varchar(2500) NULL,
	aum_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_autorizacion_modulo PRIMARY KEY (aum_codigo),
	CONSTRAINT autorizacion_modulo_FK_autorizacion FOREIGN KEY (aut_codigo) REFERENCES protecciondatos.autorizacion(aut_codigo),
	CONSTRAINT autorizacion_modulo_FK_modulo FOREIGN KEY (mod_codigo) REFERENCES dbo.modulo(mod_codigo),
);


CREATE TABLE protecciondatos.autorizacion_configuracion (
	auc_codigo int IDENTITY(1,1) NOT NULL,
	tus_codigo int NOT NULL,
	aut_codigo int NOT NULL,
	auc_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_autorizacion_configuracion PRIMARY KEY (auc_codigo),
	CONSTRAINT autorizacion_configuracion_FK_usuario_tipo FOREIGN KEY (tus_codigo) REFERENCES dbo.usuario_tipo(tus_codigo),
	CONSTRAINT autorizacion_configuracion_FK_autorizacion FOREIGN KEY (aut_codigo) REFERENCES protecciondatos.autorizacion (aut_codigo),
);

INSERT INTO protecciondatos.autorizacion_configuracion (tus_codigo, aut_codigo) VALUES(:usuario, :autorizacion);
UPDATE protecciondatos.autorizacion_configuracion SET tus_codigo=:usuario, aut_codigo=:autorizacion WHERE auc_codigo = :codigo;
UPDATE protecciondatos.autorizacion_configuracion SET auc_estado=0 WHERE auc_codigo = :codigo;

select * from dbo.usuario_tipo tu where tu.tus_estado = 1; 

select * from protecciondatos.autorizacion_configuracion ac
inner join dbo.usuario_tipo tu on ac.tus_codigo = tu.tus_codigo 
inner join protecciondatos.autorizacion a on ac.aut_codigo = a.aut_codigo 
where ac.auc_estado = 1;

CREATE FUNCTION [dbo].[validarEncuestaEvaluacionDocente]
(
-- Add the parameters for the function here
@per_codigo int
)
RETURNS @rtnTable TABLE
(
    -- Columns returned by the function
    estado int NOT NULL,
    descripcion varchar(MAX) NOT NULL
)
AS
BEGIN
-- Declare the return variable here
DECLARE @encuesta_necesaria int,
@encuesta_realizada int ,
@encuesta_codigo int ;

-- Add the T-SQL statements to compute the return value here

--VALIDACION 1: VERIFICAR SI ES OBIGATORIA LA ENCUESTA DE ALTA ACREDITACION
--SI EL PARAMETRO DEVUELVE 1 SI ES NECESARIA
--DE LA FORMA CONTRARIA NO ES NECESARIA LA ENCUESTA DE ALTA ACREDITACION Y RETORNA 1.

SET @encuesta_necesaria = (SELECT wep_valor FROM web_parametro WHERE wep_nombre = 'EVALUACION_DOCENTE_REALIZAR_ENCUESTA');

    SET @encuesta_codigo = (SELECT wep_valor FROM web_parametro WHERE wep_codigo = 521);
SET @encuesta_realizada = (select count(rcu_codigo) from encuestas.respuestas_cuestionarios  rc
  inner join persona p on p.per_codigo = rc.per_codigo  
  where p.per_codigo = @per_codigo and rc.cue_codigo = @encuesta_codigo and rc.rcu_estado = 1) ;

    IF (@encuesta_necesaria > 0)
IF(@encuesta_realizada > 0)
INSERT INTO @rtnTable VALUES(1, 'Encuesta Diligenciada');

ELSE
INSERT INTO @rtnTable VALUES(0, 'Encuesta no diligenciada');
ELSE
INSERT INTO @rtnTable VALUES(1, 'La encuesta no es obligatoria');

-- Return the result of the function
RETURN
END


select * from protecciondatos.item i  


select * from dbo.modulo


UPDATE dbo.modulo SET mod_nombre='Sistema', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=0 WHERE mod_codigo=1;
UPDATE dbo.modulo SET mod_nombre='Curriculo', mod_descripcion=NULL, mod_orden=2, mod_url=NULL, sis_codigo=NULL, mod_estado=0 WHERE mod_codigo=3;
UPDATE dbo.modulo SET mod_nombre='Academia', mod_descripcion=NULL, mod_orden=3, mod_url=NULL, sis_codigo=NULL, mod_estado=0 WHERE mod_codigo=4;
UPDATE dbo.modulo SET mod_nombre='Docente', mod_descripcion=NULL, mod_orden=4, mod_url=NULL, sis_codigo=NULL, mod_estado=0 WHERE mod_codigo=5;
UPDATE dbo.modulo SET mod_nombre='Estadisticas', mod_descripcion=NULL, mod_orden=5, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=6;
UPDATE dbo.modulo SET mod_nombre='Reportes', mod_descripcion=NULL, mod_orden=6, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=7;
UPDATE dbo.modulo SET mod_nombre='Ayuda', mod_descripcion=NULL, mod_orden=7, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=8;
UPDATE dbo.modulo SET mod_nombre='Matricula', mod_descripcion=NULL, mod_orden=8, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=9;
UPDATE dbo.modulo SET mod_nombre='Notas Pregrado ', mod_descripcion=NULL, mod_orden=3, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=11;
UPDATE dbo.modulo SET mod_nombre='Estudiantes', mod_descripcion=NULL, mod_orden=9, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=12;
UPDATE dbo.modulo SET mod_nombre='Programación Académica', mod_descripcion='Sistema para crear cursos con horarios y docentes Alimenta la agenda docente', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=13;
UPDATE dbo.modulo SET mod_nombre='Matricula automatica primiparos', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=15;
UPDATE dbo.modulo SET mod_nombre='Sirca', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=16;
UPDATE dbo.modulo SET mod_nombre='plan_academico', mod_descripcion=NULL, mod_orden=10, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=17;
UPDATE dbo.modulo SET mod_nombre='OPERARIO', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=19;
UPDATE dbo.modulo SET mod_nombre='Graduado', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=20;
UPDATE dbo.modulo SET mod_nombre='CERTIFICADO', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=21;
UPDATE dbo.modulo SET mod_nombre='INSCRIPCION', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=22;
UPDATE dbo.modulo SET mod_nombre='INSCRIPCION_ADMIN', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=23;
UPDATE dbo.modulo SET mod_nombre='ESTUDIANTE', mod_descripcion=NULL, mod_orden=2, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=24;
UPDATE dbo.modulo SET mod_nombre='Administración Usuarios', mod_descripcion=NULL, mod_orden=0, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=25;
UPDATE dbo.modulo SET mod_nombre='SILSA', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=26;
UPDATE dbo.modulo SET mod_nombre='SIVIPS', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=27;
UPDATE dbo.modulo SET mod_nombre='SIBUSCO', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=28;
UPDATE dbo.modulo SET mod_nombre='Proyectos de investigacion y proyeccion social', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=29;
UPDATE dbo.modulo SET mod_nombre='CONTRATO', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=30;
UPDATE dbo.modulo SET mod_nombre='ORNI', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=31;
UPDATE dbo.modulo SET mod_nombre='Módulo EVENTOS', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=32;
UPDATE dbo.modulo SET mod_nombre='Módulo ILEUSCO', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=33;
UPDATE dbo.modulo SET mod_nombre='Módulo Educacion Virtual', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=34;
UPDATE dbo.modulo SET mod_nombre='Módulo Consejerias Acdémicas', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=35;
UPDATE dbo.modulo SET mod_nombre='Módulo SGD', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=36;
UPDATE dbo.modulo SET mod_nombre='Módulo Duplicado de Diploma', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=37;
UPDATE dbo.modulo SET mod_nombre='Módulo SEYSATRA', mod_descripcion='MODULO DEL SISTEMA GESTION DE SEGURIDAD Y SALUD EN EL TRABAJO', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=38;
UPDATE dbo.modulo SET mod_nombre='Módulo ADMITIDOS_DOCUMENTOS', mod_descripcion='MODULO PARA QUE LOS ADMITIDOS SUBAN LOS DOCUMENTOS SOPORTES PARA LIQUIDACION Y MATRICULA', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=39;
UPDATE dbo.modulo SET mod_nombre='Módulo Certificado Electoral', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=40;
UPDATE dbo.modulo SET mod_nombre='Módulo Consultorio Jurídico', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=41;
UPDATE dbo.modulo SET mod_nombre='Módulo Planta Física', mod_descripcion=NULL, mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=42;
UPDATE dbo.modulo SET mod_nombre='Módulo Novedad Docente', mod_descripcion='Modulo de novedades académicas y administrativas de los docentes', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=43;
UPDATE dbo.modulo SET mod_nombre='Módulo Certifusco Administración', mod_descripcion='Modulo Administrador de Certificaciones Estudiantes de la usco', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=44;
UPDATE dbo.modulo SET mod_nombre='Módulo Hoja de Vida', mod_descripcion='Modulo para actualizar la hoja de vida de los trabajadores de la usco', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=45;
UPDATE dbo.modulo SET mod_nombre='Módulo Fichas Antiguas', mod_descripcion='Módulo que gestiona las fichas académicas de los graduados antiguos', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=46;
UPDATE dbo.modulo SET mod_nombre='Módulo Matrícula Posgrado Programa', mod_descripcion='Módulo para realizar la matricula, adiciones y cancelaciones de los posgrados', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=47;
UPDATE dbo.modulo SET mod_nombre='Módulo Alternancia', mod_descripcion='Módulo para gestionar las personas que asisten presencialmente a clases, bajo modalidad de alternacia', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=48;
UPDATE dbo.modulo SET mod_nombre='Módulo Elecciones', mod_descripcion='Modulo de gestion para las elecciones virtuales', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=49;
UPDATE dbo.modulo SET mod_nombre='Módulo Inventario', mod_descripcion='Módulo para gestión de inventario por usuario', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=50;
UPDATE dbo.modulo SET mod_nombre='CMS_Admin', mod_descripcion='Módulo para la administración de los Micrositios', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=51;
UPDATE dbo.modulo SET mod_nombre='Módulo Oferta Inscripción Admisión MatriculaPS Posgrados', mod_descripcion='Modulo para la administración de ofertas académicas, inscripción, matricula primer semestre y admisión de posgrado', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=53;
UPDATE dbo.modulo SET mod_nombre='Módulo Cambio Documento Estudiante', mod_descripcion='Módulo que permite al estudiante subir su cédula y generar un sgd a Registro y Control para realizr cambio t.i. a cedula con el documento soporte', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=57;
UPDATE dbo.modulo SET mod_nombre='Módulo Acreditación Administrador', mod_descripcion='Módulo para la administración de la Información de acreditación', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=58;
UPDATE dbo.modulo SET mod_nombre='Módulo PROVEEDORES', mod_descripcion='Sistema de proveedores Externos y cargue de cuenta de cobro', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=59;
UPDATE dbo.modulo SET mod_nombre='Módulo Convocatoria Docente', mod_descripcion='Modulo de convocatoria docente ', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=60;
UPDATE dbo.modulo SET mod_nombre='Portal', mod_descripcion='Portal Institucional', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=62;
UPDATE dbo.modulo SET mod_nombre='Módulo Acuerdo046 Administrador', mod_descripcion='Módulo para el administrador del acuerdo 046', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=63;
UPDATE dbo.modulo SET mod_nombre='Módulo PQRSD', mod_descripcion='Módulo para las Peticiones,Quejas,Reclamos,Sugerencias,Denuncias y Consultas', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=65;
UPDATE dbo.modulo SET mod_nombre='Módulo Evaluación Docente', mod_descripcion='Módulo para gestionar y realizar la evaluación docente en un periodo determinado', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=66;
UPDATE dbo.modulo SET mod_nombre='Módulo Talento Humano', mod_descripcion='Módulo para administrar la hoja de vida y las vinculaciones de los trabajadores y docentes de la usco', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=67;
UPDATE dbo.modulo SET mod_nombre='Módulo Oferta_Admision_Pregrado', mod_descripcion='Modulo para la administración de ofertas académicas y admisión de pregrado', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=52;
UPDATE dbo.modulo SET mod_nombre='Módulo Cuentas Por Pagar', mod_descripcion='Módulo de Gestión de Cuentas por Pagar', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=61;
UPDATE dbo.modulo SET mod_nombre='Módulo Matrícula Pregrado Programa', mod_descripcion='Módulo para la realización de matrículas, adiciones y cancelaciones de estudiantes de pregrado administrado por las secretarías', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=68;
UPDATE dbo.modulo SET mod_nombre='Módulo Matrícula Pregrado Posgrado Registro', mod_descripcion='Módulo para la realización de matrículas, adiciones y cancelaciones de estudiantes de pregrado administrado por Registro y Control', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=69;
UPDATE dbo.modulo SET mod_nombre='Módulo Matrícula Posgrado Registro', mod_descripcion='Módulo para la realización de matrículas, adiciones y cancelaciones de estudiantes de posgrado administrado por Registro y Control', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=70;
UPDATE dbo.modulo SET mod_nombre='Módulo Solicitud Cancelación Extraordinaria Estudiantes', mod_descripcion='Módulo para generar solicitudes de cancelaciones extemporáneas', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=71;
UPDATE dbo.modulo SET mod_nombre='Módulo Solicitud Cancelación Extraordinaria Docentes y Jefes', mod_descripcion='Módulo para aceptar, rechazar y supervisar las solicitudes de cancelaciones extemporáneas', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=72;
UPDATE dbo.modulo SET mod_nombre='Módulo Cancelación Extraordinaria', mod_descripcion='Módulo para realizar cancelaciones extemporáneas una vez validadas', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=73;
UPDATE dbo.modulo SET mod_nombre='Módulo Carnetizacion Administrador', mod_descripcion='Módulo administrador del carné intitucional', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=74;
UPDATE dbo.modulo SET mod_nombre='Módulo USCO a la Mano', mod_descripcion='Módulo que permite generar y visualizar el carnet digital para cada uno de los estamentos de la institución', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=75;
UPDATE dbo.modulo SET mod_nombre='Módulo Control Acceso Administrador', mod_descripcion='Módulo administrador de los puestos de vigilancia y vigilantes de la institución', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=76;
UPDATE dbo.modulo SET mod_nombre='Módulo Encuestas Administrador', mod_descripcion='Módulo administrador de las encuestas que se aplican a los usuarios de la institución', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=77;
UPDATE dbo.modulo SET mod_nombre='Módulo Control Acceso', mod_descripcion='Módulo que gestiona el registro de ingreso y salida de los diferentes peustos de acceso la institución', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=78;
UPDATE dbo.modulo SET mod_nombre='Módulo Graduado Administrador', mod_descripcion='Módulo administrador para los estamentos graduados y egresados', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=79;
UPDATE dbo.modulo SET mod_nombre='Módulo Egresados Web', mod_descripcion='Módulo que permite la actualización de datos para el egresado y la correspondiente actualización del estado en la tabla de estudiante, lo que permite generar la liquidación de derechos de grado.', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=80;
UPDATE dbo.modulo SET mod_nombre='Módulo Graduado Web', mod_descripcion='Módulo que permite la actualización de datos para el gradaudo y diligenciar la encuesta de seguimiento.', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=81;
UPDATE dbo.modulo SET mod_nombre='Módulo Tarjeta Segura', mod_descripcion='Modulo para que los vinculados en la universidad puedan reportar un acto inseguro, condición insegura, o condición de salud', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=82;
UPDATE dbo.modulo SET mod_nombre='Módulo Restaurante Administrador', mod_descripcion='Módulo administrador para el control del restaurante universitario', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=83;
UPDATE dbo.modulo SET mod_nombre='Módulo Nota Docente Web', mod_descripcion='Módulo que permite el ingreso de notas parciales y definitivas a los docentes de pregrado', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=84;
UPDATE dbo.modulo SET mod_nombre='Módulo Matriadican Configuración Admin', mod_descripcion='Módulo para configurar los módulos relacionados a los procesos de matrícula, adiciones y cancelaciones', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=85;
UPDATE dbo.modulo SET mod_nombre='Módulo Inscripcion Doble Titulacion Admon', mod_descripcion='Módulo para administrar las inscripciones de doble titulacion', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=86;
UPDATE dbo.modulo SET mod_nombre='Módulo SIGAD', mod_descripcion='Modulo del sistema de gestión administrativa.', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=88;
UPDATE dbo.modulo SET mod_nombre='Módulo Encuestas Web', mod_descripcion='Módulo que permite responder las encuestas parametrizadas para cada uno de los estamentos que comprende la institución', mod_orden=0, mod_url=NULL, sis_codigo=1, mod_estado=1 WHERE mod_codigo=87;
UPDATE dbo.modulo SET mod_nombre='Módulo Encuesta Snies', mod_descripcion='Módulo para realizar la encuesta Snies requerida para continuar el proceso de matrícula', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=91;
UPDATE dbo.modulo SET mod_nombre='Módulo Biblioteca Estadísticas', mod_descripcion='Módulo para la generación de reportes de las consultas de usuarios a las bases de datos EzProxy', mod_orden=1, mod_url=NULL, sis_codigo=NULL, mod_estado=1 WHERE mod_codigo=92;

select * from autorizacion_terminos at2 where at2.per_codigo = 108797

select * from protecciondatos.seccion s 
inner join protecciondatos.seccion_tipo st on s.set_codigo = st.set_codigo
where s.sec_estado = 1;

select * from dbo.modulo m;

select * from web_parametro wp where wp.wep_valor like '%https://%';


select * from protecciondatos.autorizacion a 
inner join protecciondatos.normativa n on a.nor_codigo = n.nor_codigo
inner join protecciondatos.normativa_expide ne on n.nex_codigo = ne.nex_codigo
inner join protecciondatos.normativa_entidad net on ne.noe_codigo = net.noe_codigo
where a.aut_estado = 1 and a.aut_codigo = ;


select * from protecciondatos.item i
inner join protecciondatos.seccion s on i.sec_codigo = s.sec_codigo
where i.ite_estado = 1 and i.sec_codigo = ;

select * from protecciondatos.autorizacion_item ai
inner join protecciondatos.autorizacion a on ai.aut_codigo = a.aut_codigo
inner join protecciondatos.item i on ai.ite_codigo = i.ite_codigo
inner join protecciondatos.seccion s on i.sec_codigo = s.sec_codigo
where ai.aui_estado = 1;

select * from dbo.sistema s where s.sis_estado = 1;

select * from dbo.modulo m
inner join dbo.sistema s on m.sis_codigo = s.sis_codigo
where m.mod_estado = 1 and m.sis_codigo =;

select * from protecciondatos.autorizacion_modulo am 
inner join protecciondatos.autorizacion a on am.aut_codigo = a.aut_codigo
inner join dbo.modulo m on am.mod_codigo = m.mod_codigo
where am.aum_estado = 1;

select * from protecciondatos.autorizacion_modulo am 
inner join protecciondatos.autorizacion a on am.aut_codigo = a.aut_codigo
inner join dbo.modulo m on am.mod_codigo = m.mod_codigo
inner join dbo.sistema s on m.sis_codigo = s.sis_codigo
where am.aum_estado = 1 and am.aut_codigo =;


