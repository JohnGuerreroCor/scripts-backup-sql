--CREATE TABLE principal.curso (
    cur_codigo SERIAL PRIMARY KEY,
    cur_nombre varchar(200),
    per_codigo int NOT NULL,
    cur_descripcion varchar(250),
    cur_fecha_registro DATE DEFAULT CURRENT_DATE ,
    cur_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT curso_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo)
);

--CREACION CUESTIONARIO

--CREATE TABLE principal.cuestionario (
    cue_codigo SERIAL PRIMARY KEY,
    cue_nombre varchar(200) NOT NULL,
    cue_instrucciones varchar(250) NOT NULL,
    cur_codigo int NOT NULL,
    cue_fecha_inicio timestamp NOT NULL,
    cue_fecha_fin timestamp NOT NULL,
    cue_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT cuestionario_FK_curso FOREIGN KEY (cur_codigo) REFERENCES curso(cur_codigo)
);

--RESPUESTA TIPO
--CREATE TABLE principal.respuesta_tipo (
    ret_codigo SERIAL PRIMARY KEY,
    ret_nombre varchar(250),
    ret_estado int DEFAULT 1 NOT NULL
);

-- RESPUESTA OPCION
--CREATE TABLE principal.respuesta_opcion (
    reo_codigo SERIAL PRIMARY KEY,
    reo_nombre varchar(250),
    cue_codigo int not null,
    reo_puntuacion DECIMAL(5, 1),
    reo_estado int DEFAULT 1 NOT null,
    CONSTRAINT respuesta_opcion_FK_cuestionario FOREIGN KEY (cue_codigo) REFERENCES cuestionario(cue_codigo)
);

-- PREGUNTA
--CREATE TABLE principal.pregunta (
    pre_codigo SERIAL PRIMARY KEY,
    pre_nombre varchar(200),
    cue_codigo int not null,
    ret_codigo int not null,
    pre_texto_adicional varchar(100),
    pre_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT pregunta_FK_cuestionario FOREIGN KEY (cue_codigo) REFERENCES cuestionario(cue_codigo),
    CONSTRAINT pregunta_FK_respuesta_tipo FOREIGN KEY (ret_codigo) REFERENCES respuesta_tipo(ret_codigo)
);


-- PREGUNTA RESPUESTA
--CREATE TABLE principal.pregunta_respuesta (
    prr_codigo SERIAL PRIMARY KEY,
    pre_codigo int not null,
    reo_codigo int not null,
    prr_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT pregunta_respuesta_FK_pregunta FOREIGN KEY (pre_codigo) REFERENCES pregunta(pre_codigo),
    CONSTRAINT pregunta_respuesta_FK_respuesta_opcion FOREIGN KEY (reo_codigo) REFERENCES respuesta_opcion(reo_codigo)
);


-- RESPUESTA CUESTIONARIO
--CREATE TABLE principal.respuesta_cuestionario (
    rec_codigo SERIAL PRIMARY KEY,
    rec_estudiante_nombre varchar(200) not null,
    cue_codigo int not null,
    rec_fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rec_calificacion_total DECIMAL(5, 1),
    rec_total_preguntas int,
    CONSTRAINT respuesta_cuestionario_FK_cuestionario FOREIGN KEY (cue_codigo) REFERENCES cuestionario(cue_codigo)
);

-- RESPUESTA
--CREATE TABLE principal.respuesta (
    res_codigo SERIAL PRIMARY KEY,
    rec_codigo int not null, 
    prr_codigo int not null, 
    pre_codigo int not null,
    res_fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT respuesta_FK_respuesta_cuestionario FOREIGN KEY (rec_codigo) REFERENCES respuesta_cuestionario(rec_codigo),
    CONSTRAINT respuesta_FK_pregunta_respuesta FOREIGN KEY (prr_codigo) REFERENCES pregunta_respuesta(prr_codigo),
    CONSTRAINT respuesta_FK_pregunta FOREIGN KEY (pre_codigo) REFERENCES pregunta(pre_codigo)
);

-- CALIFICACION
--CREATE TABLE principal.calificacion (
    cal_codigo SERIAL PRIMARY KEY,
    rec_codigo int NOT NULL,
    res_codigo int NOT NULL,
    cal_puntuacion DECIMAL(5, 1) NOT NULL,
    CONSTRAINT calificacion_FK_respuesta_cuestionario FOREIGN KEY (rec_codigo) REFERENCES respuesta_cuestionario(rec_codigo),
    CONSTRAINT calificacion_FK_respuesta FOREIGN KEY (res_codigo) REFERENCES respuesta(res_codigo)
);



