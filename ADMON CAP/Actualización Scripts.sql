
-- SCRIPTS PARA CREAR ESTRUCTURA DE LA BASE DE DATOS CAP

-- Crear el esquema CAP
CREATE SCHEMA cap;

-- Creación de grupo administrador para secretaria/jurídica.
INSERT INTO grupo (gru_nombre, gru_id, gru_estado)
VALUES ('CAP - Administrador CAP', 'CAP_ADMINISTRADOR_RECONOCIMIENTO',1);

--Creación de grupo para usuario encargado de alimentar y validar los trabajos de investigación.
INSERT INTO grupo (gru_nombre, gru_id, gru_estado)
VALUES ('CAP - Colaborador Editorial de Investigación', 'CAP_COLABORADOR_EDITORIAL',1);

-- ** Creación de grupo para usuario encargado de supervisar.
INSERT INTO grupo (gru_nombre, gru_id, gru_estado)
VALUES ('CAP - Observador Comité', 'CAP_COMITE_CONSULTA',1);

-- ** Creación de vista para traer la información fundamental del usuario.
-- Se debe incluir el código autogenerado por los INSERT de los grupos en la cláusula 'ug.usg_grupo IN (<Agregar aquí los códigos separados por comas>)'.

select * from grupo

CREATE VIEW [dbo].[usuario_administrador_cap_login]
AS
SELECT ua.uid, ua.up,ua.us,ua.uwd2,ua.sys,ua.state,ug.usg_uaa,gr.gru_codigo,gr.gru_nombre, gr.gru_id, gr.gru_estado
FROM usuario_administrativos ua
INNER JOIN usuario_grupo ug ON ua.uid = ug.usg_usuario
INNER JOIN grupo gr ON ug.usg_grupo = gr.gru_codigo
WHERE ug.usg_grupo IN (362,363,364) AND ug.usg_estado = 1;

select * from dbo.usuario_administrador_cap_login

select * from estudiante e where e.per_codigo = 131405;

-- Crear estado_acta.
CREATE TABLE cap.estado_acta (
    esa_codigo INT IDENTITY(1,1) PRIMARY KEY,
    esa_nombre VARCHAR(100) UNIQUE NOT NULL,
	esa_estado INT DEFAULT 1
);

-- Se crean dos estados.
INSERT INTO cap.estado_acta (esa_nombre) VALUES 
('Abierta'),
('Cerrada');

-- Crear la tabla acta_solicitud_puntaje en el esquema CAP
CREATE TABLE cap.acta_solicitud_puntaje (
    acsp_codigo INT IDENTITY(1,1) PRIMARY KEY,
    acsp_nombre VARCHAR(100) UNIQUE NOT NULL,
    acsp_descripcion VARCHAR(500),
    acsp_fecha_inicio datetime NOT NULL,
    acsp_fecha_fin datetime NOT NULL,
	esa_codigo INT NOT NULL, 
    acsp_estado INT DEFAULT 1,
	FOREIGN KEY (esa_codigo) REFERENCES cap.estado_acta(esa_codigo)
);

-- Crear la tabla linea_investigacion en el esquema CAP
CREATE TABLE cap.linea_investigacion (
    lii_codigo INT IDENTITY(1,1) PRIMARY KEY,
    lii_nombre VARCHAR(100) UNIQUE NOT NULL,
    lii_estado INT DEFAULT 1
);

INSERT INTO cap.linea_investigacion (lii_nombre) VALUES
-- Ciencias Naturales
('Biología'),
('Física'),
('Química'),
('Matemáticas'),
('Ciencias del Medio Ambiente'),
('Ciencias del Espacio'),
-- Ciencias Médicas y de la Salud
('Medicina Clínica'),
('Salud Pública'),
('Ciencias Básicas de la Salud'),
('Enfermería'),
('Odontología'),
('Tecnología en Salud'),
-- Ingeniería y Tecnología
('Ingeniería de Sistemas'),
('Ingeniería Industrial'),
('Ingeniería Electrónica'),
('Ingeniería Mecánica'),
('Energías Renovables'),
('Robótica'),
('Nanotecnología'),
('Tecnologías de la Información y la Comunicación (TIC)'),
-- Ciencias Agrícolas
('Agronomía'),
('Ciencia y Tecnología de Alimentos'),
('Producción Animal'),
('Ciencias del Suelo'),
('Ciencias Forestales'),
('Pesca y Acuicultura'),
-- Ciencias Sociales
('Psicología'),
('Sociología'),
('Ciencias Políticas'),
('Economía'),
('Antropología'),
('Trabajo Social'),
('Comunicación Social'),
-- Humanidades
('Educación'),
('Historia'),
('Filosofía'),
('Lengua y Literatura'),
('Arte y Cultura'),
-- Multidisciplinarias
('Desarrollo Sostenible'),
('Cambio Climático'),
('Innovación Social'),
('Estudios de Género'),
('Ciencia de Datos'),
('Gobernanza y Políticas Públicas'),
('Ciencia, Tecnología e Innovación');
 
-- Crear la tabla grupo_investigacion en el esquema CAP
CREATE TABLE cap.grupo_investigacion (
    gri_codigo INT IDENTITY(1,1) PRIMARY KEY,
    gri_nombre VARCHAR(100) UNIQUE NOT NULL,
    lii_codigo INT NOT NULL,
    gri_estado INT DEFAULT 1,
    FOREIGN KEY (lii_codigo) REFERENCES cap.linea_investigacion(lii_codigo)
);

INSERT INTO cap.grupo_investigacion (gri_nombre, lii_codigo) VALUES
('Geosciences, Infraestructure, Productivity and Environment - GIPE', 9),
('Agroindustria USCO', 6),
('HidroIngeniería y Desarrollo Agropecuario', 6),
('Grupo de Tratamiento de Señales y Telecomunicaciones', 12),
('Ingeniería y Surdesarrollo', 6),
('Nuevas Tecnologías', 12),
('UNITCOM', 12),
('COFA', 6),
('La Colonia', 6),
('Carlos Finlay', 13),
('MI DNEUROPSY', 13),
('Parasitologia y Medicina Tropical', 13),
('Laboratorio de Medicina Genomica', 15),
('Desarrollo Social Salud Publica y Derechos Humanos', 14),
('CUIDAR', 13),
('Salud y Grupos Vulnerables', 14),
('Grupo Medico Quirurgico Surcolombiano de Investigacion', 13),
('Epidemiología y Salud publica región Surcolombiana', 14),
('Conocimiento Profesional del Profesor de Ciencias', 33),
('Grupo Interinstitucional Ciencia, Acciones y Creencias UPN-UV', 33),
('PACA', 33),
('ALTERARTE', 33),
('Grupo de Investigacion y Pedagogia en Biodiversidad GIPB', 33),
('Grupo Quimico de Investigacion y Desarrollo Ambiental', 33),
('IPES Investigacion en Practicas Educativas y Sociales', 33),
('Comuniquemonos', 33),
('Aprenap', 33),
('Alternativas pedagógicas', 33),
('ILESEARCH', 33),
('Paz desde la Paz', 33),
('IUDEX', 33),
('Molúfode', 33),
('Impulso', 33),
('Acción Motriz', 33),
('Nuevas Visiones del Derecho', 28),
('CYNERGIA', 28),
('Conciencia Jurídica', 28),
('PYMES', 27),
('CREA', 27),
('IGUAQUE', 27),
('ESINSUR (Pitalito)', 27),
('Comunicación, Memoria y Región', 26),
('Desarrollo Humano y Sostenibilidad Ambiental (2019)', 25),
('CRECER', 25),
('INSURGENTES', 25),
('GRUPO DE INVESTIGACIÓN ESTUDIOS SOCIO HUMANÍSTICOS - GIESH', 25),
('Fisica Teorica', 2),
('DINUSCO', 2),
('FIASUR', 2),
('Ecología y Conservación', 1),
('SINTROPIA (2021)', 45);

