-- SCRIPTS PARA CREAR ESTRUCTURA DE LA BASE DE DATOS CAP

-- Crear el esquema CAP
CREATE SCHEMA cap;

CREATE TABLE cap.estado_acta (
    esa_codigo INT IDENTITY(1,1) PRIMARY KEY,
    esa_nombre VARCHAR(100) UNIQUE NOT NULL,
    esa_estado INT DEFAULT 1
);

INSERT INTO cap.estado_acta (esa_nombre) VALUES
('Abierta'),
('Cerrada');

-- Crear la tabla convocatoria_solicitud_puntaje en el esquema CAP
CREATE TABLE cap.acta_solicitud_puntaje (
    acsp_codigo INT IDENTITY(1,1) PRIMARY KEY,
    acsp_nombre VARCHAR(100) UNIQUE NOT NULL,
    acsp_descripcion VARCHAR(500),
    acsp_fecha_inicio datetime NOT NULL,
    acsp_fecha_fin datetime NOT NULL,
    esa_codigo INT NOT NULL,
    acsp_estado INT DEFAULT 1
    FOREIGN KEY (esa_codigo) REFERENCES cap.estado_acta(esa_codigo),
);

select * from cap.acta_solicitud_puntaje

-- Crear la tabla solicitud_puntaje en el esquema CAP
CREATE TABLE cap.solicitud_puntaje (
    sop_codigo INT IDENTITY(1,1) PRIMARY KEY,
    per_codigo INT NOT NULL,
    sop_fecha_solicitud DATETIME DEFAULT GETDATE(),
    cosp_codigo INT NOT NULL,
    sop_concepto_cap VARCHAR(500),
    sop_observacion VARCHAR(500),
    ess_codigo INT NOT NULL,
    FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    FOREIGN KEY (cosp_codigo) REFERENCES cap.convocatoria_solicitud_puntaje(cosp_codigo),
    FOREIGN KEY (ess_codigo) REFERENCES cap.estado_solicitud(ess_codigo)
);

-- Crear la tabla factor_valoracion en el esquema CAP (DE ACUERDO AL DECRETO 2002)

CREATE TABLE cap.factor_valoracion (
    fav_codigo INT IDENTITY(1,1) PRIMARY KEY,
    fav_nombre VARCHAR(100) UNIQUE NOT NULL,
    fav_descripcion VARCHAR(500),
    fav_estado INT DEFAULT 1
);

-- INSERT DE LOS FACTORES NECESARIOS SEGÚN EL DECRETO

INSERT INTO cap.factor_valoracion (fav_nombre, fav_descripcion)
VALUES ('Títulos Universitarios','Certificaciones oficiales obtenidas tras completar estudios de educación superior.');
INSERT INTO cap.factor_valoracion (fav_nombre, fav_descripcion)
VALUES ('Categoría Docente','Nivel o rango asignado a un docente dentro del escalafón académico según su experiencia, formación y méritos.');
INSERT INTO cap.factor_valoracion (fav_nombre, fav_descripcion)
VALUES ('Experiencia Calificada','Trayectoria profesional acreditada en un área específica, respaldada por formación y desempeño comprobable.');
INSERT INTO cap.factor_valoracion (fav_nombre, fav_descripcion)
VALUES ('Productividad Académica','Conjunto de publicaciones, investigaciones y contribuciones realizadas en el ámbito académico y científico.');

select * from cap.factor_valoracion

-- Crear la tabla tipo_puntaje en el esquema CAP
CREATE TABLE cap.tipo_puntaje (
    tip_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tip_nombre VARCHAR(100) NOT NULL,
    tip_descripcion VARCHAR(500),
    tip_estado INT DEFAULT 1
);

-- Crear la tabla parametro_puntos en el esquema CAP
CREATE TABLE cap.parametro_puntaje (
    pap_codigo INT IDENTITY(1,1) PRIMARY KEY,
    fav_codigo INT NOT NULL,
    tip_codigo INT NOT NULL,
    pap_valor INT NOT NULL,
    pde_descripcion VARCHAR(500) NOT NULL,
    FOREIGN KEY (fav_codigo) REFERENCES cap.factor_valoracion(fav_codigo),
    FOREIGN KEY (tip_codigo) REFERENCES cap.tipo_puntaje(tip_codigo)
);

