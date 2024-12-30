select * from dbo.estudiante e where e.per_codigo = 182831select * from dbo.matricula m where m.est_codigo = '20251231681'select * from persona p where p.per_apellido = 'ANAYA ISAZA'select * from encuestas.cuestionarios c select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 51select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 182831select top 1 *, GETDATE() as horaInicioSesion from encuestas.usuario_encuesta_web_login ucdl inner join uaa u on ucdl.usg_uaa = u.uaa_codigo inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on ucdl.up = p.per_codigo where  ucdl.us = 'u20251231681' order by ucdl.usg_codigo descselect COUNT(ucdl.us) from encuestas.usuario_encuesta_web_login ucdl inner join uaa u on ucdl.usg_uaa = u.uaa_codigo inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on ucdl.up = p.per_codigo where us = 'u20212200048'select * from usuario_notas_posgrado ue where ue.us ='4930027'select * from programa p where p.uaa_codigo_unificado = 1065select * from uaa u where uaa_codigo = 1065select * from persona p where p.per_nombre like '%Hipolito%'select * from web_parametro wp where wp.wep_nombre like '%ENCUESTA%'select * from dbo.matricula_curso c where c.cur_codigo in (186100, 186101, 186103, 186105, 186108, 186110, 186111, 186112, 186114, 186116, 186119, 186122, 186125, 186132, 186133, 186139, 186140, 186141, 186144, 186149, 186150, 186152, 186154, 186155, 186157, 186161, 186165, 186168, 186169, 186170, 186172, 186174, 186176, 186178, 186181, 186186, 186189, 186193, 186195, 186196, 186206, 186209, 186214, 186216, 186331, 186333, 186335, 186362, 186370, 186381, 186430, 186431, 186432, 186436, 186455, 186456, 186457, 186458, 186459, 186460, 186461, 186462, 186466, 186468, 186472, 186475, 186479, 186481, 186483, 186485, 186496, 186498, 186512, 186515, 186519, 186525, 186529, 186530, 186533, 186534, 186537, 186540, 186541, 186542, 186544, 186546, 186547, 186549, 186550, 186551, 186555, 186620, 186623, 186629, 186643, 186649, 186654, 186657, 186660, 186712, 186713, 186740, 186744, 186748, 186751, 186753, 186755, 186756, 186810, 186939, 186940, 187090, 187091, 187092, 187093, 187095, 187098, 187099, 187100, 187101, 187102, 187103, 187104, 187105, 187106, 187107, 187156, 187158, 187159, 187160, 187161, 187163, 187164, 187165, 187166, 187168, 187169, 187170, 187172, 187174, 187176, 187177, 187178, 187179, 187180, 187182, 187184, 187185, 187187, 187191, 187193, 187195, 187196, 187197, 187198, 187199, 187200, 187201, 187202, 187203, 187204, 187205, 187206, 187207, 187208, 187209, 187210, 187211, 187212, 187213, 187214, 187215, 187216, 187218, 187219, 187222, 187223, 187225, 187226, 187227, 187228, 187229, 187230, 187231, 187232, 187233, 187234, 187235, 187236, 187237, 187238, 187239, 187240, 187241, 187242, 187243, 187244, 187254, 187255, 187256, 187257, 187259, 187260, 187261, 187262, 187263, 187265, 187266, 187267, 187346, 187347, 187348, 187349, 187350, 187351, 187352, 187353, 187354, 187355, 187356, 187605, 187620, 187621, 187622, 187623, 187631, 187635, 187637, 187638, 187658, 187660, 187661, 187663, 187668, 187671, 187678, 187679, 187680, 187681, 187682, 187683, 187684, 187685, 187686, 187690, 187694, 187696, 187697, 187698, 187700, 187701, 187702, 187703, 187704, 187705, 187706, 187707, 187708, 187709, 187711, 187712, 187714, 187715, 187716, 187717, 187718, 187720, 187721, 187722, 187723, 187724, 187725, 187726, 187727, 187728, 187729, 187731, 187770, 187771, 187772, 187773, 187774, 187779, 187808, 187832, 187835, 187838, 187840, 187843, 187844, 187845, 187848, 187849, 187851, 187852, 187853, 187859, 187860, 187862, 187863, 187864, 187865, 187866, 187869, 187870, 187871, 187872, 187873, 187910, 187911, 187915, 187916, 187920, 187923, 187924, 187925, 187926, 187927, 187928, 187929, 187930, 187932, 187933, 187934, 187935, 187936, 188014, 188015, 188016, 188017, 188018, 188019, 188020, 188021, 188022, 188024, 188032, 188034, 188035, 188036, 188037, 188038, 188039, 188041, 188043, 188044, 188049, 188050, 188052, 188053, 188054, 188055, 188056, 188059, 188060, 188061, 188063, 188064, 188066, 188096, 188101, 188117, 188118, 188119, 188121, 188123, 188125, 188142, 188143, 188144, 188145, 188146, 188147, 188148, 188149, 188150, 188151, 188152, 188153, 188154, 188155, 188156, 188157, 188158, 188159, 188160, 188161, 188162, 188174, 188377, 188383, 188390, 188391, 188392, 188395, 188396, 188397, 188398, 188399, 188400, 188401, 188402, 188403, 188404, 188405, 188406, 188407, 188409, 188410, 188411, 188412, 188413, 188414, 188415, 188416, 188417, 188418, 188419, 188420, 188421, 188422, 188423, 188424, 188425, 188426, 188430, 188431, 188433, 188435, 188436, 188437, 188441, 188526, 188527, 188528, 188529, 188530, 188531, 188532, 188534, 188536, 188537, 188538, 188539, 188540, 188542, 188544, 188545, 188547, 188548, 188549, 188550, 188551, 188552, 188554, 188555, 188556, 188557, 188564, 188565, 188566, 188567, 188568, 188569, 188570, 188571, 188572, 188573, 188575, 188576, 188577, 188578, 188579, 188580, 188581, 188582, 188583, 188584, 188585, 188586, 188587, 188588, 188589, 188590, 188591, 188593, 188594, 188595, 188660, 188717, 188718, 188720, 188721, 188723, 188724, 188726, 188727, 188728, 188730, 188732, 188733, 188734, 188738, 188739, 188742, 188743, 188744, 188745, 188746, 188748, 188749, 188754, 188757, 188759, 188761, 188765, 188771, 188773, 188775, 188776, 188780, 188783, 188786, 188787, 188788, 188789, 188791, 188792, 188793, 188794, 188795, 188796, 188797, 188799, 188800, 188801, 188803, 188806, 188808, 188811, 188814, 188815, 188816, 188817, 188819, 188820, 188821, 188822, 188823, 188824, 188826, 188827, 188828, 188829, 188831, 188833, 188834, 188835, 188836, 188837, 188838, 188839, 188840, 188841, 188842, 188843, 188845, 188846, 188847, 188848, 188849, 188850, 188851, 188853, 188854, 188856, 188857, 188859, 188860, 188861, 188862, 188863, 188864, 188865, 188867, 188868, 188869, 188879, 188880, 188881, 188882, 188884, 188885, 188889, 188890, 188896, 188897, 188898, 188900, 188902, 188905, 188907, 188908, 188926, 188928, 188929, 188932, 188935, 188938, 188939, 188943, 188946, 188950, 188951, 188952, 188953, 188955, 189097, 189111, 189112, 189139, 189242, 189243, 189244, 189245, 189246, 189247, 189248, 189249, 189250, 189251, 189252, 189253, 189254, 189255, 189256, 189257, 189258, 189259, 189260, 189261, 189262, 189264, 189267, 189268, 189270, 189299, 189300, 189337) and c.mac_definitiva is not nullselect * from dbo.matricula_curso c where c.cur_codigo = 187622select * from dbo.aud_curso acselect * from encuestas.cuestionarios c select * from dbo.persona p where p.per_apellido = 'SALAS SOTO'select * from bloque b select * from uaaselect * from sibusco.restaurante_horario_servicio rhs select * from sub_sede ss select * from dbo.bloque b inner join dbo.sub_sede ss on b.sus_codigo = ss.sus_codigo inner join dbo.sede s on ss.sed_codigo = s.sed_codigo where b.blo_estado = 1 and b.blo_estado is not null and s.sed_codigo = 1select * from uaa u where u.sed_codigo = and u.uaa_dependencia is not null and u.uat_codigo in (1,2,6,9,11,22,26) and u.sed_codigo in (1,2,3,4) and u.uaa_estado = 1select s.sed_nombre, ss.sus_nombre, b.blo_nombre, e.esp_nombre, e.esp_nombre_corto from espacio e inner join bloque b on e.blo_codigo = b.blo_codigo inner join dbo.sub_sede ss on b.sus_codigo = ss.sus_codigo inner join dbo.sede s on ss.sed_codigo = s.sed_codigowhere s.sed_codigo = 1select * from acreditacion.invitacion_programa_acreditable ipa select * from acreditacion.estado_invitacion ei select * from inscripcion i select * from persona p where p.per_nombre LIKE '%SAMUEL%' and p.per_apellido = 'CALDERON BUSTOS'SELECT * From inscselect * from inscripcion i where i.per_codigo = 182831select * from familiar f where f.ins_codigo = 179429select * from persona p where p.per_codigo = 128884select * from select * from encuestas.respuestas_cuestionarios rc select * from dbo.persona p where p.per_codigo = 50983select * from dbo.estudiante e where e.per_codigo = 50983select * from encuestas.respuestas r where r.rcu_codigo = 61514select count(*) from dbo.autorizacion_terminos at2select * from dbo.usuario_admin_login ual WHERE UAL.us = 'a1075289196'select * from dbo.persona p where p.per_nombre like '%PAULA%' and p.per_apellido like '%PINZON%'select * from dbo.persona p where p.per_apellido like '%SANDOVAL BRAND%'select * from modulo m select * from ileusco.estudiantes_activos_ileusco eai where eai.per_identificacion = '1028481471'select * from sibusco.restaurante_contrato rc select * from sibusco.restaurante_venta rv select * from dbo.persona p where p.per_apellido like '%ariza%' and p.per_nombre like '%carol%'8741771751600187821126922select * from dbo.uaa_personal up where up.per_codigo = 126922select * from estudiante e where e.per_codigo = 142027select * from usuario_estudiante_login uel where uel.us = 'u20191178312'select * from usuario_estudiante_login uel where uel.us = 'u20171155993'select * from estudiante e where e.est_codigo = '20191178312'select * from dbo.persona p where p.per_codigo = 1442802019117705320242229490select * from dbo.matricula m where m.est_codigo = '20242229490'select * from carnetizacion.usuario_carnet_digital_login ucdl where ucdl.us = 'a1077865570'select * from dbo.estudiante_virtual ev where ev.per_codigo = 79319select * from token.codigo_inicio_sesion cis where cis.uid = 175686select * from dbo.autorizacion_terminos at2 --Solicitamos muy amablemente el listado de los graduados del programa en sus 2 denominaciones educación infantil y pedagogía infantil --de la ciudad de Neiva y de las sedes  desde los años 2019 ,2020,2021,2022,2023,2024 hasta la fecha, --esto con el fin de continuar con los procesos que se requieren para mantener la calificación de categoría B frente a los procesos de acreditación próximamente.select pr.per_identificacion, pr.per_apellido, pr.per_nombre, e.est_codigo, u.uaa_nombre_corto, g.gra_fecha, dc.dac_trabajo_grado  from dbo.graduado g inner join dbo.estudiante e on g.est_codigo = e.est_codigo inner join dbo.persona pr on e.per_codigo = pr.per_codigo inner join dbo.programa p on e.pro_codigo = p.pro_codigo inner join dbo.uaa u on p.uaa_codigo = u.uaa_codigo left join academia3000.graduado.datos_complementarios dc on g.est_codigo = dc.est_codigo where p.pro_codigo in (1, 14, 28, 98, 102, 238, 309, 365, 370, 480) and CONVERT(DATE, g.gra_fecha) BETWEEN '2019-01-01' and '2024-09-27'order by g.gra_fecha desc;select * from uaa u where u.uaa_nombre ;select * from programa p inner join nivel_academico na on p.nia_codigo = na.nia_codigo inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo where p.uaa_codigo_unificado = 811 and nat.nat_codigo in (1,2)select * from dbo.terminos_condiciones tc select * from estudiante e where e.est_codigo like '%20232%'SELECT * FROM dbo.matricula m INNER JOIN dbo.estudiante e on m.est_codigo = e.est_codigo INNER JOIN dbo.persona pe on e.per_codigo = pe.per_codigo INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo WHERE pe.per_codigo = '1003814391'  AND convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin


SELECT docente.per_identificacion AS doc_identificacion, docente.per_apellido AS doc_apellido , 
docente.per_nombre AS doc_nombre, evaluador.per_identificacion AS eva_identificacion,evaluador.per_apellido AS eva_apellido,
evaluador.per_nombre as eva_nombre, ee.eva_periodo, ed.evd_uaa FROM evadoc_evaluador ee
JOIN evadoc_docente ed ON ee.eva_docente = ed.evd_docente
INNER JOIN persona docente ON ed.evd_docente = docente.per_codigo
INNER JOIN persona evaluador ON ee.eva_evaluador = evaluador.per_codigo
WHERE ed.evd_uaa = 63 AND ee.eva_periodo = 124
GROUP BY ee.eva_periodo,ed.evd_uaa,docente.per_codigo,docente.per_identificacion , 
docente.per_apellido ,docente.per_nombre ,evaluador.per_codigo, evaluador.per_identificacion ,
evaluador.per_apellido ,evaluador.per_nombre, ed.evd_uaa;


select * from web_parametro wp where wp.wep_nombre like '%EDUCACION%'SELECT * FROM periodo p 


SELECT docente.per_identificacion AS doc_identificacion, docente.per_apellido AS doc_apellido , 
docente.per_nombre AS doc_nombre, evaluador.per_identificacion AS eva_identificacion,evaluador.per_apellido AS eva_apellido,
evaluador.per_nombre as eva_nombre, ee.eva_periodo, ed.evd_uaa  
FROM evadoc_evaluador ee
LEFT JOIN evadoc_docente ed ON ee.eva_docente = ed.evd_docente 
INNER JOIN persona docente ON ed.evd_docente = docente.per_codigo
INNER JOIN persona evaluador ON ee.eva_evaluador = evaluador.per_codigo 
WHERE 
--docente.per_identificacion ='12136530' AND ee.eva_periodo =124
ed.evd_uaa=63 AND ee.eva_periodo =124
GROUP BY ee.eva_periodo,ed.evd_uaa,docente.per_codigo,docente.per_identificacion , 
docente.per_apellido ,docente.per_nombre ,evaluador.per_codigo, evaluador.per_identificacion ,
evaluador.per_apellido ,evaluador.per_nombre, ed.evd_uaa



select * from dbo.evadoc_evaluador ee --par

select * from dbo.evadoc_docente ed where ed.evd_docente=3382 --uaa


select * from dbo.uaa u where u.uaa_codigo = 814


select * from dbo.persona p where p.per_identificacion = '12136530'

select * from estudiante e where e.est_codigo = '20201186354';
select * from graduado g where g.est_codigo = '20201186354';
select * from estudiante e where e.per_codigo = 149982

select * from persona p where p.per_identificacion = '1075312158'


select * from sgd.documento d where d.doc_contenido = 'Fotos Carnetizacion' and d.doc_nombre_archivo = '137556'

select e.per_codigo from estudiante e where e.est_codigo = '20172163517' and e.est_registro_egresado = 0

select p.per_codigo from persona p where p.per_identificacion = ?

select * from sibusco.restaurante_horario_servicio rhs where rhs.rhs_uaa_codigo = 645;select * from sibusco.restaurante_venta rv where rv.uaa_codigo != 645select * from sibusco.restaurante_horario_servicio rhs 

WITH VentaPorRestaurante AS
(SELECT rhs.rhs_uaa_codigo, rv.rts_codigo, COUNT(rv.rve_codigo) AS ventas FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN sibusco.restaurante_venta rv ON rhs.rhs_uaa_codigo = rv.uaa_codigo and rv.rve_fecha = CONVERT(DATE, '2024-10-07')
left join sibusco.restaurante_grupo_gabu rgg on rv.per_codigo = rgg.per_codigo 
WHERE rhs.rhs_uaa_codigo = 647 AND (CONVERT(TIME, '19:35:00') BETWEEN rhs.rhs_hora_inicio_venta AND rhs.rhs_hora_fin_atencion and rv.rve_eliminado != 0 AND rgg.per_codigo IS NULL)
GROUP BY rhs.rhs_uaa_codigo, rv.rts_codigo)
SELECT rhs.rts_codigo, rts.rts_nombre, rhs.rhs_uaa_codigo, rs.uaa_nombre, rhs.rhs_cantidad_ventas_permitidas,
ventas, rhs.rhs_cantidad_ventas_permitidas - v.ventas AS tiquetes_disponibles, rhs.rhs_hora_inicio_venta,
rhs.rhs_hora_fin_venta FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN VentaPorRestaurante v ON rhs.rhs_uaa_codigo = v.rhs_uaa_codigo AND rhs.rts_codigo = v.rts_codigo
INNER JOIN sibusco.restaurante_tipo_servicio rts on rhs.rts_codigo = rts.rts_codigo
INNER JOIN sibusco.restaurante_sede rs on rhs.rhs_uaa_codigo = rs.uaa_codigo
WHERE CONVERT(TIME, '19:35:00') BETWEEN rhs.rhs_hora_inicio_venta AND rhs.rhs_hora_fin_atencion;

WITH ConsumoPorRestaurante AS
(SELECT rc.uaa_codigo, rc.rcn_fecha, rc.rts_codigo, COUNT(*) AS consumo FROM sibusco.restaurante_consumo rc
left join sibusco.restaurante_grupo_gabu rgg on rc.per_codigo = rgg.per_codigo 
WHERE rc.uaa_codigo = 647  and rc.rcn_fecha = CONVERT(DATE, '2024-10-07') and rgg.per_codigo IS NULL
GROUP BY rc.uaa_codigo, rc.rcn_fecha, rc.rts_codigo)
SELECT rhs.rts_codigo, rts.rts_nombre, rhs.rhs_uaa_codigo, rs.uaa_nombre, rhs.rhs_cantidad_comidas,
consumo, rhs.rhs_cantidad_comidas - c.consumo AS raciones_disponibles, rhs.rhs_hora_inicio_atencion,
rhs.rhs_hora_fin_atencion FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN ConsumoPorRestaurante c ON rhs.rhs_uaa_codigo = c.uaa_codigo AND rhs.rts_codigo = c.rts_codigo
INNER JOIN sibusco.restaurante_tipo_servicio rts on rhs.rts_codigo = rts.rts_codigo
INNER JOIN sibusco.restaurante_sede rs on rhs.rhs_uaa_codigo = rs.uaa_codigo
WHERE CONVERT(TIME, '19:35:00') BETWEEN rhs.rhs_hora_inicio_atencion AND rhs.rhs_hora_fin_atencion;