-- ** Crear la tabla tipo_material en el esquema CAP, Se encuentra relacionado si requiere par evaluador
CREATE TABLE cap.tipo_material (
    tim_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tim_nombre VARCHAR(100) UNIQUE NOT NULL,
	tim_requiere_par_evaluador INT NOT NULL,
    tim_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_material (tim_nombre, tim_requiere_par_evaluador) VALUES 
('Artículo de Investigación', 0),
('Artículo Reflexión', 0),
('Artículo Reporte de Caso', 0),
('Artículo Revisión o Cartas al editor o Editoriales', 0),
('Capítulo de Libro', 1),
('Comunicación Corta - Short Comunication o Artículo Corto', 0),
('Dirección Individual de Tesis', 0),
('Estudios Postdoctorales', 0),
('Publicaciones Impresas Universitarias', 0),
('Libro de Ensayo', 1),
('Libro de Texto', 1),
('Libro derivado de Investigación', 1),
('Producción de Videos, Cinematográficas o Fonográficas', 1),
('Producción Técnica', 1),
('Patente', 0),
('Ponencia', 0),
('Premios', 0),
('Reseñas Críticas', 0),
('Software', 1),
('Título de Posgrado', 1),
('Traducción de Artículo', 1),
('Traducción de Libro', 0),
('Obra Artística', 1);

-- Crear la tabla factor_valoracion en el esquema CAP (DE ACUERDO AL DECRETO 2002)
CREATE TABLE cap.factor_valoracion (
    fav_codigo INT IDENTITY(1,1) PRIMARY KEY,
    fav_nombre VARCHAR(100) UNIQUE NOT NULL,
    fav_descripcion VARCHAR(500),
    fav_estado INT DEFAULT 1
);

INSERT INTO cap.factor_valoracion (fav_nombre, fav_descripcion) VALUES 
('Títulos Universitarios','Certificaciones oficiales obtenidas tras completar estudios de educación superior.');
('Categoría Docente','Nivel o rango asignado a un docente dentro del escalafón académico según su experiencia, formación y méritos.');
('Experiencia Calificada','Trayectoria profesional acreditada en un área específica, respaldada por formación y desempeño comprobable.');
('Productividad Académica','Conjunto de publicaciones, investigaciones y contribuciones realizadas en el ámbito académico y científico.');

select * from cap.tipo_material tm where tm.tim_estado = 1;

-- Crear tipo_material_subcategoria
CREATE TABLE cap.tipo_material_subcategoria (
    tims_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tims_nombre VARCHAR(100) NOT NULL,
	tims_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_material_subcategoria (tims_nombre) VALUES 
('A1'), ('A2'), ('B'),('C'),
('Libro Ensayo'), ('Libro Derivado de Investigación'), ('Libro Texto'),
('Maestría'), ('Doctorado'),
('Didáctico'), ('Documental'),
('Innovación tecnológica'), ('Adaptación tecnológica'),
('Creación Original Artística'), ('Creación Complementaria o de Apoyo'), ('Interpretación');

select * from cap.tipo_material_subcategoria;

select * from cap.tipo_material_subcategoria ts
inner join cap.tipo_material tm on ts.tim_codigo = tm.tim_codigo
where ts.tims_estado = 1 and ts.tim_codigo = 

-- Crear tope_maximo_puntos
CREATE TABLE cap.tope_maximo_puntos (
    tomp_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tomp_valor DECIMAL(10,2) NOT NULL,
    tomp_porcentaje_aplicable DECIMAL(5,2),
    tomp_estado INT DEFAULT 1
);

INSERT INTO cap.tope_maximo_puntos (tomp_valor, tomp_porcentaje_aplicable)
VALUES (15,100), (12,100), (8,100), (3,100), (15,30), (12,30), (8,30), (3,30),
(20,100),(15,60), (12,60), (8,60), (3,60), (36,100), (72, 100), (120, 100), 
(60,100), (7,100), (48,100), (12,80), (7,80), (25, 100), (84,100), (24,100),
(10,100), (40,100), (80,100), (36,100), (20,100), (14,100), (28,100);

select * from cap.tope_maximo_puntos

-- Crear tope_anual_reconocimiento_solicitud
CREATE TABLE cap.tope_anual_reconocimiento_solicitud (
        tars_codigo INT IDENTITY(1,1) PRIMARY KEY,
        tars_valor INT NOT NULL,
        tars_periodo_meses INT NOT NULL,
        tars_estado INT DEFAULT 1
);

INSERT INTO cap.tope_anual_reconocimiento_solicitud (tars_valor, tars_periodo_meses)
VALUES (3,12), (1,9), (5, 12), (140,12);

select * from cap.tope_anual_reconocimiento_solicitud

-- Crear la tabla tipo_impacto en el esquema CAP
CREATE TABLE cap.tipo_impacto (
    tii_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tii_nombre VARCHAR(100) UNIQUE NOT NULL,
    tii_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_impacto (tii_nombre) VALUES
('Nacional'), ('Internacional'), ('Regional o local');

select * from cap.tipo_impacto

-- Crear la tabla tipo_punto en el esquema CAP
CREATE TABLE cap.tipo_punto (
    tipu_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tipu_nombre VARCHAR(100) NOT NULL,
	tipu_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_punto (tipu_nombre) VALUES 
('Salarial'),
('Bonificación'),
('No Aplica');

-- Crear material_configuracion
CREATE TABLE cap.material_configuracion (
    maco_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tim_codigo INT NOT NULL,
	tims_codigo INT NULL,
	tipu_codigo INT NOT NULL,
	tii_codigo INT  NULL,
	tomp_codigo INT NOT NULL,
    tars_codigo INT NULL,
	maco_estado INT DEFAULT 1,
	FOREIGN KEY (tim_codigo) REFERENCES cap.tipo_material(tim_codigo),
	FOREIGN KEY (tims_codigo) REFERENCES cap.tipo_material_subcategoria(tims_codigo),
	FOREIGN KEY (tipu_codigo) REFERENCES cap.tipo_punto(tipu_codigo),
	FOREIGN KEY (tii_codigo) REFERENCES cap.tipo_impacto(tii_codigo),
	FOREIGN KEY (tomp_codigo) REFERENCES cap.tope_maximo_puntos(tomp_codigo),
	FOREIGN KEY (tars_codigo) REFERENCES cap.tope_anual_reconocimiento_solicitud(tars_codigo)
);


select * from cap.material_configuracion mc
inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo
left join cap.tipo_material_subcategoria tms on mc.tims_codigo = tms.tims_codigo
left join cap.tipo_punto tp on mc.tipu_codigo = tp.tipu_codigo
left join cap.tipo_impacto ti on mc.tii_codigo = ti.tii_codigo
left join cap.tope_maximo_puntos tmp on mc.tomp_codigo = tmp.tomp_codigo
left join cap.tope_anual_reconocimiento_solicitud tars on mc.tars_codigo = tars.tars_codigo
where mc.maco_estado = 1 AND mc.tim_codigo = ? AND (? = 0 OR mc.tims_codigo = ?) AND ((? = 0) OR (mc.tii_codigo = ?) OR (? > 0 AND mc.tii_codigo IS NULL))


INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (1,1,1,1), (1,2,1,2), (1,3,1,3), (1,4,1,4);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (2,1,1,5), (2,2,1,6), (2,3,1,7), (2,4,1,8);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (3,1,1,5), (3,2,1,6), (3,3,1,7), (3,4,1,8);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (4,1,1,5), (4,2,1,6), (4,3,1,7), (4,4,1,8);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (5,5,1,1), (5,6,1,29), (5,7,1,1);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (6,1,1,10), (6,2,1,11), (6,3,1,12), (6,4,1,13);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (7,8,2,14,1), (7,9,2,15,1);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (8,2,16,2);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (9,2,17,3);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo)
VALUES (10,1,1);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo)
VALUES (11,1,1);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo)
VALUES (12,1,9);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tii_codigo,tomp_codigo)
VALUES (13,10,1,1,18), (13,10,1,2,2), (13,11,1,1,21), (13,11,1,2,20);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tii_codigo,tomp_codigo,tars_codigo)
VALUES (13,2,3,19,3);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo)
VALUES (14,12,1,1), (14,13,1,3);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo)
VALUES (15,1,22);
INSERT INTO cap.material_configuracion (tim_codigo,tii_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (16,2,2,23,1), (16,1,2,19,1), (16,3,2,24,1);
INSERT INTO cap.material_configuracion (tim_codigo,tii_codigo,tipu_codigo,tomp_codigo)
VALUES (17,2,1,1), (17,1,1,25);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (18,2,2,3);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo)
VALUES (19,1,1);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (20,8,1,26,4), (20,9,1,27,4);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (21,2,28,3);
INSERT INTO cap.material_configuracion (tim_codigo,tipu_codigo,tomp_codigo)
VALUES (22,1,1);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tii_codigo,tipu_codigo,tomp_codigo,tars_codigo)
VALUES (23,14,2,1,29,3), (23,14,1,1,30,3), (23,14,3,2,15,3), 
(23,15,2,1,2,3), (23,15,1,1,3,3), (23,15,3,2,31,3), 
(23,16,2,1,30,3), (23,16,1,1,3,3);
INSERT INTO cap.material_configuracion (tim_codigo,tims_codigo,tii_codigo,tipu_codigo,tomp_codigo)
VALUES (23,16,3,2,19);