-- Crear la tabla tipo_punto en el esquema CAP
CREATE TABLE cap.tipo_punto (
    tipu_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tipu_nombre VARCHAR(100) NOT NULL
);

INSERT INTO cap.tipo_punto (tipu_nombre)
VALUES ('Salarial');
INSERT INTO cap.tipo_punto (tipu_nombre)
VALUES ('Bonificación');
INSERT INTO cap.tipo_punto (tipu_nombre)
VALUES ('No Aplica');

select * from cap.tipo_punto

-- Crear la tabla asignacion_puntos en el esquema CAP
CREATE TABLE cap.asignacion_puntos (
    asp_codigo INT IDENTITY(1,1) PRIMARY KEY,
    per_docente INT NOT NULL,
    pap_codigo INT NOT NULL,
    asp_puntaje INT,
    tipu_codigo INT NOT NULL,
    asp_periodo INT NOT NULL,
    asp_fecha_asignacion DATETIME DEFAULT GETDATE(),
    asp_concepto_cap VARCHAR(500),
    asp_observacion VARCHAR(500),
    asp_estado INT DEFAULT 1,
    FOREIGN KEY (per_docente) REFERENCES persona(per_codigo),
    FOREIGN KEY (pap_codigo) REFERENCES cap.parametro_puntaje(pap_codigo),
    FOREIGN KEY (tipu_codigo) REFERENCES cap.tipo_punto(tipu_codigo),
    FOREIGN KEY (asp_periodo) REFERENCES periodo(per_codigo)
);

-- Crear la tabla linea_investigacion en el esquema CAP
CREATE TABLE cap.linea_investigacion (
    lii_codigo INT IDENTITY(1,1) PRIMARY KEY,
    lii_nombre VARCHAR(100) UNIQUE NOT NULL,
    lii_estado INT DEFAULT 1
);

select * from cap.linea_investigacion li where li.lii_estado = 1
select * from cap.linea_investigacion li where li.lii_estado = 1 and li.lii_codigo = 

-- Crear la tabla grupo_investigacion en el esquema CAP
CREATE TABLE cap.grupo_investigacion (
    gri_codigo INT IDENTITY(1,1) PRIMARY KEY,
    gri_nombre VARCHAR(100) UNIQUE NOT NULL,
    lii_codigo INT NOT NULL,
    gri_estado INT DEFAULT 1,
    FOREIGN KEY (lii_codigo) REFERENCES cap.linea_investigacion(lii_codigo)
);

select * from cap.grupo_investigacion gi 
inner join cap.linea_investigacion li on gi.lii_codigo = li.lii_codigo
where gi.gri_estado = 1

select * from cap.grupo_investigacion gi
inner join cap.linea_investigacion li on gi.lii_codigo = li.lii_codigo
where gi.gri_estado = 1 and gi.lii_codigo = 

-- Crear la tabla docente_grupo en el esquema CAP
CREATE TABLE cap.docente_grupo (
    dog_codigo INT IDENTITY(1,1) PRIMARY KEY,
    per_codigo INT NOT NULL,
    gri_codigo INT NOT NULL,
    dog_estado INT DEFAULT 1,
    FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    FOREIGN KEY (gri_codigo) REFERENCES cap.grupo_investigacion(gri_codigo)
);

