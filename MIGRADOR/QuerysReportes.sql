----------------------------------------------------------------------
----------------------------------------------------------------------
---------------------QUERYS REPORTES IMPORTANTES----------------------
----------------------------------------------------------------------
----------------------------------------------------------------------


-- INSCRITOS POR GENERO DESDE PERIODO INICIO Y FIN
with resultado(periodo, calendario, sed_nombre, sed_codigo, nat_nombre, nia_nombre, facultad, dependencia,  pro_codigo, 
pro_registro_snies, per_genero, total, anuladas, incompletas)AS  
(SELECT P.per_nombre as periodo, c.cal_nombre as calendario,sed_nombre,s.sed_codigo,nat.nat_nombre,nia.nia_nombre,  
u2.uaa_nombre as facultad,u.uaa_nombre as dependencia,pr.pro_codigo,pr.pro_registro_snies,  
(CASE WHEN per.per_genero IS NULL THEN 'N' WHEN LTRIM(RTRIM(per.per_genero)) = '' THEN 'N' ELSE per.per_genero END) AS per_genero, 
COUNT (*) AS total,   
(SELECT count(*) as total   
FROM inscripcion i  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON i.ins_codigo = inp.ins_codigo
LEFT JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo
LEFT JOIN calendario c WITH (NOLOCK) ON ofa.cal_codigo = c.cal_codigo
LEFT JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo 
LEFT JOIN sede s WITH (NOLOCK) ON pro.sed_codigo = s.sed_codigo 
INNER JOIN uaa u ON pro.uaa_codigo=u.uaa_codigo  
INNER JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo  
INNER JOIN persona per ON i.per_codigo=per.per_codigo  
INNER JOIN periodo p ON c.per_codigo = p.per_codigo    
LEFT JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo   
LEFT JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo   
WHERE p.per_nombre in ('20221')    
AND i.ies_codigo not in (5,12)  
AND pro.pro_codigo = pr.pro_codigo  
) as anuladas,  
(SELECT count(*) as total  
FROM inscripcion i  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON i.ins_codigo = inp.ins_codigo
LEFT JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo
LEFT JOIN calendario c WITH (NOLOCK) ON ofa.cal_codigo = c.cal_codigo
LEFT JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo 
LEFT JOIN sede s WITH (NOLOCK) ON pro.sed_codigo = s.sed_codigo 
INNER JOIN uaa u ON pro.uaa_codigo=u.uaa_codigo  
INNER JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo  
INNER JOIN persona per ON i.per_codigo=per.per_codigo  
INNER JOIN periodo p ON c.per_codigo = p.per_codigo  
LEFT JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo   
LEFT JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo   
WHERE p.per_nombre in ('20221')    
and pro.pro_codigo = pr.pro_codigo  
AND i.ies_codigo in (12)) as incompletas  
FROM inscripcion i  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON i.ins_codigo = inp.ins_codigo
LEFT JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo
LEFT JOIN calendario c WITH (NOLOCK) ON ofa.cal_codigo = c.cal_codigo
LEFT JOIN programa pr WITH (NOLOCK) ON ofa.pro_codigo = pr.pro_codigo 
LEFT JOIN sede s WITH (NOLOCK) ON pr.sed_codigo = s.sed_codigo 
INNER JOIN uaa u ON pr.uaa_codigo=u.uaa_codigo  
INNER JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo  
INNER JOIN persona per ON i.per_codigo=per.per_codigo  
INNER JOIN periodo p ON c.per_codigo = p.per_codigo  
LEFT JOIN nivel_academico nia WITH (NOLOCK) ON pr.nia_codigo = nia.nia_codigo   
LEFT JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo   
WHERE (p.per_nombre BETWEEN '20221' AND '20221') 
GROUP BY p.per_nombre, c.cal_nombre,s.sed_codigo,nat.nat_nombre,nia.nia_nombre,u2.uaa_nombre,u.uaa_nombre,sed_nombre,pr.pro_codigo,pr.pro_registro_snies,per_genero)  
SELECT ROW_NUMBER() OVER(ORDER BY sed_codigo,nia_nombre,facultad,dependencia) as num,* FROM resultado PIVOT(SUM(total) FOR per_genero IN ([F], [M],[N])) AS pvt  
ORDER BY periodo,sed_codigo,nat_nombre,nia_nombre,facultad,dependencia 