select * from cap.material_configuracion;
select * from cap.tipo_material;
select * from cap.tipo_material_subcategoria;
select * from cap.tipo_punto;
select * from cap.tipo_impacto;
select * from cap.tope_maximo_puntos;
select * from cap.tope_anual_reconocimiento_solicitud;

select ti.tii_codigo, ti.tii_nombre, ti.tii_estado from cap.material_configuracion mc 
inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo
inner join cap.tipo_impacto ti on mc.tii_codigo = ti.tii_codigo 
where mc.maco_estado = 1 and mc.tim_codigo = 13
group by ti.tii_codigo, ti.tii_nombre, ti.tii_estado


-- Crear tipo_anexo.
CREATE TABLE cap.tipo_anexo (
    tian_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tian_nombre VARCHAR(100) UNIQUE NOT NULL,
	tian_descripcion VARCHAR(500),
	tian_estado INT DEFAULT 1
);


INSERT INTO cap.tipo_anexo (tian_nombre, tian_descripcion) VALUES 
('PDF completo del artículo', 'Archivo digital que contiene el texto íntegro de un artículo, incluyendo título, autores, resumen, contenido, tablas, figuras y referencias, presentado en formato PDF para su lectura y descarga.'),
('Soporte publindex', 'Archivo PDF del artículo completo, validado para cumplir con los criterios de indexación de Publindex.'),
('PDF completo del libro o  dos ejemplares en físico', 'PDF completo del libro o entrega de dos ejemplares físicos, según requisitos de validación para indexación en Publindex.'),
('Certificado expedido por la editorial en el que conste', 'Certificado expedido por la editorial que incluya su nombre, constancia de revisión por pares bajo reglamento editorial público, y evidencia de un catálogo web con portadas, títulos, autores, ISBN y fechas de publicación.'),
('Certificado de Maestría o Doctorado', 'Constancia de grado de Maestría o Doctorado con datos del estudiante, fecha de aprobación de tesis y si hubo remuneración por su dirección.'),
('Certificado de Finalización de Posdoctorado', 'Documento oficial que acredita la culminación del estudio de posdoctorado, indicando nombre del investigador, institución, fechas y áreas de investigación.'),
('Certificación del Consejo de Facultad sobre Relación Académica', 'Documento emitido por el Consejo de Facultad que certifica que el estudio realizado por el docente guarda relación directa con su actividad académica, en caso de no estar incluido en el Plan Quinquenal de la Facultad.'),
('Publicación Aprobada por la Universidad Surcolombiana', 'Documento en formato PDF de la publicación completa, cuya aprobación haya sido emitida por la Universidad Surcolombiana conforme a sus criterios institucionales.'),
('Soporte de Material Audiovisual o Fonográfico', 'Documento o archivo que respalda la creación de piezas de video, cinematográficas o fonográficas.'),
('Certificado de Aprobación Institucional', 'Documento que acredita la aprobación oficial otorgada por la institución correspondiente.'),
('Soportes de Producción Técnica', 'Documentos o evidencias que respaldan la creación y ejecución de una producción técnica.'),
('Soportes en Cumplimiento de la Resolución 00693 de 2004', 'Documentación que acredita el cumplimiento de los requisitos establecidos en la Resolución 00693 del 13 de julio de 2004.'),
('Soporte de Patente de Invención', 'Documento que certifica el registro y la concesión oficial de una patente de invención.'),
('Registro de Patente de Invención con Reconocimiento Institucional', 'Documento que acredita el registro oficial de una patente de invención, reconociendo a la Universidad Surcolombiana como parte vinculada.'),
('Certificado de Ponente', 'Documento que acredita la participación de una persona como ponente en un evento académico, científico o cultural.'),
('Memorias de Presentación de Ponencia', 'Documento que contiene el registro completo del contenido expuesto durante la presentación de la ponencia.'),
('Registro Fotográfico de Ponencia', 'Evidencia visual que documenta la presentación de la ponencia durante un evento académico o científico.'),
('Soporte de Premio de Institución de Prestigio', 'Documento que certifica que el premio fue otorgado por una institución de reconocido prestigio a una obra o trabajo realizado.'),
('Soporte de Convocatoria Nacional o Internacional', 'Documento que acredita la convocatoria nacional o internacional, con un proceso de selección institucionalizado y respaldado por una entidad de reconocido prestigio.'),
('Reseña Crítica Aprobada por la Universidad Surcolombiana', 'Documento en formato PDF de la reseña crítica completa, cuya aprobación haya sido emitida por la Universidad Surcolombiana.'),
('Código Fuente', 'Conjunto de instrucciones escritas en un lenguaje de programación que forma la base de un software o aplicación.'),
('Algoritmo', 'Conjunto de pasos o instrucciones definidas para resolver un problema o realizar una tarea específica de manera eficiente.'),
('Instrucciones según Lenguaje Utilizado', 'Conjunto de directrices o comandos específicos adaptados al lenguaje de programación empleado para desarrollar una solución o aplicación.'),
('Manual Técnico del Usuario o Programa Ejecutable', 'Documento que proporciona instrucciones detalladas sobre el uso del sistema o programa, o bien el archivo ejecutable correspondiente para su instalación y operación.'),
('Registro de Reconocimiento ante el Ministerio del Interior', 'Documento oficial que certifica el reconocimiento otorgado a la Universidad Surcolombiana por parte del Ministerio del Interior.'),
('Acta de Grado', 'Documento oficial que certifica la finalización de los estudios y la obtención del grado académico correspondiente.'),
('Diploma de Estudio', 'Documento oficial que acredita la finalización de un programa académico o curso, otorgando el título correspondiente.'),
('Resolución de Convalidación de Estudio de Posgrado Internacional', 'Documento oficial que valida un título de posgrado obtenido en el extranjero, emitido por la autoridad competente.'),
('Certificado del Consejo de Facultad sobre Relación Académica', 'Documento emitido por el Consejo de Facultad que certifica la relación directa del estudio realizado con la actividad académica asignada al docente, en ausencia del Plan Quinquenal.'),
('Traducción Completa del Libro en PDF', 'Documento en formato PDF que contiene la traducción completa de un libro, debidamente registrada y aprobada.');

