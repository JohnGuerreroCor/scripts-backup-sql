--****************************--
--******CARNET DIGITAL********--
--****************************--

select * from modulo m 

--CREACIÓN DEL MÓDULO
INSERT INTO modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Carnet Digital', 'Módulo que permite generar y visualizar el carnet digital para cada uno de los estamentos de la institución', getDate(), 1);

select * from web_parametro wp where wp.wep_codigo = 486 

--INSERT INTO academia3000.dbo.web_parametro
(wep_nombre, wep_valor, wep_descripcion, wep_estado)
VALUES('CARNET_DIGITAL_IMPLEMENTACION_TOKEN', '1', 'PARAMETRIZA LA IMPLEMENTACION DEL TOKEN EN EL INICIO DE SESION DEL CARNET DIGITAL', 1);


INSERT INTO dbo.web_parametro
(wep_nombre, wep_valor, wep_descripcion, wep_estado)
VALUES('VIGENCIA_QR_RESTAURANTE', 600 , 'TIEMPO VIGENCIA QR RESTAURANTE, QR CAMBIA SEGUN VALOR INDICADO EN SEGUNDOS', 1);

-------------------------
--TABLAS Y DISPARADORES--
-------------------------

-------------------------
-------CONSULTAS---------
-------------------------
select * from estudiante e where e.per_codigo = 119299

select per_nombre from periodo p where CONVERT(DATE, GETDATE()) BETWEEN p.per_fecha_inicio  AND p.per_fecha_fin

select * from plan_academico pa;
select * from plan_estudiante pe where pe.est_codigo = '20171157616'
select * from plan_estudiante pe where pe.est_codigo = '20241223915' and ple_estado = 1
select * from plan_academico_asignatura paa; 

-------------------FICHA ACADÉMICA Y MATRICULA ACTUAL
--Esta query genera la informacion de todas las asignaturas matriculadas por el estudiante, en todos los periodos, desde el periodo de inciio hasta el periodo actual
--En en periodo actual puede que no tenga nota definitiva pero en el momento en que se coloque se actualiza.
SELECT c.cur_codigo, pr.per_nombre as periodo, nt.paa_semestre, nt.paa_credito, c.cur_grupo, nt.asi_nombre_corto, nt.asi_nombre, nt.mac_nota, nt.maa_nombre, p.per_codigo, p.per_nombre, p.per_apellido, p.per_email_interno FROM notas_total nt
inner join calendario cal on nt.cal_nombre = cal.cal_nombre  
inner join periodo pr on cal.per_codigo = pr.per_codigo 
inner join curso c on nt.cur_codigo = c.cur_codigo 
inner join uaa_personal up on c.uap_codigo = up.uap_codigo 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE est_codigo = '20241223915' --Codigo del estudiante
AND nt.pla_codigo = '1222' -- Codigo del plan activo
AND nt.maa_codigo IN(1,2)
ORDER BY nt.cal_nombre, nt.asi_nombre

select * from estudiante e where e.per_codigo = 138211

SELECT pr.per_nombre FROM notas_total nt
inner join calendario cal on nt.cal_nombre = cal.cal_nombre  
inner join periodo pr on cal.per_codigo = pr.per_codigo 
inner join curso c on nt.cur_codigo = c.cur_codigo 
inner join uaa_personal up on c.uap_codigo = up.uap_codigo 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE est_codigo = '20171157616' 
AND nt.pla_codigo = '981' 
AND nt.maa_codigo IN(1,2)
GROUP by pr.per_nombre
ORDER BY pr.per_nombre DESC 

 