-- Crear la tabla tipo_material en el esquema CAP
CREATE TABLE cap.tipo_material (
    tim_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tim_nombre VARCHAR(100) UNIQUE NOT NULL,
    tim_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Adaptación Tecnológica');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Artículo de Investigación');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Artículo Reflexión');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Artículo Reporte de Caso');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Artículo Revisión');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Capítulo de Libro');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Creación Original de Carácter Nacional');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Dirección de Tesis');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Estudios Postdoctorales');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Impreso Universitario');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Innovación Tecnológica');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Libro de Ensayo');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Libro de Texto');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Libro derivado de Investigación');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Producción Cinematográfica');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Patente');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Ponencia Internacional');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Ponencia Nacional');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Ponencia Regional');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Premios Internacionales'); --
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Premios Nacionales');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Premios Regionales');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Reseñas Criticas');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Software');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Titulo de Posgrado');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Traducción de Artículo');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Traducción Libro Ensayo');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Traducción Libro Texto');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Video');
INSERT INTO cap.tipo_material (tim_nombre)
VALUES ('Video de Carácter Internacional');

select * from cap.tipo_material

-- Crear la tabla estado_solicitud en el esquema CAP
CREATE TABLE cap.estado_solicitud (
    ess_codigo INT IDENTITY(1,1) PRIMARY KEY,
    ess_nombre VARCHAR(50) UNIQUE NOT NULL,
    ess_estado INT DEFAULT 1
);

INSERT INTO cap.estado_solicitud (ess_nombre) VALUES
('Pendiente'),
('En revisión'),
('Aprobada'),
('Rechazada'),
('Cancelada'),
('Completada'),
('En proceso'),
('Devuelta para corrección'),
('Expirada'),
('Archivada');

select * from cap.estado_solicitud



-- Crear la tabla categorias_minciencias en el esquema CAP
CREATE TABLE cap.categorias_minciencias (
    cami_codigo INT IDENTITY(1,1) PRIMARY KEY,
    cami_nombre VARCHAR(100) UNIQUE NOT NULL,
    cami_estado INT DEFAULT 1
);

INSERT INTO cap.categorias_minciencias (cami_nombre) VALUES
('A1'), ('A2'), ('A'), ('B'), ('C'), ('No Aplica');

select * from cap.categorias_minciencias

-- Crear la tabla caracter_material en el esquema CAP
CREATE TABLE cap.caracter_material (
    cam_codigo INT IDENTITY(1,1) PRIMARY KEY,
    cam_nombre VARCHAR(100) UNIQUE NOT NULL,
    cam_estado INT DEFAULT 1
);

INSERT INTO cap.caracter_material (cam_nombre) VALUES
('Didáctico'), ('Documental');

select * from cap.caracter_material