select * from cap.tipo_anexo

-- Crear material_anexos
CREATE TABLE cap.material_anexos (
    maan_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tim_codigo INT NOT NULL,
	tian_codigo INT NOT NULL,
	maan_orden_presentacion INT NOT NULL,
    maan_estado INT DEFAULT 1,
	FOREIGN KEY (tim_codigo) REFERENCES cap.tipo_material(tim_codigo),
	FOREIGN KEY (tian_codigo) REFERENCES cap.tipo_anexo(tian_codigo)
);


INSERT INTO cap.material_anexos (tim_codigo, tian_codigo, maan_orden_presentacion) VALUES 
(1,1,1),
(1,2,2),
(2,1,1),
(2,2,2),
(3,1,1),
(3,2,2),
(4,1,1),
(4,2,2), 
(5,3,1), 
(5,4,2), 
(6,1,1),
(6,2,2), 
(7,5,1), 
(8,6,1), 
(8,7,2), 
(9,8,1), 
(10,3,1),
(10,4,2), 
(11,3,1),
(11,4,2), 
(12,3,1),
(12,4,2), 
(13,9,1),
(13,10,2), 
(14,11,1),
(14,12,2), 
(15,13,1),
(15,14,2),
(16,15,1),
(16,16,2),
(16,17,3), 
(17,18,1),
(17,19,2), 
(18,20,1), 
(19,21,1),
(19,22,2),
(19,23,3),
(19,24,4),
(19,25,5), 
(20,26,1),
(20,27,2),
(20,29,3),
(20,28,4), 
(21,8,1), 
(22,30,1), 
(23,3,1),
(23,4,2);

select * from cap.material_anexos
select * from cap.tipo_material
select * from cap.tipo_anexo

select * from cap.material_anexos ma 
inner join cap.tipo_material tm on ma.tim_codigo = tm.tim_codigo
inner join cap.tipo_anexo ta on ma.tian_codigo = ta.tian_codigo
where ma.maan_estado = 1 and ma.tim_codigo = 1

-- Crear la tabla categorias_minciencias en el esquema CAP
CREATE TABLE cap.categorias_minciencias (
    cami_codigo INT IDENTITY(1,1) PRIMARY KEY,
    cami_nombre VARCHAR(100) UNIQUE NOT NULL,
    cami_estado INT DEFAULT 1
);

INSERT INTO cap.categorias_minciencias (cami_nombre) VALUES
('A1'), ('A2'), ('A'), ('B'), ('C'), ('No Aplica');


-- Crear la tabla revista_minciencias en el esquema CAP
CREATE TABLE cap.revista_minciencias (
    rem_codigo INT IDENTITY(1,1) PRIMARY KEY,
    rem_nombre VARCHAR(255) NOT NULL,
    rem_issn VARCHAR(10) NOT NULL,
    rem_institucion_editora VARCHAR(255) NOT NULL,
    cami_codigo INT NOT NULL,
    rem_estado INT DEFAULT 1,
    FOREIGN KEY (cami_codigo) REFERENCES cap.categorias_minciencias(cami_codigo)
);

-- Insertar valores de prueba en revista_minciencias
INSERT INTO cap.revista_minciencias 
(rem_nombre, rem_issn, rem_institucion_editora, cami_codigo)
VALUES
('Revista Colombiana de Ciencia', '1234-5678', 'Universidad Nacional', 1),
('Revista de Investigaciones Sociales', '8765-4321', 'Universidad del Valle', 2),
('Ciencia y Tecnología Andina', '1122-3344', 'Universidad de los Andes', 3),
('Revista de Estudios Regionales', '5566-7788', 'Universidad Surcolombiana', 4),
('Revista Humanismo y Sociedad', '9988-7766', 'Universidad del Cauca', 5),
('Revista Interna USCO', '0000-0000', 'USCO', 6);

select * from cap.revista_minciencias rm where rm.rem_estado = 1;


-- Crear la tabla tipo_evaluacion_cap en el esquema CAP
CREATE TABLE cap.tipo_evaluacion_cap (
    tiec_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tiec_nombre VARCHAR(100) UNIQUE NOT NULL,
    --tiec_puntaje_maximo INT NOT NULL,
    tiec_estado INT DEFAULT 1
);