---Puntajes calificados en todos los semestres o matriculas realizadas en total
--Hay que tener en cuenta que pueden existir periodos o registros en esta query en la que los estudiantes tiene matricula activa pero
--no matricularon ninguna asignatura.
SELECT per.per_nombre, mti.mti_nombre, ROUND(ppcp.promedio_ponderado, 3) as promedio_ponderado 
FROM matricula mat WITH(NOLOCK)  
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON mat.est_codigo = ple.est_codigo  
INNER JOIN plan_academico pla WITH(NOLOCK) ON ple.pla_codigo = pla.pla_codigo  
INNER JOIN calendario cal WITH(NOLOCK) ON mat.cal_codigo = cal.cal_codigo  
INNER JOIN periodo per WITH(NOLOCK) ON cal.per_codigo = per.per_codigo  
LEFT JOIN matricula_tipo mti WITH(NOLOCK) ON mat.mat_tipo = mti.mti_codigo  
LEFT JOIN promedio_ponderado_con_perdidas ppcp WITH(NOLOCK) ON (mat.est_codigo = ppcp.est_codigo AND mat.mat_codigo = ppcp.mat_codigo)  
LEFT JOIN promedio_aritmetico_con_perdidas pacp WITH(NOLOCK) ON (mat.est_codigo = pacp.est_codigo AND mat.mat_codigo = pacp.mat_codigo)  
lEFT JOIN aud_matricula aud WITH(NOLOCK) ON  aud.mat_codigo=mat.mat_codigo
WHERE mat.est_codigo = '20191179782'
AND pla.pla_codigo = '1160'
GROUP BY per.per_nombre, cal.cal_nombre, mat.mat_estado, mti.mti_nombre,  ppcp.promedio_ponderado, pacp.promedio_aritmetico, mat.mat_fecha_actualizacion,mat.mat_codigo
ORDER by per_nombre


select puntaje_calificado from puntaje_calificado_estudiante_activo pcea where pcea.est_codigo = '20171155993' 

select p.pro_codigo, u.uaa_codigo, ua.uaa_nombre as facultad, 
p.pro_registro_snies, u.uaa_nombre, s.sed_nombre, ca.pla_codigo, ca.pla_total_creditos, 
ca.creditos_aprobados from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join uaa ua on u.uaa_dependencia = ua.uaa_codigo 
inner join creditos_aprobados ca on e.est_codigo = ca.est_codigo 
inner join plan_estudiante pe on ca.pla_codigo = pe.pla_codigo 
where ca.est_codigo = '20152141476' and pe.ple_estado = 1 and pe.est_codigo = '20152141476'


--DIAS PARA EL HORARIO
SELECT dia.dia_codigo, dia.dia_nombre 
FROM matricula mat WITH(NOLOCK)
INNER JOIN estudiante est WITH(NOLOCK) ON est.est_codigo=mat.est_codigo
INNER JOIN matricula_curso mac ON (mat.mat_codigo = mac.mat_codigo AND mac.maa_codigo IN(1,2))
INNER JOIN curso cur WITH(NOLOCK) ON mac.cur_codigo = cur.cur_codigo
INNER JOIN espacio_ocupacion_total eso WITH(NOLOCK) ON cur.cur_codigo = eso.eso_actividad AND  eso.eso_subgrupo=mac.mac_subgrupo
INNER JOIN sede sed WITH(NOLOCK) ON cur.sed_codigo = sed.sed_codigo
INNER JOIN hora hra WITH(NOLOCK) ON eso.hra_codigo = hra.hra_codigo
INNER JOIN dia dia WITH(NOLOCK) ON eso.dia_codigo = dia.dia_codigo
INNER JOIN espacio esp WITH(NOLOCK) ON eso.esp_codigo = esp.esp_codigo
LEFT JOIN bloque blo WITH(NOLOCK) ON esp.blo_codigo = blo.blo_codigo
INNER JOIN plan_academico_asignatura paa WITH(NOLOCK) ON mac.paa_codigo = paa.paa_codigo
INNER JOIN asignatura asi WITH(NOLOCK) ON paa.asi_codigo = asi.asi_codigo
INNER JOIN calendario cal WITH(NOLOCK) ON mat.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH(NOLOCK) ON cal.per_codigo = per.per_codigo
INNER JOIN uaa_personal uap WITH(NOLOCK) ON eso.uap_codigo = uap.uap_codigo
INNER JOIN persona pe WITH(NOLOCK) ON uap.per_codigo = pe.per_codigo
AND mat.est_codigo = '20171157616' --Codigo del estudiante
AND per.per_nombre = '20171' ---Periodo actual
WHERE mac.maf_codigo =2
GROUP BY dia.dia_codigo, dia.dia_nombre 
ORDER BY dia.dia_codigo, dia.dia_nombre desc


