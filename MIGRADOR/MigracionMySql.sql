-------------------------------------------------------------------------
-------------------------------------------------------------------------
--------------------- QUERYS MIGRACION MYSQL LOCAL ----------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
 
--CREATE VIEW [acreditacion].[programa_registrado_snies] AS
select p.pro_codigo, pro_registro_snies, u.uaa_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS pro_nivel_academico, 
s.sed_nombre, m.mod_nombre, CASE WHEN pro_registro_snies NOT like '0%' or pro_registro_snies != null THEN 'ACTIVO' ELSE 'INACTIVO' END AS pro_estado, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as pro_facultad, na.nia_nombre as pro_nivel_formacion, re.res_numero, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS pro_oferta, p.pro_creacion_snies, p.pro_fecha_creacion from programa p
INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
INNER JOIN sede s on s.sed_codigo = u.sed_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
LEFT JOIN resolucion re on re.res_codigo = p.res_codigo

	
select * from acreditacion.programa_registrado_snies prs order by prs.pro_codigo asc

select * from programa p order by p.pro_codigo asc
	
select * from web_parametro wp where wp.wep_nombre = 'ACREDITACION_SINCRONIZADOR_ACTIVO'
select * from web_parametro wp where wp.wep_nombre = 'ACREDITACION_SINCRONIZADOR_MIGRACION'

-- CREAR WEB PARAMETRO ACREDITACION SINCRONIZADOR LOCAL
INSERT INTO academia3000_john.dbo.web_parametro (wep_nombre, wep_valor, wep_descripcion, wep_estado) VALUES(N'ACREDITACION_SINCRONIZADOR_ACTIVO', N'0', N'PARA PODER ACTIVAR O DESACTIVAR EL SINCRONIZADOR ENTRE ACADEMIA3000 Y ACREDITACION MYSQL', 1);

-- CREAR WEB PARAMETRO ACREDITACION MIGRACION LOCAL
INSERT INTO academia3000_john.dbo.web_parametro (wep_nombre, wep_valor, wep_descripcion, wep_estado) VALUES(N'ACREDITACION_SINCRONIZADOR_MIGRACION', N'1', N'PARA PODER ACTIVAR LA MIGRACION COMPLETA ENTRE ACADEMIA3000 Y ACREDITACION MYSQL', 1);


-- VISTA MATRICULADOS CON LOS 14 CRITERIOS
CREATE VIEW [acreditacion].[matriculados_acreditacion] AS
SELECT mat.mat_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, 
nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion, u2.uaa_nombre AS facultad, 
pro.pro_registro_snies, u1.uaa_nombre, est.est_codigo, cal.cal_nombre, per.per_nombre, per.per_apellido, 
per.per_estrato, per.per_genero, per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, dep1.dep_nombre AS dep_nacimiento, moi.moi_nombre,
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre,
(CASE WHEN mat.mat_tipo =2 THEN 'Continuidad' ELSE (SELECT CONVERT(varchar(2),
(CASE WHEN ((CASE WHEN (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo =mat.mat_codigo) 
IS NULL THEN (SELECT TOP 1(semestre) FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo < mat.mat_codigo
ORDER BY mat_codigo  DESC) ELSE (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo AND mat_codigo =mat.mat_codigo) END)) IS NULL THEN '1' 
ELSE ((CASE WHEN (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo =mat.mat_codigo) 
IS NULL THEN (SELECT TOP 1(semestre) FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo < mat.mat_codigo
ORDER BY mat_codigo  DESC) ELSE (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo AND mat_codigo =mat.mat_codigo) END)) END)
)) END) AS semestre, mti.mti_nombre FROM matricula mat WITH (NOLOCK)  
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo  
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON est.est_codigo = ple.est_codigo 
LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo  
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo  
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo  
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo  
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo 
LEFT JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN matricula_tipo mti WITH (NOLOCK) ON mat.mat_tipo = mti.mti_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo   
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A' AND pe.per_nombre = '20221' and pro.pro_codigo = 375

SELECT * FROM acreditacion.matriculados_acreditacion ma 