-- Registro de tipo de evaluación
INSERT INTO cap.tipo_evaluacion_cap (tiec_nombre) VALUES 
('Evaluación de Producción de Videos Cinematográficas o Fonográficas'),
('Evaluación de Obra Artística'),
('Evaluación de Software'),
('Evaluación Libro Texto o Capítulo de Libro'),
('Evaluación de Libro Derivado de Investigación o Capítulo de Libro'),
('Evaluación Libro Ensayo o Capítulo de Libro'), 
('Evaluación de Producción Técnica');


-- Crear material_evaluar
CREATE TABLE cap.material_evaluar (
    mae_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maco_codigo INT NOT NULL,
	tiec_codigo INT NOT NULL,
    mae_estado INT DEFAULT 1,
	FOREIGN KEY (maco_codigo) REFERENCES cap.material_configuracion(maco_codigo),
	FOREIGN KEY (tiec_codigo) REFERENCES cap.tipo_evaluacion_cap(tiec_codigo)
);

select * from cap.material_evaluar me 
inner join cap.material_configuracion mc on me.maco_codigo = mc.maco_codigo
inner join cap.
inner join cap.tipo_evaluacion_cap tec on me.tiec_codigo = tec.tiec_codigo
where me.mae_estado = 1 and me.maco_codigo =

INSERT INTO cap.material_evaluar (maco_codigo, tiec_codigo)
VALUES (17,6),(18,5), (19,4), (28,6), (29,4), (30,5), (31,1), (32,1), (33,1), (34,1), (35,1),
(36,7), (37,7), (45,3), (50,2), (51,2), (52,2), (53,2), (54,2), (55,2), (56,2), (57,2), (58,2); 

-- Crear la tabla estado_solicitud en el esquema CAP
CREATE TABLE cap.estado_solicitud (
    ess_codigo INT IDENTITY(1,1) PRIMARY KEY,
    ess_nombre VARCHAR(50) UNIQUE NOT NULL,
    ess_estado INT DEFAULT 1
);

INSERT INTO cap.estado_solicitud (ess_nombre) VALUES
('Pendiente'),
('Aprobada'),
('Rechazada'),
('Cancelada'),
('En revisión'),
('En proceso'),
('Corregir');

select * from cap.estado_solicitud;


-- Crear la tabla solicitud_puntaje en el esquema CAP
CREATE TABLE cap.solicitud_puntaje (
    sop_codigo INT IDENTITY(1,1) PRIMARY KEY,
    per_codigo INT NOT NULL,
    sop_fecha_solicitud DATETIME DEFAULT GETDATE(),
    acsp_codigo INT NOT NULL,
    sop_observacion VARCHAR(500),
    ess_codigo INT NOT NULL DEFAULT 1,
    sop_estado INT NOT NULL DEFAULT 1,
    FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    FOREIGN KEY (acsp_codigo) REFERENCES cap.acta_solicitud_puntaje(acsp_codigo),
    FOREIGN KEY (ess_codigo) REFERENCES cap.estado_solicitud(ess_codigo)
);

select * from cap.solicitud_puntaje sp ;
select * from cap.material_configuracion mc 

-- Crear la tabla docente_grupo en el esquema CAP
CREATE TABLE cap.docente_grupo (
    dog_codigo INT IDENTITY(1,1) PRIMARY KEY,
    per_codigo INT NOT NULL,
    gri_codigo INT NOT NULL,
    dog_estado INT DEFAULT 1,
    FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    FOREIGN KEY (gri_codigo) REFERENCES cap.grupo_investigacion(gri_codigo)
);

-- Crear la tabla tipo_envio_material en el esquema CAP
CREATE TABLE cap.tipo_envio_material (
    tiem_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tiem_nombre VARCHAR(100) UNIQUE NOT NULL,
    tiem_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_envio_material (tiem_nombre) VALUES
('Físico'), ('Digital');

-- Crear la tabla material_academico en el esquema CAP
CREATE TABLE cap.material_academico (
    maac_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sop_codigo INT NOT NULL,
    dog_codigo INT,
    maco_codigo INT NOT NULL,
    tiem_codigo INT NOT NULL,
    maac_titulo VARCHAR(255) NOT NULL,
    maac_traduccion_titulo VARCHAR(255),
    maac_cantidad_autor INT NOT NULL,
    maac_cambio_categoria_escalafon INT NOT NULL,
    maac_estado INT DEFAULT 1,
    maac_nombre_proyecto_investigacion VARCHAR(500),
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
    FOREIGN KEY (maco_codigo) REFERENCES cap.material_configuracion(maco_codigo),
    FOREIGN KEY (tiem_codigo) REFERENCES cap.tipo_envio_material(tiem_codigo)
);


-- Crear la tabla autor_material en el esquema CAP
CREATE TABLE cap.autor_material (
    aum_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT NOT NULL,
    aum_orden INT,
    aum_nombre VARCHAR(255) NOT NULL,
    aum_estado INT DEFAULT 1,
    FOREIGN KEY (maac_codigo) REFERENCES CAP.material_academico(maac_codigo)
);

-- Crear la tabla anexo_material en el esquema CAP
CREATE TABLE cap.anexo_material (
    anm_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT NOT NULL,
    tian_codigo INT NOT NULL,
    anm_nombre VARCHAR(255) NOT NULL,
    anm_ruta INT NOT NULL,
    anm_estado INT DEFAULT 1,
    FOREIGN KEY (maac_codigo) REFERENCES CAP.material_academico(maac_codigo),
    FOREIGN KEY (tian_codigo) REFERENCES CAP.tipo_anexo(tian_codigo)
);


-- Crear la tabla articulos_revista en el esquema CAP
CREATE TABLE cap.articulo_revista (
    arr_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT  NOT NULL,
    arr_nombre VARCHAR(255) UNIQUE NOT NULL,
    rem_codigo INT  NOT NULL,
    arr_url VARCHAR(500) NOT NULL,
    arr_meses_requerido_publicacion INT NOT NULL,
    arr_fecha_sumision date,
    arr_fecha_aprobacion date,
	arr_fecha_publicacion date,
    arr_recursos_universidad INT NOT NULL,
    arr_estado INT DEFAULT 1,
    FOREIGN KEY (maac_codigo) REFERENCES cap.material_academico(maac_codigo),
    FOREIGN KEY (rem_codigo) REFERENCES cap.revista_minciencias(rem_codigo)
);


-- Crear la tabla libro_capitulo en el esquema CAP
CREATE TABLE cap.libro_capitulo (
    lic_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT NOT NULL,
    lic_isbn VARCHAR(50) NOT NULL,
    lic_editorial VARCHAR(255) NOT NULL,
    lic_url_editorial VARCHAR(500),
    lic_ejemplares INT NOT NULL,
    lic_estado INT DEFAULT 1,
    FOREIGN KEY (maac_codigo) REFERENCES CAP.material_academico(maac_codigo),
);

-- Crear la tabla categoria_par en el esquema CAP
CREATE TABLE cap.categoria_par (
    cap_codigo INT IDENTITY(1,1) PRIMARY KEY,
    cap_nombre VARCHAR(100) UNIQUE NOT NULL,
    cap_estado INT DEFAULT 1
);

INSERT INTO cap.categoria_par (cap_nombre) VALUES
('Investigador Junior'), ('Investigador Asociado'), ('Investigador Senior'), ('Investigador Emérito');

-- Crear la tabla par_evaluador_cap en el esquema CAP
CREATE TABLE cap.par_evaluador_cap (
    paec_codigo INT IDENTITY(1,1) PRIMARY KEY,
    paec_identificacion VARCHAR(15) NOT NULL,
    paec_nombre VARCHAR(40) NOT NULL,
    paec_apellido VARCHAR(40) NOT NULL,
    paec_correo VARCHAR(100) NOT NULL,
    paec_telefono VARCHAR(50) ,
    paec_direccion_correspondencia VARCHAR(255),
    cap_codigo INT NOT NULL,
    paec_url_colciencias VARCHAR(255),
    paec_par_externo INT NOT NULL,
    pai_codigo INT NOT NULL,
    gen_codigo CHAR(1) NOT NULL,
    nia_codigo INT NOT NULL,
    paec_institucion_vinculado VARCHAR(255),
	paec_estado INT DEFAULT 1 NOT NULL,
    FOREIGN KEY (cap_codigo) REFERENCES cap.categoria_par(cap_codigo),
    FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo),
    FOREIGN KEY (gen_codigo) REFERENCES genero(gen_codigo),
    FOREIGN KEY (nia_codigo) REFERENCES nivel_academico(nia_codigo)
);