with resultado(est_codigo) as (
SELECT DISTINCT (est_codigo)
FROM notas_total nt
where esc_nombre like 'Aprobado' and mac_nota is null
and cal_nombre like '20201A')
SELECT sed.sed_nombre,u1.uaa_nombre_corto,resultado.est_codigo,per.per_nombre,per.per_apellido,
(SELECT ppcp.promedio_ponderado
FROM matricula mat WITH(NOLOCK)  
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON mat.est_codigo = ple.est_codigo
INNER JOIN plan_academico pla WITH(NOLOCK) ON ple.pla_codigo = pla.pla_codigo  
INNER JOIN calendario cal WITH(NOLOCK) ON mat.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH(NOLOCK) ON cal.per_codigo = per.per_codigo
LEFT JOIN matricula_tipo mti WITH(NOLOCK) ON mat.mat_tipo = mti.mti_codigo
LEFT JOIN promedio_ponderado_con_perdidas ppcp WITH(NOLOCK) ON (mat.est_codigo = ppcp.est_codigo AND mat.mat_codigo = ppcp.mat_codigo)
LEFT JOIN promedio_aritmetico_con_perdidas pacp WITH(NOLOCK) ON (mat.est_codigo = pacp.est_codigo AND mat.mat_codigo = pacp.mat_codigo)
WHERE mat.est_codigo = resultado.est_codigo  AND pla.pla_codigo = (SELECT pla.pla_codigo
FROM persona per WITH(NOLOCK)  
INNER JOIN estudiante est WITH(NOLOCK) ON per.per_codigo = est.per_codigo  
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON (est.est_codigo = ple.est_codigo AND ple.ple_estado = 1)
INNER JOIN plan_academico pla WITH(NOLOCK) ON ple.pla_codigo = pla.pla_codigo  
WHERE est.est_codigo = mat.est_codigo) AND per.per_nombre like '20192') as promedio_ponderado,
(SELECT round( (SUM (mc.mac_definitiva*paa.paa_credito)/ NULLIF(SUM(paa.paa_credito),0) ) , 2 ) AS  puntaje_calificado
FROM matricula_curso mc
INNER JOIN matricula mat WITH(NOLOCK) ON(mat.mat_codigo=mc.mat_codigo)
INNER JOIN plan_academico_asignatura paa WITH(NOLOCK) ON(paa.paa_codigo=mc.paa_codigo)
INNER JOIN plan_academico pla WITH(NOLOCK) ON (pla.pla_codigo=paa.pla_codigo)
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON (ple.pla_codigo=pla.pla_codigo and ple.ple_estado=1 )
INNER JOIN asignatura asi WITH(NOLOCK) ON(asi.asi_codigo=paa.asi_codigo)
INNER JOIN calendario c WITH(NOLOCK) on (mat.cal_codigo=c.cal_codigo)
INNER JOIN periodo p WITH(NOLOCK) on (c.per_codigo=p.per_codigo)
WHERE mc.maa_codigo IN (1,2) --que sea curso matriculado o adicionado
--AND mat.est_codigo NOT IN (SELECT est_codigo FROM graduado) --que sea estudiante, no graduado
AND mat.est_codigo=ple.est_codigo --confirma que es el plan activo
AND paa.paa_plan_academico = 0--confirma que las asignaturas que tiene que cursar sean las del plan de estudio
AND mc.mac_definitiva is not null--que no sean nulas porque todavia las esta cursando
AND ( --y que se cumpla una de las dos condiciones de aqui abajo
(paa.paa_multi_asignatura='s' and mc.cur_codigo is not null)--que sea multiasignatura pero tenga curso
or paa.paa_multi_asignatura='n' -- o que no sea multiasigntura (curso normalito)
)
AND p.per_a�o <=2019 and mat.est_codigo =resultado.est_codigo
--GROUP BY mat.est_codigo
) as puntaje_calificado
FROM resultado
INNER JOIN estudiante est WITH(NOLOCK) on resultado.est_codigo =est.est_codigo
INNER JOIN persona per WITH(NOLOCK) ON per.per_codigo = est.per_codigo
INNER JOIN programa pro WITH(NOLOCK) ON est.pro_codigo = pro.pro_codigo
INNER JOIN uaa u1 WITH(NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo
INNER JOIN sede sed WITH(NOLOCK) ON pro.sed_codigo = sed.sed_codigo 
ORDER BY sed.sed_nombre, u1.uaa_nombre_corto,resultado.est_codigo





DECLARE @tempotalb TABLE (uap_codigo int,per_codigo int,tii_codigo_hecaa varchar(3),tid_codigo int,tid_nombre varchar(50),
per_identificacion varchar(20),nac_mun_codigo int,exp_mun_codigo int,vin_codigo int,vin_nombre varchar(100),
ded_codigo int,ded_nombre varchar(100),ded_codigo_hecaa int,genero varchar(2),per_nombre varchar(100),per_apellido varchar(100),
per_email_interno varchar(100),per_email varchar(100),  per_telefono_fijo varchar(100),per_telefono_movil varchar(100),
fechaNac  date, uap_fecha_inicio  date ,nia_codigo int,nia_nombre varchar(100),nia_codigo_ned_hecaa int,pha_codigo int,
pha_convalidado int, pha_titulo varchar(500), pha_fecha_titulo date,ine_codigo_hecaa nvarchar(30), ine_nombre varchar(100), mo_mod_codigo int,
mo_hecaa_codigo int,mo_mod_nombre varchar(100) , ie_mun_codigo int ,pa_pai_codigo_hecaa int, uaa_codigo int, uaa_nombre_corto varchar(500),
facultad varchar(100),escalafon varchar(100),sede varchar(100), academica int, INSTITUCIONAL int, INVESTIGACION int, PROYECCION int,
ADMINISTRATIVAS int, ACTINVESTIGACION int, ACTIPROYECCION int,DOCENCIA int, fechaInicio Date, fechaFin date ,salario decimal(20,2),
esc_codigo int, dp_categoria decimal(9,2),dp_pregrado decimal(9,2),dp_especializacion decimal(7,2),dp_especializacion_medica decimal(9,2),
dp_maestria decimal(9,2),dp_doctorado decimal(9,2),dp_exp_calificada decimal(9,2) ,dp_exp_adtiva decimal(9,2),dp_articulos_revista decimal(9,2),
dp_libros decimal(9,2),dp_cap_libro decimal(9,2),dp_obra_artistica decimal(9,2),dp_premios decimal(9,2),dp_patentes decimal(9,2),
dp_produccion_tecnica decimal(9,2),dp_software decimal(9,2),dp_traducciones decimal(9,2),dp_videos decimal(9,2),dp_otras_salariales decimal(9,2),
dp_total_salariales decimal(9,2),dp_bonific_x_produccion decimal(9,2),dp_bonific_x_exp decimal(9,2),dp_total_bonificacion decimal(9,2),
dp_salario decimal(11,2) , dp_periodo int ) insert into @tempotalb(  per_codigo, tii_codigo_hecaa,tid_codigo ,tid_nombre ,per_identificacion,
nac_mun_codigo ,exp_mun_codigo ,vin_codigo ,vin_nombre ,ded_codigo ,ded_nombre,ded_codigo_hecaa, genero ,per_nombre ,per_apellido,per_email_interno,
per_email , per_telefono_fijo, per_telefono_movil, fechaNac, uap_fecha_inicio, uaa_codigo, uaa_nombre_corto, facultad, sede,pha_codigo,academica,
INSTITUCIONAL,INVESTIGACION, PROYECCION,ADMINISTRATIVAS,ACTINVESTIGACION,ACTIPROYECCION,DOCENCIA,fechaInicio,fechaFin)
select distinct p.per_codigo,ti.tii_codigo_hecaa, ti.tii_codigo,ti.tii_nombre, per_identificacion,per_lugar_nacimiento,per_lugar_expedicion,
v.vin_codigo,v.vin_nombre,d.ded_codigo,d.ded_nombre,d.ded_codigo_hecaa, p.per_genero, p.per_nombre, p.per_apellido,p.per_email_interno, p.per_email,
p.per_telefono_fijo, p.per_telefono_movil, CONVERT(varchar,p.per_fecha_nacimiento, 103) as per_fecha_nacimiento,
CONVERT(varchar,uap.uap_fecha_inicio, 103) as uap_fecha_inicio, uaa.uaa_codigo, uaa.uaa_nombre_corto,(select u.uaa_nombre_corto from uaa u
where u.uaa_codigo=uaa.uaa_dependencia) as facultad,s.sed_nombre, (select top 1 pha_codigo from persona_historia_academica pha 
inner join nivel_academico na on(na.nia_codigo=pha.nia_codigo )
inner join institucion_educativa ie on(ie.ine_codigo=pha.ine_codigo)
left join  modalidad mo on(mo.mod_codigo=pha.pha_mod_codigo)
left join  municipio mun on( ie.mun_codigo=mun.mun_codigo )
left join  departamento dpto on(mun.dep_codigo=dpto.dep_codigo )
left join  pais pa on(dpto.pai_codigo=pa.pai_codigo)
inner join periodo pe on(pe.per_codigo =121)
where pha.per_codigo =p.per_codigo  and (( cast(pha.pha_fecha_titulo as DATE) <= cast(pe.per_fecha_fin as DATE) or cast(pha.pha_fecha_titulo as DATE) is null) )  and pe.per_codigo =121  order by na.nia_orden desc  ) as pha,  
( select SUM( agp.factor ) as carga_academica from agenda_periodo agp
inner join (select eso.eso_actividad, eso.eso_subgrupo,uap.per_codigo from ( select cur.cur_codigo from curso cur  inner join calendario cl on(cl.cal_codigo=cur.cal_codigo) where  cl.per_codigo= 121 and cl.cal_nombre not like'%B' ) as cur
inner join ( select * from espacio_ocupacion union all select * from espacio_ocupacion_historico )as eso on eso.eso_actividad = cur.cur_codigo
inner join uaa_personal uap on (uap.uap_codigo=eso.uap_codigo) where p.per_codigo = uap.per_codigo  and uap.vin_codigo<>17 group by eso.eso_actividad, eso.eso_subgrupo,uap.per_codigo )as a on agp.sub_grupo=a.eso_subgrupo and a.eso_actividad=agp.cur_codigo and agp.per_codigo=a.per_codigo) as academia,(select  coalesce(sum(pep_hora_semana*pep_semanas),0) from proyecto with(nolock),proyecto_tipo with(nolock),persona_proyecto with(nolock),periodo  with(nolock)  where proyecto.pry_codigo = persona_proyecto.pry_codigo and   proyecto_tipo.prt_codigo = proyecto.prt_codigo and   periodo.per_codigo = persona_proyecto.per_codigo and pep_persona= uap.per_codigo and periodo.per_codigo like 121 and proyecto.prt_codigo=2 ) as INSTITUCIONAL,  (select  coalesce(sum(dpp_horas_semana*dpp_numero_semanas) ,0) from periodo pd with(nolock), proyectos.proyecto_proyeccion_social p with(nolock)
inner join proyectos.docentexproyecto_proyeccion_social dxp with(nolock) on p.pps_codigo = dxp.pps_codigo
left join proyectos.mc_proyecto_area pa with(nolock) on p.pra_codigo = pa.pra_codigo
inner join uaa_personal up with(nolock) on up.uap_codigo=dxp.uap_codigo  where up.per_codigo= uap.per_codigo and dpp_periodo=pd.per_codigo and pd.per_codigo=121  and pa.pra_codigo in( 3) ) as INVESTIGACION,  
(select  coalesce(sum(dpp_horas_semana*dpp_numero_semanas) ,0) from periodo pd with(nolock), proyectos.proyecto_proyeccion_social p with(nolock)  
inner join proyectos.docentexproyecto_proyeccion_social dxp with(nolock) on p.pps_codigo = dxp.pps_codigo  
left join proyectos.mc_proyecto_area pa with(nolock) on p.pra_codigo = pa.pra_codigo  
inner join uaa_personal up with(nolock) on up.uap_codigo=dxp.uap_codigo  where up.per_codigo= uap.per_codigo and dpp_periodo=pd.per_codigo and pd.per_codigo=121 and pa.pra_codigo in( 4) ) as PROYECCION,  (select  coalesce(sum(persona_novedad.pen_descarga_semestral ),0) from persona_novedad with(nolock) , novedad  with(nolock),periodo with(nolock)  where persona_novedad.nov_codigo = novedad.nov_codigo and periodo.per_codigo = persona_novedad.per_codigo and  persona_novedad.pen_persona = uap.per_codigo and persona_novedad.uap_codigo=uap.uap_codigo  and  periodo.per_codigo like 121 and novedad.not_codigo in (9) and persona_novedad.pen_estado=1 ) as ADMINISTRATIVAS,  (select  coalesce(sum(persona_novedad.pen_descarga_semestral ),0) from persona_novedad with(nolock) , novedad  with(nolock),periodo with(nolock)  where persona_novedad.nov_codigo = novedad.nov_codigo and periodo.per_codigo = persona_novedad.per_codigo and  persona_novedad.pen_persona = uap.per_codigo and persona_novedad.uap_codigo=uap.uap_codigo  and  periodo.per_codigo like 121 and novedad.not_codigo in (7) and persona_novedad.pen_estado=1 ) as ACTINVESTIGACION,  (select  coalesce(sum(persona_novedad.pen_descarga_semestral ),0) from persona_novedad with(nolock) , novedad  with(nolock),periodo with(nolock)  where persona_novedad.nov_codigo = novedad.nov_codigo and periodo.per_codigo = persona_novedad.per_codigo and  persona_novedad.pen_persona = uap.per_codigo and persona_novedad.uap_codigo=uap.uap_codigo  and  periodo.per_codigo like 121 and novedad.not_codigo in (8) and persona_novedad.pen_estado=1 ) as ACTIPROYECCION, (select  coalesce(sum(persona_novedad.pen_descarga_semestral ),0) from persona_novedad with(nolock) , novedad  with(nolock),periodo with(nolock)     where persona_novedad.nov_codigo = novedad.nov_codigo and periodo.per_codigo = persona_novedad.per_codigo and  persona_novedad.pen_persona = uap.per_codigo and persona_novedad.uap_codigo=uap.uap_codigo  and  periodo.per_codigo like 121 and novedad.not_codigo in (11) and persona_novedad.pen_estado=1 ) as DOCENCIA,   uap.uap_fecha_inicio,coalesce(uap.uap_fecha_fin,(select getdate())) from uaa_personal uap with(nolock)
inner join persona p with(nolock) on uap.per_codigo = p.per_codigo
inner join tipo_id ti with(nolock) on ti.tii_codigo=p.tii_codigo
inner join periodo pe with(nolock)  on ( pe.per_codigo=121 )
inner join periodo pe2 with(nolock)  on ( pe2.per_codigo=(121) )
left join vinculacion v on v.vin_codigo = uap.vin_codigo
inner join dedicacion d on d.ded_codigo=uap.ded_codigo
left join uaa with(nolock) on (uaa.uaa_codigo= uap.uaa_codigo)
left join sede s with(nolock) on (s.sed_codigo=uaa.sed_codigo) where ((uap_fecha_inicio between pe.per_fecha_inicio and pe.per_fecha_fin  and uap_fecha_fin between pe.per_fecha_inicio and pe.per_fecha_fin)   or ( uap_fecha_inicio <= pe.per_fecha_fin and uap_fecha_fin is null))and  pe.per_codigo =121   and (p.per_apellido not like '%NN CATE%' and p.per_apellido not like '%NNPROYE%')  and uap.vin_codigo in(12,13,14,16,19,23,24,25)  and uaa.uaa_dependencia=20 UPDATE @tempotalb set nia_codigo= na.nia_codigo,nia_nombre=na.nia_nombre,nia_codigo_ned_hecaa=na.nia_codigo_ne_hecaa , pha_convalidado=pha.pha_convalidado , pha_titulo = pha.pha_titulo, pha_fecha_titulo =  CONVERT(VARCHAR ,pha.pha_fecha_titulo,103),ine_codigo_hecaa =ie.ine_codigo_hecaa, ine_nombre =ie.ine_nombre , mo_hecaa_codigo = mo.hecaa_codigo,mo_mod_nombre = mo.mod_nombre,ie_mun_codigo =ie.mun_codigo ,pa_pai_codigo_hecaa =pa.pai_codigo_hecaa  from @tempotalb as t,persona_historia_academica pha
inner join nivel_academico na on(na.nia_codigo=pha.nia_codigo )
inner join institucion_educativa ie on(ie.ine_codigo=pha.ine_codigo )
left join  modalidad mo on(mo.mod_codigo=pha.pha_mod_codigo)
left join  municipio mun on( ie.mun_codigo=mun.mun_codigo )
left join  departamento dpto on(mun.dep_codigo=dpto.dep_codigo )
left join  pais pa on(dpto.pai_codigo=pa.pai_codigo)  where pha.per_codigo =t.per_codigo and pha.pha_codigo=t.pha_codigo UPDATE @tempotalb set escalafon= e.esc_nombre, esc_codigo=e.esc_codigo  from @tempotalb as t,docente_escalafon de ,escalafon e,periodo pe   where de.esc_codigo = e.esc_codigo and de.per_codigo =t.per_codigo and cast(de.doe_fecha_fin as DATE)  is null      UPDATE @tempotalb set salario = dp.dp_salario, dp_categoria=dp.dp_categoria,dp_pregrado=dp.dp_pregrado,dp_especializacion=dp.dp_especializacion,dp_especializacion_medica=dp.dp_especializacion_medica,dp_maestria=dp.dp_maestria,dp_doctorado=dp.dp_doctorado,dp_exp_calificada=dp.dp_exp_calificada, dp_exp_adtiva=dp.dp_exp_adtiva,dp_articulos_revista=dp.dp_articulos_revista,dp_libros=dp.dp_libros,dp_cap_libro=dp.dp_cap_libro,dp_obra_artistica=dp.dp_obra_artistica,dp_premios=dp.dp_premios,dp_patentes=dp.dp_patentes,dp_produccion_tecnica=dp.dp_produccion_tecnica,dp_software=dp.dp_software,dp_traducciones=dp.dp_traducciones,dp_videos=dp.dp_videos,dp_otras_salariales=dp.dp_otras_salariales,dp_total_salariales=dp.dp_total_salariales, dp_bonific_x_produccion=dp.dp_bonific_x_produccion,dp_bonific_x_exp=dp.dp_bonific_x_exp,dp_total_bonificacion=dp.dp_total_bonificacion ,dp_periodo=dp.dp_periodo    from @tempotalb as t, docente_puntos dp where dp.dp_per_codigo=t.per_codigo and dp.dp_periodo= 121 UPDATE @tempotalb set salario = ( dp.dp_salario), dp_categoria=dp.dp_categoria,dp_pregrado=dp.dp_pregrado,dp_especializacion=dp.dp_especializacion,dp_especializacion_medica=dp.dp_especializacion_medica,dp_maestria=dp.dp_maestria,dp_doctorado=dp.dp_doctorado,dp_exp_calificada=dp.dp_exp_calificada, dp_exp_adtiva=dp.dp_exp_adtiva,dp_articulos_revista=dp.dp_articulos_revista,dp_libros=dp.dp_libros,dp_cap_libro=dp.dp_cap_libro,dp_obra_artistica=dp.dp_obra_artistica,dp_premios=dp.dp_premios,dp_patentes=dp.dp_patentes,dp_produccion_tecnica=dp.dp_produccion_tecnica,dp_software=dp.dp_software,dp_traducciones=dp.dp_traducciones,dp_videos=dp.dp_videos,dp_otras_salariales=dp.dp_otras_salariales,dp_total_salariales=dp.dp_total_salariales, dp_bonific_x_produccion=dp.dp_bonific_x_produccion,dp_bonific_x_exp=dp.dp_bonific_x_exp,dp_total_bonificacion=dp.dp_total_bonificacion ,dp_periodo=dp.dp_periodo    from @tempotalb as t, docente_puntos dp where dp.dp_per_codigo=t.per_codigo and dp.dp_periodo=121 and vin_codigo in(14,24)select distinct per_codigo,tii_codigo_hecaa,tid_codigo,tid_nombre,per_identificacion,nac_mun_codigo,exp_mun_codigo,vin_codigo,vin_nombre,ded_codigo,ded_nombre,ded_codigo_hecaa,genero,per_nombre,per_apellido,per_email_interno, per_email , per_telefono_fijo, per_telefono_movil,fechaNac,uap_fecha_inicio,nia_codigo,nia_nombre,nia_codigo_ned_hecaa,pha_codigo,pha_convalidado,pha_titulo,pha_fecha_titulo,ine_codigo_hecaa,ine_nombre,mo_hecaa_codigo,mo_mod_codigo,mo_mod_nombre,ie_mun_codigo,pa_pai_codigo_hecaa, uaa_codigo, uaa_nombre_corto,facultad,escalafon,sede,  coalesce(m.mun_codigo,0) as cmnac, m.mun_nombre as nmnac, m.sippa_mun_codigo as smnac, m.SNIES_codigo as snmnac, coalesce(d.dep_codigo,0) as cdnac, d.dep_acronimo as adnac,d. dep_nombre as ndnac, d.sippa_dep_codigo as sdnac, d.dane_codigo as ddnac, pa.pai_codigo as cpnac, pa.pai_acronimo as apnac, pa.pai_nombre as npnac,pa.sippa_pai_codigo as spnac, pa.pai_codigo_hecaa as hpnac,  me.mun_codigo cmexp, me.mun_nombre nmexp, me.sippa_mun_codigo smexp, me.SNIES_codigo snmexp, de.dep_codigo cdexp, de.dep_acronimo adexp, de.dep_nombre ndexp, de.sippa_dep_codigo sdexp, de.dane_codigo ddexp, pae.pai_codigo cpexp, pae.pai_acronimo apexp, pae.pai_nombre npexp, pae.sippa_pai_codigo spexp, pae.pai_codigo_hecaa hpexp,coalesce(academica,0) as academica,INSTITUCIONAL,INVESTIGACION, PROYECCION,ADMINISTRATIVAS,ACTINVESTIGACION,ACTIPROYECCION,DOCENCIA,fechaInicio,fechaFin,(SELECT DATEDIFF(month, fechaInicio, fechaFin)) AS DateDiff, salario, esc_codigo,dp_categoria,dp_pregrado,dp_especializacion,dp_especializacion_medica,dp_maestria,dp_doctorado,dp_exp_calificada ,dp_exp_adtiva,dp_articulos_revista,dp_libros,dp_cap_libro,dp_obra_artistica,dp_premios,dp_patentes,dp_produccion_tecnica,dp_software,dp_traducciones,dp_videos,dp_otras_salariales,dp_total_salariales,dp_bonific_x_produccion,dp_bonific_x_exp,dp_total_bonificacion, dp_periodo from @tempotalb  t  
LEFT JOIN municipio m ON(m.mun_codigo=t.nac_mun_codigo)  
LEFT JOIN departamento d ON(d.dep_codigo=m.dep_codigo)  
LEFT JOIN pais pa ON(pa.pai_codigo=d.pai_codigo)  
LEFT JOIN municipio me ON(me.mun_codigo=t.exp_mun_codigo)
LEFT JOIN departamento de ON(de.dep_codigo=me.dep_codigo)e
LEFT JOIN pais pae ON(pae.pai_codigo=de.pai_codigo) where fechaInicio < fechaFin order by uaa_nombre_corto, per_apellido, per_nombre


SELECT pe.per_a�o AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,  
u2.uaa_nombre AS dependencia, pro.pro_registro_snies,u1.uaa_nombre, jo.jor_nombre, m.mod_nombre, est.est_codigo,  
ese.ese_nombre, mat.mat_estado, cal.cal_nombre, per.per_nombre, per.per_apellido, per.per_estrato,  
per.per_genero, per.per_fecha_nacimiento, DATEDIFF(YY,per.per_fecha_nacimiento,GETDATE()) AS edad,  
tii.tii_nombre, per.per_identificacion,  
mun2.mun_nombre AS mun_residencia,  
dep2.dep_nombre AS dep_residencia, esc.esc_nombre,  
(SELECT SUM(paa1.paa_credito) FROM matricula mat1  
    INNER JOIN matricula_curso mac1 ON mat1.mat_codigo = mac1.mat_codigo 
    INNER JOIN plan_academico_asignatura paa1 ON mac1.paa_codigo = paa1.paa_codigo 
    INNER JOIN calendario cal1 ON mat1.cal_codigo = cal1.cal_codigo 
    INNER JOIN periodo per1 ON cal1.per_codigo = per1.per_codigo 
    WHERE mat1.est_codigo = est.est_codigo 
    AND per1.per_nombre <= pe.per_nombre AND mat1.mat_estado = 'A' AND mac1.maa_codigo IN (1,2) 
    AND (mac1.mac_definitiva >= paa1.paa_nota_minima OR mac1.esc_codigo IN (2,6)) 
    AND paa1.paa_plan_academico = 0), 
(CASE WHEN CONVERT(VARCHAR, est.est_fecha_ingreso, 111) = CONVERT(VARCHAR, mat.mat_fecha, 111)  
THEN 'SI' ELSE 'NO' END) AS primer_semestre, ins.ins_codigo, 
moi.moi_nombre, 
(SELECT MIN(paa.paa_semestre)  
FROM matricula_curso mac 
INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo 
WHERE mac.mat_codigo = mat.mat_codigo AND mac.maa_codigo IN(1,2) 
) AS semestre, mti.mti_nombre 
FROM matricula mat WITH (NOLOCK)  
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
INNER JOIN modalidad m WITH (NOLOCK) ON pro.mod_codigo = m.mod_codigo 
INNER JOIN jornada jo WITH (NOLOCK) ON pro.jor_codigo  = jo.jor_codigo  
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo 
LEFT JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo  
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo 
LEFT JOIN matricula_tipo mti WITH (NOLOCK) ON mat.mat_tipo = mti.mti_codigo   
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo 
LEFT JOIN estado_civil esc WITH (NOLOCK) ON per.per_estado_civil = esc.esc_codigo  
LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo 
LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo  
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo    
WHERE (pe.per_nombre BETWEEN '20221' AND '20221') AND ple.ple_estado = 1 AND mat.mat_estado= 'A' AND per.per_codigo 
and sed.sed_codigo in (1,2,3,4) and nia.nia_codigo in (9,11,12,13,14)
ORDER BY pe.per_a�o, pe.per_nombre,sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_codigo,u1.uaa_codigo


--SNIES QUERY MATRICULA
select ti.snies_codigo, pe.per_identificacion, l.est_codigo, p.pro_registro_snies, mp.SNIES_codigo as municipio, 
pe.per_fecha_nacimiento, coalesce(pe.per_codigo_pais_hecaa,170) as pais_nacimiento, mn.SNIES_codigo as municipio_nacimiento,
coalesce(se.hecaa_zor, pe.zor_codigo) as codigo_zona, pe.per_estrato, 'N', '', '', 
(select (select coalesce(sum(valor_total),0) from VI_factura_detalle_nac v inner join concepto c on v.con_codigo = c.con_codigo
where fac_codigo = fl.fac_codigo and c.con_codigo in (select con_codigo from concepto where con_nombre like 'matric%' AND cot_codigo = 1 and con_estado = 'A' and lit_codigo = 13 )
)-(select coalesce(sum(valor_total),0) from VI_factura_detalle_nac v inner join concepto c on v.con_codigo = c.con_codigo
where fac_codigo = fl.fac_codigo and c.con_codigo in (select con_codigo from concepto where cot_codigo = 2 and con_estado = 'A' and lit_codigo = 13 and con_codigo not in (893,94,910,911,912,913,914,915,105,908))
)) as liquidacion, pe.per_telefono_movil, pe.per_email
from  liquidacion l
inner join estudiante e on l.est_codigo = e.est_codigo
inner join uaa u on l.uaa_codigo = u.uaa_codigo
inner join programa p on u.uaa_codigo = p.uaa_codigo
inner join sede sp on p.sed_codigo = sp.sed_codigo
inner join municipio mp on sp.mun_codigo = mp.mun_codigo
inner join calendario c on l.cal_codigo = c.cal_codigo
inner join matricula m on m.est_codigo = l.est_codigo and m.cal_codigo = l.cal_codigo 
inner join persona pe on l.per_codigo = pe.per_codigo
inner join tipo_id ti on pe.tii_codigo = ti.tii_codigo
inner join municipio mn on pe.per_lugar_nacimiento = mn.mun_codigo
left join snies_estudiante_complementario se ON se.per_codigo = pe.per_codigo and se.ins_codigo = e.ins_codigo
inner join factura fl on l.liq_codigo = fl.liq_codigo
where l.lit_codigo = 13 and m.mat_estado = 'A'
and  pe.per_identificacion = '1075276839' and c.cal_nombre like '20202A' order by c.cal_codigo desc


--SNIES QUERY PRIMER CURSO
select ti.snies_codigo, pe.per_identificacion, p.pro_registro_snies, mp.SNIES_codigo as municipio, '2',
coalesce(se.hecaa_gre,0) as grupo_etnico, coalesce(se.hecaa_pi,0) as pueblo_indigena, coalesce(se.hecaa_con,0) as comunidad_negra, 
'', sd.sdi_codigo_hecaa as codigo_tipo_discapacidad, coalesce(se.hecaa_cae,0) as capacidad_exepcional, i.icf_snp
from  liquidacion l
inner join estudiante e on l.est_codigo = e.est_codigo
inner join uaa u on l.uaa_codigo = u.uaa_codigo
inner join programa p on u.uaa_codigo = p.uaa_codigo
inner join sede sp on p.sed_codigo = sp.sed_codigo
inner join municipio mp on sp.mun_codigo = mp.mun_codigo
inner join calendario c on l.cal_codigo = c.cal_codigo
inner join matricula m on m.est_codigo = l.est_codigo and m.cal_codigo = l.cal_codigo 
inner join persona pe on l.per_codigo = pe.per_codigo
inner join tipo_id ti on pe.tii_codigo = ti.tii_codigo
inner join municipio mn on pe.per_lugar_nacimiento = mn.mun_codigo
left join snies_estudiante_complementario se ON se.per_codigo = pe.per_codigo and se.ins_codigo = e.ins_codigo
left join snies_discapacidad sd on se.sdi_codigo = sd.sdi_codigo
inner join inscripcion i on e.ins_codigo = i.ins_codigo
where l.lit_codigo = 13 and m.mat_estado = 'A'
and  pe.per_identificacion = '1081404857' and c.cal_nombre like '20081A' order by c.cal_codigo desc

--QUERY GRADUADOS POR A�O
WITH resultado(ano,sed_nombre,nat_codigo, nat_nombre, nia_nombre, dependencia_codigo, 
dependencia, pro_codigo, pro_registro_snies, uaa_nombre, per_genero, total
) AS( 
SELECT  YEAR(gra.gra_fecha) AS ano, 
sed.sed_nombre, nat.nat_codigo, nat.nat_nombre, nia.nia_nombre, u2.uaa_codigo AS dependencia_codigo,  
u2.uaa_nombre AS dependencia,  pro.pro_codigo,pro.pro_registro_snies, u1.uaa_nombre, 
(CASE WHEN per.per_genero IS NULL THEN 'N' WHEN LTRIM(RTRIM(per.per_genero)) = '' THEN 'N' ELSE per.per_genero END) AS per_genero, 
COUNT (*) AS total 
FROM graduado gra 
INNER JOIN estudiante est ON gra.est_codigo = est.est_codigo 
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo  
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo 
WHERE (gra.gra_fecha BETWEEN '01/01/1968' AND '18/08/2022' )  
--AND pro.pro_codigo IN (SELECT * FROM dbo.Split(:pro_codigo,',')) 
GROUP BY gra.gra_fecha, sed.sed_nombre,nat.nat_codigo, nat.nat_nombre, nia.nia_nombre, u2.uaa_codigo,  
u2.uaa_nombre,  pro.pro_codigo,pro.pro_registro_snies, u1.uaa_nombre,per.per_genero 
) SELECT * FROM resultado PIVOT(SUM(total) FOR per_genero IN([F],[M],[N])) AS pvt 
 ORDER BY  ano,sed_nombre, nat_codigo, nia_nombre, dependencia,uaa_nombre


select * from graduado g 
 
with resultado(periodo, calendario, sed_nombre, sed_codigo, nat_nombre, nia_nombre, facultad, dependencia,  pro_codigo, pro_registro_snies, per_genero, total)AS 
(SELECT P.per_nombre as periodo, c.cal_nombre as calendario,sed_nombre,s.sed_codigo,nat.nat_nombre,nia.nia_nombre, u2.uaa_nombre as facultad,u.uaa_nombre as dependencia,pr.pro_codigo,pr.pro_registro_snies, 
(CASE WHEN per.per_genero IS NULL THEN 'N' WHEN LTRIM(RTRIM(per.per_genero)) = '' THEN 'N' ELSE per.per_genero END) AS per_genero, 
COUNT (*) AS total FROM inscripcion i  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON i.ins_codigo = inp.ins_codigo
LEFT JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo
LEFT JOIN calendario c WITH (NOLOCK) ON ofa.cal_codigo = c.cal_codigo
LEFT JOIN programa pr WITH (NOLOCK) ON ofa.pro_codigo = pr.pro_codigo 
LEFT JOIN sede s WITH (NOLOCK) ON pr.sed_codigo = s.sed_codigo 
INNER JOIN uaa u ON pr.uaa_codigo=u.uaa_codigo  
INNER JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo  
INNER JOIN persona per ON i.per_codigo=per.per_codigo  
INNER JOIN periodo p ON c.per_codigo = p.per_codigo  
LEFT JOIN nivel_academico nia WITH (NOLOCK) ON pr.nia_codigo = nia.nia_codigo   
LEFT JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo   
WHERE (p.per_nombre BETWEEN '20221' AND '20221') 
GROUP BY p.per_nombre, c.cal_nombre,s.sed_codigo,nat.nat_nombre,nia.nia_nombre,u2.uaa_nombre,u.uaa_nombre,sed_nombre,pr.pro_codigo,pr.pro_registro_snies,per_genero)  
SELECT ROW_NUMBER() OVER(ORDER BY sed_codigo,nia_nombre,facultad,dependencia) as num,* FROM resultado PIVOT(SUM(total) FOR per_genero IN ([F], [M],[N])) AS pvt  
ORDER BY periodo, sed_codigo, nat_nombre, nia_nombre, facultad, dependencia 

--MATRICULADOS POR GENERO
WITH resultado(ano,periodo,sed_nombre,nat_nombre,nia_nombre,dependencia_codigo,  
dependencia, pro_codigo, uaa_nombre, per_genero, total) AS (  
SELECT pe.per_año AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,   
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo, u.uaa_nombre,   
(CASE WHEN LTRIM(RTRIM(per.per_genero)) IS NULL THEN 'N' WHEN LTRIM(RTRIM(per.per_genero)) = '' THEN 'N' ELSE per.per_genero END) AS per_genero,  
COUNT(*) AS total  
FROM matricula mat WITH (NOLOCK)   
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
GROUP BY pe.per_año, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,   
u2.uaa_codigo, u2.uaa_nombre,  pro.pro_codigo, u.uaa_nombre, per.per_genero  
)SELECT * FROM resultado PIVOT(SUM(total) FOR per_genero IN([F],[M],[N])) AS pvt;

--MATRICULADOS DETALLADO
SELECT mat.mat_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,  
            u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, est.est_codigo,  
            ese.ese_nombre, mat.mat_estado, cal.cal_nombre, per.per_nombre, per.per_apellido, per.per_estrato,  
            per.per_genero, per.per_fecha_nacimiento, DATEDIFF(YY,per.per_fecha_nacimiento,GETDATE()) AS edad,  
            tii.tii_nombre, per.per_identificacion, per.per_telefono_fijo, per.per_telefono_movil, per.per_email,  
            per.per_email_interno,mun1.mun_nombre AS mun_nacimiento, mun2.mun_nombre AS mun_residencia,  
            dep1.dep_nombre AS dep_nacimiento, dep2.dep_nombre AS dep_residencia, esc.esc_nombre,  
            (SELECT SUM(paa1.paa_credito) FROM matricula mat1  
                INNER JOIN matricula_curso mac1 ON mat1.mat_codigo = mac1.mat_codigo 
                INNER JOIN plan_academico_asignatura paa1 ON mac1.paa_codigo = paa1.paa_codigo 
                INNER JOIN calendario cal1 ON mat1.cal_codigo = cal1.cal_codigo 
                INNER JOIN periodo per1 ON cal1.per_codigo = per1.per_codigo 
                WHERE mat1.est_codigo = est.est_codigo 
                AND per1.per_nombre <= pe.per_nombre AND mat1.mat_estado = 'A' AND mac1.maa_codigo IN (1,2) 
                AND (mac1.mac_definitiva >= paa1.paa_nota_minima OR mac1.esc_codigo IN (2,6)) 
                AND paa1.paa_plan_academico = 0) AS creditos_aprobados, 
            (CASE WHEN CONVERT(VARCHAR, est.est_fecha_ingreso, 111) = CONVERT(VARCHAR, mat.mat_fecha, 111)  
            THEN 'SI' ELSE 'NO' END) AS primer_semestre, ins.ins_codigo, 
            moi.moi_nombre, adr.adr_puesto, adr.adr_puntaje, adt.adt_nombre,  
            ine.ine_nombre, inc.inc_nombre, col.col_nombre, col.col_sector, 
            pra.promedio AS promedio_aritmetico, prp.promedio_ponderado, 
            (SELECT MIN(paa.paa_semestre)  
            FROM matricula_curso mac 
            INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo 
            WHERE mac.mat_codigo = mat.mat_codigo AND mac.maa_codigo IN(1,2) 
            ) AS semestre, mti.mti_nombre 
            FROM matricula mat WITH (NOLOCK)  
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
            LEFT JOIN promedio_aritmetico pra WITH(NOLOCK) ON est.est_codigo = pra.est_codigo 
            LEFT JOIN promedio_ponde prp WITH(NOLOCK) ON est.est_codigo = prp.est_codigo  
            LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo 
            LEFT JOIN estado_civil esc WITH (NOLOCK) ON per.per_estado_civil = esc.esc_codigo  
            LEFT JOIN municipio mun1 WITH (NOLOCK) ON per.per_lugar_nacimiento = mun1.mun_codigo 
            LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
            LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
            LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo 
            LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo 
            LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo  
            LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo   
            LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
            LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
            LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
            WHERE (pe.per_nombre BETWEEN '20221' AND '20221') AND ple.ple_estado = 1 AND mat.mat_estado= 'A'
            ORDER BY pe.per_a�o, pe.per_nombre,sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_codigo,u1.uaa_codigo 
            
            
            
SELECT mat.mat_codigo, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion, 
u2.uaa_nombre AS facultad, pro.pro_registro_snies, u1.uaa_nombre, est.est_codigo,  
cal.cal_nombre, per.per_nombre, per.per_apellido, per.per_estrato,  
per.per_genero, per.per_fecha_nacimiento, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,  
tii.tii_nombre, per.per_identificacion, mun1.mun_nombre AS mun_nacimiento,  
dep1.dep_nombre AS dep_nacimiento, moi.moi_nombre,
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre,
(SELECT MIN(paa.paa_semestre)  
FROM matricula_curso mac 
INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo 
WHERE mac.mat_codigo = mat.mat_codigo AND mac.maa_codigo IN(1,2) 
) AS semestre, mti.mti_nombre 
FROM matricula mat WITH (NOLOCK)  
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
WHERE (pe.per_nombre BETWEEN '20201' AND '20212') AND ple.ple_estado = 1 AND mat.mat_estado= 'A'  
ORDER BY pe.per_a�o, pe.per_nombre,sed.sed_nombre, nat.nat_nombre, nia.nia_nombre




-- GRADUADOS AGOSTO POR A�O

WITH resultado(sed_codigo,sed_nombre,nat_codigo, nat_nombre, nia_nombre, dependencia_codigo, 
dependencia, pro_codigo, pro_registro_snies, uaa_nombre, per_genero, total 
) AS( 
SELECT sed.sed_codigo, 
sed.sed_nombre, nat.nat_codigo, nat.nat_nombre, nia.nia_nombre, u2.uaa_codigo AS dependencia_codigo,  
u2.uaa_nombre AS dependencia,  pro.pro_codigo,pro.pro_registro_snies, u1.uaa_nombre, 
(CASE WHEN per.per_genero IS NULL THEN 'N' WHEN LTRIM(RTRIM(per.per_genero)) = '' THEN 'N' ELSE per.per_genero END) AS per_genero, 
COUNT (*) AS total 
FROM graduado gra 
INNER JOIN estudiante est ON gra.est_codigo = est.est_codigo 
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo  
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo  
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo 
WHERE (gra.gra_fecha BETWEEN '01/01/1968' AND '18/08/2022' )  
AND pro.pro_codigo IN (SELECT * FROM dbo.Split(:pro_codigo,',')) 
GROUP BY gra.gra_fecha, sed.sed_codigo,sed.sed_nombre,nat.nat_codigo, nat.nat_nombre, nia.nia_nombre, u2.uaa_codigo,  
u2.uaa_nombre,  pro.pro_codigo,pro.pro_registro_snies, u1.uaa_nombre,per.per_genero 
) SELECT * FROM resultado PIVOT(SUM(total) FOR per_genero IN([F],[M],[N])) AS pvt 
 ORDER BY sed_nombre, nat_codigo, nia_nombre, dependencia,uaa_nombre
 

SELECT gra.gra_fecha AS ano,    
(CASE WHEN MONTH(gra.gra_fecha) <= 6 THEN CONVERT(VARCHAR,YEAR(gra.gra_fecha))+'1'    
ELSE CONVERT(VARCHAR,YEAR(gra.gra_fecha))+'2' END) AS periodo ,    
sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, u2.uaa_codigo AS dependencia_codigo,    
u2.uaa_nombre AS dependencia,  pro.pro_codigo,pro.pro_registro_snies, u.uaa_nombre, est.est_codigo, ese.ese_nombre,    
gra.gra_acta, gra.gra_folio, gra.pla_codigo, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,    
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
tii.tii_nombre, per.per_identificacion, per.per_email_interno  
FROM graduado gra   
INNER JOIN estudiante est ON gra.est_codigo = est.est_codigo   
LEFT JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo    
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo    
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo    
INNER JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo    
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo    
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo    
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo   
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo   
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo   
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo   
--WHERE gra.est_codigo=:est_codigo 
ORDER BY sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_nombre,u.uaa_nombre,gra.gra_fecha 
 
 
 