----- HORARIO POR PERIODO
SELECT per.per_nombre, cur.asi_codigo, cur.cur_grupo, asi.asi_nombre, hra.hra_codigo, 
hra.hra_nombre, hra.hra_inicio, hra.hra_fin,
dia.dia_codigo, dia.dia_nombre, cur.cur_codigo, asi.asi_nombre_corto, esp.esp_nombre_corto, blo.blo_nombre,
paa.paa_semestre, sed.sed_nombre, pe.per_nombre AS per_nombre_profesor, pe.per_apellido AS per_apellido_profesor,
pe.per_email_interno AS per_email_profesor
FROM matricula mat WITH(NOLOCK)
INNER JOIN estudiante est WITH(NOLOCK) ON est.est_codigo=mat.est_codigo
INNER JOIN matricula_curso mac ON (mat.mat_codigo = mac.mat_codigo AND mac.maa_codigo IN(1,2))
INNER JOIN curso cur WITH(NOLOCK) ON mac.cur_codigo = cur.cur_codigo
INNER JOIN espacio_ocupacion_total eso WITH(NOLOCK) ON cur.cur_codigo = eso.eso_actividad AND  eso.eso_subgrupo=mac.mac_subgrupo
INNER JOIN sede sed WITH(NOLOCK) ON cur.sed_codigo = sed.sed_codigo
INNER JOIN hora hra WITH(NOLOCK) ON eso.hra_codigo = hra.hra_codigo
INNER JOIN dia dia WITH(NOLOCK) ON eso.dia_codigo = dia.dia_codigo
INNER JOIN espacio esp WITH(NOLOCK) ON eso.esp_codigo = esp.esp_codigo
LEFT JOIN bloque blo WITH(NOLOCK) ON esp.blo_codigo = blo.blo_codigo
INNER JOIN plan_academico_asignatura paa WITH(NOLOCK) ON mac.paa_codigo = paa.paa_codigo
INNER JOIN asignatura asi WITH(NOLOCK) ON paa.asi_codigo = asi.asi_codigo
INNER JOIN calendario cal WITH(NOLOCK) ON mat.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH(NOLOCK) ON cal.per_codigo = per.per_codigo
INNER JOIN uaa_personal uap WITH(NOLOCK) ON eso.uap_codigo = uap.uap_codigo
INNER JOIN persona pe WITH(NOLOCK) ON uap.per_codigo = pe.per_codigo
AND mat.est_codigo = '20191179782' --Codigo del estudiante
AND per.per_nombre = '20241' ---Periodo actual
WHERE mac.maf_codigo =2
GROUP BY cur.pla_codigo, cur.asi_codigo, cur.cur_grupo, mac.mac_subgrupo, paa.paa_codigo,
asi.asi_nombre, eso.eso_subgrupo, hra.hra_codigo, hra.hra_nombre, hra.hra_inicio, hra.hra_fin,
dia.dia_codigo, dia.dia_nombre, cur.cur_codigo, asi.asi_nombre_corto, esp.esp_nombre_corto, blo.blo_nombre,
paa.paa_semestre, sed.sed_nombre, per.per_nombre, cal.cal_nombre, pe.per_nombre, pe.per_apellido, pe.per_email_interno
ORDER BY dia.dia_codigo, hra.hra_codigo, asi.asi_nombre


---NOTAS PARCIALES

select * from cursoweb.curso_nota cn where cn.cun_estudiante = '20171157616' and cn.cun_curso = 140893;

select * from matricula_curso;

select * from curso c where c.cur_codigo = 140869;

select * from cursoweb.curso_evaluacion ce;