-- Crear la tabla tipo_impacto en el esquema CAP
CREATE TABLE cap.tipo_impacto (
    tii_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tii_nombre VARCHAR(100) UNIQUE NOT NULL,
    tii_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_impacto (tii_nombre) VALUES
('Nacional'), ('Internacional'), ('Regional o local');

select * from cap.tipo_impacto

-- Crear la tabla tipo_envio_material en el esquema CAP
CREATE TABLE cap.tipo_envio_material (
    tiem_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tiem_nombre VARCHAR(100) UNIQUE NOT NULL,
    tiem_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_envio_material (tiem_nombre) VALUES
('Físico'), ('Digital');

select * from cap.tipo_envio_material

-- Crear la tabla material_academico en el esquema CAP
CREATE TABLE cap.material_academico (
    maac_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sop_codigo INT NOT NULL,
    tim_codigo INT NOT NULL,
    cam_codigo INT NOT NULL,
    tii_codigo INT NOT NULL,
    tiem_codigo INT NOT NULL,
    maac_titulo VARCHAR(255) NOT NULL,
    maac_traduccion_titulo VARCHAR(255),
    maac_fecha_publicacion DATETIME NOT NULL,
    maac_enlace VARCHAR(255),
    maac_anexo INT NOT NULL,
    maac_cantidad_autor INT NOT NULL,
    maac_estado INT DEFAULT 1,
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
    FOREIGN KEY (tim_codigo) REFERENCES cap.tipo_material(tim_codigo),
    FOREIGN KEY (cam_codigo) REFERENCES cap.caracter_material(cam_codigo),
    FOREIGN KEY (tii_codigo) REFERENCES cap.tipo_impacto(tii_codigo),
    FOREIGN KEY (tiem_codigo) REFERENCES cap.tipo_envio_material(tiem_codigo)
);

-- Crear la tabla autor_material en el esquema CAP
CREATE TABLE cap.autor_material (
    aum_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT NOT NULL,
    aum_nombre VARCHAR(255) NOT NULL,
    FOREIGN KEY (maac_codigo) REFERENCES CAP.material_academico(maac_codigo)
);

-- Crear la tabla tipo_articulo en el esquema CAP
CREATE TABLE cap.tipo_articulo (
    tia_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tia_nombre VARCHAR(100) UNIQUE NOT NULL,
    tia_descripcion VARCHAR(300) NOT NULL,
    tia_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_articulo (tia_nombre, tia_descripcion)
VALUES ('Investigación','Actividad académica que contribuye al avance del conocimiento.');
INSERT INTO cap.tipo_articulo (tia_nombre, tia_descripcion)
VALUES ('Comunicación corta','Trabajo académico breve que presenta resultados preliminares o avances significativos.');
INSERT INTO cap.tipo_articulo (tia_nombre, tia_descripcion)
VALUES ('Revisión','Análisis crítico y síntesis de literatura existente sobre un tema específico.');
INSERT INTO cap.tipo_articulo (tia_nombre, tia_descripcion)
VALUES ('Reflexión','Análisis interpretativo o personal que es valorado por su profundidad, originalidad y aporte al pensamiento crítico en el ámbito académico.');
INSERT INTO cap.tipo_articulo (tia_nombre, tia_descripcion)
VALUES ('Reporte de caso','Descripción detallada de una situación específica, generalmente en el ámbito profesional o académico, que permite analizar y aprender de casos concretos para su aplicación en la práctica.');

select * from cap.tipo_articulo

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

-- Crear la tabla articulos_revista en el esquema CAP
CREATE TABLE cap.articulos_revista (
    arr_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT  NOT NULL,
    arr_nombre VARCHAR(255) UNIQUE NOT NULL,
    tia_codigo INT  NOT NULL,
    rem_codigo INT  NOT NULL,
    arr_url VARCHAR(500) NOT NULL,
    arr_fecha_sumision datetime,
    arr_fecha_aprobacion datetime NOT NULL,
    arr_recursos_universidad CHAR(1) NOT NULL,
    FOREIGN KEY (maac_codigo) REFERENCES cap.material_academico(maac_codigo),
    FOREIGN KEY (tia_codigo) REFERENCES cap.tipo_articulo(tia_codigo),
    FOREIGN KEY (rem_codigo) REFERENCES cap.revista_minciencias(rem_codigo)
);

-- Crear la tabla tipo_libro en el esquema CAP
CREATE TABLE cap.tipo_libro (
    til_codigo INT IDENTITY(1,1) PRIMARY KEY,
    til_nombre VARCHAR(255) UNIQUE NOT NULL,
    til_estado INT DEFAULT 1
);

INSERT INTO cap.tipo_libro (til_nombre) VALUES
('Investigación'),
('Texto'),
('Ensayo');

select * from cap.tipo_libro

-- Crear la tabla libro_capitulo en el esquema CAP
CREATE TABLE cap.libro_capitulo (
    lic_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT NOT NULL,
    til_codigo INT NOT NULL,
    lic_isbn VARCHAR(50) NOT NULL,
    lic_editorial VARCHAR(255) NOT NULL,
    lic_url_editorial VARCHAR(500),
    FOREIGN KEY (maac_codigo) REFERENCES CAP.material_academico(maac_codigo),
    FOREIGN KEY (til_codigo) REFERENCES CAP.tipo_libro(til_codigo)
);

-- Crear la tabla produccion_academica en el esquema CAP
CREATE TABLE cap.produccion_academica (
    pra_codigo INT IDENTITY(1,1) PRIMARY KEY,
    maac_codigo INT NOT NULL,
    pra_nombre VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (maac_codigo) REFERENCES cap.material_academico(maac_codigo)
);

-- Crear la tabla recepcion_solicitud en el esquema cap
CREATE TABLE cap.recepcion_solicitud (
    res_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sop_codigo INT NOT NULL,
    res_fecha_recepcion DATETIME DEFAULT GETDATE(),
    res_concepto_cap VARCHAR(300) NOT NULL,
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo)
);

-- Crear la tabla area_investigacion_colciencias en el esquema CAP
CREATE TABLE cap.area_investigacion_colciencias (
    aric_codigo INT IDENTITY(1,1) PRIMARY KEY,
    aric_nombre VARCHAR(255) UNIQUE NOT NULL,
    aric_estado INT DEFAULT 1
);

-- Crear la tabla categoria_par en el esquema CAP
CREATE TABLE cap.categoria_par (
    cap_codigo INT IDENTITY(1,1) PRIMARY KEY,
    cap_nombre VARCHAR(100) UNIQUE NOT NULL,
    cap_estado INT DEFAULT 1
);

INSERT INTO cap.categoria_par (cap_nombre) VALUES
('Investigador Junior'), ('Investigador Asociado'), ('Investigador Senior'), ('Investigador Emérito');

select * from cap.categoria_par

select * from nivel_academico
select * from genero

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

-- Crear la tabla par_area_colciencias en el esquema CAP
CREATE TABLE cap.par_area_colciencias (
    paac_codigo INT IDENTITY(1,1) PRIMARY KEY,
    aric_codigo INT NOT NULL,
    paec_codigo INT NOT NULL,
    paac_estado INT DEFAULT 1,
    FOREIGN KEY (aric_codigo) REFERENCES cap.area_investigacion_colciencias(aric_codigo),
    FOREIGN KEY (paec_codigo) REFERENCES cap.par_evaluador_cap(paec_codigo)
);

-- Crear la tabla tipo_evaluacion_cap en el esquema CAP
CREATE TABLE cap.tipo_evaluacion_cap (
    tiec_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tiec_nombre VARCHAR(100) UNIQUE NOT NULL,
    tiec_puntaje_maximo INT NOT NULL,
    tiec_estado INT DEFAULT 1
);

-- Crear la tabla evaluacion_cuestionario_cap en el esquema CAP
CREATE TABLE cap.evaluacion_cuestionario_cap (
    evcc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evcc_nombre VARCHAR(100) UNIQUE NOT NULL,
    tiec_codigo INT NOT NULL,
    evcc_instrucciones VARCHAR(255) NOT NULL,
    FOREIGN KEY (tiec_codigo) REFERENCES cap.tipo_evaluacion_cap(tiec_codigo)
);

-- Crear la tabla evaluacion_tipo_pregunta_cap en el esquema CAP
CREATE TABLE cap.evaluacion_tipo_pregunta_cap (
    etpc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    etpc_nombre VARCHAR(100) UNIQUE NOT NULL,
    etpc_estado INT DEFAULT 1
);

INSERT INTO cap.evaluacion_tipo_pregunta_cap (etpc_nombre) VALUES
('Selección única'), ('Selección múltiple'), ('Texto');

select * from cap.evaluacion_tipo_pregunta_cap

-- Crear la tabla evaluacion_pregunta_cap en el esquema CAP
CREATE TABLE cap.evaluacion_pregunta_cap (
    evpc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evcc_codigo INT NOT NULL,
    evpc_pregunta VARCHAR(255) NOT NULL,
    etpc_codigo INT NOT NULL,
    evpc_estado INT DEFAULT 1,
    FOREIGN KEY (evcc_codigo) REFERENCES cap.evaluacion_cuestionario_cap(evcc_codigo),
	FOREIGN KEY (etpc_codigo) REFERENCES cap.evaluacion_tipo_pregunta_cap(etpc_codigo)
);

-- Crear la tabla evaluacion_opciones_cap en el esquema CAP
CREATE TABLE cap.evaluacion_opciones_cap (
    evop_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evpc_codigo INT NOT NULL,
    evop_opcion VARCHAR(300) NOT NULL,
    FOREIGN KEY (evpc_codigo) REFERENCES cap.evaluacion_pregunta_cap(evpc_codigo)
);

-- Crear la tabla asignacion_evaluacion_par en el esquema CAP
CREATE TABLE cap.asignacion_evaluacion_par (
    asep_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sop_codigo INT NOT NULL,
    paec_codigo INT NOT NULL,
    tiem_codigo INT NOT NULL,
    asep_fecha_registro DATETIME DEFAULT GETDATE(),
    asep_vigencia DATETIME NOT NULL,
    asep_estado INT DEFAULT 1,
    FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
    FOREIGN KEY (paec_codigo) REFERENCES cap.par_evaluador_cap(paec_codigo),
    FOREIGN KEY (tiem_codigo) REFERENCES cap.tipo_envio_material(tiem_codigo)
);

-- Crear la tabla evaluacion_seleccion_cap en el esquema CAP
CREATE TABLE cap.evaluacion_seleccion_cap (
	evsc_codigo INT IDENTITY(1,1) PRIMARY KEY,
	evsc_nombre VARCHAR(100) UNIQUE NOT NULL,
	evsc_estado INT DEFAULT 1
);

INSERT INTO cap.evaluacion_seleccion_cap (evsc_nombre) VALUES
('Cumple'), ('No Cumple');

select * from cap.evaluacion_seleccion_cap

-- Crear la tabla evaluacion_respuesta_cap en el esquema CAP
CREATE TABLE cap.evaluacion_respuesta_cap (
    evrc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    asep_codigo INT NOT NULL,
    evcc_codigo INT NOT NULL,
    evpc_codigo INT NOT NULL,
    evop_codigo INT, -- Respuesta seleccionada, si aplica
    evrc_texto VARCHAR(255), -- Para respuestas abiertas
    evsc_codigo INT, 
    evpc_puntaje INT NOT NULL,
    FOREIGN KEY (asep_codigo) REFERENCES cap.asignacion_evaluacion_par(asep_codigo),
    FOREIGN KEY (evcc_codigo) REFERENCES cap.evaluacion_cuestionario_cap(evcc_codigo),
    FOREIGN KEY (evpc_codigo) REFERENCES cap.evaluacion_pregunta_cap(evpc_codigo),
    FOREIGN KEY (evop_codigo) REFERENCES cap.evaluacion_opciones_cap(evop_codigo),
	FOREIGN KEY (evsc_codigo) REFERENCES cap.evaluacion_seleccion_cap(evsc_codigo)
);

-- Crear la tabla fase_revision en el esquema CAP
CREATE TABLE cap.fase_revision (
    far_codigo INT IDENTITY(1,1) PRIMARY KEY,
    far_nombre VARCHAR(100) UNIQUE NOT NULL,
    far_estado INT DEFAULT 1
);

INSERT INTO cap.fase_revision (far_nombre) VALUES
('Revisión del Profesional de Apoyo'), ('Revisión por Secretaria Técnica');

select * from cap.fase_revision

--Crear tabla revision_solicitud_puntaje en el esquema CAP
CREATE TABLE cap.revision_solicitud_puntaje (
	rsp_codigo INT IDENTITY(1,1) PRIMARY KEY,
	sop_codigo INT NOT NULL,
	per_codigo INT NOT NULL, --Usuario que realizó la revisión
	far_codigo INT NOT NULL, --Fase en la que se hizo la revisión
	rsp_fecha_revision DATETIME DEFAULT GETDATE(),
	ess_codigo INT NOT NULL,
	rsp_observacion VARCHAR(300) NOT NULL,
	FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo),
	FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
	FOREIGN KEY (far_codigo) REFERENCES cap.fase_revision(far_codigo),
	FOREIGN KEY (ess_codigo) REFERENCES cap.estado_solicitud(ess_codigo)
);

--Crear tabla notificacion_docente_cap en el esquema CAP
CREATE TABLE cap.notificacion_docente (
	nod_codigo INT IDENTITY(1,1) PRIMARY KEY,
	sop_codigo INT NOT NULL,
	nod_fecha_creacion DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo)
);