select * from usuario_sibusco_restaurante_login usrl where usrl.usg_uaa = 645;

select top 1 *, GETDATE() as horaInicioSesion from carnetizacion.usuario_carnet_digital_login ucdl 
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where  ucdl.us = 'u20242223972' and ucdl.usg_usuario != 136525 order by ucdl.istipo asc



select * from  curso_virtual

select * from curso c where c.cur_url is NOT null

select top 1 *, GETDATE() as horaInicioSesion from dbo.usuario_estudiante_login uel 
inner join uaa u on uel.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on uel.up = p.per_codigo 
where  uel.us = 'u2002101615' order by uel.istipo asc

select * from sibusco.restaurante_horario_servicio rhs 

select * from persona p where p.per_identificacion = '1075271006'


select * from persona p where p.per_nombre like '%Jonathan janer%' and p.per_apellido like '%perdomo rojas%';

select * from estudiante e where e.per_codigo = 111483

select * from persona p where p.per_apellido like '%OLAYA ORTIZ%'

select pe.pla_codigo from plan_estudiante pe where pe.est_codigo = '20242228429' and ple_estado = 1

select p.pro_codigo, u.uaa_codigo, ua.uaa_nombre as facultad,
p.pro_registro_snies, u.uaa_nombre, s.sed_nombre, ca.pla_codigo, ca.pla_total_creditos,
ca.creditos_aprobados from estudiante e
inner join programa p on e.pro_codigo = p.pro_codigo
inner join sede s on p.sed_codigo = s.sed_codigo
inner join uaa u on p.uaa_codigo = u.uaa_codigo
inner join uaa ua on u.uaa_dependencia = ua.uaa_codigo
inner join creditos_aprobados ca on e.est_codigo = ca.est_codigo
inner join plan_estudiante pe on ca.pla_codigo = pe.pla_codigo
where ca.est_codigo = '20242228429' and pe.ple_estado = 1 and pe.est_codigo = '20242228429'
--where ca.est_codigo = '20242228429' and pe.ple_estado = 1 and pe.est_codigo = '20242228429'


SELECT per.per_nombre, mti.mti_nombre, ROUND(ppcp.promedio_ponderado, 3) as promedio_ponderado 
FROM matricula mat WITH(NOLOCK) 
INNER JOIN plan_estudiante ple WITH(NOLOCK) ON mat.est_codigo = ple.est_codigo 
INNER JOIN plan_academico pla WITH(NOLOCK) ON ple.pla_codigo = pla.pla_codigo 
INNER JOIN calendario cal WITH(NOLOCK) ON mat.cal_codigo = cal.cal_codigo 
INNER JOIN periodo per WITH(NOLOCK) ON cal.per_codigo = per.per_codigo 
LEFT JOIN matricula_tipo mti WITH(NOLOCK) ON mat.mat_tipo = mti.mti_codigo 
LEFT JOIN promedio_ponderado_con_perdidas ppcp WITH(NOLOCK) ON (mat.est_codigo = ppcp.est_codigo AND mat.mat_codigo = ppcp.mat_codigo) 
LEFT JOIN promedio_aritmetico_con_perdidas pacp WITH(NOLOCK) ON (mat.est_codigo = pacp.est_codigo AND mat.mat_codigo = pacp.mat_codigo) 
WHERE mat.est_codigo = '20242228429'
AND pla.pla_codigo = 959
GROUP BY per.per_nombre, cal.cal_nombre, mat.mat_estado, mti.mti_nombre,  ppcp.promedio_ponderado, pacp.promedio_aritmetico, mat.mat_fecha_actualizacion,mat.mat_codigo 
ORDER by per_nombre desc


SELECT c.cur_codigo, pr.per_nombre as periodo, nt.paa_semestre, nt.paa_credito, 
c.cur_grupo, nt.asi_nombre_corto, nt.asi_nombre, nt.mac_nota, nt.maa_nombre, p.per_codigo, 
p.per_nombre, p.per_apellido, p.per_email_interno FROM notas_total nt 
inner join calendario cal on nt.cal_nombre = cal.cal_nombre 
inner join periodo pr on cal.per_codigo = pr.per_codigo 
inner join curso c on nt.cur_codigo = c.cur_codigo 
inner join uaa_personal up on c.uap_codigo = up.uap_codigo 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE est_codigo = '20242228429'
AND nt.pla_codigo = 959
AND nt.maa_codigo IN(1,2) 
ORDER BY nt.cal_nombre, nt.asi_nombre


select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 169084;
---ucd.us = 'u20242228429'
select * from estudiante e where e.est_codigo = '20242228429'

select puntaje_calificado from puntaje_calificado_estudiante_activo where est_codigo = '20242228429'

select * from usuario_sibusco_restaurante_login usrl where usrl.usg_uaa = 645

select * from persona p where p.per_email_interno = 'luz.castrillon@usco.edu.co'

select * from estudiante e where e.per_codigo = 160791

select * from token.codigo_inicio_sesion cis where 

select * from estudiante e where e.est_codigo = '20202192639'

select * from usuario_sibusco_restaurante_login 

---DOCUEMNTOS ADMITIDOS:::

--fehca 21-06-2024 || 24-06-2024

select * from web_parametro wp where wp.wep_nombre like '%documen%'

select * from aud_inscripcion_documentos aid 

select * from inscripcion i 


select * from inscripcion_documentos id 
inner join inscripcion_documentos_configuracion idc on id.idc_codigo = idc.idc_codigo
inner join inscripcion_documentos_tipo idt on idc.idt_codigo = idt.idt_codigo 
inner join inscripcion i on id.ins_codigo = i.ins_codigo
inner join persona p on i.per_codigo = p.per_codigo 
where convert(Date, id.ind_fecha) BETWEEN '2024-06-25' AND GETDATE() and idt.idt_codigo in (4,1) 
order by id.ins_codigo 


select * from inscripcion_documentos id 
inner join inscripcion_documentos_configuracion idc on id.idc_codigo = idc.idc_codigo
inner join inscripcion_documentos_tipo idt on idc.idt_codigo = idt.idt_codigo 
inner join inscripcion i on id.ins_codigo = i.ins_codigo
inner join persona p on i.per_codigo = p.per_codigo 
where convert(Date, id.ind_fecha) BETWEEN '2024-06-13' AND '2024-06-17' and idt.idt_codigo in (4,1)
order by id.ins_codigo 


select * from inscripcion_documentos id 
inner join inscripcion_documentos_configuracion idc on id.idc_codigo = idc.idc_codigo
inner join inscripcion_documentos_tipo idt on idc.idt_codigo = idt.idt_codigo 
where convert(Date, id.ind_fecha) BETWEEN '2024-06-25' AND GETDATE() and idt.idt_codigo in (4,1)
order by id.ins_codigo 

group by id.ins_codigo 

select * from inscripcion_documentos_tipo idt 


select * from 

select * from persona p where p.per_apellido like '%vargas silva%'

select * from persona p where p.per_identificacion = '1007359722';
select * from graduado g where g.est_codigo = '20181169481'

select * from estudiante e where e.per_codigo = 139961

---:::::::::::::::::::::::



select * from programa p 
inner join uaa u on p.uaa_codigo  = u.uaa_codigo 
where p.pro_registro_snies = '110114'


SELECT * FROM encuestas.cuestionarios c where c.cue_codigo = 47

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 47
SELECT * FROM persona p where p.per_apellido like '%CORDOBA DIAZ%'
SELECT * FROM persona p where p.per_apellido like '%CUELLAR SALAS%'
SELECT * FROM persona p where p.per_nombre = 'DANIELA' and p.per_apellido like '%ALARCÓN%'
SELECT * FROM persona p where p.per_nombre like '%MICHELLE%' and p.per_apellido like '%LOZANO%'
SELECT * FROM persona p where p.per_nombre = 'JUAN DIEGO' and p.per_apellido like '%MEDINA TRUJILLO%'
SELECT * FROM persona p where p.per_nombre = 'JULIAN ANDRES' and p.per_apellido like '%ORTEGA%'
SELECT * FROM persona p where p.per_nombre = 'cristian julian' and p.per_apellido like '%andrade%'
SELECT * FROM persona p where p.per_nombre = 'DIEGO ANDRES' and p.per_apellido like '%CARVAJAL%'
SELECT * FROM persona p where p.per_nombre = 'ALEJANDRO' and p.per_apellido like '%CABARCAS%'
SELECT * FROM persona p where p.per_nombre = 'MARCO ANTONIO' and p.per_apellido like '%CEBALLOS'
SELECT * FROM persona p where p.per_apellido like '%FAJARDO OROZCO%'
SELECT * FROM persona p where p.per_nombre like '%diana patricia%' and p.per_apellido like '%sanchez losada%'
SELECT * FROM persona p where p.per_nombre = 'LEIDY DAYANA' and p.per_apellido like '%ORTEGA%'
SELECT * FROM persona p where p.per_nombre like '%JOHAN CAMILO%' and p.per_apellido like '%MONTERO%'
SELECT * FROM persona p where p.per_nombre = 'MARITZA' and p.per_apellido like '%SALAS%'
SELECT * FROM persona p where p.per_nombre LIKE '%MARTHA%' and p.per_apellido like '%HERMOSA%'
SELECT * FROM persona p where p.per_nombre = 'OSCAR DOUGLAS' and p.per_apellido like '%PLAZAS%'
SELECT * FROM persona p where p.per_nombre = 'VANESSA' and p.per_apellido like '%VARGAS BOLIVAR%'
SELECT * FROM persona p where p.per_nombre = 'STEPHANIA' and p.per_apellido like '%ZAMBRANO GUERRA%'
SELECT * FROM persona p where p.per_nombre = 'NIDIA' and p.per_apellido like '%GUZMAN%'
select * from persona p where p.per_nombre like '%CARLOS%' and p.per_apellido like '%SALAMANCA%'
select * from persona p where p.per_nombre like '%JOSE GABRIEL%' and p.per_apellido like '%CHICA%'
select * from persona p where p.per_nombre like '%JORGE ELIECER%' and p.per_apellido like '%GAITAN%'
select * from persona p where p.per_nombre like '%JUAN MANUEL%' and p.per_apellido like '%GONZALEZ%'
select * from persona p where p.per_nombre like '%Maria Fernanda%' and p.per_apellido like '%Jaime Osorio%'
select * from persona p where p.per_nombre like '%Ramon Eduardo%' and p.per_apellido like '%Bautista Oviedo%'
select * from persona p where p.per_nombre like '%Alfonso%' and p.per_apellido like '%Manrique Medina%'
select * from persona p where p.per_nombre like '%JONATHAN%' and p.per_apellido like '%PERDOMO%'
select * from persona p where p.per_nombre like '%jorge andres%' and p.per_apellido like '%RAMIREZ%'
select * from persona p where p.per_nombre like '%yenifer lorena%' and p.per_apellido like '%cordoba ipuz%'
select * from persona p where p.per_nombre like '%aura maria%' and p.per_apellido like '%gonzalez%'
select * from persona p where p.per_nombre like '%john jairo%' and p.per_apellido like '%guerrero fierro%'
select * from persona p where p.per_nombre like '%lina%' and p.per_apellido like '%cepeda%'
select * from persona p where p.per_nombre like '%daniela%' and p.per_apellido like '%bahamon castaño%'
select * from persona p where p.per_nombre like '%angela%' and p.per_apellido like '%alarcon vargas%'
select * from persona p where p.per_nombre like '%sergio andres%' and p.per_apellido like '%ninco%'
select * from persona p where p.per_nombre like '%zully%' and p.per_apellido like '%cuellar lopez%'
select * from persona p where p.per_nombre like '%julian marino%' and p.per_apellido like '%trujillo%'select * from persona p where p.per_nombre like '%eidy%' and p.per_apellido like '%cleves%'
select * from persona p where p.per_codigo = 129470;

select * from estudiante e where e.

select * from matricula m 

select * from persona p where p.per_codigo = 56457

SELECT * FROM dbo.matricula m 
INNER JOIN dbo.estudiante e on m.est_codigo = e.est_codigo 
INNER JOIN dbo.persona pe on e.per_codigo = pe.per_codigo 
INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo 
INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo 
WHERE pe.per_codigo = 47440 AND convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin;
--WHERE (m.est_codigo = '1079187146' or pe.per_identificacion = '1079187146') AND convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin;

select * from sgd.documento d where d.doc_contenido like '%Fotos Carnetizacion%'


SELECT * FROM dbo.persona p 
INNER JOIN dbo.estudiante e on p.per_codigo = e.per_codigo 
INNER JOIN dbo.matricula m on m.est_codigo = e.est_codigo 
INNER JOIN dbo.programa po on e.pro_codigo = po.pro_codigo 
INNER JOIN dbo.nivel_academico na on po.nia_codigo = na.nia_codigo 
INNER JOIN dbo.nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo and nat.nat_codigo in (1,2) 
INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo 
INNER JOIN dbo.periodo pe ON pe.per_codigo = c.per_codigo 
LEFT JOIN graduado g on e.est_codigo = g.est_codigo 
WHERE p.per_codigo = 104284 AND convert(Date, GETDATE()) BETWEEN pe.per_fecha_inicio AND pe.per_fecha_fin 
order by g.gra_fecha desc;


select p.per_codigo, p.per_identificacion, m.est_codigo, g.gra_fecha from dbo.persona p 
INNER JOIN dbo.estudiante e on p.per_codigo = e.per_codigo 
INNER JOIN dbo.matricula m on e.est_codigo = m.est_codigo 
INNER JOIN dbo.calendario c ON m.cal_codigo = c.cal_codigo 
INNER JOIN dbo.periodo pe ON c.per_codigo = pe.per_codigo 
LEFT JOIN dbo.graduado g on e.est_codigo = g.est_codigo 
WHERE convert(Date, GETDATE()) BETWEEN pe.per_fecha_inicio AND pe.per_fecha_fin
group by p.per_codigo, p.per_identificacion, m.est_codigo, g.gra_fecha;


SELECT * FROM dbo.matricula m 
INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo 
INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo 
WHERE m.est_codigo = '20171155993' AND 
convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin 

select top 500 * from estudiante_virtual

select * from encuestas.cuestionarios c where c.cue_codigo = 48

select * from web_parametro wp where wp.wep_nombre like '%ENCUESTA%'

select * from web_parametro wp where wp.wep_codigo in (419,433)

select * from web_parametro wp where wp.wep_codigo in (435,436)

select * from web_parametro wp where wp.wep_codigo in (457,458)

select * from web_parametro wp where wp.wep_codigo in (520,521)

select * from web_parametro wp where wp.wep_codigo in (419,433,435,4366,457,458,529,521)

select * from persona p where p.per_email_interno = 'jhon.castaneda@usco.edu.co';

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 125399;

select * from encuestas.cuestionarios c order by c.cue_codigo desc

select * from sibusco.res

select * from dbo.usuario_graduado_admin_login ugal 

select * from estudiante e where e.est_codigo = '20151134866'

select * from token.codigo_inicio_sesion cis 

select * from modulo m 

select * from persona p where p.per_identificacion = '1004773533'

select * from persona p where p.per_apellido = 'CRUZ ROJAS'

select * from usuario_graduado_admin_login ugl where ugl.us in ('a1075303330','a1075261344')

select * from persona p where p.per_email_interno like '%U2015%'
select * from persona p where p.per_apellido like '%GALINDO CHARRY%'
select * from estudiante e WHERE e.per_Codigo = 123221

select * from dbo.usuario_graduado_admin_login ugal 

select * from uaa_personal up where up.per_codigo = 171797

select * from estudiante_virtual ev where ev.est_codigo = '20191177081';

select * from web_parametro wp WHERE wp.wep_nombre like '%sincronizador%'

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 45

select * from encuestas.cuestionarios c where c.cue_codigo = 8

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 8 

select * from encuestas.preguntas p where p.cue_codigo = 8 and p.pre_estado = 1

select * from persona p 
inner join uaa_personal up on p.per_codigo = up.per_codigo 
where up.uaa_codigo = 463 order by up.uap_codigo desc

select * from persona p where p.per_apellido LIKE '%HERMOSA TRUJILLO%';
Sofía Burgos Huergo

select * from carnetizacion.ticket_estudiante_ileusco tei 

select * from carnetizacion.ticket_estudiante_ileusco tei 

SELECT * FROM estudiante e where e.per_codigo = 144065
SELECT * from modulo m order by m.mod_codigo  desc 

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

select ut.tus_codigo, ut.tus_nombre, nat.nat_codigo from carnetizacion.usuario_carnet_digital ucd 
inner join uaa u on ucd.usg_uaa = u.uaa_codigo
left join programa p on u.uaa_codigo = p.uaa_codigo 
left join nivel_academico na on p.nia_codigo = na.nia_codigo 
left join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 150152 
group by ut.tus_codigo, ut.tus_nombre, nat.nat_codigo


select * from persona p where p.per_identificacion = '1003803003'

UPDATE academia3000.encuestas.cuestionarios SET uaa_codigo=627 WHERE cue_codigo=41;

select * from 

select * from encuestas.cuestionarios c 

select * from web_parametro wp; 

select * from grupo ;

SELECT * from persona p where p.per_apellido = 'GARCIA PIMENTEL'; 

select * from uaa u where u.uaa_codigo = 463

select * from bloque b ;

select * from uaa u where u.uaa_nombre like '%POL%';
SELECT * from programa p where p.uaa_codigo = 563

select * from estudiante e where e.pro_codigo = 411

WITH CTE AS (SELECT eai.eil_codigo, eai.tii_nombre_corto, eai.per_identificacion, eai.nombre, eai.reg_email, tei.tei_codigo, tei.tei_fecha_vigencia,
        ROW_NUMBER() OVER (PARTITION BY eai.per_identificacion ORDER BY tei.tei_fecha_vigencia DESC) AS RowNumber FROM ileusco.estudiantes_activos_ileusco eai
		LEFT JOIN carnetizacion.ticket_estudiante_ileusco tei ON eai.eil_codigo = tei.eil_codigo)