select * from estudiante_semestre_matricula
CREATE VIEW estudiante_semestre_matricula AS (
SELECT mat.est_codigo, mat.cal_codigo,mac.mat_codigo, MIN(paa.paa_semestre) as semestre
FROM matricula_curso mac
INNER JOIN matricula mat ON mac.mat_codigo =mat.mat_codigo 
INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo
WHERE mac.mat_codigo in (SELECT mat_codigo  FROM matricula 
where est_codigo in (SELECT est_codigo FROM estudiante) and mat_estado = 'A') 
AND mac.maa_codigo IN(1,2)
GROUP BY mat.est_codigo, mat.cal_codigo,mac.mat_codigo
)

select * FROM  estudiante e 

select * from persona p 

select * from modulo m
select * from modalidad_ingreso mi 

select * from uaa u
select * from programa p 

select * FROM programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_registro_icfes is not null

select * from carnetizacion.puesto_vigilancia pv 

(CASE WHEN mat.mat_tipo =2 THEN 'Continuidad' ELSE (SELECT CONVERT(varchar(2),
(CASE WHEN
((CASE WHEN (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo =mat.mat_codigo) 
IS NULL THEN (SELECT TOP 1(semestre) FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo < mat.mat_codigo
ORDER BY mat_codigo  DESC) ELSE (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo AND mat_codigo =mat.mat_codigo) END)) IS NULL THEN '1' 
ELSE ((CASE WHEN (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo =mat.mat_codigo) 
IS NULL THEN (SELECT TOP 1(semestre) FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo  AND mat_codigo < mat.mat_codigo
ORDER BY mat_codigo  DESC) ELSE (SELECT semestre FROM estudiante_semestre_matricula 
WHERE est_codigo =mat.est_codigo AND mat_codigo =mat.mat_codigo) END)) END)
)) END) AS semestre 

SELECT * FROM municipio m WHERE m.mun_nombre like '%RIVERA%'

select * from programa p where p.pro_titulo_otorgado like 

select COUNT(*) from acreditacion.matriculados_acreditacion ma 
select * from acreditacion.matriculados_acreditacion ma where ma.mat_codigo = 723357
select * from acreditacion.matriculados_acreditacion ma where ma.anio = 2021 and ma.semestre = 1 and ma.periodo = '20211' and ma.sed_nombre = 'NEIVA'





-- VISTA INSCRITOS CON LOS 14 CRITERIOS
CREATE VIEW [acreditacion].[inscritos_acreditacion] AS
SELECT ins.ins_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion,  
u2.uaa_nombre AS facultad, pro.pro_registro_snies, u.uaa_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,  
per.per_fecha_nacimiento, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, tii.tii_nombre,  
per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, 
dep1.dep_nombre AS dep_nacimiento, moi.moi_nombre ,ies.ies_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre 
FROM inscripcion ins WITH (NOLOCK)   
INNER JOIN persona per WITH (NOLOCK) ON ins.per_codigo = per.per_codigo  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN modalidad_ingreso moi WITH (NOLOCK) ON ins.moi_codigo = moi.moi_codigo 
LEFT JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo  
LEFT JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo 
LEFT JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
LEFT JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo  
LEFT JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo  
LEFT JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
LEFT JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
LEFT JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
LEFT JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo  
LEFT JOIN estado_civil esc WITH (NOLOCK) ON per.per_estado_civil = esc.esc_codigo 
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo 
LEFT JOIN inscripcion_estado ies WITH (NOLOCK) ON ins.ies_codigo = ies.ies_codigo 
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE pe.per_nombre = '20211' and mun1.mun_codigo = 917

select COUNT(*) from acreditacion.inscritos_acreditacion ia
select * from acreditacion.inscritos_acreditacion ia where ia.ins_codigo = 25526