-- Eliminar columna nacionalidad tabla par evaluador cap(se deja solo país)
ALTER TABLE cap.par_evaluador_cap
DROP COLUMN paec_nacionalidad;


-- Añadir estado para eliminado lógico de pares evaluadores
ALTER TABLE cap.par_evaluador_cap
ADD paec_estado INT DEFAULT 1 NOT NULL;




-- Creación de grupo administrador para secretaria/jurídica.
INSERT INTO grupo (gru_nombre, gru_id, gru_estado)
VALUES ('CAP - Administrador CAP', 'CAP_ADMINISTRADOR_RECONOCIMIENTO',1)

--Creación de grupo para usuario encargado de alimentar y validar los trabajos de investigación.
INSERT INTO grupo (gru_nombre, gru_id, gru_estado)
VALUES ('CAP - Colaborador Editorial de Investigación', 'CAP_COLABORADOR_EDITORIAL',1)

select * from grupo

--Creación de vista para traer la información fundamental del usuario.
-- Se debe incluir el código autogenerado por los INSERT de los grupos en la cláusula 'ug.usg_grupo IN (<Agregar aquí los códigos separados por comas>)'.

CREATE VIEW [dbo].[usuario_administrador_cap_login]
AS
SELECT ua.uid, ua.up,ua.us,ua.uwd2,ua.sys,ua.state,ug.usg_uaa,gr.gru_codigo,gr.gru_nombre, gr.gru_id, gr.gru_estado
FROM usuario_administrativos ua
INNER JOIN usuario_grupo ug ON ua.uid = ug.usg_usuario
INNER JOIN grupo gr ON ug.usg_grupo = gr.gru_codigo
WHERE ug.usg_grupo IN (361,362) AND ug.usg_estado = 1