SELECT c.cur_codigo, pr.per_nombre as periodo, nt.paa_semestre, 
nt.paa_credito, nt.asi_nombre_corto, nt.asi_nombre, nt.mac_nota, 
p.per_codigo, p.per_nombre, p.per_apellido, p.per_email_interno,
ce.cue_tipo, ce.cue_porcentaje, ce.cue_nombre, cn.cun_nota, cn.cun_fallas 
FROM notas_total nt
inner join calendario cal on nt.cal_nombre = cal.cal_nombre  
inner join periodo pr on cal.per_codigo = pr.per_codigo 
inner join curso c on nt.cur_codigo = c.cur_codigo 
left join cursoweb.curso_nota cn on c.cur_codigo = cn.cun_curso and cn.cun_estudiante = '20171157616'
left join cursoweb.curso_evaluacion ce on cn.cun_evaluacion = ce.cue_codigo 
inner join uaa_personal up on c.uap_codigo = up.uap_codigo 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE est_codigo = '20171157616' 
AND nt.pla_codigo = '981' 
AND nt.maa_codigo IN(1,2) 
AND pr.per_nombre = '20172' 
ORDER BY nt.cal_nombre, nt.asi_nombre;

--CARGA ACADÉMICA


---Datos generales por codigo del curso

SELECT sed.sed_nombre, uaa.uaa_nombre, cal.cal_nombre, asi.asi_codigo, 
asi.asi_nombre_corto, asi.asi_nombre, cur.cur_codigo, cur.cur_grupo,  
cur.cur_observaciones, tp.tic_nombre, c.car_nombre  
FROM curso cur 
INNER JOIN asignatura asi ON cur.asi_codigo = asi.asi_codigo 
LEFT JOIN caracter c ON RTRIM (c.car_codigo) = RTRIM (asi.car_codigo)
INNER JOIN calendario cal ON  cur.cal_codigo = cal.cal_codigo 
INNER JOIN uaa uaa ON asi.uaa_codigo = uaa.uaa_codigo 
INNER JOIN sede sed ON cur.sed_codigo = sed.sed_codigo  
INNER JOIN tipo_curso tp ON cur.tic_codigo = tp.tic_codigo 
WHERE cur.cur_codigo = :cur_codigo  


--- Informacion del horario, hay que tener en cuenta que hay ocasiones en las que los cursos pueden tener varios subgrupos
--- y esos subgrupos pueden ser impartidos por docentes diferentes.


--HORARIOS DIAS
SELECT cur.cur_codigo, sed.sed_nombre, asi.asi_nombre, cur.cur_grupo, eso.eso_subgrupo, 
dia.dia_codigo, dia.dia_nombre, hra.hra_codigo, hra.hra_inicio, hra.hra_fin, blo.blo_nombre, 
esp.esp_nombre, esp.esp_nombre_corto 
FROM curso cur WITH(NOLOCK) 
inner join calendario ca on cur.cal_codigo = ca.cal_codigo 
inner join periodo p on ca.per_codigo = p.per_codigo
INNER JOIN sede sed WITH(NOLOCK) ON cur.sed_codigo = sed.sed_codigo 
INNER JOIN asignatura asi WITH(NOLOCK) ON cur.asi_codigo = asi.asi_codigo 
INNER JOIN espacio_ocupacion_total eso WITH(NOLOCK) ON cur.cur_codigo = eso.eso_actividad 
INNER JOIN espacio esp WITH(NOLOCK) ON esp.esp_codigo = eso.esp_codigo 
LEFT JOIN bloque blo WITH(NOLOCK) ON esp.blo_codigo = blo.blo_codigo 
INNER JOIN dia dia WITH(NOLOCK) ON eso.dia_codigo = dia.dia_codigo 
INNER JOIN hora hra WITH(NOLOCK) ON eso.hra_codigo = hra.hra_codigo 
INNER JOIN uaa_personal uap WITH(NOLOCK) ON eso.uap_codigo = uap.uap_codigo 
INNER JOIN vinculacion vin WITH(NOLOCK) ON uap.vin_codigo = vin.vin_codigo 
INNER JOIN persona per WITH(NOLOCK) ON uap.per_codigo = per.per_codigo 
where per.per_codigo = 83865 and p.per_nombre = '20241'
GROUP BY cur.cur_codigo, cur.pla_codigo, cur.cur_grupo, asi.asi_codigo, 
asi.asi_nombre,sed.sed_nombre,per.per_nombre,per.per_apellido,per.per_codigo,  
per.per_identificacion, per.per_email_interno, eso.eso_subgrupo,hra.hra_codigo, 
hra.hra_inicio, hra.hra_fin, dia.dia_codigo, dia.dia_nombre, blo.blo_nombre, 
esp.esp_codigo , esp.esp_nombre, esp.esp_nombre_corto, vin.vin_nombre 
ORDER BY eso.eso_subgrupo, dia.dia_codigo,hra.hra_codigo;