INSERT INTO cap.par_evaluador_cap (
    paec_identificacion,
    paec_nombre,
    paec_apellido,
    paec_correo,
    paec_telefono,
    paec_direccion_correspondencia,
    cap_codigo,
    paec_url_colciencias,
    paec_par_externo,
    pai_codigo,
    gen_codigo,
    nia_codigo,
    paec_institucion_vinculado
) VALUES (
    '9876543210',
    'Carlos',
    'Ramírez',
    'carlos.ramirez@correo.com',
    '3109876543',
    'Carrera 12 #34-89, Medellín',
    2, 
    'http://scienti.colciencias.gov.co/cvlac/CarlosRamirez',
    0, 
    21, 
    'M',
    14, 
    'Universidad de Antioquia'
);

CREATE TABLE cap.estado_asignacion_evaluacion_par (
    eaep_codigo INT IDENTITY(1,1) PRIMARY KEY,
    eaep_nombre VARCHAR(100) UNIQUE NOT NULL,
    eaep_estado INT DEFAULT 1
);

INSERT INTO cap.estado_asignacion_evaluacion_par (eaep_nombre) VALUES
('Pendiente'), ('Aceptado'), ('Rechazado'), ('Evaluado');

-- Crear la tabla asignacion_evaluacion_par en el esquema CAP
CREATE TABLE cap.asignacion_evaluacion_par (
    asep_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sop_codigo INT NOT NULL,
    paec_codigo INT NOT NULL,
    tiem_codigo INT NOT NULL,
    eaep_codigo INT NOT NULL DEFAULT 1,
    asep_vigencia_invitacion INT NOT NULL,
    asep_fecha_invitacion Date,
    asep_token_invitacion VARCHAR(255) NOT NULL,
    asep_vigencia_evaluacion INT NOT NULL,
    asep_fecha_evaluacion Date,
    asep_token_evaluacion VARCHAR(255) NOT NULL,
    asep_fecha_registro Date DEFAULT GETDATE(),
    asep_estado INT DEFAULT 1,
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
    FOREIGN KEY (paec_codigo) REFERENCES cap.par_evaluador_cap(paec_codigo),
    FOREIGN KEY (tiem_codigo) REFERENCES cap.tipo_envio_material(tiem_codigo),
    FOREIGN KEY (eaep_codigo) REFERENCES cap.estado_asignacion_evaluacion_par(eaep_codigo)
);

select * from cap.asignacion_evaluacion_par aep inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo inner join cap.acta_solicitud_puntaje asp on sp.acsp_codigo = asp.acsp_codigo inner join cap.estado_solicitud es on sp.ess_codigo = es.ess_codigo inner join dbo.persona p on sp.per_codigo = p.per_codigo inner join cap.estado_acta ea on asp.esa_codigo = ea.esa_codigo inner join cap.material_academico ma on sp.sop_codigo = ma.sop_codigo inner join cap.material_configuracion mc on ma.maco_codigo = mc.maco_codigo inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo left join cap.tipo_material_subcategoria tms on mc.tims_codigo = tms.tims_codigo left join cap.tipo_punto tp on mc.tipu_codigo = tp.tipu_codigo  left join cap.tipo_impacto ti on mc.tii_codigo = ti.tii_codigo left join cap.tope_maximo_puntos tmp on mc.tomp_codigo = tmp.tomp_codigo left join cap.tope_anual_reconocimiento_solicitud tars on mc.tars_codigo = tars.tars_codigo left join cap.docente_grupo dg on ma.dog_codigo = dg.dog_codigo left join cap.grupo_investigacion gi on dg.gri_codigo = gi.gri_codigo left join cap.linea_investigacion li on gi.lii_codigo = li.lii_codigo inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo 
inner join cap.categoria_par cp on pec.cap_codigo = cp.cap_codigo 
inner join dbo.pais p on
inner join dbo.nivel_academico na on
inner join dbo.genero g on pec.ginner join cap.tipo_envio_material tem on aep.tiem_codigo = tem.tiem_codigo 
inner join cap.estado_asignacion_evaluacion_par eaep on aep.eaep_codigo = eaep.eaep_codigo where aep.asep_estado = 1 and aep.asep_token_invitacion = ?;


select * from cap.par_evaluador_cap pec 
inner join cap.categoria_par cp 
inner join dbo.pais p 
inner join dbo.nivel_academico na 
inner join dbo.genero g 

INSERT INTO cap.asignacion_evaluacion_par (
    sop_codigo,
    paec_codigo,
    tiem_codigo,
    asep_aceptacion_invitacion,
    asep_vigencia_invitacion,
    asep_fecha_invitacion,
    asep_token_invitacion,
    asep_vigencia_evaluacion,
    asep_fecha_evaluacion,
    asep_token_evalaucion,
    asep_fecha_registro,
    asep_estado
) VALUES
(3, 1, 2, 1, 15, '2025-06-01', 'token_inv_abc123', 30, '2025-06-10', 'token_eval_xyz123', GETDATE(), 1),
(3, 1, 2, 0, 10, '2025-06-02', 'token_inv_def456', 20, '2025-06-15', 'token_eval_xyz456', GETDATE(), 1),
(3, 1, 2, 1, 20, '2025-06-03', 'token_inv_ghi789', 25, '2025-06-20', 'token_eval_xyz789', GETDATE(), 1);