select * from cap.asignacion_evaluacion_par aep 
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
inner join cap.tipo_envio_material tem on aep.tiem_codigo = tem.tiem_codigo
where aep.asep_estado = 1


select * from cap.asignacion_evaluacion_par aep 
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
inner join cap.tipo_envio_material tem on aep.tiem_codigo = tem.tiem_codigo
where aep.asep_estado = 1 and aep.paec_codigo = ;

select * from cap.asignacion_evaluacion_par aep 
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
inner join cap.tipo_envio_material tem on aep.tiem_codigo = tem.tiem_codigo
where aep.asep_estado = 1 and aep.sop_codigo = ; 

select * from cap.asignacion_evaluacion_par aep 
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
inner join cap.tipo_envio_material tem on aep.tiem_codigo = tem.tiem_codigo
where aep.asep_estado = 1 and aep.tiem_codigo = ;


select * from cap.asignacion_evaluacion_par aep 
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
inner join cap.tipo_envio_material tem on aep.tiem_codigo = tem.tiem_codigo
where aep.asep_estado = 1 and aep.asep_codigo = ;


select * from cap.categorias_minciencias cm where cm.cami_estado = 1

select * from cap.revista_minciencias rm 
inner join cap.categorias_minciencias cm on rm.cami_codigo = cm.cami_codigo
where rm.rem_estado = 1


select * from cap.revista_minciencias rm 
inner join cap.categorias_minciencias cm on rm.cami_codigo = cm.cami_codigo
where rm.rem_estado = 1 and rm.cami_codigo;


---Crear estado en convocatorias.
CREATE TABLE cap.estado_convocatoria (
    esc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    esc_nombre VARCHAR(100) UNIQUE NOT NULL,
);

---Generar antes del estado.
ALTER TABLE cap.convocatoria_solicitud_puntaje ADD esc_codigo INT  FOREIGN KEY (esc_codigo) REFERENCES cap.estado_convocatoria(esc_codigo);

---Se crean dos estados.
INSERT INTO cap.estado_convocatoria (esc_nombre)
VALUES ('Abierta')

INSERT INTO cap.estado_convocatoria (esc_nombre)
VALUES ('Cerrada')