-- VISTA ADMITIDOS 
CREATE VIEW [acreditacion].[admitidos_acreditacion] AS
SELECT ins.ins_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion,  
u2.uaa_nombre AS facultad, pro.pro_registro_snies, u.uaa_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,  
per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, dep1.dep_nombre AS dep_nacimiento, 
moi.moi_nombre, adr.adr_puesto, adr.adr_puntaje, adt.adt_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre 
FROM inscripcion ins WITH (NOLOCK)  
INNER JOIN persona per WITH (NOLOCK) ON ins.per_codigo = per.per_codigo 
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo  
LEFT JOIN oferta_academica ofa WITH(NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo  
LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo  
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo  
LEFT JOIN programa pro WITH(NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
LEFT JOIN uaa u WITH(NOLOCK) ON pro.uaa_codigo = u.uaa_codigo  
LEFT JOIN uaa u2 WITH(NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo  
LEFT JOIN nivel_academico nia WITH(NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
LEFT JOIN nivel_academico_tipo nat WITH(NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
LEFT JOIN sede sed WITH(NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
LEFT JOIN calendario cal WITH(NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
LEFT JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo 
LEFT JOIN estado_civil esc WITH (NOLOCK) ON per.per_estado_civil = esc.esc_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo 
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
AND (ofa.ofa_publicar_admitidos IS NOT NULL OR ofa.ofa_publicar_admitidos <> 0) 
AND adt.adt_admitido IS NOT NULL AND adt.adt_admitido like 'SI%'
WHERE pe.per_nombre = '20211' and mun1.mun_codigo = 917


select COUNT(*) from acreditacion.admitidos_acreditacion aa WHERE 
select * from acreditacion.admitidos_acreditacion aa


--- QUERY GRADUADOS

CREATE VIEW [acreditacion].[graduados_acreditacion] AS
SELECT gra.gra_codigo, YEAR(gra.gra_fecha) as anio, (CASE WHEN MONTH(gra.gra_fecha) <= 6 THEN CONVERT(VARCHAR,YEAR(gra.gra_fecha))+'1'   
ELSE CONVERT(VARCHAR,YEAR(gra.gra_fecha))+'2' END) AS periodo, u2.uaa_nombre AS facultad, pro.pro_codigo, pro.pro_registro_snies, u.uaa_nombre,
nat.nat_nombre, nia.nia_nombre, m.mod_nombre, sed.sed_nombre, tii.tii_nombre, per.per_identificacion, per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
per.per_nombre, per.per_apellido, est.est_codigo, gra.gra_fecha, pcgcp.puntaje_calificado, per.per_genero, per.per_estrato, 
p.pai_nombre as pai_nacimiento, dep1.dep_nombre AS dep_nacimiento, mun1.mun_nombre AS mun_nacimiento, mun2.mun_nombre AS mun_residencia, 
SUBSTRING(est.est_codigo, 1, 5) as cohorte, gra.gra_acta, gra.gra_folio, gra.pla_codigo,    
(CASE WHEN ine.ine_nombre IS NULL THEN col.col_nombre ELSE ine.ine_nombre END) AS ine_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre 
FROM graduado gra  
INNER JOIN estudiante est ON gra.est_codigo = est.est_codigo  
LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo   
INNER JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo   
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo   
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
INNER JOIN modalidad m WITH (NOLOCK) ON pro.mod_codigo = m.mod_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo
LEFT JOIN pais p WITH (NOLOCK) ON dep1.pai_codigo = p.pai_codigo 
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo  
LEFT JOIN puntaje_calificado_graduado_con_perdidas pcgcp WITH (NOLOCK) ON est.est_codigo = pcgcp.est_codigo  
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE (gra.gra_fecha BETWEEN '18/08/2021' AND '28/08/2022')  
--AND pro.pro_codigo IN (SELECT * FROM dbo.Split(:pro_codigo,','))  
--where YEAR(gra.gra_fecha) >= 2015
ORDER BY sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, u2.uaa_nombre, u.uaa_nombre, gra.gra_fecha

select count(*) from acreditacion.graduados_acreditacion ga 



--- QUERY EGRESADOS

WITH resultado(ano, periodo, sed_nombre, nat_nombre, nia_nombre, dependencia_codigo,  
dependencia, pro_codigo, pro_registro_snies,uaa_nombre, est_codigo, ese_nombre, mat_estado, cal_nombre,  
per_nombre, per_apellido, per_estrato, per_genero, edad, tii_nombre, per_identificacion,  
per_email_interno, pla_codigo, pla_total_creditos, creditos_aprobados, 
mti_nombre) AS (  
SELECT pe.per_a�o AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,   
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo,  pro.pro_registro_snies, 
u1.uaa_nombre, est.est_codigo, ese.ese_nombre, mat.mat_estado, cal.cal_nombre, 
per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,  
tii.tii_nombre, per.per_identificacion, per.per_email_interno, pla.pla_codigo, pla.pla_total_creditos,  
(SELECT SUM(creditos_aprobados) FROM creditos_aprobados_por_calendario  
WHERE est_codigo = est.est_codigo AND mat_codigo <= mat.mat_codigo AND pla_codigo = pla.pla_codigo ) AS creditos_aprobados, 
-- (CASE WHEN ine.ine_nombre IS NULL THEN col.col_nombre ELSE ine.ine_nombre END) AS ine_nombre, 
-- (CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre, 
mti.mti_nombre 
FROM estudiante est WITH (NOLOCK)   
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
-- LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
-- LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
-- LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE pe.per_nombre BETWEEN :inicio AND :fin AND ple.ple_estado = 1 AND mat.mat_estado = 'A'  
AND pro.pro_codigo IN(SELECT * FROM dbo.Split(:pro_codigo,','))  
) SELECT * FROM resultado WHERE creditos_aprobados >= pla_total_creditos  
AND est_codigo NOT IN (SELECT gra.est_codigo FROM graduado gra WITH (NOLOCK)   
WHERE gra.est_codigo = est_codigo AND YEAR(gra.gra_fecha) <= ano  
AND MONTH(gra.gra_fecha) <=  CASE SUBSTRING(periodo,LEN(periodo),1) WHEN '1' THEN '6' ELSE '12' END)  
ORDER BY ano,periodo,sed_nombre, nat_nombre, nia_nombre, dependencia,uaa_nombre 





------------------------------------------------------------------------------
------------------------------------------------------------------------------
--------------------- QUERYS MIGRACION MYSQL PRODUCCI�N ----------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- CREAR WEB PARAMETRO ACREDITACION SINCRONIZADOR PRODUCCI�N 
INSERT INTO academia3000.dbo.web_parametro (wep_nombre, wep_valor, wep_descripcion, wep_estado) VALUES(N'ACREDITACION_SINCRONIZADOR_ACTIVO', N'0', N'PARA PODER ACTIVAR O DESACTIVAR EL SINCRONIZADOR ENTRE ACADEMIA3000 Y ACREDITACION MYSQL', 1);

-- CREAR WEB PARAMETRO ACREDITACION MIGRACION PRODUCCI�N 
INSERT INTO academia3000.dbo.web_parametro (wep_nombre, wep_valor, wep_descripcion, wep_estado) VALUES(N'ACREDITACION_SINCRONIZADOR_MIGRACION', N'1', N'PARA PODER ACTIVAR LA MIGRACION COMPLETA ENTRE ACADEMIA3000 Y ACREDITACION MYSQL', 1);

-- VISTA PROGRAMAS PARA ACREDITACION 
CREATE VIEW [acreditacion].[programa_registrado_snies] AS
select p.pro_codigo, pro_registro_snies, u.uaa_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS pro_nivel_academico, 
s.sed_nombre, m.mod_nombre, CASE WHEN pro_registro_snies NOT like '0%' or pro_registro_snies != null THEN 'ACTIVO' ELSE 'INACTIVO' END AS pro_estado, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as pro_facultad, na.nia_nombre as pro_nivel_formacion, re.res_numero, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS pro_oferta, p.pro_creacion_snies, p.pro_fecha_creacion from programa p
INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
INNER JOIN sede s on s.sed_codigo = u.sed_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
LEFT JOIN resolucion re on re.res_codigo = p.res_codigo


-- VISTA INSCRITOS PARA ACREDITACION
CREATE VIEW [acreditacion].[inscritos_acreditacion] AS
SELECT ins.ins_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion,  
u2.uaa_nombre AS facultad, pro.pro_registro_snies, u.uaa_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,  
per.per_fecha_nacimiento, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, dep1.dep_nombre AS dep_nacimiento, moi.moi_nombre ,ies.ies_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre 
FROM inscripcion ins WITH (NOLOCK)   
INNER JOIN persona per WITH (NOLOCK) ON ins.per_codigo = per.per_codigo  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN modalidad_ingreso moi WITH (NOLOCK) ON ins.moi_codigo = moi.moi_codigo 
LEFT JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo  
LEFT JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo 
LEFT JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
LEFT JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo  
LEFT JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo  
LEFT JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
LEFT JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
LEFT JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
LEFT JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN inscripcion_estado ies WITH (NOLOCK) ON ins.ies_codigo = ies.ies_codigo 
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
where pe.per_nombre = '20221' and pro.pro_codigo = 375

--171726
-- VISTA ADMITIDOS PARA ACREDITACION
CREATE VIEW [acreditacion].[admitidos_acreditacion] AS
SELECT ins.ins_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion,  
u2.uaa_nombre AS facultad, pro.pro_registro_snies, u.uaa_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,  
per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, dep1.dep_nombre AS dep_nacimiento, 
moi.moi_nombre, adr.adr_puesto, adr.adr_puntaje, adt.adt_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre 
FROM inscripcion ins WITH (NOLOCK)  
INNER JOIN persona per WITH (NOLOCK) ON ins.per_codigo = per.per_codigo 
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo  
LEFT JOIN oferta_academica ofa WITH(NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo  
LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo  
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo  
LEFT JOIN programa pro WITH(NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
LEFT JOIN uaa u WITH(NOLOCK) ON pro.uaa_codigo = u.uaa_codigo  
LEFT JOIN uaa u2 WITH(NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo  
LEFT JOIN nivel_academico nia WITH(NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
LEFT JOIN nivel_academico_tipo nat WITH(NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
LEFT JOIN sede sed WITH(NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
LEFT JOIN calendario cal WITH(NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
LEFT JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo 
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
AND (ofa.ofa_publicar_admitidos IS NOT NULL OR ofa.ofa_publicar_admitidos <> 0) 
AND adt.adt_admitido IS NOT NULL AND adt.adt_admitido like 'SI%'
where pe.per_nombre = '20221' and pro.pro_codigo = 375

-- VISTA MATRICULADOS PARA ACREDITACION
CREATE VIEW [acreditacion].[matriculados_acreditacion] AS
SELECT mat.mat_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico,
nia.nia_nombre as nivel_formacion, u2.uaa_nombre AS facultad, pro.pro_registro_snies, u1.uaa_nombre, est.est_codigo, 
cal.cal_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero, per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, dep1.dep_nombre AS dep_nacimiento, moi.moi_nombre,
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre,
(SELECT MIN(paa.paa_semestre) FROM matricula_curso mac 
INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo 
WHERE mac.mat_codigo = mat.mat_codigo AND mac.maa_codigo IN(1,2)) AS semestre, mti.mti_nombre FROM matricula mat WITH (NOLOCK)  
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo  
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON est.est_codigo = ple.est_codigo 
LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo  
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo  
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo  
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo  
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo 
LEFT JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN matricula_tipo mti WITH (NOLOCK) ON mat.mat_tipo = mti.mti_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo   
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A' and pe.per_nombre = '20011' and pro.pro_codigo = 228
--- 1|228    2|405    3|576
select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where u.uaa_nombre like '%ARTISTICA'

--VISTA GRADUADOS PARA ACREDITACION
CREATE VIEW [acreditacion].[graduados_acreditacion] AS
SELECT gra.gra_codigo, YEAR(gra.gra_fecha) as anio, (CASE WHEN MONTH(gra.gra_fecha) <= 6 THEN CONVERT(VARCHAR,YEAR(gra.gra_fecha))+'1'   
ELSE CONVERT(VARCHAR,YEAR(gra.gra_fecha))+'2' END) AS periodo, u2.uaa_nombre AS facultad, pro.pro_codigo, pro.pro_registro_snies, u.uaa_nombre,
nat.nat_nombre, nia.nia_nombre, m.mod_nombre, sed.sed_nombre, tii.tii_nombre, per.per_identificacion, per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
per.per_nombre, per.per_apellido, est.est_codigo, gra.gra_fecha, pcgcp.puntaje_calificado, per.per_genero, per.per_estrato, 
p.pai_nombre as pai_nacimiento, dep1.dep_nombre AS dep_nacimiento, mun1.mun_nombre AS mun_nacimiento, mun2.mun_nombre AS mun_residencia, 
SUBSTRING(est.est_codigo, 1, 5) as cohorte, gra.gra_acta, gra.gra_folio, gra.pla_codigo,    
(CASE WHEN ine.ine_nombre IS NULL THEN col.col_nombre ELSE ine.ine_nombre END) AS ine_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre 
FROM graduado gra  
INNER JOIN estudiante est ON gra.est_codigo = est.est_codigo  
LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo   
INNER JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo   
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo   
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
INNER JOIN modalidad m WITH (NOLOCK) ON pro.mod_codigo = m.mod_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo
LEFT JOIN pais p WITH (NOLOCK) ON dep1.pai_codigo = p.pai_codigo 
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo  
LEFT JOIN puntaje_calificado_graduado_con_perdidas pcgcp WITH (NOLOCK) ON est.est_codigo = pcgcp.est_codigo  
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 

SELECT count(*) from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
where e.per_codigo is null




--VISTA OFERTA ACADEMICA PARA ACREDITACION
CREATE VIEW [acreditacion].[oferta_academica_acreditacion] AS        
SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) ofa_codigo, per.per_año AS anio, per.per_nombre AS periodo, sed_nombre,
nat_nombre as nivel_academico, nia_nombre as nivel_formacion, m.mod_nombre as modalidad, 
u2.uaa_codigo AS facultad_codigo, u2.uaa_nombre AS facultad, pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in   
(SELECT TOP 1 pla_codigo  from plan_academico pa  
where pa.pro_codigo=pro.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)  
ORDER BY paa_semestre DESC) as semestres 
FROM oferta_academica ofa WITH (NOLOCK)  
INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
INNER JOIN modalidad m WITH (NOLOCK) ON pro.mod_codigo = m.mod_codigo 
INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo  
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo  



WHERE per.per_a�o >= 2015
ORDER BY ofa_codigo, periodo,sed_nombre,nat_nombre,nia_nombre,facultad,u1.uaa_nombre 


select count(*) from acreditacion.oferta_academica_acreditacion 





























SELECT mat.mat_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico,
nia.nia_nombre as nivel_formacion, u2.uaa_nombre AS facultad, pro.pro_registro_snies, u1.uaa_nombre, est.est_codigo, 
cal.cal_nombre, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero, per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento, dep1.dep_nombre AS dep_nacimiento, moi.moi_nombre,
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre,
(SELECT MIN(paa.paa_semestre) FROM matricula_curso mac 
INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo 
WHERE mac.mat_codigo = mat.mat_codigo AND mac.maa_codigo IN(1,2)) AS semestre, mti.mti_nombre FROM matricula mat WITH (NOLOCK)  
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo  
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON est.est_codigo = ple.est_codigo 
LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo  
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo  
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo  
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo  
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo 
LEFT JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN matricula_tipo mti WITH (NOLOCK) ON mat.mat_tipo = mti.mti_codigo  
LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo   
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A' and pro.pro_codigo = 228


--- 1|228    2|405    3|516
select p.pro_codigo, u.uaa_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo in (228,405,516)

select * from calendario
select * from periodo

select p.per_nombre, u.uaa_nombre, e.est_codigo, pacp.promedio_aritmetico from promedio_aritmetico_con_perdidas pacp 
inner join estudiante e on pacp.est_codigo = e.est_codigo 
inner join programa p2 on e.pro_codigo = p2.pro_codigo 
inner join uaa u on p2.uaa_codigo = u.uaa_codigo 
inner join calendario c on pacp.cal_codigo = c.cal_codigo 
inner join periodo p on c.per_codigo = p.per_codigo 
where e.pro_codigo = 405 and p.per_a�o >= 2017 

--VISTA DOCENTES VINCULADOS
CREATE VIEW [acreditacion].[docentes_vinculacion_activa] AS   
SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) dva_codigo, p.per_nombre, p.per_apellido, p.per_email_interno,uaa.uaa_nombre
FROM persona p
INNER JOIN usuario_docentes ud ON p.per_codigo =ud.up
INNER JOIN uaa_personal up ON up.per_codigo =p.per_codigo
INNER JOIN uaa uaa on up.uaa_codigo = uaa.uaa_codigo
INNER JOIN vinculacion v ON up.vin_codigo = v.vin_codigo
WHERE ud.state = 1 AND up.uap_cargo IN (3) AND p.per_apellido  NOT LIKE 'NN CATEDRA%'
AND (GETDATE() BETWEEN up.uap_fecha_inicio AND up.uap_fecha_fin OR up.uap_fecha_fin IS NULL)
GROUP BY p.per_nombre, p.per_apellido, p.per_email_interno,uaa.uaa_nombre


SELECT * from acreditacion.docentes_vinculacion_activa dva 