--FUNCIÓN CALIFICACION
CREATE OR REPLACE FUNCTION principal.calcular_calificacion()
RETURNS TRIGGER AS $$
DECLARE
    puntuacion numeric;
    total numeric;
    respuesta_opcion_reo_codigo int;
begin
   
    -- Obtener el código de la opción de respuesta desde pregunta_respuesta
    SELECT prr.reo_codigo INTO respuesta_opcion_reo_codigo
    FROM principal.pregunta_respuesta prr
    WHERE prr.prr_codigo = NEW.prr_codigo;

    -- Obtener la puntuación de la opción de respuesta
    SELECT ro.reo_puntuacion INTO puntuacion
    FROM principal.respuesta_opcion ro
    WHERE ro.reo_codigo = respuesta_opcion_reo_codigo;
    
    -- Insertar la calificación en la tabla de calificaciones
    INSERT INTO principal.calificacion (rec_codigo, res_codigo, cal_puntuacion)
    VALUES (NEW.rec_codigo, NEW.res_codigo, puntuacion);
    
    -- Calcular la calificación total del cuestionario para el estudiante
    SELECT SUM(cal_puntuacion) INTO total
    FROM principal.calificacion
    WHERE rec_codigo = NEW.rec_codigo;
    
    -- Actualizar la calificación total en la tabla respuesta_cuestionario
    UPDATE principal.respuesta_cuestionario
    SET rec_calificacion_total = total
    WHERE rec_codigo = NEW.rec_codigo;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--DISPARADOR FUNCION
CREATE TRIGGER trigger_calificar_respuesta
AFTER INSERT ON principal.respuesta
FOR EACH ROW
EXECUTE PROCEDURE calcular_calificacion();





--REINICIAR DATA DE BD

DELETE FROM principal.calificacion;
ALTER SEQUENCE general.calificacion_cal_codigo_seq RESTART WITH 1;
DELETE FROM principal.cuestionario;
ALTER SEQUENCE general.cuestionario_cue_codigo_seq RESTART WITH 1;



DELETE FROM general.facultad;
ALTER SEQUENCE general.facultad_fac_codigo_seq RESTART WITH 1;
DELETE FROM general.sede;
ALTER SEQUENCE general.sede_sed_codigo_seq RESTART WITH 1;
DELETE FROM general.institucion ;
ALTER SEQUENCE general.institucion_ins_codigo_seq RESTART WITH 1;
DELETE FROM general.norma_clasificada ;
ALTER SEQUENCE general.norma_clasificada_noc_codigo_seq RESTART WITH 1;
DELETE FROM general.norma_grupo;
ALTER SEQUENCE general.norma_grupo_nog_codigo_seq RESTART WITH 1;
DELETE FROM general.norma_deroga;
ALTER SEQUENCE general.norma_deroga_nod_codigo_seq RESTART WITH 1;
DELETE FROM general.norma;
ALTER SEQUENCE general.norma_nor_codigo_seq RESTART WITH 1;
DELETE FROM general.campo_detallado_cine;
ALTER SEQUENCE general.campo_detallado_cine_cdc_codigo_seq RESTART WITH 1;
DELETE FROM general.campo_especifico_cine;
ALTER SEQUENCE general.campo_especifico_cine_cec_codigo_seq RESTART WITH 1;
DELETE FROM general.campo_amplio_cine;
ALTER SEQUENCE general.campo_amplio_cine_cac_codigo_seq RESTART WITH 1;
DELETE FROM general.representante_legal;
ALTER SEQUENCE general.representante_legal_rel_codigo_seq RESTART WITH 1;
DELETE FROM general.funciones_curpos_colegiados;
ALTER SEQUENCE general.funciones_curpos_colegiados_fcc_codigo_seq RESTART WITH 1;
DELETE FROM general.integrante_cuerpo_colegiado;
ALTER SEQUENCE general.integrante_cuerpo_colegiado_icc_codigo_seq RESTART WITH 1;
DELETE FROM general.cuerpos_colegiados;
ALTER SEQUENCE general.cuerpos_colegiados_cuc_codigo_seq RESTART WITH 1;