SELECT mc.*, dg.*, gi.*, li.*, sp.*, asp.*, ac.*, es.*, ma.*, tma.*, tms.*, tpu.*, tpi.*, tpp.*, tar.*, te.*, p.per_codigo, p.per_nombre, p.per_apellido, p.per_identificacion, p.per_email_interno, ap.*, fc.*, lc.*, ar.*, rmin.*, cmin.*,per.per_nombre AS periodo FROM cap.material_academico mc INNER JOIN cap.docente_grupo dg ON mc.dog_codigo = dg.dog_codigo INNER JOIN cap.grupo_investigacion gi ON dg.gri_codigo = gi.gri_codigo INNER JOIN cap.linea_investigacion li ON gi.lii_codigo = li.lii_codigo INNER JOIN cap.solicitud_puntaje sp ON mc.sop_codigo = sp.sop_codigo INNER JOIN persona p ON sp.per_codigo = p.per_codigo INNER JOIN cap.acta_solicitud_puntaje asp ON sp.acsp_codigo = asp.acsp_codigo INNER JOIN cap.estado_acta ac ON asp.esa_codigo = ac.esa_codigo INNER JOIN cap.estado_solicitud es ON sp.ess_codigo = es.ess_codigo INNER JOIN cap.material_configuracion ma ON mc.maco_codigo = ma.maco_codigo INNER JOIN cap.tipo_material tma ON ma.tim_codigo = tma.tim_codigo LEFT JOIN cap.tipo_material_subcategoria tms ON ma.tims_codigo = tms.tims_codigo INNER JOIN cap.tipo_punto tpu ON ma.tipu_codigo = tpu.tipu_codigo LEFT JOIN cap.tipo_impacto tpi ON ma.tii_codigo = tpi.tii_codigo INNER JOIN cap.tope_maximo_puntos tpp ON ma.tomp_codigo = tpp.tomp_codigo LEFT JOIN cap.tope_anual_reconocimiento_solicitud tar ON ma.tars_codigo = tar.tars_codigo INNER JOIN cap.tipo_envio_material te ON mc.tiem_codigo = te.tiem_codigo LEFT JOIN cap.asignacion_puntos ap ON sp.sop_codigo = ap.sop_codigo LEFT JOIN periodo per ON ap.asp_periodo = per.per_codigo LEFT JOIN cap.factor_valoracion fc ON ap.fav_codigo = fc.fav_codigo  LEFT JOIN cap.libro_capitulo lc ON lc.maac_codigo = mc.maac_codigo LEFT JOIN cap.articulo_revista ar ON ar.maac_codigo = mc.maac_codigo 
LEFT JOIN cap.revista_minciencias rmin ON ar.rem_codigo = rmin.rem_codigo LEFT JOIN cap.categorias_minciencias cmin ON rmin.cami_codigo = cmin.cami_codigo WHERE asp.acsp_estado = 1 AND mc.maac_estado = 1 AND sp.sop_codigo = 3


select * from cap.evaluacion_cuestionario_cap ecc inner join cap.tipo_evaluacion_cap tec on ecc.tiec_codigo = tec.tiec_codigo where ecc.tiec_codigo = 6 and ecc.evcc_estado = 1

-- Crear checklist_seccion
CREATE TABLE cap.checklist_seccion (
	chs_codigo INT IDENTITY(1,1) PRIMARY KEY,
	chs_nombre VARCHAR(500) NOT NULL,
	chs_estado INT DEFAULT 1
);

select * from cap.checklist_seccion cs where cs.chs_estado = 1

-- Crear solicitud_checklist
CREATE TABLE cap.solicitud_checklist (
    soch_codigo INT IDENTITY(1,1) PRIMARY KEY,
    soch_item VARCHAR(500) UNIQUE NOT NULL,
    soch_fecha_creacion DATE DEFAULT GETDATE() NOT NULL,
	chs_codigo INT NOT NULL, 
    soch_estado INT DEFAULT 1,
	FOREIGN KEY (chs_codigo) REFERENCES cap.checklist_seccion(chs_codigo)
);

select * from cap.solicitud_checklist sc
inner join cap.checklist_seccion cs on sc.chs_codigo = cs.chs_codigo
where sc.soch_estado = 1


-- Insertar secciones
INSERT INTO cap.checklist_seccion (chs_nombre) VALUES 
('Documentación'),
('Revisión Técnica'),
('Entrevista Final');

-- Insertar ítems (10 en total, distribuidos entre las 3 secciones)
INSERT INTO cap.solicitud_checklist (soch_item, chs_codigo) VALUES 
('Copia de cédula', 1),
('Formato de solicitud diligenciado', 1),
('Certificados académicos', 1),
('Análisis de requisitos técnicos', 2),
('Inspección física del equipo', 2),
('Validación de compatibilidad', 2),
('Presentación personal', 3),
('Conocimiento del proyecto', 3),
('Respuestas a preguntas técnicas', 3),
('Evaluación actitudinal', 3);


-- Crear solicitud_requisitos
CREATE TABLE cap.solicitud_requisitos (
    sore_codigo INT IDENTITY(1,1) PRIMARY KEY,
	sop_codigo INT NOT NULL,
    soch_codigo INT NOT NULL,
	sore_estado_requisito INT NOT NULL,
	sore_fecha_registro DATE DEFAULT GETDATE() NOT NULL,
    sore_estado INT DEFAULT 1,
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
    FOREIGN KEY (soch_codigo) REFERENCES cap.solicitud_checklist(soch_codigo)
);

-- Insertar registros de requisitos para una solicitud de puntaje con sop_codigo = 1
INSERT INTO cap.solicitud_requisitos (sop_codigo, soch_codigo, sore_estado_requisito) VALUES 
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0);


select * from cap.solicitud_requisitos sr 
inner join cap.solicitud_puntaje sp on sr.sop_codigo = sp.sop_codigo
inner join cap.estado_solicitud es on sp.ess_codigo = es.ess_codigo
inner join cap.solicitud_checklist sc on sr.soch_codigo = sc.soch_codigo
inner join cap.checklist_seccion cs on sc.chs_codigo = cs.chs_codigo
where sr.sore_estado = 1


select * from cap.solicitud_puntaje sp 
inner join cap.acta_solicitud_puntaje asp on sp.acsp_codigo = asp.acsp_codigo
inner join cap.estado_solicitud es on sp.ess_codigo = es.ess_codigo
inner join dbo.persona p on sp.per_codigo = p.per_codigo
inner join cap.estado_acta ea on asp.esa_codigo = ea.esa_codigo
inner join cap.material_academico ma on sp.sop_codigo = ma.sop_codigo
inner join cap.material_configuracion mc on ma.maco_codigo = mc.maco_codigo
inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo left join cap.tipo_material_subcategoria tms on mc.tims_codigo = tms.tims_codigo left join cap.tipo_punto tp on mc.tipu_codigo = tp.tipu_codigo left join cap.tipo_impacto ti on mc.tii_codigo = ti.tii_codigo left join cap.tope_maximo_puntos tmp on mc.tomp_codigo = tmp.tomp_codigo left join cap.tope_anual_reconocimiento_solicitud tars on mc.tars_codigo = tars.tars_codigo 
left join cap.docente_grupo dg on ma.dog_codigo = dg.dog_codigo
left join cap.grupo_investigacion gi on dg.gri_codigo = gi.gri_codigo
left join cap.linea_investigacion li on gi.lii_codigo = li.lii_codigo
inner join cap.tipo_envio_material tem on ma.tiem_codigo = tem.tiem_codigo
where sp.sop_estado = 1 and sp.sop_codigo = 3