SELECT eil_codigo, tii_nombre_corto, per_identificacion, nombre, reg_email, tei_codigo, tei_fecha_vigencia FROM CTE
WHERE RowNumber = 1
ORDER BY tei_fecha_vigencia desc;


select * from persona p where p.per_apellido = 'CARVAJAL RUIZ'
select * from persona p where p.per_apellido = 'Castañeda Calderon'
select * from encuestas.cuestionarios c;

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 44;

select DISTINCT per.per_codigo as ile_codigo, tii.tii_nombre_corto, per.per_identificacion, (per.per_nombre+' '+per.per_apellido) as nombre, r.reg_email from ileusco.registro r
inner join persona per on per.per_codigo = r.reg_per_codigo
inner join tipo_id tii on tii.tii_codigo = per.tii_codigo
inner join ileusco.oferta o on o.ofe_codigo = r.reg_ofe_codigo
inner join ileusco.periodo p on p.per_codigo = o.ofe_per_codigo
where r.reg_estado = 2 and r.reg_fac_codigo is not null and p.per_codigo in (select top 12 p.per_codigo from ileusco.periodo p order by p.per_codigo desc)
UNION
select DISTINCT ter.ter_codigo as ile_codigo, tii.tii_nombre_corto, ter.ter_identificacion, ter_nombre, r.reg_email from ileusco.registro r
inner join tercero ter on ter.ter_codigo = r.reg_ter_codigo
inner join tipo_id tii on tii.tii_codigo = ter.tii_codigo
inner join ileusco.oferta o on o.ofe_codigo = r.reg_ofe_codigo
inner join ileusco.periodo p on p.per_codigo = o.ofe_per_codigo
where r.reg_estado = 2 and r.reg_fac_codigo is not null and p.per_codigo in (select top 12 p.per_codigo from ileusco.periodo p order by p.per_codigo desc);

select count(*) from ileusco.estudiantes_activos_ileusco

Select p.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from persona p where p.per_fecha_nacimiento = '1969-12-31' and p.per_fecha_expedicion > '1978-01-01'

Select count(*) from persona p where p.per_fecha_nacimiento = '1969-12-31' and p.per_fecha_expedicion > '1978-01-01'

select * from aud_persona ap where ap.per_codigo = 137556 order by ap.aud_fecha desc

select * from persona p where p.per_apellido like '%ALARCÓN%'

select * from ileusco.registro r where r.reg_per_codigo = 140591
select * from ileusco.registro r where r.reg_per_codigo = 153123

select count(*) from ileusco.registro r WHERE r.reg_estado = 2 and r.reg_fac_codigo is not null and r.reg_ofe_codigo in (select top 12 p.per_codigo from ileusco.periodo p order by p.per_codigo desc)
select * from ileusco.registro r WHERE r.reg_estado = 2 and r.reg_fac_codigo is not null


select * from ileusco.oferta o 


select * from ileusco.estudiantes_periodo

select * from persona p where p.per_apellido = 'MUÑOZ CORONADO'
select * from persona p where p.per_nombre = 'LAURA LILEN'
SELECT * FROM tipo_id ti 

select * from web_parametro wp where wp.wep_codigo = 204

SELECT * FROM estudiante e where e.per_codigo = 149849
where 

select * from persona p where p.per_nombre = 'JONATHAN JANER'

select * from persona p where p.per_apellido = 'CANO TORO'

DECLARE @CodigoContrato INT;
DECLARE @CodigoSede INT;
SET @CodigoSede = (SELECT rv.uaa_codigo FROM sibusco.restaurante_venta rv 
	WHERE rv.per_codigo = 159266 AND rv.rve_estado = 1
	group by rv.uaa_codigo);
               
SET @CodigoContrato = (SELECT rco_codigo FROM sibusco.restaurante_contrato rc 
	INNER JOIN sibusco.restaurante_tipo_contrato rtc ON rtc.rtc_codigo  = rc.rtc_codigo 
	INNER JOIN dbo.uaa u ON u.uaa_codigo = rc.rco_uaa_codigo 
	WHERE rc.rco_uaa_codigo = @CodigoSede AND rc.rtc_codigo = 2 AND rc.rco_estado = 1 AND CONVERT(DATE, GETDATE()) BETWEEN rc.rco_fecha_inicial AND rc.rco_fecha_final);
 
IF @CodigoContrato > 1
BEGIN
    select u.uaa_nombre, rts.rts_codigo, rts.rts_nombre, count(*) as cantidad, rc.rco_fecha_final from sibusco.restaurante_venta rv 
	inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
	inner join sibusco.restaurante_pibote_adicion rpa on rv.rco_codigo = rpa.rco_codigo_general 
	inner join sibusco.restaurante_contrato rc on rpa.rco_codigo_adicion =  rc.rco_codigo 
	inner join dbo.uaa u on rv.uaa_codigo = u.uaa_codigo 
	where rv.per_codigo = 159266 and rv.rve_estado = 1 and rc.rco_estado = 1 and convert(Date, GETDATE()) between rc.rco_fecha_inicial  and rc.rco_fecha_final 
	group by u.uaa_nombre,rts.rts_codigo, rts.rts_nombre, rc.rco_fecha_final
END
ELSE
BEGIN
    select u.uaa_nombre, rts.rts_codigo, rts.rts_nombre, COUNT(*) as cantidad, rc.rco_fecha_final 
	from sibusco.restaurante_venta rv
	inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
	inner join sibusco.restaurante_contrato rc on rv.rco_codigo =  rc.rco_codigo 
	inner join dbo.uaa u on rv.uaa_codigo = u.uaa_codigo 
	where rv.per_codigo = 159266 and rv.rve_estado = 1 and rc.rco_estado = 1 and convert(Date, GETDATE()) between rc.rco_fecha_inicial  and rc.rco_fecha_final
	group by u.uaa_nombre,rts.rts_codigo, rts.rts_nombre, rc.rco_fecha_final 
END

select * from persona p where p.per_identificacion = '1006518767'


select * from persona p where p.per_identificacion = '36304727'

select * from sibusco.restaurante_contrato rc 

select * from sibusco.restaurante_grupo_gabu rgg

select * from sibusco.restaurante_venta rv 

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where p.per_identificacion = '1003805915'

select * from modulo m 

select * from s

select * from usuario_grupo ug
inner join grupo g on ug.usg_grupo = g.gru_codigo
where ug.usg_usuario = 77407 and ug.usg_estado = 1

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 44

select * from encuestas.preguntas p where p.cue_codigo = 44;
select * from encuestas.preguntas_respuestas ps where ps.pre_codigo = 1050

select * from encuestas.respuestas_opciones ro where ro.rop_codigo in  (417,418)

SELECT * FROM uaa where uaa_nombre like '%bienestar%'

select * from uaa where uaa_dependencia = 517

SELECT * FROM uaa where uaa_dependencia = 1042
SELECT * FROM uaa where uaa_codigo = 645

SELECT * FROM uaa where uat_tipo = 22


select * from persona p where p.per_email_interno = 'nubia.sanmiguel@usco.edu.co' ---66595


SELECT * from usuario_notas_posgrados_programa_login unppl 

select * from estudiante e where e.est_codigo = '20191176712'

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 40

select * from persona p where p.per_email_interno = 'edgar.perdomo@usco.edu.co'

select * from persona p where p.per_identificacion = '1077865570'
select * from usuario_general_login ugl where ugl.us = 'u20201187176' or ugl.us = 'u20171157616'
select * from estudiante e where e.est_codigo = '20201187176'
select * from usuario_estudiante_login ugl where ugl.us = 'u20201187176' or ugl.us = 'u20171157616' 

select * from usuario_

select * from persona p where p.per_identificacion = '1083917616';
select * from persona p where p.per_codigo = 150387
select * from uaa_personal up where up.per_codigo = 109237 

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 41


select * from vinculacion v 

select * from uaa_personal up where up.per_codigo = 49466

select * from usuario_sibusco_restaurante_login usrl 

select top 1 * from carnetizacion.usuario_carnet_digital_login ucdl 
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo   
where  ucdl.us = 'u20241221957' and ucdl.usg_usuario != 136525 order by ucdl.istipo asc

select * from persona p where p.per_nombre like 'MISHAEL%'

select e.est_codigo, p.per_apellido, p.per_nombre  from persona p 
inner join estudiante e on p.per_codigo = e.per_codigo 
where p.per_apellido like 'ORDOÑEZ%'

select * from persona p where p.per_codigo in (80043,177140)
80043

20241222461

select ucd.usg_usuario, ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 150387 group by ucd.usg_usuario, ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us 
order by ucd.usg_usuario desc

select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 150387 



select * from estudiante e where e.est_codigo = '20201186928'

select * from programa p where p.pro_codigo = 8

select * from uaa u where u.uaa_codigo in (36,793)


select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 40 



