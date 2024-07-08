SELECT p.per_codigo, p.per_nombre, p.per_apellido, p.per_email, p.per_pais_residencia, p.per_fecha_registro, 
COUNT(CASE WHEN u.usu_estado = 1 THEN 1 ELSE NULL END) AS perfiles FROM persona p
LEFT JOIN usuario u ON p.per_codigo = u.per_codigo 
WHERE p.per_estado = 1
GROUP BY p.per_codigo, p.per_nombre, p.per_apellido, p.per_email, p.per_pais_residencia, p.per_fecha_registro
order by perfiles desc;

select * from persona p ;

select * from usuario u ;

select * from usuario_tipo ut ;


select * from principal.cuestionario c; 

select * from principal.pregunta p 
inner join principal.cuestionario c on p.cue_codigo = c.cue_codigo 
inner join principal.respuesta_tipo rt on p.ret_codigo = rt.ret_codigo 
where p.pre_estado = 1 
order by p.pre_codigo asc;

select * from principal.respuesta_tipo rt where rt.ret_estado = 1;

select * from principal.respuesta_opcion ro 
inner join principal.cuestionario c on ro.cue_codigo = c.cue_codigo 
where ro.reo_codigo =  and ro.reo_estado = 1
order by ro.reo_codigo asc;

select * from principal.pregunta_respuesta pr 
inner join principal.pregunta p on pr.pre_codigo = p.pre_codigo 
inner join principal.respuesta_opcion ro on pr.reo_codigo = ro.reo_codigo 
where pr.pre_codigo = ? and pr.prr_estado = 1
order by pr.prr_codigo asc;

select * from principal.respuesta_cuestionario rc ;

select * from principal.respuesta_opcion ro ;

select rc.rec_calificacion_total from principal.respuesta_cuestionario rc where rc.rec_codigo = 5 ;
	
select * from principal.respuesta r ;

select * from principal.calificacion c ;

select rc.rec_codigo from principal.respuesta_cuestionario rc order by rc.rec_codigo desc limit 1;

DROP TRIGGER IF EXISTS trigger_calificar_respuesta ON principal.respuesta;
DROP FUNCTION IF EXISTS principal.calcular_calificacion();

select * from principal.pregunta p where p.pre_estado = 1

select * from principal.cuestionario c 


WITH resultado AS (
    SELECT 
        rc.rec_codigo, 
        rc.rec_estudiante_nombre, 
        rc.rec_fecha_registro,
        pr.pre_codigo, 
        ro.reo_nombre,
        rc.rec_calificacion_total
    FROM 
        principal.respuesta_cuestionario rc 
        INNER JOIN principal.respuesta r ON r.rec_codigo = rc.rec_codigo
        INNER JOIN principal.pregunta_respuesta pr ON r.prr_codigo = pr.prr_codigo
        INNER JOIN principal.pregunta p ON pr.pre_codigo = p.pre_codigo 
        INNER JOIN principal.respuesta_opcion ro ON pr.reo_codigo = ro.reo_codigo 
    WHERE 
        rc.cue_codigo = 1
)
SELECT 
    rec_codigo,
    rec_estudiante_nombre,
    rec_fecha_registro,
    MAX(CASE WHEN pre_codigo = 3 THEN reo_nombre END) AS "3",
    MAX(CASE WHEN pre_codigo = 4 THEN reo_nombre END) AS "4",
    MAX(CASE WHEN pre_codigo = 5 THEN reo_nombre END) AS "5",
    rec_calificacion_total
FROM 
    resultado
GROUP BY 
    rec_codigo, rec_estudiante_nombre, rec_fecha_registro, rec_calificacion_total;

   
   
select * from principal.respuesta_cuestionario rc
inner join principal.cuestionario cu on rc.cue_codigo = cu.cue_codigo 
inner join principal.curso c on cu.cur_codigo = c.cur_codigo 
group by rc.rec_codigo, c.cur_codigo, cu.cue_codigo, rc.rec_calificacion_total
order by rc.rec_calificacion_total desc




CREATE OR REPLACE FUNCTION principal.calcular_calificacion()
RETURNS TRIGGER AS $$
DECLARE
    puntuacion numeric;
    total numeric;
    respuesta_opcion_reo_codigo int;
    total_respuestas int;
    total_preguntas int;
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

    -- Contar el número total de respuestas registradas para el cuestionario
    SELECT COUNT(*) INTO total_respuestas
    FROM principal.respuesta r
    WHERE r.rec_codigo = NEW.rec_codigo;

    -- Obtener el número total de preguntas del cuestionario
    SELECT rec_total_preguntas INTO total_preguntas
    FROM principal.respuesta_cuestionario
    WHERE rec_codigo = NEW.rec_codigo;

    -- Si todas las respuestas han sido registradas, calcular la calificación total
    IF total_respuestas = total_preguntas THEN
        -- Calcular la calificación total del cuestionario para el estudiante
        SELECT SUM(cal_puntuacion) INTO total
        FROM principal.calificacion
        WHERE rec_codigo = NEW.rec_codigo;

        -- Actualizar la calificación total en la tabla respuesta_cuestionario
        UPDATE principal.respuesta_cuestionario
        SET rec_calificacion_total = total
        WHERE rec_codigo = NEW.rec_codigo;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_calificar_respuesta
AFTER INSERT ON principal.respuesta
FOR EACH ROW
EXECUTE PROCEDURE calcular_calificacion();