--DIAS
SELECT dia.dia_codigo, dia.dia_nombre   
FROM curso cur WITH(NOLOCK) 
inner join calendario ca on cur.cal_codigo = ca.cal_codigo 
inner join periodo p on ca.per_codigo = p.per_codigo
INNER JOIN sede sed WITH(NOLOCK) ON cur.sed_codigo = sed.sed_codigo 
INNER JOIN asignatura asi WITH(NOLOCK) ON cur.asi_codigo = asi.asi_codigo 
INNER JOIN espacio_ocupacion_total eso WITH(NOLOCK) ON cur.cur_codigo = eso.eso_actividad 
INNER JOIN espacio esp WITH(NOLOCK) ON esp.esp_codigo = eso.esp_codigo 
LEFT JOIN bloque blo WITH(NOLOCK) ON esp.blo_codigo = blo.blo_codigo 
INNER JOIN dia dia WITH(NOLOCK) ON eso.dia_codigo = dia.dia_codigo 
INNER JOIN hora hra WITH(NOLOCK) ON eso.hra_codigo = hra.hra_codigo 
INNER JOIN uaa_personal uap WITH(NOLOCK) ON eso.uap_codigo = uap.uap_codigo 
INNER JOIN vinculacion vin WITH(NOLOCK) ON uap.vin_codigo = vin.vin_codigo 
INNER JOIN persona per WITH(NOLOCK) ON uap.per_codigo = per.per_codigo 
where per.per_codigo = 83865 and p.per_nombre = '20241'
GROUP BY dia.dia_codigo, dia.dia_nombre  
ORDER BY dia.dia_codigo, dia.dia_nombre ;

select * from curso c
inner join calendario ca on c.cal_codigo = ca.cal_codigo 
inner join periodo p on ca.per_codigo = p.per_codigo 


---Estudiantes por curso, de la misma forma tener en cuenta los subgrupos de los cursos:

SELECT per.per_nombre, per.per_apellido, uaa.uaa_nombre, mac.mac_subgrupo, 
per.per_identificacion, est.est_codigo, per.per_email_interno  
FROM curso cur WITH(NOLOCK) 
INNER JOIN matricula_curso mac WITH(NOLOCK) ON cur.cur_codigo = mac.cur_codigo AND mac.maa_codigo IN(1,2) 
INNER JOIN matricula mat WITH(NOLOCK) ON mac.mat_codigo = mat.mat_codigo 
INNER JOIN estudiante est WITH(NOLOCK) ON mat.est_codigo = est.est_codigo 
INNER JOIN persona per WITH(NOLOCK) ON est.per_codigo = per.per_codigo 
INNER JOIN programa pro WITH(NOLOCK) ON est.pro_codigo = pro.pro_codigo 
INNER JOIN uaa uaa WITH(NOLOCK) ON pro.uaa_codigo = uaa.uaa_codigo 
WHERE cur.cur_codigo = :cur_codigo AND mac.maf_codigo not in (6,11) 
ORDER BY mac.mac_subgrupo,per.per_apellido, per.per_nombre 



--- La carga academica la hace Douglas y javier mediante un monton de querys y cosas locas
--- para los datos personal esta este query que tengo en un reporte de estadisticas y funciona,
--- seria adaptarlo a la carga por periodo academico:

SELECT cur_codigo, periodo, sed_nombre, asi_nombre, asi_nombre_corto, 
cur_grupo,eso_subgrupo, count(*) as horas, ded_codigo, 
uaa_dependencia, uaa_codigo, cur_semanas, (SELECT count(*) FROM curso cur WITH(NOLOCK) 
     INNER JOIN matricula_curso mac WITH(NOLOCK) ON cur.cur_codigo = mac.cur_codigo AND mac.maa_codigo IN(1,2) 
     INNER JOIN matricula mat WITH(NOLOCK) ON mac.mat_codigo = mat.mat_codigo 
     INNER JOIN estudiante est WITH(NOLOCK) ON mat.est_codigo = est.est_codigo 
     INNER JOIN persona per WITH(NOLOCK) ON est.per_codigo = per.per_codigo 
     INNER JOIN programa pro WITH(NOLOCK) ON est.pro_codigo = pro.pro_codigo 
     INNER JOIN uaa uaa WITH(NOLOCK) ON pro.uaa_codigo = uaa.uaa_codigo 
     WHERE cur.cur_codigo = dah.cur_codigo AND mac.maf_codigo not in (6,11)) as cantidad_estudiantes
from dedicacion_asignatura_historico dah
inner join sede s ON dah.sed_codigo=s.sed_codigo
where per_codigo = 83865 AND periodo = '20241'
group by periodo,sed_nombre, uaa_nombre_corto,asi_nombre_corto, cur_grupo,
eso_subgrupo,asi_nombre, vin_nombre, ded_codigo, ded_nombre, uaa_codigo,
uaa_dependencia,per_identificacion,uaa_nombre,cur_semanas, vin_codigo,cur_codigo
order by periodo,vin_codigo 


SELECT count(*) 
FROM curso cur WITH(NOLOCK) 
INNER JOIN matricula_curso mac WITH(NOLOCK) ON cur.cur_codigo = mac.cur_codigo AND mac.maa_codigo IN(1,2) 
INNER JOIN matricula mat WITH(NOLOCK) ON mac.mat_codigo = mat.mat_codigo 
INNER JOIN estudiante est WITH(NOLOCK) ON mat.est_codigo = est.est_codigo 
INNER JOIN persona per WITH(NOLOCK) ON est.per_codigo = per.per_codigo 
INNER JOIN programa pro WITH(NOLOCK) ON est.pro_codigo = pro.pro_codigo 
INNER JOIN uaa uaa WITH(NOLOCK) ON pro.uaa_codigo = uaa.uaa_codigo 
WHERE cur.cur_codigo = 182762 AND mac.maf_codigo not in (6,11); 

select * from asignatura a 
select * from curso

SELECT per.per_codigo, est.est_codigo, per.per_nombre, per.per_apellido, s.sed_nombre, asi.asi_nombre, cur.cur_grupo, per.per_email_interno 
FROM curso cur WITH(NOLOCK) 
INNER JOIN matricula_curso mac WITH(NOLOCK) ON cur.cur_codigo = mac.cur_codigo AND mac.maa_codigo IN(1,2) 
INNER JOIN matricula mat WITH(NOLOCK) ON mac.mat_codigo = mat.mat_codigo 
INNER JOIN estudiante est WITH(NOLOCK) ON mat.est_codigo = est.est_codigo 
INNER JOIN persona per WITH(NOLOCK) ON est.per_codigo = per.per_codigo 
INNER JOIN programa pro WITH(NOLOCK) ON est.pro_codigo = pro.pro_codigo 
INNER JOIN sede s on pro.sed_codigo = s.sed_codigo
INNER JOIN uaa uaa WITH(NOLOCK) ON pro.uaa_codigo = uaa.uaa_codigo 
INNER JOIN asignatura asi on cur.asi_codigo = asi.asi_codigo
WHERE cur.cur_codigo = 182762 AND mac.maf_codigo not in (6,11) 
ORDER BY per.per_apellido, per.per_nombre 

select * from nivel_academico na 

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.nia_codigo = 13


select ut.tus_codigo, ut.tus_nombre, nat.nat_codigo from carnetizacion.usuario_carnet_digital ucd 
inner join uaa u on ucd.usg_uaa = u.uaa_codigo
left join programa p on u.uaa_codigo = p.uaa_codigo 
left join nivel_academico na on p.nia_codigo = na.nia_codigo 
left join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 5244 
group by ut.tus_codigo, ut.tus_nombre, nat.nat_codigo

select * from grupo g 

select ut.tus_codigo, ut.tus_nombre from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 108797 group by ut.tus_codigo, ut.tus_nombre;

select e.est_codigo, u.uaa_nombre from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
where nat.nat_codigo = 1