select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_creacion_snies,
CASE WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado ,
CASE WHEN pro_estado = 01 THEN 'SI' ELSE 'NO' END AS oferta,
p.pro_creacion_snies, p.pro_fecha_creacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,
p.pro_registro_snies, p.pro_registro_icfes, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, c.con_descripcion, pe.pre_nombre, r.res_numero, tn.tin_nombre, nat.nat_nombre, na.nia_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ca.cam_codigo, ce.cam_esp_nombre, ce.cam_esp_codigo, cd.cam_det_nombre, cd.cam_det_codigo, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+ pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe,
(select top 1 pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as email,
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo 
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACIÓN' and ica.ica_estado = 1) as coordinador 
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
left join convenio c on c.con_codigo = p.con_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  
where p.pro_codigo = ?


select p.pro_codigo, p.pro_registro_snies, u.uaa_codigo, p.pro_fecha_creacion, p.pro_creacion_snies, u.uaa_nombre, s.sed_codigo, s.sed_nombre, j.jor_nombre, nat.nat_nombre, na.nia_nombre, fa.uaa_nombre, f.for_nombre from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join formalidad f on na.for_codigo = f.for_codigo 
inner join uaa fa on u.uaa_dependencia = fa.uaa_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo
where f.for_codigo = 1 and p.pro_estado = 1

select * from encuestas.cuestionarios c 

left join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
left join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  

select * from convenio c 
select * from dbo.formalidad f  
select * from nivel_academico na 


SELECT * FROM dbo.matricula m 
INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo 
INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo 
WHERE m.est_codigo = '20202191161' AND 
convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin

select * from carnetizacion.vigilantes


select * from encuestas.cuestionarios c 

SELECT * FROM dbo.web_parametro wp where wp.wep_codigo = 377

select * from persona p where p.per_nombre like '%Lilia Susana%'

select * from dbo.modulo m 
select * from matricula m where m.est_codigo = '20171157616'

select * from persona p where p.per_identificacion = '1003895686'--163858
select * from estudiante e where e.per_codigo = 163858

select * from usuario_sibusco_restaurante_login

select * from modulo m order by m.mod_codigo DESC 

select * from persona p where p.per_nombre like '%JOSE ESTEBAN%' and p.per_apellido like '%CORDOBA%'
select * from matricula m where m.est_codigo = '20181166864'
select * from matricula_tipo mt 
select * from calendario c where c.cal_codigo = 219
select * from sgd.tipo_documento td 

select * from acreditacion.invitacion_programa_acreditable ipa

select * from web_parametro wp 

select * from usuario_sibusco_restaurante_login usrl 
inner join uaa u on u.uaa_codigo = usrl.usg_uaa 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on p.per_codigo = usrl.up 
where  usrl.us = 'a36168373' and usrl.gru_codigo = 88

select COUNT(usrl.us) from usuario_sibusco_restaurante_login usrl 
inner join uaa u on u.uaa_codigo = usrl.usg_uaa 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on p.per_codigo = usrl.up 
where  usrl.us = 'a36168373' and usrl.gru_codigo = 88

select * from carnetizacion.usuario_carnetizacion_admon_login ucal 

select * from modulo m order by m.mod_codigo desc

select * from 

select * from creditos


select count(*) from acreditacion.admitidos_acreditacion aa where aa.periodo = '20232'

select * from dbo.usuario_graduado_admin_login ugal  
inner join uaa u on u.uaa_codigo = ugal.usg_uaa 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on p.per_codigo = ugal.up 
where  us = ? 

select p.pro_codigo, p.sed_codigo, s.sed_nombre, j.jor_nombre, p.uaa_codigo, p.pro_registro_icfes, p.pro_registro_snies, nat.nat_nombre, na.nia_nombre, m.mod_nombre, u.uaa_nombre, p.pro_titulo_otorgado, p.pro_fecha_creacion, u.uaa_email, u.uaa_email_pqr, u.uaa_jefe, u.uaa_pagina, p.pro_creacion_snies from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
where u.uaa_dependencia = 23 and u.uaa_estado = 1 and p.pro_estado in (1,5) and p.pro_propio = 'S'
-- and p.pro_creacion_snies is not null

select * from programa p 

select * from plan_academico_asignatura paa where paa.pla_codigo = 1001

select * from plan_academico pa where pa.pro_codigo = 15

select * from programa_estado pe 


select * from encuestas.cuestionarios c where c.cue_codigo = 22

select * from usuario_graduado ug 

select * from carnetizacion.usuario_carnet_digital ucd 

select * from sibusco.restaurante_sede rs 

select * from plan_academico pa where pa.pro_codigo = 16

select * from web_parametro w where w.wep_nombre like '%ENCUESTA%'

select * from persona p where p.per_nombre = 'DOLLY ORFILIA'

select e.est_codigo  from persona p 
inner join estudiante e on p.per_codigo = e.per_codigo 
where p.per_codigo = 108797

select * from uaa u where u.uaa_nombre like '%FACULTAD%'

Select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where p.per_identificacion  = '1075240473' order by g.gra_fecha desc


select * from encuestas.cuestionarios c 

select u.uaa_nombre, e.est_codigo from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa p2 on e.pro_codigo = p2.pro_codigo 
inner join uaa u on p2.uaa_codigo = u.uaa_codigo 
where p.per_identificacion = '1075240473'

select * from graduado g where g.est_codigo = '2006263397'

select * from estudiante e where e.est_codigo = '2006263397'

select * from persona p where p.per_nombre = 'LEIDY TATIANA' and p.per_apellido = 'RAMIREZ GOMEZ'

select * from graduado g where g.est_codigo = '20142131557'

select * from persona p 
inner join estudiante e on p.per_codigo = e.per_codigo
where e.est_codigo = '20142131557'

select * from calendario c where c.cal_codigo in (225, 226)
select * from calendario c where c.cal_codigo = 225

select * from  asignatura a 
select * from uaa_personal up 
select * from uaa u 
select * from calendario c 
select * from curso c

select * from web_parametro wp where wp.wep_codigo = 177

select * from matricula_curso_actual mca 

WITH GraduadosConNumeros AS (
SELECT 
        s.sed_nombre, 
        u2.uaa_nombre AS facultad, -- Alias para la columna 'uaa_nombre' de la tabla 'u2'
        nat.nat_nombre, 
        u.uaa_nombre AS programa, -- Alias para la columna 'uaa_nombre' de la tabla 'u'
        p.per_nombre, 
        p.per_apellido, 
        ti.tii_nombre_corto, 
        p.per_identificacion, 
        ROW_NUMBER() OVER (PARTITION BY p.per_identificacion ORDER BY g.gra_fecha DESC) AS NumeroFila
    FROM graduado g
        INNER JOIN estudiante e ON g.est_codigo = e.est_codigo
        LEFT JOIN  persona p ON e.per_codigo =p.per_codigo
        LEFT JOIN tipo_id ti ON p.tii_codigo = ti.tii_codigo
        INNER JOIN programa pr ON e.pro_codigo = pr.pro_codigo
        INNER JOIN nivel_academico na ON pr.nia_codigo = na.nia_codigo
        INNER JOIN nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
        INNER JOIN sede s on pr.sed_codigo = s.sed_codigo 
        LEFT JOIN uaa u on pr.uaa_codigo = u.uaa_codigo 
        LEFT JOIN uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
    WHERE pr.pro_propio = 'S' AND -- na.nia_codigo IN (11)-- AND s.sed_codigo in (1)
    nat.nat_codigo in (1,2))
SELECT
    sed_nombre, 
    facultad, 
    nat_nombre, 
    programa, 
    per_nombre, 
    per_apellido, 
    tii_nombre_corto, 
    per_identificacion 
FROM
    GraduadosConNumeros
WHERE
    NumeroFila = 1
ORDER BY 
	sed_nombre, programa asc
    
select * from sede s 

/*
 * 
 * En este ejemplo, la función ROW_NUMBER() asigna un número de fila a cada fila de la partición especificada por IDGraduado, 
 * ordenada por FechaGrado en orden descendente. Luego, la consulta principal selecciona solo las filas donde el número de fila es 1,
 *  lo que significa que solo se seleccionará la última fecha de grado para cada graduado.
 * 
 * */

WITH GraduadosConNumeros AS (
    SELECT
        s.sed_nombre,
        u2.uaa_nombre AS facultad, -- Alias para la columna 'uaa_nombre' de la tabla 'u2'
        nat.nat_nombre, 
        u.uaa_nombre AS programa, -- Alias para la columna 'uaa_nombre' de la tabla 'u'
        p.per_nombre, 
        p.per_apellido, 
        ti.tii_nombre_corto, 
        p.per_identificacion, 
        ROW_NUMBER() OVER (PARTITION BY p.per_identificacion ORDER BY g.gra_fecha DESC) AS NumeroFila
    FROM persona p
		INNER JOIN tipo_id ti ON p.tii_codigo = ti.tii_codigo
		INNER JOIN estudiante e ON p.per_codigo = e.per_codigo
		INNER JOIN programa pr ON e.pro_codigo = pr.pro_codigo
		INNER JOIN nivel_academico na ON pr.nia_codigo = na.nia_codigo
		INNER JOIN nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
		INNER JOIN graduado g ON e.est_codigo = g.est_codigo
		INNER JOIN sede s on pr.sed_codigo = s.sed_codigo 
		INNER JOIN uaa u on pr.uaa_codigo = u.uaa_codigo 
		INNER JOIN uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
	WHERE pr.pro_propio = 'S' AND na.nia_codigo IN (4, 9, 11, 12, 13, 14)
	--nat.nat_codigo in (1,2)
)

SELECT
    sed_nombre, 
    facultad, 
    nat_nombre, 
    programa, 
    per_nombre, 
    per_apellido, 
    tii_nombre_corto, 
    per_identificacion 
FROM
    GraduadosConNumeros
WHERE
    NumeroFila = 1
ORDER BY 
	sed_nombre asc




	
	
	
	
	
	
	WITH GraduadosConNumeros AS (
    SELECT
        CASE 
            WHEN s.sed_codigo IN (1, 2, 3, 4) THEN s.sed_nombre
            ELSE 'NEIVA' 
        END AS sed_nombre, 
        u2.uaa_nombre AS facultad, 
        nat.nat_nombre, 
        na.nia_nombre,
        u.uaa_nombre AS programa, 
        p.per_nombre, 
        p.per_apellido, 
        ti.tii_nombre_corto, 
        p.per_identificacion, 
        ROW_NUMBER() OVER (PARTITION BY p.per_identificacion ORDER BY g.gra_fecha DESC) AS NumeroFila
    FROM persona p
		INNER JOIN tipo_id ti ON p.tii_codigo = ti.tii_codigo
		INNER JOIN estudiante e ON p.per_codigo = e.per_codigo
		INNER JOIN programa pr ON e.pro_codigo = pr.pro_codigo
		INNER JOIN nivel_academico na ON pr.nia_codigo = na.nia_codigo
		INNER JOIN nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
		INNER JOIN graduado g ON e.est_codigo = g.est_codigo
		INNER JOIN sede s on pr.sed_codigo = s.sed_codigo 
		INNER JOIN uaa u on pr.uaa_codigo = u.uaa_codigo 
		INNER JOIN uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
	WHERE pr.pro_propio = 'S' AND nat.nat_codigo in (1,2)
)

SELECT
    sed_nombre, 
    facultad, 
    nat_nombre, 
    nia_nombre,
    programa, 
    per_nombre, 
    per_apellido, 
    tii_nombre_corto, 
    per_identificacion 
FROM
    GraduadosConNumeros
WHERE
    NumeroFila = 1
ORDER BY 
	sed_nombre asc















































select * from estudiante e where e.est_codigo = '20161147560'

select * from periodo p 

select * from persona p 

select * from espacio_ocupacion eo 

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionarios c order by c.cue_codigo desc

select * from encuestas.respuestas_opciones ro 


select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 100675

SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre,
p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno
FROM usuario_general_login u
INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo
INNER JOIN persona p ON u.up = p.per_codigo
WHERE u.us like '38943401' and u.state != 0 ORDER by istipo asc

select * from progr

select * from dbo.nivel_academico na where na.nia_estado = 1 and na.nat_codigo = 1 order by na.nia_codigo desc

select * from acreditacion.matriculados_acreditacion ma where ma.periodo = '20232'

select * from uaa_personal up 

select * from graduado.graduado.historial_academico ha

select * from cargo c 
select * from uaa_personal up 

select * from persona p where p.per_identificacion = '7706716'

select * from graduado.reportes.competencia_evaluacion ce where ce.per_codigo = 108797

select * from estudiante e where e.per_codigo = 21565

--Paola Andrea García Marroquín

select * from persona p where p.per_apellido like '%GARCIA MARROQUIN%'

select * from tercero t  where t.ter_nombre like '%Paola Andrea Garcia Marroquin%'

select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
inner join matricula m on e.est_codigo = m.est_codigo  
inner join matricula_tipo mt on m.mat_tipo = mt.mti_codigo 
where e.est_codigo = '20231215046' order by m.mat_codigo desc

select * from web_parametro wp where wp.wep_nombre like '%posgrado%'

select * from nivel_academico na 

select * from sgd.tipo_documento td 

select * from calendario c 

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where p.per_identificacion  = '1075303330' order by g.gra_fecha desc

select * from web_parametro wp where wp.wep_nombre like '%matricula%' --278 y 267

select * from web_parametro wp where wp.wep_codigo = 278 --278 y 267

select * from periodo p 
select * from calendario c 


SELECT ip.inp_codigo, iap.iap_codigo, pap.pap_ponderado, iap.iap_puntaje,
((pap.pap_ponderado * iap.iap_puntaje)/100.0) as ponderado, SUBSTRING(ic.icf_snp,3,5) as anio
FROM inscripcion i
INNER JOIN inscripcion_programa ip ON i.ins_codigo = ip.ins_codigo
INNER JOIN oferta_academica oa ON oa.ofa_codigo = ip.ofa_codigo
INNER JOIN cupo c ON (c.ofa_codigo = oa.ofa_codigo AND c.moi_codigo = i.moi_codigo AND c.cup_estado = 1)
INNER JOIN proceso_seleccion ps ON c.cup_codigo = ps.cup_codigo
INNER JOIN icfes ic ON i.icf_snp = ic.icf_snp
INNER JOIN icfes_area_puntaje iap ON iap.icf_snp = ic.icf_snp
INNER JOIN programa_area_ponderado pap ON (pap.ofa_codigo = oa.ofa_codigo AND pap.ica_codigo = iap.ica_codigo AND (pap.pap_estado = 1 OR pap.pap_estado is null))
INNER JOIN programa p ON p.pro_codigo = oa.pro_codigo
WHERE oa.ofa_codigo = 2909 AND ic.icf_antiguedad in (0,1) AND i.ies_codigo = 5 
AND ip.inp_codigo = 189258
AND i.ins_modulo1 is not null AND i.ins_modulo2 is not null AND i.ins_modulo3 is not null
ORDER BY ip.inp_codigo



select * from admision_resultado where inp_codigo = 189258

select * from inscripcion_programa where ins_codigo = 217278

-- PUNTAJE ICFES PROGRAMA CONTADURIA PUBLICO
select pe.per_año, pe.per_nombre, e.est_codigo, s.sed_nombre, u.uaa_nombre, ar.adr_puntaje from admision_resultado ar 
inner join inscripcion_programa ip on ar.inp_codigo = ip.inp_codigo 
inner join inscripcion i on ip.ins_codigo = i.ins_codigo 
inner join persona pr on i.per_codigo = pr.per_codigo 
inner join estudiante e on pr.per_codigo = e.per_codigo 
inner join oferta_academica oa on ip.ofa_codigo = oa.ofa_codigo 
inner join calendario c on oa.cal_codigo = c.cal_codigo 
inner join periodo pe on c.per_codigo = pe.per_codigo 
inner join programa p on oa.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
where p.uaa_codigo_unificado = 792 and pe.per_año >= 2018

select * from departamento d 
inner join municipio m on d.dep_codigo on m.dep_codigo 
where m.mun_codigo = 


select * from pais p 
inner join departamento d on p.pai_codigo = d.pai_codigo 
where d.dep_codigo = 

select * from persona p where p.per_codigo = 108797

select * from metod

select * from persona p where p.per_codigo = 108797

select * from municipio m 
left join departamento d on m.dep_codigo = d.dep_codigo 
left join pais p on d.pai_codigo = p.pai_codigo 


select * from departamento d 
inner join pais p on d.pai_codigo = p.pai_codigo 
inner join municipio m on d.dep_codigo = m.dep_codigo 
where m.mun_codigo = 905


select * from inscripcion i 

select * from calendario c 
select * from periodo p 

select * from inscripcion_programa ip 
select * from oferta_academica oa 

select * from programa p 

select  * from uaa u 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
where p.uaa_codigo_unificado = 792

--792

select * from uaa u where u.uaa_nombre like '%Contaduria Publica%' and u.uaa_estado = 1 

--519,520,166,10,521

select * from inscripcion i 
select * from inscripcion_admitidos ia 
select * from icfes_area_puntaje iap 
select * from ic

select top 1 * from acreditacion.matriculados_acreditacion ma where ma.est_codigo = '20171157616' ORDER by ma.mat_codigo desc

select * from uaa_personal up 



Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where p.per_identificacion  = '1075303330' or e.est_codigo = '1075303330' order by g.gra_codigo desc



Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join nivel_academico na on pr.nia_codigo = na.nia_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
inner join municipio m on p.per_lugar_expedicion = m.mun_codigo 
where p.per_identificacion  = '1075303330' order by g.gra_codigo desc

select * from graduado g 
select * from municipio m 

select * from plan_academico pa 
select * from programa p 
select * from uaa u 
select * from nivel_academico na 
select * from carnetizacion.horario_puesto_vigilancia hpv 


select * from snies_estrato se 
select * from acre

select * from persona p where p.per_nombre like '%MARSH%'
select * from tercero t where t.ter_nombre like '%MARSH%'
select * from certificado c order by c.cer_fecha_hora desc

select * from certificaciones.certificado c 

select * from aud_certificado ac 

select * from acreditacion.institucion i 

select * from dbo.graduado g order by g.gra_codigo desc
select * from dbo.graduado g where g.est_codigo = '20171157616'
select * from dbo.graduado g where g.est_codigo = '20162152349'

select * from plan_academico pa 

select * from pais p 
inner join departamento d on p.pai_codigo  = d.pai_codigo 
inner join municipio m on d.dep_codigo = m.dep_codigo 

select g.est_codigo, u.uaa_nombre  from dbo.graduado g 
inner join plan_academico pa on g.pla_codigo = pa.pla_codigo 
inner join programa p on pa.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where g.gra_fecha BETWEEN '28/07/2023' AND GETDATE()

select count(*) from dbo.graduado g where g.gra_fecha BETWEEN '28/07/2023' AND GETDATE() 

select * from carnetizacion.control_acceso ca

select * from carnetizacion.ticket_visitante tv 

select * from carnetizacion.usuario_carnet_digital_login ucdl
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo
inner join sede s on s.sed_codigo = u.sed_codigo
inner join persona p on ucdl.up = p.per_codigo
where  ucdl.us = '1075270537' order by ucdl.istipo asc

select * from carnetizacion.usuario_carnet_digital_login ucdl
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo
inner join sede s on s.sed_codigo = u.sed_codigo
inner join persona p on ucdl.up = p.per_codigo
where  ucdl.us = '7692971' order by ucdl.usg_codigo desc, istipo descte

--CASOS EXCEPCIONALES
7692971
1075270537


select COUNT(ucdl.us) from carnetizacion.usuario_carnet_digital_login ucdl  
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where ucdl.us = '1075270537'


select * from carnetizacion.inicio_sesion_vigilante isv
select * from token.codigo_inicio_sesion_estado cise 
select * from carnetizacion.control_acceso ca 
select count(*) from carnetizacion.control_acceso ca 

select * from carnetizacion.ticket_visitante tv 
select * from carnetizacion.ti


select * from persona p where p.per_identificacion = '83029398'

select count(*) from carnetizacion.control_acceso ca

select * from carnetizacion.control_acceso ca WHERE ca.coa_identificacion = '1075320464'


select * from carnetizacion.vigilante v where v.vig_identificacion = '1075234160'

SELECT
  p.per_codigo,
  ue.uid,
  p.per_identificacion,
  p.per_nombre,
  ue.us,
  ue.state,
  per_email,
  p.per_email_interno,
  ue.sys
FROM
  usuario_estudiantes ue
  INNER JOIN persona p ON ue.up = p.per_codigo
WHERE
    ue.us =''
    or p.per_identificacion ='1075303330'

SELECT * FROM  persona p where per_identificacion ='1075320464'

SELECT * FROM usuario_estudiantes WHERE us like '%201611446%'

SELECT * FROM persona where per_email_interno like '%2023%'


select * from carnetizacion.usuario_carnet_digital_login ucdl  

Select * from carnetizacion.inicio_sesion_vigilante isv 

select ucd.usg_usuario, ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 169001 group by ucd.usg_usuario, ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us 
order by ucd.usg_usuario desc


select * from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 169001 group by ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us order by ucd.

select * from estudiante e where e.est_codigo = '20232217495'--NUEVO
select * from estudiante e where e.est_codigo = '20232217469'--ANTIGUO


Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from docente_vinculacion dv 
inner join persona p on dv.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join uaa u on dv.uaa_codigo = u.uaa_codigo 
inner join sede s on u.sed_codigo = s.sed_codigo 
where dv.per_identificacion  = '1075282351' order by dv.uap_codigo desc
--1075282351
--79523543
Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e
inner join persona p on e.per_codigo = p.per_codigo
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo
inner join programa pr on e.pro_codigo = pr.pro_codigo
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
inner join sede s on pr.sed_codigo = s.sed_codigo
where e.est_codigo = '20232216394'


Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e
inner join persona p on e.per_codigo = p.per_codigo
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo
inner join programa pr on e.pro_codigo = pr.pro_codigo
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
inner join sede s on pr.sed_codigo = s.sed_codigo
where p.per_identificacion = '1077723030' order by ins_codigo desc

select * from estudiante e where e.per_codigo = 168576

20231212230	168576
20232216394	168576

select * from tipo

select * from carnetizacion.inicio_sesion_vigilante isv 

select distinct ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us from carnetizacion.usuario_carnet_digital ucd
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo
where ucd.up = 168576 group by ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us order by ucd.us desc


select  top 1 * from carnetizacion.usuario_carnet_digital_login ucdl
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo
inner join sede s on s.sed_codigo = u.sed_codigo
inner join persona p on ucdl.up = p.per_codigo
where  ucdl.us = 'u20232216394' order by ucdl.usg_codigo desc

select * from persona p where p.per_codigo = 168576

select * from carnetizacion.inicio_sesion_vigilante isv 

select * from dbo.modulo m where m.mod_nombre like '%encuestas%'

select * from persona

select * from dbo.modulo m 


select * from carnetizacion.control_acceso ca 

select * from web_parametro wp where wp.wep_nombre like '%token%'
SELECT * from persona p 

select count(*) from carnetizacion.usuario_carnet_digital_login ucdl where ucdl.istipo = 3

select * from modulo m 

select * from inscripcion_graduado

select * from carnetizacion.usuario_carnetizacion_control_acceso_admon_login uccaal 


select * from estudiantes_acuerdo046 ea where ea.est_codigo = '20152141476'

SELECT * FROM persona p where p.per_nombre = 'JOSE ESTEBAN' and p.per_apellido like '%CORDOBA%'
SELECT * FROM modulo m
select YEAR(g.gra_fecha) AS periodo, u.uaa_nombre, g.est_codigo, g.gra_fecha, pcgcp.puntaje_calificado from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join puntaje_calificado_graduado_sin_perdidas pcgcp on g.est_codigo = pcgcp.est_codigo 
where e.pro_codigo = 27 and g.gra_fecha BETWEEN '01/01/2017' AND '24/11/2022'

SELECT * FROM persona p where p.per_codigo = 137596

select * from estudiante e where e.per_codigo = 119299

select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where u.uaa_nombre like '%INGENIERIA%'

select * from carnetizacion.usuario_carnet_digital ucd where ucd.istipo = 5

select * from liqui_matri lm where l.est_codigo = '20172163517'
select * from liquidacion l where l.est_codigo = '20172163517'

select * from usuario_carnet_digital

select * from usuario_carnetizacion_admon_login ucal 

select * from usuario_acreditacion_login ual 

select * from sgd.documento d where d.doc_contenido = 'Fotos Carnetizacion'

select * from modulo m 

select * from usuario_acreditacion_login ual where

select * from usuario_carnetizacion_admon_login uca inner join uaa u on u.uaa_codigo = uca.usg_uaa inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on p.per_codigo = uca.up where  us = 'a1075303330'

select COUNT(us.us) from usuario_carnetizacion_admon_login us inner join uaa u on u.uaa_codigo = us.usg_uaa inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on p.per_codigo = us.up where  us = 'a1075303330' 

select * from grupo g 

--CARNET ESTUDIANTES ACTIVOS
select ma.per_nombre, ma.per_apellido, ma.per_identificacion, ma.est_codigo, gs.grs_nombre, ma.sed_nombre, ma.uaa_nombre, e.est_id_carnet from acreditacion.matriculados_acreditacion ma 
left join estudiante e on ma.est_codigo = e.est_codigo 
left join persona p on ma.per_identificacion = p.per_identificacion  
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
where ma.periodo = '20232' and e.est_id_carnet is not null



hex_column,
    CONVERT(INT, SUBSTRING(hex_column, 1, 2), 16) AS decimal_1,
    CONVERT(INT, SUBSTRING(hex_column, 4, 2), 16) AS decimal_2,
    CONVERT(INT, SUBSTRING(hex_column, 7, 2), 16) AS decimal_3,
    CONVERT(INT, SUBSTRING(hex_column, 10, 2), 16) AS decimal_4


select ma.per_nombre, ma.per_apellido, ma.per_identificacion, ma.est_codigo, gs.grs_nombre, ma.sed_nombre, ma.uaa_nombre, 
CONVERT(INT, SUBSTRING(e.est_id_carnet, 1, 2), 16) AS decimal_1,
    CONVERT(INT, SUBSTRING(e.est_id_carnet, 4, 2), 16) AS decimal_2,
    CONVERT(INT, SUBSTRING(e.est_id_carnet, 7, 2), 16) AS decimal_3,
    CONVERT(INT, SUBSTRING(e.est_id_carnet, 10, 2), 16) AS decimal_4, GETDATE() from acreditacion.matriculados_acreditacion ma 
left join estudiante e on ma.est_codigo = e.est_codigo 
left join persona p on ma.per_identificacion = p.per_identificacion  
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
where ma.periodo = '20232'

select count(*) from uaa_personal up where up.uap_id_carnet is not null 

--CARNET AMPLEADOS ACTIVOS
select p.per_nombre, p.per_apellido, p.per_identificacion, p.per_codigo, gs.grs_nombre, u.uaa_nombre, up2.uap_id_carnet from uaa_personal up 
left join uaa_personal up2 on up.uap_id_carnet = up2.uap_id_carnet 
inner join persona p on up.per_codigo = p.per_codigo 
left join uaa u on up.uaa_codigo = u.uaa_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
where up.uap_id_carnet is not null
where up.uap_fecha_fin is null or up.uap_fecha_fin >= GETDATE() and up2.uap_id_carnet is not null and p.per_identificacion = '7725584'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 125359
select * from encuestas.cuestionarios
SELECT * FROM persona p where p.per_nombre = 'MARCO ANTONIO' and p.per_apellido like '%CEBALLOS%'

select count(*) from uaa_personal up 
where up.uap_fecha_fin is null or up.uap_fecha_fin >= GETDATE()

select * from encuestas.respuestas_cuestionarios rc 

select * from 

select * from uaa_personal up 
where up.uap_id_carnet is not null and up.uap_fecha_fin >= GETDATE() 

select * from usuario_administrativo ua 


SELECT * FROM persona p where p.per_nombre = 'JUAN MANUEL' and p.per_apellido like '%GONZALEZ%'

select * from uaa_personal up 



select count(*) from acreditacion.matriculados_acreditacion ma 
left join estudiante e on ma.est_codigo = e.est_codigo 
left join persona p on ma.per_identificacion = p.per_identificacion  
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
where ma.periodo = '20231'

select count(*) from acreditacion.matriculados_acreditacion ma  
where ma.periodo = '20231'

select * from periodo p 

select * from grupo_sanguineo gs 

select * from estudiante 
select * from persona p where p.per_identificacion = '84040306888'

select * from uaa_cargo uc
inner join persona on uc.
where uc.uac_cargo = 12

select * from vinculacion v 
select * from cargo c 
select up.uap_codigo, p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin  from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
where up.uaa_codigo = 463

select * from uaa u where u.uaa_nombre like '%CENTRO%'

where up.uap_cargo = 12

select p.per_codigo, ti.tii_nombre, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email_interno from persona p 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
where p.per_email_interno is not null

select * from tercero t 

select t.ter_codigo, ti.tii_nombre, t.ter_identificacion, t.ter_nombre1 + ' ' + t.ter_nombre2 as nombre, t.ter_apellido1 + ' ' + t.ter_apellido2 as apellido, t.ter_email from tercero t 
inner join tipo_id ti on ti.tii_codigo = t.tii_codigo 
where t.ter_email is not null

elect * from academia3000.encuestas.cuestionario_configuracion cc join academia3000.dbo.uaa u2 on cc.uaa_codigo = u2.uaa_codigo 
select ut.tus_nombre, count(*) from academia3000.encuestas.respuestas_cuestionarios c
inner join academia3000.encuestas.cuestionarios cu ON c.cue_codigo = cu.cue_codigo
inner join  academia3000.dbo.uaa u on cu.uaa_codigo = u.uaa_codigo
inner join academia3000.dbo.usuario_tipo ut ON c.rcu_estamento = ut.tus_codigo
where u.uaa_codigo = 554
group by ut.tus_nombre

select ro.rop_descripcion,p.pre_descripcion,p.pre_identificador,c.cue_nombre,tu.tus_nombre from academia3000.encuestas.respuestas r join academia3000.encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join academia3000.encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo join academia3000.encuestas.respuestas_opciones ro 
on pr.rop_codigo = ro.rop_codigo join academia3000.encuestas.preguntas p on r.pre_codigo =p.pre_codigo
join academia3000.encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo join academia3000.encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo  
join academia3000.dbo.usuario_tipo tu  on cc.tus_codigo = tu.tus_codigo

where (c.uaa_codigo =554 and c.cue_codigo= 4) AND(p.pre_codigo=55 AND ro.rop_codigo=29);

select * from academia3000.encuestas.cuestionarios c 


select count(*) from academia3000.encuestas.cuestionarios c 
select cue_nombre,tus.tus_nombre from academia3000.encuestas.respuestas_cuestionarios rc join academia3000.encuestas.cuestionarios c2 on rc.cue_codigo = c2.cue_codigo join
academia3000.encuestas.cuestionario_configuracsion cc on c2.cue_codigo =cc.cue_codigo join academia3000.dbo.usuario_tipo tus on cc.tus_codigo = tus.tus_codigo
where c2.uaa_codigo =554 AND cc.tus_codigo = 12

select * from encuestas.cuestionario_configuracion cc 
select * from promedio p  where codigo = 20141124615
select ro.rop_descripcion,p.pre_descripcion,p.pre_identificador,c.cue_nombre,tu.tus_nombre from encuestas.respuestas r
 join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu  on cc.tus_codigo = tu.tus_codigo  where c.cue_codigo=:codigo

select * from academia3000.encuestas.preguntas p where cue_codigo = 6



select * from academia3000.encuestas.respuestas r join academia3000.encuestas.respuestas_cuestionarios rc on r.rcu_codigo =rc.rcu_codigo 


SELECT pre_codigo from encuestas.preguntas p where cue_codigo =5 And pre_tipo =0
SELECT ro.rop_codigo,rop_descripcion from encuestas.preguntas_respuestas pr join encuestas.respuestas_opciones ro on pr.rop_codigo =ro.rop_codigo where pr.pre_codigo =:pregunta and pr.prr_estado =1


SELECT * FROM academia3000.dbo.web_parametro where wep_nombre like '%PREGRADO%'

select * from dbo.modulo


select* from academia3000.acreditacion.norma_acreditacion


select * from 
select pro_creacion_snies FROM  academia3000.dbo.programa

select * from academia3000.encuestas.tipo_respuestas tr 

------------------------------------------------------------------------------
select * from grupo order by gru_codigo desc
select * from encuestas.cuestionarios
select * from encuestas.respuestas_cuestionarios
--query snies verificar matricula
select ti.snies_codigo, c.cal_nombre, sp.sed_nombre,l.liq_total, c.cal_codigo, p.pro_codigo, m.mat_estado, p.pro_titulo_otorgado, pe.per_identificacion, l.est_codigo, p.pro_registro_snies, mp.SNIES_codigo as municipio, 
pe.per_fecha_nacimiento, coalesce(pe.per_codigo_pais_hecaa,170) as pais_nacimiento, mn.SNIES_codigo as municipio_nacimiento,
coalesce(se.hecaa_zor, pe.zor_codigo) as codigo_zona, pe.per_estrato, 'N', '', '', l.liq_total, pe.per_telefono_movil, pe.per_email
from  liquidacion l
inner join estudiante e on l.est_codigo = e.est_codigo
inner join uaa u on l.uaa_codigo = u.uaa_codigo
inner join programa p on u.uaa_codigo = p.uaa_codigo
left join sede sp on p.sed_codigo = sp.sed_codigo
left join municipio mp on sp.mun_codigo = mp.mun_codigo
inner join calendario c on l.cal_codigo = c.cal_codigo
inner join matricula m on m.est_codigo = l.est_codigo and m.cal_codigo = l.cal_codigo 
inner join persona pe on l.per_codigo = pe.per_codigo
inner join tipo_id ti on pe.tii_codigo = ti.tii_codigo
left join municipio mn on pe.per_lugar_nacimiento = mn.mun_codigo
left join snies_estudiante_complementario se ON se.per_codigo = pe.per_codigo and se.ins_codigo = e.ins_codigo
where l.lit_codigo = 13 --and m.mat_estado = 'A'
and  pe.per_identificacion = '1081404857' order by c.cal_codigo desc

select * from estudiante_horario_actual where est_codigo  = '20171155993'
select * from estudiantes_curso WHERE pro_codigo = 418 and per_nombre = '20212'
select * from matricula where est_codigo  = '20171155993'
select * from curso c
inner join asignatura a2 on c.asi_codigo = a2.asi_codigo
where 
select * from asignatura a 

select * from persona where per_identificacion = '12120368'
select * from uaa_personal where per_codigo in (101710,2679)
select * from contrato.contrato where per_codigo in (101710,2679)
select * from web_parametro where wep_nombre like 'EDUCACION_VIRTUAL_CALENDARIO_ACTUAL'

select * from periodo

select * from curso c 

select * from aud_persona where per_codigo = 119317 order by aud_fecha desc

select * from factura where fac_codigo in (577206,591884)
select * from pagosenlinea_credenciales_cuenta
select * from banco
select * from banco_cuenta where ban_codigo = 59 bac_codigo in (193,220,221,222,223)
select * from persona where per_identificacion = '1004148899' order by aud_fecha desc
select * from tipo_id
Error estudiante matriculado 2021-1

select * from web_parametro where wep_nombre like '%covid%'
select * from covid.encuesta where codigo_periodo = 120 and enc_codigo > 230518
select * from institucion_educativa where iet_codigo = 10
select * from municipio where mun_nombre like '%popayan%'
select * from institucion_educativa_tipo
select * from uaa_personal where per_codigo = 51437

 SELECT DISTINCT TOP 10 uap.uap_codigo, p.per_codigo, per_identificacion, p.per_nombre, per_apellido,
per_fecha_nacimiento, per_direccion_residencia, uap_fecha_inicio, uap_fecha_fin,
eps_nombre, vin_nombre, uaa.uaa_nombre_corto, uaa.uaa_codigo, uaa.uaa_nombre,
uaa.uaa_dependencia, uaa.uat_codigo,
(select u.uaa_nombre_corto from uaa u where u.uaa_codigo=uaa.uaa_dependencia  ) as facultad,
coalesce ((select top 1 d.ded_nombre from dedicacion d where d.ded_codigo=uap.ded_codigo ),'') as dedicacion
FROM uaa_personal uap
INNER JOIN persona p ON uap.per_codigo = p.per_codigo
INNER JOIN periodo pe ON 
(per_fecha_inicio <= per_fecha_fin and uap_fecha_inicio <= uap_fecha_fin ) or uap_fecha_fin is null
LEFT JOIN eps ON eps.eps_codigo = p.eps_codigo
LEFT JOIN vinculacion v ON v.vin_codigo = uap.vin_codigo
LEFT JOIN uaa ON (uaa.uaa_codigo= uap.uaa_codigo)
WHERE ((per_fecha_inicio <= uap_fecha_inicio and per_fecha_fin >= uap_fecha_fin) OR
(per_fecha_inicio >= uap_fecha_inicio and per_fecha_fin <= uap_fecha_fin) OR
(per_fecha_inicio >= uap_fecha_inicio and per_fecha_inicio <= uap_fecha_fin) OR
(per_fecha_fin >= uap_fecha_inicio and per_fecha_fin <= uap_fecha_fin) OR
(per_fecha_fin >= uap_fecha_inicio and uap_fecha_fin is null )) 
--AND (pe.per_nombre in (select * from web_parametro where wep_nombre = 'PERIODO_MATRICULA_PRIMIPAROS'))
AND (uap_fecha_fin is NULL or GETDATE() <= uap_fecha_fin)
AND (p.per_nombre + ' ' + p.per_apellido like '%URREA%')
ORDER BY uap_fecha_inicio, uap_fecha_fin 






 select * from institucion_categoria
insert into institucion_educativa (iet_codigo, ine_nombre, mun_codigo, jor_codigo, ine_nivel, inc_codigo, ine_codigo_hecaa)
values (10,'FUNDACION UNIVERSITARIA DE POPAYAN',234,5,'SUPERIOR',2,2715)
select * from hecaa.colegios
select * from inscripcion where ins_codigo = 199571
select * from factura where fac_codigo = 1555122

select * from inscripcion_programa where ofa_codigo = 2588 order by ofa_codigo desc
select * from hecaa.grupo_etnico
select * from hecaa.pueblo_indigena
select * from hecaa.comunidad_negra
select * from snies_discapacidad
select * from hecaa.capacidad_excepcional
sql += "sdi_codigo, // snies_discapacidad
sql += "hecaa_cae, // hecaa.capacidad_excepcional
		sql += "hecaa_zor, // hecaa.zona_residencia
		sql += "hecaa_con, // hecaa.comunidad_negra
select * from liquidacion_tipo

select * from concepto where con_nombre like 'matricula%'
--Dctos matriculas
select * from concepto where cot_codigo = 2 and con_estado = 'A' and lit_codigo = 13 and con_codigo not in (893,94,910,911,912,913,914,915,105,908)
--Valor concepto matricula
select  sum(valor_total) from VI_factura_detalle_nac v
inner join concepto c on v.con_codigo = c.con_codigo
where fac_codigo = 1561273 and c.con_codigo in (select con_codigo from concepto where con_nombre like 'matricula%' AND cot_codigo = 1 and con_estado = 'A' and lit_codigo = 13 )
--Valor dctos concepto matricula
select sum(valor_total) from VI_factura_detalle_nac v
inner join concepto c on v.con_codigo = c.con_codigo
where fac_codigo = 1473738 and c.con_codigo in (select con_codigo from concepto where cot_codigo = 2 and con_estado = 'A' and lit_codigo = 13 and con_codigo not in (893,94,910,911,912,913,914,915,105,908))


select * from concepto where con_nombre like 'matricula%'


con_nombre like 'matricula%'

select f.fac_codigo,l.liq_total, fd.fad_valor, c.con_codigo, c.con_nombre, c.con_descripcion, c.cot_codigo from liquidacion l 
inner join factura f on l.liq_codigo = f.liq_codigo
inner join factura_detalle fd on f.fac_codigo = fd.fac_codigo
inner join concepto c on fd.con_codigo = c.con_codigo
where l.est_codigo = '2009179647' and l.cal_codigo = 208 and c.con_codigo = 72

select sum(d.lid_valor) from liquidacion l 
inner join liquidacion_detalle  d on l.liq_codigo = d.liq_codigo 
inner join concepto c on d.con_codigo = c.con_codigo
where l.est_codigo = '20191181930' and l.cal_codigo = 208 and c.cot_codigo = 2

select * from concepto_tipo
select p.per_identificacion, p.per_nombre, e.* from persona p
inner join estudiante e on p.per_codigo = e.per_codigo
where p.per_identificacion = ''


select * from oferta_academica where cal_codigo = 213

select * from modalidad_ingreso

select * from web_parametro where wep_nombre like '%PREGRADO%'
select * from calendario
213
select * from modulo 
select * from token.codigo_inicio_sesion where mod_codigo = 52

select * from snies_estudiante_complementario where per_codigo = 68828
select * from hecaa.zona_residencia
select * from calendario where cal_codigo = 210
select * from curso  where cur_codigo = 165106
select * from matricula_curso where  cur_codigo = 164882
select * from matricula where mat_codigo = 710311
select * from estudiante where est_codigo = '2021N199780'
select * from calendario where cal_codigo = 2

SELECT * FROM curso_virtual WHERE cal_codigo in (SELECT cal_codigo FROM calendario 
WHERE cal_nombre like '20211%') 
AND (asi_fecha_actualizacion BETWEEN dateadd(minute,-8,getdate()) AND getdate()) 
OR (cur_fecha_actualizacion BETWEEN dateadd(minute,-8,getdate()) AND getdate())

select * from inscripcion_documentos_configuracion_oferta
select * from inscripciones.documentosEstudiosAnteriores
select * from inscripciones.oferta_estamento

select * from uaa_personal where per_codigo = 10440

select * from web_parametro where wep_nombre like '%EDUCACION_VIRTUAL%'
select * from curso order by cur_codigo desc
7727601
select * from persona where per_nombre like '%diego%' and per_apellido like '%carvajal ruiz%'
select * from uaa_personal where per_codigo = 27060
select * from curso where uap_codigo in (57655,63869)

select au.aud_fecha,au.per_tarjeta,* from aud_persona au where au.per_codigo in (select per_codigo from persona where per_identificacion='1079186821')
order by au.aud_fecha desc
1075322174
select * from aud_LNX000PROYECTO
select k_proyect  from liquidacion
SELECT k_proyect, n_proyect, i_activo, k_sucurs, k_cencos, n_observ FROM (select row_number() over(order by Array) AS RowNumber, k_proyect, n_proyect, i_activo, k_sucurs, k_cencos, n_observ FROM LNX000PROYECTO ) as tabla where tabla.RowNumber between 0 and 10

select * from pagosenlinea_credenciales_cuenta
select * from aud_uaa
select * from programa where uaa_codigo = 888
select * from modalidad
select * from plan_academico where pro_codigo = 563
select * from plan_academico_asignatura where pla_codigo = 1194
select * from oferta_academica where pro_codigo = 563
select * from aud_oferta_academica where pro_codigo = 563 order by aud_changed desc
2588
select * from liquidacion_configuracion where uaa_codigo = 888
select * from LNX000PROYECTO WHERE k_proyect like '%%' OR n_proyect like '%%' OR i_activo like '' OR k_sucurs like '' OR k_cencos like '' OR n_observ like ''
Codigo, Nombre, actiov, sucursal, Centros de Costos, 

select * from liquidacion
select * from aud_liquidacion_configuracion
select * from calendario
select * from web_parametro where wep_nombre = 'INSCRIPCION_POSGRADO_CALENDARIO'
select * from persona where per_identificacion = '1075298009
'

select * from aud_oferta_academica order by aud_changed desc
select * from oferta_academica where pro_codigo = 563
select * from covid.aud_encuesta where enc_codigo =  206871
select * from covid.respuesta where enc_codigo = 206871
select * from matricula where est_codigo = '20201186953'
select * from aud_matricula_curso where mat_codigo = 699575 and cur_codigo = 163299 and maa_codigo in (1,2)
select * from matricula_autorizacion
select * from matricula_curso where cur_codigo = 162278
and cat_codigo = 6
select * from encuestas.respuestas_cuestionarios
select * from persona where per_identificacion = '40412900'
select * from uaa_personal where per_codigo =13770
select * from espacio_ocupacion where uap_codigo = 63800
select * from inscripcion order by ins_codigo desc
select * from factura where fac_codigo = 1571455
select * from persona where per_codigo = 70143
1070584950,
N77NY3TC1RZBK7X
select * from persona where per_email_interno = '79983784'
select * from persona where per_identificacion like '79983784' 
select * from uaa_personal where per_codigo = 94348
select * from curso where uap_codigo = 65834
select * from matricula_curso where cur_codigo = 163812
select * from matricula_autorizacion
select * from matricula_curso where cur_codigo = 163826
select * from matricula_curso where cur_codigo = 163864
select * from matricula_curso where cur_codigo = 163880

per_email like '%pachito%' per_apellido like '%rive%' and per_nombre like '%francisco%'

1075282351


select * from encuestas.cuestionarios
update encuestas.cuestionarios set cue_fecha_fin =

select * from encuestas.cuestionarios
select * from encuestas.cuestionario_configuracion
select * from persona where per_identificacion like '900407911'
select * from conjuridico.solicitud_consultorio
select * from persona where per_codigo = 159139 order by aud_fecha desc
select * from inscripcion_programa where ofa_codigo = 2588
select * from matricula_curso where mat_codigo in (
select * from matricula where est_codigo in (
	select est_codigo from estudiante where per_codigo in (159139,159140,159137)
))
select * from covid.encuesta where codigo_periodo = 120
select * from calendario where cal_codigo = 210
select * from usuario_estudiantes_virtual where up in (159139,159140,159137)
select * from aud_matricula where mat_codigo in (710123)
select * from aud_curso where cur_codigo = 163848 

select * from admision_tipo

select * from recaudo_pagosenlinea_peticion
select * from pagosenlinea_status
select * from pagosenlinea_credenciales_cuenta
select * from factura_fecha order by fac_codigo desc
select * from banco
select * from banco_cuenta where ban_codigo = 59 and  bac_cuenta like '%76015450%'





select * from persona where per_codigo in (
select per_codigo from uaa_personal where uap_codigo in (
select distinct uap_codigo from espacio_ocupacion where eso_actividad = 163848 
))
65570


select (coalesce(ter_apellido1,'')+' '+coalesce(ter_apellido2,'')) as apellido, (coalesce(ter_nombre1,'')+' '+coalesce(ter_nombre2,'')) as nombre from tercero where ter_codigo = 147733 










select * from uaa 
select * from programa where uaa_codigo = 888
select * from asignatura where uaa_codigo = 888
select * from curso where asi_codigo in (select asi_codigo from asignatura where uaa_codigo = 888)
select * from asignatura where uaa_codigo = 888
select * from liquidacion_configuracion where uaa_codigo = 888
select * from liquidacion where lit_codigo =  14

SELECT
    t.name AS Tabla,
    c.name as Campo,
    tp.name + '(' + CAST(TP.max_length AS VARCHAR) + ')' AS 'Tipo de Campo',
    ep.value as Comentario,
    (CASE
        WHEN c.is_nullable = 0 THEN 'SI'
        WHEN c.is_nullable = 1 THEN 'NO'
    END) AS 'NULL'
 
FROM sys.tables t
    inner join sys.columns c
        on t.OBJECT_ID = c.OBJECT_ID
    inner join sys.types tp
        on c.user_type_id = tp.user_type_id
    left join sys.extended_properties ep
		on (t.object_id=ep.major_id and
			c.object_id=ep.minor_id)
 
where t.name='cuestionarios'
ORDER BY T.name, C.name

SELECT * FROM persona p where p.per_apellido like '%MEZA%'



select * from covid.encuesta

select * from covid.pregunta

update covid.pregunta set pre_descripcion = 'Teniendo en cuenta la situaci�n del semestre acad�mico actual �Cu�l de las siguientes opciones considera m�s apropiada para su situaci�n personal?' where pre_codigo = 19;
update covid.pregunta set pre_descripcion = 'De los siguientes programas que podr� ofrecer la Universidad ordene seg�n la importancia que tengan para que Usted pueda continuar las actividades formativas en el semestre actual. Tenga en cuenta que 1 es la mayor importancia y 5 la menor' where pre_codigo = 22;

select * from familiar where per_codigo = 149705 and fam_vinculacion = ?
select * from familiar where per_codigo = 151759 or ins_codigo = 188803
select * from aud_informacion_socioeconomica where per_codigo = 151759

SELECT * from academia3000.dbo.calendario c 
select * from academia3000.dbo.web_parametro wp where wep_nombre like '%pregrado%'
select * from periodo p 
select * from acreditacion.campo_amplio ca where ca.cam_estado = 1
select * from acreditacion.campo_especifico ce where ce.cam_esp_estado = 1
select * from acreditacion.campo_detallado cd where cd.cam_det_estado = 1


SELECT * from programa

SELECT p.pro_codigo, uaa_codigo_unificado, pro_registro_icfes, pro_registro_snies, pro_titulo_otorgado, pro_fecha_creacion,nbc.nbc_codigo,pro_calendario,ua.uaa_codigo,uaa_nombre_corto,sed_nombre,jor_nombre, (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia,nia_nombre,snies_codigo,mod_nombre,con_descripcion,nbc_nombre,pre_nombre,res_descripcion,gru_nombre,gru_id,per_apellido,per_nombre,per_genero,per_email_interno
FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo  
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up

select * from calendario c



select * from inscripcion
 * from modalidad
select * from modalidad
select * from programa where mod_codigo = 3
 select * from inscripcion_estado

 select * from matricula where est_codigo = '20201189869'
 select * from matricula_curso where cur_codigo =162092 and maa_codigo in (1,2)

select * from web_parametro where wep_nombre like '%covid%'
select * from aud_web_parametro where wep_codigo = 371 order by aud_changed desc
select * from usuario_general_login where us like 'u20211194163'


select * from icfes_area_puntaje
select * from icfes_area
select * from inscripcion

 select * from curso where cur_url <> '' order by cur_codigo desc
 select * from aud_curso where cur_codigo = 164679 order by aud_changed desc

 select * from covid.encuesta where codigo_periodo = 120
 
 
 select * from matricula where est_codigo = '2003200471'
 select * from matricula_curso where mat_codigo = 707304 and maa_codigo  in (1,2)

select * from persona where per_apellido = 'manchola trujillo'
select * from covid.encuesta where per_codigo = 9158
162494=>ok
162493=>falta
162498=>falta
164114=>ok
162592=>ok
162495=>ok
162507=>ok
164243=>ok

162496
 select * from matricula_autorizacion


select * from persona


SELECT  * from academia3000.dbo.aud_asignatura order by asi_fecha_actualizacion desc
SELECT  * from academia3000.dbo.asignatura aa where asi_codigo =61752


 PUNTO 1


SELECT i.cal_nombre, i.uaa_nombre_corto, AVG(i.adr_puntaje) AS promedio, COUNT(*) AS total
FROM I_inscritos i
INNER JOIN estudiante est WITH (NOLOCK) ON i.ins_codigo = est.ins_codigo 
INNER JOIN matricula m ON (est.est_codigo = m.est_codigo and i.cal_codigo = m.cal_codigo)
INNER JOIN calendario cal WITH (NOLOCK) ON i.cal_codigo = cal.cal_codigo 
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo 
WHERE m.mat_estado = 'A' AND i.adt_admitido = 'Si' AND (pe.per_a�o BETWEEN '2019' AND '2021') AND i.nia_codigo = 11
GROUP BY i.cal_nombre, pe.per_a�o, pe.per_nombre, i.uaa_nombre_corto
ORDER BY pe.per_a�o, pe.per_nombre, i.uaa_nombre_corto

 SELECT pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, 
u2.uaa_nombre, pro.pro_codigo, u.uaa_nombre, AVG(adr.adr_puntaje) AS promedio, COUNT(*) AS total
FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo 
INNER JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo 
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo 
INNER JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo 
--LEFT JOIN icfes_area_puntaje iap WITH (NOLOCK) ON ins.icf_snp = iap.icf_snp
--LEFT JOIN icfes_area ica WITH (NOLOCK) ON iap.ica_codigo = ica.ica_codigo
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo 
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo 
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo 
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo 
INNER JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo 
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo 
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo 
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo
AND mat.mat_estado = 'A' AND (pe.per_a�o BETWEEN '2019' AND '2021') AND nia.nia_codigo = 11
GROUP BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, 
u2.uaa_nombre, pro.pro_codigo, u.uaa_nombre
ORDER BY pe.per_a�o, pe.per_nombre, u.uaa_nombre


punto 2

SELECT pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, 
u2.uaa_nombre,  pro.pro_codigo, u.uaa_nombre, col.col_nombre, col.col_sector, COUNT (*) AS total
FROM inscripcion ins WITH (NOLOCK)  
INNER JOIN inscripcion_programa inp WITH (NOLOCK) ON ins.ins_codigo = inp.ins_codigo 
INNER JOIN oferta_academica ofa WITH (NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo 
INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo 
INNER JOIN persona per WITH (NOLOCK) ON ins.per_codigo = per.per_codigo 
INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo 
INNER JOIN uaa u WITH (NOLOCK) ON pro.uaa_codigo = u.uaa_codigo 
INNER JOIN uaa u2 WITH (NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo 
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo 
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo 
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo
WHERE (pe.per_a�o BETWEEN '2019' AND '2021')
GROUP BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, 
u2.uaa_nombre,  pro.pro_codigo, u.uaa_nombre, col.col_nombre, col.col_sector


punto 3

SELECT pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,
u2.uaa_nombre, pro.pro_codigo, u.uaa_nombre, col.col_nombre, col.col_sector, COUNT(*) AS total
FROM inscripcion ins WITH (NOLOCK) 
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo 
INNER JOIN oferta_academica ofa WITH(NOLOCK) ON inp.ofa_codigo = ofa.ofa_codigo 
INNER JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo 
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo 
INNER JOIN programa pro WITH(NOLOCK) ON ofa.pro_codigo = pro.pro_codigo 
INNER JOIN uaa u WITH(NOLOCK) ON pro.uaa_codigo = u.uaa_codigo 
INNER JOIN uaa u2 WITH(NOLOCK) ON u.uaa_dependencia = u2.uaa_codigo 
INNER JOIN nivel_academico nia WITH(NOLOCK) ON pro.nia_codigo = nia.nia_codigo 
INNER JOIN nivel_academico_tipo nat WITH(NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN sede sed WITH(NOLOCK) ON pro.sed_codigo = sed.sed_codigo 
INNER JOIN calendario cal WITH(NOLOCK) ON ofa.cal_codigo = cal.cal_codigo 
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo
WHERE (pe.per_a�o BETWEEN '2019' AND '2022') AND adt.adt_admitido = 'Si'
GROUP BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, 
u2.uaa_nombre,  pro.pro_codigo, u.uaa_nombre, col.col_nombre, col.col_sector

select * from academia3000.dbo.homologada order by hom_codigo desc

select * from academia3000.dbo.plan_academico pa where pla_codigo = 970

SELECT * FROM academia3000.encuestas.cuestionarios c 


SELECT p.pro_codigo, uaa_codigo_unificado, pro_registro_icfes, pro_registro_snies, pro_titulo_otorgado, pro_fecha_creacion,nbc.nbc_codigo,pro_calendario,ua.uaa_codigo,uaa_nombre_corto,sed_nombre,jor_nombre,nia_nombre,snies_codigo,mod_nombre,con_descripcion,nbc_nombre,pre_nombre,res_descripcion,gru_nombre,gru_id,per_apellido,per_nombre,per_genero,per_email_interno
FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo  
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up


select pro_registro_snies , CASE
    WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero
    ,p.pro_fecha_creacion, pe.per_nombre +' '+ pe.per_apellido as nombres , pe.per_email_interno , pe.per_telefono_movil ,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS formacion
	from programa p
	full JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	full JOIN sede s on s.sed_codigo = u.sed_codigo
	full JOIN modalidad m on m.mod_codigo = p.mod_codigo
	full JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	full JOIN resolucion re on re.res_codigo = p.res_codigo
	full JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo
	full JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	full join persona pe on pe.per_codigo= ud.up  


select count(*) from matricula where cal_codigo = 216 
select count(*) from encuestas.respuestas_cuestionarios where cue_codigo = 10
select * from encuestas.cuestionarios
WITH resultado(ano,periodo,sed_nombre,nat_nombre,nia_nombre,dependencia_codigo,
dependencia, pro_codigo, pro_registro_snies, uaa_nombre, per_genero, total) AS (
SELECT pe.per_a�o AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo, pro.pro_registro_snies, u.uaa_nombre,
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
WHERE pe.per_nombre BETWEEN '20151' AND '20212' AND mat.mat_estado= 'A'
and nia.nia_codigo in (9,11,12,13,14) and sed.sed_codigo in (1,2,3,4)
--,12,13,14
--AND pro.pro_codigo IN (SELECT * FROM dbo.Split(?,','))
GROUP BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,
u2.uaa_codigo, u2.uaa_nombre,  pro.pro_codigo, pro.pro_registro_snies, u.uaa_nombre, per.per_genero
)SELECT * FROM resultado PIVOT(SUM(total) FOR per_genero IN([F],[M],[N])) AS pvt;

select * from encuestas.preguntas p 

selec * from encuestas.preguntas_respuestas pr 
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner join encuestas.respuestas r on p.pre_codigo 

select * from encuestas.cuestionarios


select * from nivel_academico_tipo nat 
select * from nivel_academico na 
select * from programa
select * from modalidad m 
select * from jornada j 

select * from promedio_aritmetico pa 

SELECT * FROM matriadican.validarEvaluacionDocenteMatriculaPregrado('20181166117', 'vnLOuD6COeiVHkV5WB2P2Q==');

select * from periodo where per_codigo 
select * from programa
EXECUTE academia3000.vinculacion_actual(1075303330, 1) 

select pro_registro_snies, pro_registro_icfes , CASE
    WHEN pro_registro_snies NOT like '0%' or pro_registro_snies != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero
    ,p.pro_fecha_creacion as fechaCreacion,
	pe.per_nombre +' '+ pe.per_apellido as nombres , pe.per_email_interno , pe.per_telefono_movil ,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS formacion
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 0
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up

select * from programa

select * from periodo

select * from docente_puntos where dp_periodo = 115

select * from encuestas.cuestionarios c 

select * from programa p where pro_codigo = 147

select * from aud_programa ap where ap.pro_codigo = 147

select * from usuario_tipo ut 


select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 132470

select * from persona p where p.per_identificacion = '7716989'

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 4

select * from encuestas.preguntas p where p.cue_codigo = 9 and p.pre_estado = 1 and p.tre_codigo = 2

select * from usuario_tipo ut 

select * from grupo g where g.gru_nombre like '%encuesta%'

select * from usuario_grupo ug where ug.usg_usuario = 52329

select * from usg

select * FROM persona where per_apellido like '%RAMIREZ ZARTA%'

select * from estudiante e 


select * from persona p where p.per_codigo = 
select * from persona p where p.per_identificacion = '1075220954'


select * from encuestas.cuestionarios c 


SELECT TOP 1 p.per_codigo, e.enc_codigo, e.enc_inicio, p.per_identificacion, p.per_genero, p.per_fecha_nacimiento, p.per_telefono_movil, p.per_direccion_residencia, p.per_genero,p.per_barrio, t.tii_nombre_corto, p.per_apellido, p.per_nombre FROM covid.encuesta e INNER JOIN persona p ON e.per_codigo = p.per_codigo INNER JOIN tipo_id t ON p.tii_codigo = t.tii_codigo WHERE e.enc_estado = 1
AND e.cat_codigo = 7 AND p.per_codigo = ? 
AND e.enc_codigo = ?


SELECT TOP 30 e.enc_codigo, e.enc_inicio, p.per_codigo, p.per_apellido, p.per_identificacion, p.per_nombre FROM covid.encuesta e INNER JOIN persona p ON e.per_codigo = p.per_codigo WHERE e.cat_codigo =? AND p.per_codigo = ? ORDER BY e.enc_inicio DESC
 
 
 select r.pre_codigo, r.res_adicional, o.opc_codigo, o.opc_descripcion, o.opc_adicional,s.sub_descripcion from covid.respuesta r inner join covid.opciones o on r.opc_codigo = o.opc_codigo left join covid.respuesta_subopciones ro on r.res_codigo = ro.res_codigo left join covid.subopciones s on ro.sub_codigo = s.sub_codigo where r.enc_codigo = ? order by r.pre_codigo 

select * from snies_categoria_sisben scs 
 

SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre,
 p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno
 FROM usuario_general_login u
 INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo
 INNER JOIN persona p ON u.up = p.per_codigo
 WHERE u.us like '%1075282351%'  --12113154
 
select * from usuario_general_login
 
SELECT * FROM usuario_academia_login ual WHERE up in (132538, 2284, 155840)
SELECT TOP 1 istipo, us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = '1075282351'
SELECT * from persona p where p.per_identificacion = '12113154'
 ---
 
select * from covid.autorizacion_ingreso ai 
 
select * from persona where per_apellido = 'RIVERA RODRIGUEZ' and per_nombre = 'LUIS ALBERTO'
 
select p.uaa_codigo_unificado, pro_registro_snies, pro_registro_icfes , CASE
    WHEN pro_registro_snies NOT like '0%' or pro_registro_snies != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,
    CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS formacion,
    na.nia_nombre,m.mod_nombre ,(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia,
    u.uaa_nombre, p.pro_creacion_snies,re.res_numero
    ,p.pro_fecha_creacion as fechaCreacion,
	pe.per_nombre +' '+ pe.per_apellido as nombres , pe.per_email_interno 
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	order by u.uaa_nombre 

SELECT * FROM persona p where p.per_nombre LIKE '%FELIPE%' AND p.per_apellido LIKE '%TRUJILLO%'


select * from encuestas.cuestionarios c

select * from persona
SELECT e.est_codigo, e.enc_inicio, p.per_identificacion, p.per_nombre, p.per_apellido FROM covid.encuesta e   
inner join persona p on e.per_codigo = p.per_codigo
where e.cat_codigo = 8


with resultado(enc_codigo, enc_inicio, per_nombre, per_codigo, per_identificacion, est_codigo, uaa_nombre_corto, per_telefono_movil, per_email_interno,pre_codigo, opc_descripcion) as(
select e2.enc_codigo, e2.enc_inicio, p.per_apellido + ' ' + p.per_nombre as nombre ,e2.per_codigo, p.per_identificacion, e2.est_codigo, u.uaa_nombre_corto, p.per_telefono_movil, p.per_email_interno, r.pre_codigo, op.opc_descripcion  from covid.encuesta e2 
inner JOIN covid.respuesta r on r.enc_codigo = e2.enc_codigo 
inner JOIN covid.opciones op on op.opc_codigo = r.opc_codigo 
inner join persona p on e2.per_codigo = p.per_codigo 
left join estudiante e on e2.est_codigo = e.est_codigo 
left join programa pr on e.pro_codigo = pr.pro_codigo 
left join uaa u on pr.uaa_codigo = u.uaa_codigo 
where e2.cat_codigo = 8 and convert(varchar(10),e2.enc_inicio, 120) BETWEEN '2022-03-19' AND '2022-04-19'
) SELECT * from resultado pivot( max(opc_descripcion) FOR pre_codigo in ([39],[40],[41],[42],[43],[44],[45],[46],[47],[48])) as pvt
ORDER BY enc_inicio DESC

sELECT count(m.mat_codigo) FROM matricula m INNER JOIN calendario c ON m.cal_codigo = c.cal_codigo INNER JOIn periodo p ON c.per_codigo = p.per_codigo WHERE (GETDATE() between p.per_fecha_inicio
 AND p.per_fecha_fin) AND m.mat_estado = 'A' AND m.est_codigo = '20171154792'
 


select  from programa p where pro_codigo = 



select p.pro_codigo, count(*) from graduado g
inner join estudiante e  WITH (NOLOCK) ON g.est_codigo = e.est_codigo
inner join programa p WITH (NOLOCK) ON e.pro_codigo = p.pro_codigo
inner join uaa u WITH (NOLOCK) ON p.uaa_codigo = u.uaa_codigo 
inner join sede s WITH (NOLOCK) ON p.sed_codigo = s.sed_codigo 
INNER JOIN nivel_academico nia WITH (NOLOCK) ON p.nia_codigo = nia.nia_codigo
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
where nat.nat_codigo = 2 and p.pro_registro_snies is not null
group by (p.pro_codigo)




SELECT pe.per_a�o AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,   
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo, pro.pro_registro_snies,  
u.uaa_nombre, est.est_codigo, ese.ese_nombre, mat.mat_estado, cal.cal_nombre,   
ins.ins_codigo, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,  
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, tii.tii_nombre, per.per_identificacion,  
per.per_email_interno, moi.moi_nombre, adr.adr_puesto, adr.adr_puntaje, adt.adt_nombre, 
(CASE WHEN ine.ine_nombre IS NULL THEN col.col_nombre ELSE ine.ine_nombre END) AS ine_nombre, 
(CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre, mat.mat_fecha 
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
INNER JOIN inscripcion ins WITH (NOLOCK) ON est.ins_codigo = ins.ins_codigo   
INNER JOIN inscripcion_programa inp WITH(NOLOCK) ON ins.ins_codigo = inp.ins_codigo   
INNER JOIN tipo_id tii WITH (NOLOCK) ON per.tii_codigo = tii.tii_codigo  
LEFT JOIN estudiante_estado ese WITH (NOLOCK) ON est.ese_codigo = ese.ese_codigo  
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo  
LEFT JOIN admision_resultado adr WITH(NOLOCK) ON  inp.inp_codigo = adr.inp_codigo   
LEFT JOIN admision_tipo adt WITH(NOLOCK) ON adr.adt_codigo = adt.adt_codigo    
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE pe.per_nombre BETWEEN '19761' AND '20212' 
--AND pro.pro_codigo IN(SELECT * FROM dbo.Split(:pro_codigo,','))  AND mat.mat_estado= 'A' 
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%')  
ORDER BY pe.per_a�o, pe.per_nombre,sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_nombre, u.uaa_nombre  

select * from acreditacion.institucion i 


select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_creacion_snies is not null


select DISTINCT u.uaa_nombre, m.mat_fecha from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 544


select u.uaa_nombre, p.pro_codigo, p.pro_registro_snies, (select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, s.sed_nombre, p.pro_fecha_creacion from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo
where pro_registro_snies is not null and na.nia_codigo in (9,10,11)


select * from 

select * from nivel_academico na 




WITH resultado(ano, periodo, sed_nombre, nat_nombre, nia_nombre, dependencia_codigo,  
        dependencia, pro_codigo, pro_registro_snies,uaa_nombre, est_codigo, ese_nombre, mat_estado, cal_nombre,  
        per_nombre, per_apellido, per_estrato, per_genero, edad, tii_nombre, per_identificacion,  
        per_email_interno, pla_codigo, pla_total_creditos, creditos_aprobados, ine_nombre, inc_nombre, 
        mti_nombre) AS (  
        SELECT pe.per_a�o AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,   
        u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo,  pro.pro_registro_snies, 
        u1.uaa_nombre, est.est_codigo, ese.ese_nombre, mat.mat_estado, cal.cal_nombre, 
        per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,  
        tii.tii_nombre, per.per_identificacion, per.per_email_interno, pla.pla_codigo, pla.pla_total_creditos,  
        (SELECT SUM(creditos_aprobados) FROM creditos_aprobados_por_calendario  
        WHERE est_codigo = est.est_codigo AND mat_codigo <= mat.mat_codigo AND pla_codigo = pla.pla_codigo ) AS creditos_aprobados, 
        (CASE WHEN ine.ine_nombre IS NULL THEN col.col_nombre ELSE ine.ine_nombre END) AS ine_nombre, 
        (CASE WHEN inc.inc_nombre IS NULL THEN col.col_sector ELSE inc.inc_nombre END) AS inc_nombre, 
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
        LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
        LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
        LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
        WHERE pe.per_nombre BETWEEN '19761' AND '20212' AND ple.ple_estado = 1 AND mat.mat_estado = 'A'  
--        AND pro.pro_codigo IN(SELECT * FROM dbo.Split(:pro_codigo,','))  
        ) SELECT * FROM resultado WHERE creditos_aprobados >= pla_total_creditos  
        AND est_codigo NOT IN (SELECT gra.est_codigo FROM graduado gra WITH (NOLOCK)   
        WHERE gra.est_codigo = est_codigo AND YEAR(gra.gra_fecha) <= ano  
        AND MONTH(gra.gra_fecha) <=  CASE SUBSTRING(periodo,LEN(periodo),1) WHEN '1' THEN '6' ELSE '12' END)  
        ORDER BY ano,periodo,sed_nombre, nat_nombre, nia_nombre, dependencia,uaa_nombre 
        
        
select * from egresado e 
select * from egresado_estadistica

select * from persona
select * from vinculacion v 
select * from uaa_personal up 

select DISTINCT pro_registro_snies, pro_registro_icfes , CASE
    WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero
    ,p.pro_fecha_creacion as fechaCreacion, cd.codigo_cine as cam_det_codigo ,
    ce.codigo_cine as cam_esp_codigo,ca.codigo_cine as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre,ca.cam_nombre,
	pe.per_nombre +' '+ pe.per_apellido as nombres , pe.per_email_interno , pe.per_telefono_movil ,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,  
    (select top 1 v.vin_nombre from uaa_personal up inner join vinculacion v on up.vin_codigo = v.vin_codigo where up.per_codigo = pe.per_codigo order by up.uap_codigo desc ) as vinculacion 
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo = 418
	
	
Select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, (select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo INNER JOIN sede s on s.sed_codigo = u.sed_codigo INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo INNER JOIN resolucion re on re.res_codigo = p.res_codigo INNER JOIN jornada j on p.jor_codigo = j.jor_codigo left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo where u.uaa_estado = 1
	 

select * from uaa_personal up 
inner join vinculacion v on up.vin_codigo = v.vin_codigo 
where per_codigo = 100472
	
ORDER by u.uaa_nombre ASC 

select * from web_parametro wp where wp.wep_nombre = 'MATRICULA_PERIODO_ACTUAL'
select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_ACTIVO'
select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_MIGRACION'


select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 103118--31475--41643

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 8

select * from persona p where p.per_codigo = 41643
exec vinculacion_actual '1075303330', 0 
select * from uaa u where u.uaa_nombre_corto like '%PRESTAMO%'
SELECT us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = 1075303330 

select * from persona p where p.per_nombre like '%BAIRON CAMILO%' and p.per_apellido like '%SALAZAR PARRA%'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 9204


select * from acreditacion.institucion i 

select * from acreditacion.institucion_acreditada ia

select * from uaa u WHERE u.uaa_nombre like '%MAESTRIA EN ADMINISTRACION DE EMPRESAS%'

select * from programa p where p.uaa_codigo = 674

select * from plan_academico pa WHERE pa.pro_codigo = 454

select * from graduado g where g.pla_codigo = 1016

select * from egresado_estadistica ee where ee.pro_codigo = 454

select * from matricula m where m.est_codigo = '20211197600'

select * from estudiante e WHERE e.per_codigo = 157297

select * from persona p where p.per_identificacion = '1084866510'




select dv.uaa_nombre, p.per_email_interno, dv.per_apellido, dv.per_nombre from docente_vinculacion dv 
inner join persona p on p.per_codigo =dv.per_codigo 
where dv.uap_fecha_fin is not null and p.per_email_interno is not null and p.per_email_interno != ' '



SELECT * from encuestas.cuestionarios c 
select * from estudiante e 

select count(*) from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
left join plan_academico pa on g.pla_codigo = pa.pla_codigo 

select * from plan_academico pa 
select * from gra

select distinct substring(ca.cal_nombre,1,4) as anno,substring(ca.cal_nombre,5,1) as periodo,ti.tii_codigo_hecaa,pe.per_identificacion,
        pe.per_nombre1,pe.per_nombre2,pe.per_apellido1,pe.per_apellido2,
        'genero' = case when pe.per_genero='M' then 1 else 2 end, pe.per_genero
       from i_inscritos i inner join r_personax4 pe on pe.per_codigo=i.per_codigo
        inner join tipo_id ti on ti.tii_codigo=pe.tii_codigo
        inner join calendario ca on ca.cal_codigo=i.cal_codigo
        inner join programa pr on pr.pro_codigo=i.pro_codigo
        inner join uaa u on u.uaa_codigo=pr.uaa_codigo
       where ca.cal_nombre like '20222%' and i.nia_codigo in (9,11,12,4,13,14,10,15)
        and i.per_identificacion not in ( select per_identificacion from snies_persona_inhabilitada) 
        and u.uat_codigo not in (SELECT wep_valor FROM web_parametro WHERE wep_nombre = 'EDUCACION_VIRTUAL_TIPO_UAA_EDUCACION_NO_FORMAL')
        
        
        
select i.ins_codigo,substring(ca.cal_nombre,1,4) as anno,substring(ca.cal_nombre,5,1) as periodo,ti.tii_codigo_hecaa,
        i.per_identificacion,pr.pro_registro_snies, mu.SNIES_codigo
       from i_inscritos i
        inner join tipo_id ti on ti.tii_codigo=i.tii_codigo
        inner join calendario ca on ca.cal_codigo=i.cal_codigo
        inner join programa pr on pr.pro_codigo=i.pro_codigo
        inner join uaa u on u.uaa_codigo=pr.uaa_codigo
        inner join sede s on s.sed_codigo=pr.sed_codigo
        inner join municipio mu on mu.mun_codigo=s.mun_codigo
       where ca.cal_nombre like '20222%' and i.nia_codigo in (9,11,12,4,13,14,10,15)
        and i.per_identificacion not in (select per_identificacion from snies_persona_inhabilitada) 
        and i.ins_codigo in (select top 1 ins_codigo from i_inscritos where pro_codigo=pr.pro_codigo and cal_codigo=ca.cal_codigo and per_identificacion=i.per_identificacion order by adr_codigo asc)        
        and uat_codigo not in (SELECT wep_valor FROM web_parametro WHERE wep_nombre = 'EDUCACION_VIRTUAL_TIPO_UAA_EDUCACION_NO_FORMAL')
        
        
select * from encuestas.cuestionarios c 

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 12





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
WHERE pe.per_nombre = '20211'
--WHERE (pe.per_nombre BETWEEN :inicio AND :fin ) AND 
ORDER BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre, u2.uaa_nombre,u.uaa_nombre  





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
WHERE pe.per_nombre = '20221'
AND (ofa.ofa_publicar_admitidos IS NOT NULL OR ofa.ofa_publicar_admitidos <> 0) 
AND adt.adt_admitido IS NOT NULL AND adt.adt_admitido like 'SI%' 
ORDER BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_nombre , u.uaa_nombre



SELECT per.per_nombre, per.per_apellido, per.per_identificacion, est.est_codigo, 
        floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
        tii.tii_nombre, pla.pla_nombre, pla.pla_codigo, pla.pla_creditos, pla.pla_total_creditos, 
        pla.pla_total_horas, pro.pro_codigo, pro.pro_registro_snies,  u1.uaa_nombre,  
        sed.sed_nombre, nia.nia_codigo, nia.nia_nombre, nat.nat_codigo,  nat.nat_nombre, cra.creditos_aprobados,  
        pcea.puntaje_calificado AS puntaje_calificado_estudiante,   
        pcaea.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_estudiante, 
        pcgcp.puntaje_calificado AS puntaje_calificado_graduado,  
        (CASE WHEN pcea.puntaje_calificado IS NOT NULL THEN pcea.puntaje_calificado ELSE pcgcp.puntaje_calificado END ) AS promedio_ponderado 
        FROM persona per WITH(NOLOCK)  
        INNER JOIN estudiante est WITH(NOLOCK) ON per.per_codigo = est.per_codigo  
        INNER JOIN plan_estudiante ple WITH(NOLOCK) ON (est.est_codigo = ple.est_codigo AND ple.ple_estado = 1) 
        INNER JOIN plan_academico pla WITH(NOLOCK) ON ple.pla_codigo = pla.pla_codigo  
        INNER JOIN programa pro WITH(NOLOCK) ON est.pro_codigo = pro.pro_codigo  
        INNER JOIN uaa u1 WITH(NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo 
        INNER JOIN nivel_academico nia WITH(NOLOCK) ON pro.nia_codigo = nia.nia_codigo 
        INNER JOIN nivel_academico_tipo nat WITH(NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
        INNER JOIN sede sed WITH(NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
        INNER JOIN tipo_id tii WITH(NOLOCK) ON per.tii_codigo = tii.tii_codigo   
        LEFT JOIN creditos_aprobados cra ON (est.est_codigo = cra.est_codigo AND cra.pla_codigo = pla.pla_codigo)  
        LEFT JOIN puntaje_calificado_estudiante_activo pcea ON est.est_codigo = pcea.est_codigo 
        LEFT JOIN puntaje_calificado_aritmetico_estudiante_activo pcaea ON est.est_codigo = pcaea.est_codigo   
        LEFT JOIN puntaje_calificado_graduado_con_perdidas pcgcp ON est.est_codigo = pcgcp.est_codigo  
        WHERE est.est_codigo = '20171155993'
        
        select * from programa p where p.pro_titulo_otorgado like '%SOFTWARE%'
        SELECT * FROM uaa u where u.uaa_codigo = 601
        select * from plan_academico pa where pa.pro_codigo = 418
select * from persona p where p.per_nombre like '%JAIRO ALFONSO%'


--981  --510
select * from token.aud_codigo_inicio_sesion acis 



select * from persona p where p.per_nombre like '%STEPHANIA%'
select * from estudiante e where e.per_codigo = 140591


select count(*) from acreditacion.matriculados_acreditacion ma where ma.periodo = '20222' 




select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, uaa_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_dependencia, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


SELECT *, (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+ pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select top 1 pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as per_email_interno, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 15

SELECT *, floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as tiempo FROM programa
where tiempo > 8


select * from acreditacion.norma_acreditable




--- 1|228    2|405    3|516


select p.per_nombre, count(*) from matricula m
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo  
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p on c.per_codigo = p.per_codigo 
where pr.pro_codigo = 405 and m.mat_estado = 'C'
group BY p.per_nombre
ORDER by p.per_nombre asc

select * from matricula 

select * from matricula_tipo mt 


-- FEA NEIVA 349,8,10,165,166,182,350 
-- FEA LA PLATA 66, 73, 520, 531
-- FEA GARZON 76, 77, 519, 530
-- FEA PITALITO 79, 78, 432, 507, 521, 532


SELECT u1.uaa_nombre, pr.per_nombre, pr.per_apellido, per.per_nombre FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo
INNER JOIN persona pr WITH (NOLOCK) ON est.per_codigo = pr.per_codigo 
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo 
INNER JOIN periodo per WITH (NOLOCK)ON cal.per_codigo = per.per_codigo 
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo 
INNER JOIN uaa u1 WITH(NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo 
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo 
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo 
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo 
WHERE pro.pro_codigo IN (349,8,10,165,166,182,350 ) and per.per_nombre = '20201' and (CONVERT(VARCHAR, est.est_fecha_ingreso, 111) <> CONVERT(VARCHAR, mat.mat_fecha, 111)) 
AND mat.mat_estado = 'A'  
AND est.est_codigo NOT IN( 
    SELECT mat1.est_codigo FROM matricula mat1 
    INNER JOIN calendario cal1 ON mat1.cal_codigo = cal1.cal_codigo 
    INNER JOIN periodo per1 ON cal1.per_codigo = per1.per_codigo 
    WHERE mat1.est_codigo = est.est_codigo  
    AND per1.per_nombre = (SELECT TOP (1) per2.per_nombre FROM periodo per2  
    WHERE per2.per_nombre < per.per_nombre ORDER BY per2.per_nombre DESC) 
) AND est.est_codigo IN ( 
    SELECT mat1.est_codigo FROM matricula mat1 
    INNER JOIN calendario cal1 ON mat1.cal_codigo = cal1.cal_codigo 
    INNER JOIN periodo per1 ON cal1.per_codigo = per1.per_codigo 
    WHERE mat1.est_codigo = est.est_codigo  
    AND per1.per_nombre < per.per_nombre 
) GROUP BY per.per_nombre, pr.per_nombre, pr.per_apellido, u1.uaa_nombre
  ORDER BY u1.uaa_nombre asc

  
  
  
  
  
  
  
 SELECT per.per_a�o AS ano, per.per_nombre AS periodo, sed.sed_nombre,nat.nat_codigo, nat.nat_nombre, nia.nia_nombre,  
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, COUNT(*) AS total 
FROM matricula mat WITH (NOLOCK) 
INNER JOIN  estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo 
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo 
INNER JOIN periodo per WITH (NOLOCK)ON cal.per_codigo = per.per_codigo 
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo 
INNER JOIN uaa u1 WITH(NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo 
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo 
INNER JOIN nivel_academico nia WITH (NOLOCK) ON pro.nia_codigo = nia.nia_codigo 
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo 
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo 
WHERE (CONVERT(VARCHAR, est.est_fecha_ingreso, 111) <> CONVERT(VARCHAR, mat.mat_fecha, 111)) 
AND mat.mat_estado = 'A' AND per.per_nombre = '20201'   
AND est.est_codigo NOT IN( 
    SELECT mat1.est_codigo FROM matricula mat1 
    INNER JOIN calendario cal1 ON mat1.cal_codigo = cal1.cal_codigo 
    INNER JOIN periodo per1 ON cal1.per_codigo = per1.per_codigo 
    WHERE mat1.est_codigo = est.est_codigo  
    AND per1.per_nombre = (SELECT TOP (1) per2.per_nombre FROM periodo per2  
    WHERE per2.per_nombre < per.per_nombre ORDER BY per2.per_nombre DESC) 
) AND est.est_codigo IN ( 
    SELECT mat1.est_codigo FROM matricula mat1 
    INNER JOIN calendario cal1 ON mat1.cal_codigo = cal1.cal_codigo 
    INNER JOIN periodo per1 ON cal1.per_codigo = per1.per_codigo 
    WHERE mat1.est_codigo = est.est_codigo  
    AND per1.per_nombre < per.per_nombre 
) GROUP BY per.per_a�o, per.per_nombre, sed.sed_nombre,nat.nat_codigo, nat.nat_nombre, nia.nia_nombre,  
u2.uaa_codigo, u2.uaa_nombre,  pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre 
    ORDER BY ano,periodo,sed_nombre,nat_codigo,nat_nombre,nia_nombre,dependencia,uaa_nombre
  
  
  
  
  
  
  
  
 select * from periodo
  
select * from uaa u where u.uaa_dependencia = 19 
  
 select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio >= 2022;
 select count(*) from acreditacion.inscritos_acreditacion ia where ia.anio >= 2022;
 select count(*) from acreditacion.
 
 
 SELECT * FROM programa p 
 inner join uaa u on p.uaa_codigo = u.uaa_codigo 
 where p.pro_codigo in (79,521)
 
 SELECT count (*)
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

        
        
        SELECT count(*)
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
        
        
        SELECT pe.per_a�o AS ano, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,  
        u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia,  pro.pro_codigo, pro.pro_registro_snies, 
        u.uaa_nombre, ins.ins_codigo, per.per_nombre, per.per_apellido, per.per_estrato, per.per_genero,  
        per.per_fecha_nacimiento, 
        floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
        tii.tii_nombre, 
        per.per_identificacion, per.per_telefono_fijo, per.per_telefono_movil, per.per_email, per.per_email_interno, 
        mun1.mun_nombre AS mun_nacimiento, mun2.mun_nombre AS mun_residencia,  
        dep1.dep_nombre AS dep_nacimiento, dep2.dep_nombre AS dep_residencia, 
        esc.esc_nombre, moi.moi_nombre, adr.adr_puesto, adr.adr_puntaje, adt.adt_nombre, adt.adt_admitido,  
        (CASE WHEN ine.ine_nombre IS NULL THEN col.col_nombre ELSE ine.ine_nombre END) AS ine_nombre, 
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
        WHERE pe.per_nombre BETWEEN :inicio AND :fin AND  
        pro.pro_codigo IN (SELECT * FROM dbo.Split(:pro_codigo,',')) 
        AND (ofa.ofa_publicar_admitidos IS NOT NULL OR ofa.ofa_publicar_admitidos <> 0) 
        AND adt.adt_admitido IS NOT NULL AND adt.adt_admitido like 'SI%' 
        ORDER BY pe.per_a�o, pe.per_nombre, sed.sed_nombre, nat.nat_nombre, nia.nia_nombre,u2.uaa_nombre , u.uaa_nombre  
        
        
        
        
        
        
select pe.per_a�o, pe.per_nombre, s.sed_nombre, u2.uaa_nombre, u.uaa_nombre, e.est_codigo, sd.sdi_descripcion from dbo.snies_estudiante_complementario sec
inner join inscripcion i on sec.ins_codigo = i.ins_codigo 
inner join inscripcion_programa ip on i.ins_codigo = ip.ins_codigo 
inner join oferta_academica oa on ip.ofa_codigo = oa.ofa_codigo 
inner join calendario c on oa.cal_codigo = c.cal_codigo 
inner join periodo pe on c.per_codigo = pe.per_codigo 
inner join persona p on p.per_codigo=sec.per_codigo
inner join estudiante e on e.per_codigo= sec.per_codigo
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join snies_discapacidad sd on sd.sdi_codigo=sec.sdi_codigo
where sec.sdi_codigo != 99 and pr.pro_codigo = 516

select * from dbo.snies_estudiante_complementario

select * from inscripcion i  

select * from inscripcion_programa ip 

select * from oferta_academica oa 

select * from acreditacion.norma_acreditable na 




SELECT _column, COUNT(*) 
FROM _table
GROUP BY _column








select p.pro_codigo, p2.per_nombre, u2.uaa_nombre, p.pro_registro_snies, 
u.uaa_nombre, s.sed_nombre, p.pro_creacion_snies,  DATEADD(year, -9, getdate()) as fecha_corte, 
p2.per_fecha_inicio, getdate() as fecha_actual, p2.per_fecha_fin, count(*) as total_matriculados from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join acreditacion.norma_acreditable na on e.pro_codigo = na.pro_codigo
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where convert(Date, p2.per_fecha_inicio) BETWEEN DATEADD(year, -9, getdate()) AND getdate() and convert(Date, p2.per_fecha_fin)  BETWEEN DATEADD(year, -9, getdate()) AND getdate() and na.gru_codigo = 15
group by p.pro_codigo, p2.per_nombre,u2.uaa_nombre, p.pro_registro_snies, u.uaa_nombre, s.sed_nombre, pro_creacion_snies, p2.per_fecha_inicio, p2.per_fecha_fin






select p.pro_codigo, p2.per_nombre, u2.uaa_nombre, p.pro_registro_snies, 
u.uaa_nombre, s.sed_nombre, p.pro_creacion_snies,  DATEADD(year, -9, getdate()) as fecha_corte, 
p2.per_fecha_inicio, getdate() as fecha_actual, p2.per_fecha_fin, count(*) as total_matriculados from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join acreditacion.norma_acreditable na on e.pro_codigo = na.pro_codigo
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where convert(Date, p2.per_fecha_inicio) BETWEEN DATEADD(year, -9, getdate()) AND getdate() and convert(Date, p2.per_fecha_fin)  BETWEEN DATEADD(year, -9, getdate()) AND getdate() and na.gru_codigo = 15
group by p.pro_codigo, p2.per_nombre,u2.uaa_nombre, p.pro_registro_snies, u.uaa_nombre, s.sed_nombre, pro_creacion_snies, p2.per_fecha_inicio, p2.per_fecha_fin



select * from estudiante e where e.est_codigo = '20171157616'

select p.pro_codigo, s.sed_nombre, u2.uaa_nombre,nat.nat_nombre, nia.nia_nombre, u.uaa_nombre, p.pro_registro_snies, p2.per_nombre, p2.per_fecha_inicio, count(*) as total_egresados from estudiante e
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join oferta_academica oa on p.pro_codigo = oa.pro_codigo 
inner join calendario c on oa.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
INNER JOIN nivel_academico nia ON p.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat ON nia.nat_codigo = nat.nat_codigo
where e.est_registro_egresado = 1 and p.pro_creacion_snies is not null
group by p.pro_codigo, s.sed_nombre, u2.uaa_nombre,nat.nat_nombre, nia.nia_nombre, u.uaa_nombre, p.pro_registro_snies, p2.per_nombre, p2.per_fecha_inicio


select p.pro_codigo, s.sed_nombre, u2.uaa_nombre,nat.nat_nombre, nia.nia_nombre, u.uaa_nombre, p.pro_registro_snies, p2.per_nombre, p2.per_fecha_inicio, count(*) as matriculados_primer_ingreso from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
INNER JOIN nivel_academico nia ON p.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat ON nia.nat_codigo = nat.nat_codigo
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where p2.per_nombre = SUBSTRING(e.est_codigo, 1, 5) and p.pro_creacion_snies is not null
group by p.pro_codigo, s.sed_nombre, u2.uaa_nombre, nat.nat_nombre, nia.nia_nombre, u.uaa_nombre, p.pro_registro_snies, p2.per_nombre, p2.per_fecha_inicio



select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, p.per_email_interno, p.per_email, u.uaa_nombre, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc


select * from matricula 


select pe.per_nombre, pe.per_apellido, usg_codigo, usg_usuario, usg_grupo, usg_uaa, usg_estado, u.uaa_nombre from usuario_grupo ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.usg_usuario = pe.per_codigo 
where usg_grupo = 34 and p.pro_codigo = 418

SELECT * FROM acreditacion.norma_nivel_academico

select * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo 
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo 
where nc.noc_estado = 1 and nc.nna_codigo = 13


select * from persona p where p.per_nombre like '%KAREN%' and p.per_apellido like '%PENAGOS%'

select * from estado_civil ec 

select * from uaa_personal up where up.uaa_codigo = 888 --(676,956)

select * from 

select * from uaa u where u.uaa_nombre like '%AMBIENTAL%'

select * from encuestas.cuestionarios c -- 17 18 19 20

select  from encuestas.respuestas_cuestionarios rc where rc.cue_codigo in (17,18,19,20)

select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.estado_invitacion ei 

SELECT * FROM acreditacion.invitacion_programa_acreditable ipa 


select p.pro_registro_snies, p.pro_registro_icfes, 
CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'INACTIVO' END AS estado, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, s.sed_nombre, m.mod_nombre, na.nia_nombre, u.uaa_nombre, re.res_numero, p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, ce.codigo_cine as cam_esp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_esp_nombre, ca.cam_nombre, uf.uaa_nombre as dependencia, j.jor_nombre, nat.nat_nombre AS academico, floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from dbo.programa p INNER JOIN dbo.uaa u on u.uaa_codigo = p.uaa_codigo 
INNER JOIN uaa uf on u.uaa_dependencia = uf.uaa_codigo INNER JOIN dbo.sede s on s.sed_codigo = u.sed_codigo INNER JOIN dbo.modalidad m on m.mod_codigo = p.mod_codigo INNER JOIN dbo.nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN dbo.jornada j on p.jor_codigo = j.jor_codigo LEFT JOIN dbo.resolucion re on re.res_codigo = p.res_codigo LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo where u.uaa_estado = 1 and p.pro_registro_snies is not null and p.pro_registro_snies != '' and p.pro_registro_snies not like '0%0' and p.pro_registro_snies != '0'






select p.per_nombre, u.uaa_nombre, e.est_codigo, pacp.promedio_aritmetico from promedio_aritmetico_con_perdidas pacp 
inner join estudiante e on pacp.est_codigo = e.est_codigo 
inner join programa p2 on e.pro_codigo = p2.pro_codigo 
inner join uaa u on p2.uaa_codigo = u.uaa_codigo 
inner join calendario c on pacp.cal_codigo = c.cal_codigo 
inner join periodo p on c.per_codigo = p.per_codigo 
where e.pro_codigo = 516 and p.per_a�o >= 2017


select YEAR(g.gra_fecha) AS periodo, u.uaa_nombre, g.est_codigo, g.gra_fecha, pcgcp.puntaje_calificado from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join puntaje_calificado_graduado_sin_perdidas pcgcp on g.est_codigo = pcgcp.est_codigo 
where e.pro_codigo = 405 and g.gra_fecha BETWEEN '01/01/2017' AND '24/11/2022'


select * from puntaje_calificado_graduado_con_perdidas pcgcp 

select * from puntaje_calificado_graduado_sin_perdidas pcgsp 

--- 1|228    2|405    3|516
select u.uaa_nombre from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo where p.pro_codigo = 405


select YEAR(g.gra_fecha) AS periodo, u.uaa_nombre, g.est_codigo, g.gra_fecha from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where e.pro_codigo = 516 and g.gra_fecha BETWEEN '01/01/2017' AND '10/11/2022'


select count(*) from graduado g 
where g.gra_fecha BETWEEN '01/01/2017' AND '24/11/2022'


select u2.uaa_nombre, u.uaa_nombre, e.est_codigo, g.gra_fecha, mi.moi_nombre from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
inner join inscripcion i on e.ins_codigo = i.ins_codigo
inner join modalidad_ingreso mi on i.moi_codigo = mi.moi_codigo 
where g.gra_fecha BETWEEN '01/01/2017' AND '24/11/2022'


select * from graduado

select * from admision_tipo at2 


select * from inscripcion

select * from modalidad_ingreso


select * from acreditacion.invitacion_programa_acreditable ipa 


select sum(pon_ponderado) as pun, ip.inp_codigo, i.ins_codigo, i.moi_codigo, 
ar.puntaje_desempate1, ar.puntaje_desempate2
  from icfes inner join icfes_area_puntaje iap on icfes.icf_snp = iap.icf_snp 
  inner join icfes_area_ponderado pon on pon.iap_codigo = iap.iap_codigo 
  inner join inscripcion i on i.icf_snp = icfes.icf_snp   
  inner join inscripcion_programa ip on i.ins_codigo = ip.ins_codigo and ip.inp_codigo = pon.inp_codigo 
  INNER JOIN admision_resultado ar ON ar.inp_codigo = ip.inp_codigo
  inner join oferta_academica oa on oa.ofa_codigo = ip.ofa_codigo 
  left  join inscripcion_desempate_icfes_20142 dn on dn.inp_codigo = ip.inp_codigo and icfes.icf_snp = dn.icf_snp 
  where i.moi_codigo in (1) and i.ies_codigo = 5 and 
  oa.ofa_codigo = 2825 and icfes.icf_antiguedad = 1 
  and ins_modulo1 is not null and ins_modulo2 is not null and ins_modulo3 is not null 
  group by ip.inp_codigo, i.ins_codigo, i.moi_codigo, ar.puntaje_desempate1, ar.puntaje_desempate2 
  order by cast(sum(pon_ponderado) as decimal(19,1)) desc, puntaje_desempate1 desc
 
  
select sum(pon_ponderado) as pun, ip.inp_codigo, i.ins_codigo, i.moi_codigo, 
ar.puntaje_desempate1 as d1, ar.puntaje_desempate2 as d2 
  from icfes inner join icfes_area_puntaje iap on icfes.icf_snp = iap.icf_snp 
  inner join icfes_area_ponderado pon on pon.iap_codigo = iap.iap_codigo 
  inner join inscripcion i on i.icf_snp = icfes.icf_snp   
  inner join inscripcion_programa ip on i.ins_codigo = ip.ins_codigo and ip.inp_codigo = pon.inp_codigo 
  INNER JOIN admision_resultado ar ON ar.inp_codigo = ip.inp_codigo
  inner join oferta_academica oa on oa.ofa_codigo = ip.ofa_codigo 
  left  join inscripcion_desempate_icfes_20142 dn on dn.inp_codigo = ip.inp_codigo and icfes.icf_snp = dn.icf_snp 
  where i.moi_codigo in (1) and i.ies_codigo = 5 and 
  oa.ofa_codigo = 2825 and icfes.icf_antiguedad = 1 
  and ins_modulo1 is not null and ins_modulo2 is not null and ins_modulo3 is not null 
  group by ip.inp_codigo, i.ins_codigo, i.moi_codigo, ar.puntaje_desempate1, ar.puntaje_desempate2 
  order by sum(pon_ponderado) desc, ar.puntaje_desempate1, ar.puntaje_desempate2  

select pun, d1 from ()
  
58.40
58.40
  
SELECT FIELD1, FIELD2 FROM TABLE ORDER BY FIELD1 ASC, FIELD2 ASC


select * from persona p where p.per_identificacion  = '36166693'

select * from estudiante e where e.per_codigo = 101825

select * from programa p where p.pro_codigo = 383


select * from municipio m 


select * from uaa_personal up where up.per_codigo = 93787


select * from programa_dpto pd where pd.uaa_codigo = 615

select * from pr

select * from cargo c 

select * from vinculacion_historico vh 
where vh.car_codigo != 3

select * from persona p where p.per_nombre LIKE '%JULIETA%' and p.per_apellido like '%TURY%'

select ma.periodo, count(*) as maticulados from acreditacion.matriculados_acreditacion ma group by ma.periodo 


select * from modulo m where m.mod_nombre like '%%'

SELECT * FROM sgd.documento d WHERE d.mod_codigo = 58


select * from estudiante e where e.est_codigo = '20192183594'

select * from persona p where p.per_codigo  =128065

select count(*) from graduado g WHERE g.gra_fecha < convert(Date, '2022-12-31')

select * from usuario_graduado ug 


select *, p.per_fecha_nacimiento, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from persona p where p.per_nombre like '%EDNA ALEXANDRA%'

select * from estudiante e where e.per_codigo = 8392

select * from graduado g where g.est_codigo = 1994100011 

select * from evento e 

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where e.pro_codigo = 418 and p.per_apellido like '%MARTINEZ%'

select * from encuestas.cuestionarios c 
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 25

SELECT count(*) from acreditacion.inscritos_acreditacion ia where ia.periodo = '20232'


select * from acreditacion.matriculados_acreditacion ma where ma.mat_codigo = 740536


select * from encuestas.cuestionarios c 
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 22

select * from encuestas.respuestas_cuestionarios rc 

select * from encuestas.cuestionarios c 

select * from estudiante e where e.per_codigo = 108797

select * from usuario_academia_login ual 

38943401

select * from usuario_general_login ugl where ugl.us = '38943401' ORDER by istipo asc


SELECT TOP 1 us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND us = '38943401' ORDER by istipo asc

SELECT us AS username, 'ROLE_ENCUESTA' as role FROM usuario_general_login WHERE state = 1 AND us = '38943401' ORDER by istipo asc 1075282351

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 22

SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre, p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno FROM usuario_general_login u INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo INNER JOIN persona p ON u.up = p.per_codigo WHERE u.us like '38943401' ORDER by istipo asc 
 
 
 select * from acreditacion.matriculados_acreditacion ma where ma.periodo = '20231' -- residencia
 

 --VISTA RESTAURANTES INSTITUCION
 CREATE VIEW [coleccion].[restaurante_sede] AS
 select u.uaa_codigo, u.uat_codigo, u.uaa_nombre, u.uaa_dependencia, u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre from uaa u 
 inner join sede s on u.sed_codigo = s.sed_codigo 
 where u.uaa_codigo in (645, 646, 647, 648, 649)
 
 
 -- VISTA MATRICULADOS CON LOS 14 CRITERIOS
CREATE VIEW [coleccion].[matriculados_restauarante] AS
SELECT mat.mat_codigo, pe.per_año AS anio, pe.per_nombre AS periodo, sed.sed_nombre, 
nat.nat_nombre as nivel_academico, nia.nia_nombre as nivel_formacion, u2.uaa_nombre AS facultad, 
pro.pro_registro_snies, u1.uaa_nombre, est.est_codigo, cal.cal_nombre, per.per_nombre, per.per_apellido, 
per.per_estrato, per.per_genero, per.per_fecha_nacimiento, 
floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
tii.tii_nombre, per.per_identificacion, dep1.dep_nombre AS dep_nacimiento, mun1.mun_nombre AS mun_nacimiento, mun2.mun_nombre AS mun_residencia, moi.moi_nombre,
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
LEFT JOIN municipio mun2 WITH (NOLOCK) ON per.per_lugar_residencia = mun2.mun_codigo 
LEFT JOIN departamento dep1 WITH (NOLOCK) ON mun1.dep_codigo = dep1.dep_codigo 
LEFT JOIN departamento dep2 WITH (NOLOCK) ON mun2.dep_codigo = dep2.dep_codigo 
LEFT JOIN modalidad_ingreso moi WITH(NOLOCK) ON ins.moi_codigo = moi.moi_codigo   
LEFT JOIN institucion_educativa ine WITH (NOLOCK) ON ins.ine_codigo = ine.ine_codigo 
LEFT JOIN institucion_categoria inc WITH (NOLOCK) ON ine.inc_codigo = inc.inc_codigo 
LEFT JOIN hecaa.colegios col WITH (NOLOCK) ON ins.hecaa_col = col.col_codigo 
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A' AND pe.per_año >= 2023


select * from 
 
 
 