select * from cap.anexo_material am 
inner join cap.tipo_anexo ta on am.tian_codigo = ta.tian_codigo 
where am.anm_estado = 1 and am.maac_codigo = 3


select * from cap.articulo_revista ar 
inner join cap.revista_minciencias rm on ar.rem_codigo = rm.rem_codigo
inner join cap.categorias_minciencias cm on rm.cami_codigo = cm.cami_codigo
where ar.arr_estado = 1 and ar.maac_codigo 

select * from cap.autor_material am where am.aum_estado = 1 and am.maac_codigo = 

select * from cap.libro_capitulo lc where lc.lic_estado = 1 and lc.maac_codigo = 


select * from cap.tipo_material tm 
inner join cap.material_configuracion mc on mc.tim_codigo = tm.tim_codigo
inner join cap.tipo_material_subcategoria tms on mc.tims_codigo = tms.tims_codigo
where tm.tim_codigo = 1


select * from cap.tipo_material tm 
inner join cap.tipo_material_subcategoria tms on tm.tim_codigo = tms.tim_codigo
where tm.tim_codigo = 1;



CREATE VIEW [cap].[usuario_docente_cap_login] AS
SELECT dbo.usuario_docentes.uid, dbo.usuario_docentes.up, dbo.usuario_docentes.uwd, dbo.usuario_docentes.uwd2, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_grupo.usg_estado, dbo.usuario_docentes.us_encriptado, up.uaa_codigo, v.vin_nombre, d.ded_nombre
FROM dbo.grupo 
INNER JOIN dbo.usuario_grupo ON dbo.grupo.gru_codigo = dbo.usuario_grupo.usg_grupo 
INNER JOIN dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
INNER JOIN dbo.uaa_personal up ON dbo.usuario_docentes.up = up.per_codigo
INNER JOIN dbo.vinculacion v ON up.vin_codigo = v.vin_codigo
INNER JOIN dbo.dedicacion d on up.ded_codigo = d.ded_codigo
WHERE dbo.grupo.gru_nombre = 'Docente' and up.vin_codigo = 12 and dbo.usuario_docentes.state = 1 AND up.uap_fecha_fin is null and up.per_codigo<>0 and dbo.usuario_grupo.usg_estado = 1
group by dbo.usuario_docentes.uid, dbo.usuario_docentes.up, dbo.usuario_docentes.uwd, dbo.usuario_docentes.uwd2, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_grupo.usg_estado, dbo.usuario_docentes.us_encriptado, up.uaa_codigo, v.vin_nombre, d.ded_nombre;



select * from cap.usuario_docente_cap_login udcl WHERE udcl.up = 25055
inner join uaa u on udcl.uaa_codigo = u.uaa_codigo
inner join uaa d on u.uaa_dependencia = d.uaa_codigo
inner join sede s on u.sed_codigo = s.sed_codigo

select * from uaa

select *, GETDATE() as horaInicioSesion, d.uaa_nombre as facultad, u.uaa_nombre as departamento from cap.usuario_docente_cap_login udcl inner join persona p on udcl.up = p.per_codigo 
inner join uaa u on udcl.uaa_codigo = u.uaa_codigo 
inner join uaa d on u.uaa_dependencia = d.uaa_codigo where  udcl.us = ? 

select COUNT(udcl.us) from cap.usuario_docente_cap_login udcl where udcl.us = ? 


SELECT * FROM uaa_personal up
inner join dedicacion d on up.ded_codigo = d.ded_codigo
INNER JOIN dbo.vinculacion v ON up.vin_codigo = v.vin_codigo
INNER JOIN dbo.usuario_docentes ud ON up.per_codigo = ud.up
INNER JOIN dbo.usuario_grupo ug ON ud.uid = ug.usg_usuario 
INNER JOIN dbo.grupo g on ug.usg_grupo = g.gru_codigo 
WHERE up.vin_codigo=12 AND up.uap_fecha_fin is null and up.per_codigo<>0 and g.gru_nombre = 'Docente'

select * from uaa_personal

select * from grupo

select * from vinculacion v 

select * from usuario_docentes; 

select * from uaa_personal up where up.per_codigo = 108797 

-- Crear la tabla area_investigacion_colciencias en el esquema CAP
CREATE TABLE cap.area_investigacion_colciencias (
    aric_codigo INT IDENTITY(1,1) PRIMARY KEY,
    aric_nombre VARCHAR(255) UNIQUE NOT NULL,
    aric_estado INT DEFAULT 1
);

-- Crear la tabla par_area_colciencias en el esquema CAP
CREATE TABLE cap.par_area_colciencias (
    paac_codigo INT IDENTITY(1,1) PRIMARY KEY,
    aric_codigo INT NOT NULL,
    paec_codigo INT NOT NULL,
    paac_estado INT DEFAULT 1,
    FOREIGN KEY (aric_codigo) REFERENCES cap.area_investigacion_colciencias(aric_codigo),
    FOREIGN KEY (paec_codigo) REFERENCES cap.par_evaluador_cap(paec_codigo)
);

-- Crear la tabla asignacion_puntos en el esquema CAP
CREATE TABLE cap.asignacion_puntos (
    asp_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sop_codigo INT NOT NULL,
    asp_puntaje FLOAT,
	doc_codigo INT,
    tipu_codigo INT NOT NULL,
    asp_periodo INT NOT NULL,
    fav_codigo INT NOT NULL,
    asp_fecha_asignacion DATETIME DEFAULT GETDATE(),
    asp_concepto_cap VARCHAR(500),
    asp_observacion VARCHAR(500),
    asp_estado INT DEFAULT 1,
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
    FOREIGN KEY (tipu_codigo) REFERENCES cap.tipo_punto(tipu_codigo),
    FOREIGN KEY (asp_periodo) REFERENCES periodo(per_codigo),
	FOREIGN KEY (doc_codigo) REFERENCES sgd.documento(doc_codigo),
	FOREIGN KEY (fav_codigo) REFERENCES cap.factor_valoracion(fav_codigo)
);


-- Crear la tabla tipo_punto en el esquema CAP
CREATE TABLE cap.tipo_punto (
    tipu_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tipu_nombre VARCHAR(100) NOT NULL,
	tipu_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_punto (tipu_nombre) VALUES 
('Salarial'), ('Bonificación'),('No Aplica');


select * from cap.usuario_docente_cap_login;

CREATE TABLE cap.notificacion (
	nod_codigo INT IDENTITY(1,1) PRIMARY KEY,
	acsp_codigo INT NOT NULL,
	nod_fecha_creacion DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (acsp_codigo) REFERENCES cap.acta_solicitud_puntaje(acsp_codigo)
);
