
----------------------------------------------------------------
----------------------------------------------------------------
---------------------QUERYS PARA ENCUESTAS----------------------
----------------------------------------------------------------

-----------------------------------------
--------ENCUESTA DEMOLINGÜÍSTICA---------                                                                                                                   
-----------------------------------------

--CUESTIONARIO
select * from encuestas.cuestionarios c where c.cue_codigo = 47;
select count(*) From encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 47  

--PREGUNTAS
select * from encuestas.preguntas p where p.cue_codigo = 47 and p.pre_estado = 1

--ENCUESTA DEMOLINGÜÍSTICA RADIO BUTTON
with resultado(rcu_codigo, rcu_fecha, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.rcu_fecha, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 47
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([1248],[1249],[1250],[1251],[1252],[1253],[1254],[1255])) as pvt

--ENCUESTA DEMOLINGÜÍSTICA TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 47
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([1249],[1250],[1251],[1254],[1255])) as pvt
order by rc.rcu_codigo desc


--rc.rcu_codigo, s.sed_nombre, ud.uaa_nombre as facultad, u.uaa_nombre
select rc.rcu_codigo, p.per_nombre, p.per_apellido, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, p.per_genero from encuestas.respuestas_cuestionarios rc  
inner join dbo.persona p on rc.per_codigo = p.per_codigo 
where rc.cue_codigo = 47
order by rc.rcu_codigo asc



select count(*) from encuestas.respuestas_cuestionarios rc  
where rc.cue_codigo = 47 

select count(*) from encuestas.respuestas_cuestionarios rc  
inner join dbo.estudiante e on rc.per_codigo = e.per_codigo
where rc.cue_codigo = 47 and e.est_registro_egresado = 0


SELECT DISTINCT rc.per_codigo, rc.rcu_codigo, s.sed_nombre, ud.uaa_nombre as facultad, u.uaa_nombre
FROM encuestas.respuestas_cuestionarios rc  
INNER JOIN dbo.estudiante e ON rc.per_codigo = e.per_codigo
inner join dbo.programa po on e.pro_codigo = po.pro_codigo 
inner join dbo.uaa u on po.uaa_codigo = u.uaa_codigo 
inner join dbo.uaa ud on u.uaa_dependencia = ud.uaa_codigo 
inner join dbo.sede s on po.sed_codigo = s.sed_codigo 
inner join dbo.nivel_academico na on po.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo
WHERE rc.cue_codigo = 47 and nat.nat_codigo in (1,2);


select * from matricula m 

SELECT rc.rcu_codigo, s.sed_nombre, ud.uaa_nombre as facultad, u.uaa_nombre FROM matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join encuestas.respuestas_cuestionarios rc on e.per_codigo = rc.per_codigo 
inner join dbo.programa po on e.pro_codigo = po.pro_codigo 
inner join dbo.uaa u on po.uaa_codigo = u.uaa_codigo 
inner join dbo.uaa ud on u.uaa_dependencia = ud.uaa_codigo
inner join dbo.sede s on po.sed_codigo = s.sed_codigo 
where (convert(Date, m.mat_fecha) BETWEEN '2024-07-05' AND '2024-07-30') and rc.cue_codigo = 47 


select * from usuario_estudiante ue 


select * from matricula_tipo mt 
 

select * from encuestas.respuestas_cuestionarios rc 
select * from dbo.estudiante e 

inner join dbo.programa po on e.pro_codigo = po.pro_codigo 
inner join dbo.uaa u on po.uaa_codigo = u.uaa_codigo 
inner join dbo.uaa ud on u.uaa_dependencia = ud.uaa_codigo 
inner join dbo.sede s on po.sed_codigo = s.sed_codigo 
inner join dbo.nivel_academico na on po.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
where rc.cue_codigo = 47 and nat.nat_codigo in (1,2)
order by rc.rcu_codigo desc



-- Sede, facultad, programa, nombre, edad, género


-----------------------------------------
---ENCUESTA DIAGNOSTICO SEGURIDAD VIAL---                                                                                                                   
-----------------------------------------

--CUESTIONARIO
select * from encuestas.cuestionarios c where c.cue_codigo = 45
select * From encuestas.respuestas_cuestionarios rc 

--PREGUNTAS
select * from encuestas.preguntas p where p.cue_codigo = 45 and p.pre_estado = 1

--ENCUESTA DIAGNOSTICO SEGURIDAD VIAL RADIO BUTTON
with resultado(rcu_codigo, rcu_fecha, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.rcu_fecha, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 45
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([1129],[1130],[1131],[1133],[1134],[1135],[1137],[1138],[1139],[1141],[1142],[1143],[1144],[1145],[1146],[1147],[1148],[1149],[1150],[1151],[1152],[1153],[1154],[1155],[1156],[1158],[1159],[1160],[1161],[1162],[1163],[1164],[1166],[1167],[1168],[1169],[1170],[1171],[1172],[1173],[1174],[1175],[1176],[1177],[1180],[1181],[1182],[1183],[1184],[1185],[1186],[1187],[1189],[1190],[1191],[1192],[1193],[1194],[1195],[1196],[1197],[1198],[1199],[1200],[1201],[1202])) as pvt

select DISTINCT rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
inner join dbo.uaa_personal up on up.per_codigo = rc.per_codigo 
inner join dbo.uaa u on up.uaa_codigo = u.uaa_codigo 
inner join dbo.sede s on u.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 45

--ENCUESTA DIAGNOSTICO SEGURIDAD VIAL TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 45
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([1129],[1130],[1156])) as pvt

--ENCUESTA DIAGNOSTICO SEGURIDAD VIAL DATOS COMPLEMENTARIOS
select rc.rcu_codigo, p.per_codigo, p.per_identificacion, p.per_fecha_expedicion, m.mun_nombre , floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, p.per_nombre, p.per_apellido, p.per_genero, ec.esc_nombre, 
(select top 1 u.uaa_nombre from uaa_personal up  
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as dependencia, 
(select top 1 c.car_nombre from uaa_personal up
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as cargo,
(select top 1 na.nia_nombre from persona_historia_academica pha
inner join nivel_academico na on pha.nia_codigo = na.nia_codigo 
where pha.per_codigo = p.per_codigo 
ORDER by pha.pha_codigo desc) as escolaridad 
from encuestas.respuestas_cuestionarios rc 
left join persona p on rc.per_codigo = p.per_codigo 
left join estado_civil ec on p.per_estado_civil = ec.esc_codigo 
left join municipio m on p.per_lugar_expedicion = m.mun_codigo 
where rc.cue_codigo = 45




------------------
---BIENESTAR 2023-2
------------------

select * from encuestas.cuestionarios c --44
select * from encuestas.respuestas_opciones ro 
select * from encuestas.preguntas p 

select rc.rcu_codigo, rc.cue_codigo, rc.per_codigo, p.pre_codigo, p.pre_descripcion, ro.rop_codigo, ro.rop_descripcion from encuestas.respuestas_cuestionarios rc 
inner join encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo
where rc.cue_codigo = 44

SELECT * FROM encuestas.cuestionarios c where c.cue_estado = 1

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 39 --E
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 38 --D
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 37 --A

select * from encuestas.preguntas p where p.cue_codigo = 39 and p.pre_estado = 1 --39
select * from encuestas.preguntas p where p.cue_codigo = 38 and p.pre_estado = 1 --38
select * from encuestas.preguntas p where p.cue_codigo = 37 and p.pre_estado = 1 --37

--ENCUESTA BIENESTAR TIPO RADIO BUTTOM 39
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 39
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([1005],[1006],[1007],[1008],[1009],[1010],[1011],[1012],[1013],[1014],[1015],[1016],[1017],[1018],[1019],[1020],[1021],[1022],[1023],[1024],[1025],[1026],[1027],[1028],[1029],[1030],[1031])) as pvt

select DISTINCT rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
inner join dbo.estudiante e on rc.per_codigo = e.per_codigo 
inner join dbo.programa po on e.pro_codigo = po.pro_codigo 
inner join dbo.sede s on po.sed_codigo = s.sed_codigo 
inner join dbo.nivel_academico na on po.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
where rc.cue_codigo = 39 and nat.nat_codigo in (1,2)


--ENCUESTA BIENESTAR DE TIPO TEXTO 11
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 39
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([1024],[1031])) as pvt


--ENCUESTA BIENESTAR SEYSATRA TIPO RADIO BUTTOM 12
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 38
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([977],[978],[979],[980],[981],[982],[983],[984],[985],[986],[987],[988],[989],[990],[991],[992],[993],[994],[995],[996],[997],[998],[999],[1000],[1001],[1002],[1003],[1004])) as pvt

select DISTINCT rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
inner join dbo.uaa_personal up on up.per_codigo = rc.per_codigo 
inner join dbo.uaa u on up.uaa_codigo = u.uaa_codigo 
inner join dbo.sede s on u.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 38

--ENCUESTA BIENESTAR DE TIPO TEXTO 12
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 38
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([996],[1002],[1004])) as pvt


--ENCUESTA BIENESTAR SEYSATRA TIPO RADIO BUTTOM 13
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 37
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([949],[950],[951],[952],[953],[954],[955],[956],[957],[958],[959],[960],[961],[962],[963],[964],[965],[966],[967],[968],[969],[970],[971],[972],[973],[974],[975],[976])) as pvt

select DISTINCT rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
inner join dbo.uaa_personal up on up.per_codigo = rc.per_codigo 
inner join dbo.uaa u on up.uaa_codigo = u.uaa_codigo 
inner join dbo.sede s on u.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 37

--ENCUESTA BIENESTAR DE TIPO TEXTO 13
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 37
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([968],[975])) as pvt



----------------------------------------------------------------

SELECT * FROM encuestas.cuestionarios c 

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 11
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 12
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 13

select * from encuestas.preguntas p where p.cue_codigo = 11 and p.pre_estado = 1 --11
select * from encuestas.preguntas p where p.cue_codigo = 12 and p.pre_estado = 1 --12
select * from encuestas.preguntas p where p.cue_codigo = 13 and p.pre_estado = 1 --13

--ENCUESTA BIENESTAR TIPO RADIO BUTTOM 11
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 11
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([190],[191],[192],[193],[194],[195],[196],[197],[198],[199],[200],[201],[202],[203],[204],[205],[206],[207],[208],[209],[210],[211],[212],[213],[214],[215])) as pvt

select DISTINCT rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
inner join dbo.estudiante e on rc.per_codigo = e.per_codigo 
inner join dbo.programa po on e.pro_codigo = po.pro_codigo 
inner join dbo.sede s on po.sed_codigo = s.sed_codigo 
inner join dbo.nivel_academico na on po.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
where rc.cue_codigo = 11 and nat.nat_codigo in (1,2)


--ENCUESTA BIENESTAR DE TIPO TEXTO 11
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 11
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([215])) as pvt


--ENCUESTA BIENESTAR SEYSATRA TIPO RADIO BUTTOM 12
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 12
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([219],[220],[221],[222],[223],[224],[225],[226],[227],[228],[229],[230],[231],[232],[233],[234],[235],[236],[237],[238],[239],[240],[241],[242],[243],[247],[279])) as pvt

select DISTINCT rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
inner join dbo.uaa_personal up on up.per_codigo = rc.per_codigo 
inner join dbo.uaa u on up.uaa_codigo = u.uaa_codigo 
inner join dbo.sede s on u.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 12

--ENCUESTA BIENESTAR DE TIPO TEXTO 12
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 12
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([243],[279])) as pvt


--ENCUESTA BIENESTAR SEYSATRA TIPO RADIO BUTTOM 13
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 13
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([248],[249],[250],[251],[252],[253],[254],[255],[256],[257],[258],[259],[260],[261],[262],[263],[264],[265],[266],[267],[268],[269],[270],[271],[272],[273],[282])) as pvt

--ENCUESTA BIENESTAR DE TIPO TEXTO 13
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 13
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([273])) as pvt




--ENCUESTA SEGURIDAD DE LA INFORMACIÓN

SELECT * from encuestas.cuestionarios c --32

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32 and rc.rcu_estamento = 4

select * from encuestas.preguntas p where p.cue_codigo = 32 and p.pre_estado = 1

with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 32
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([875],[876],[877],[878],[879],[880],[881],[882],[883],[884],[885],[886],[887],[888],[889],[890],[891],[892],[893],[894],[895],[896],[897],[898])) as pvt



with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 32
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([875],[876],[877],[878],[879],[880],[881],[882],[883],[884],[885],[886],[887],[888],[889],[890],[891],[892],[893],[894],[895],[896],[897],[898])) as pvt








select * from encuestas.cuestionarios c 





select * from encuestas.cuestionarios c WHERE c.uaa_codigo = 517 --27, 30, 31

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797 and rc.cue_codigo = 22

select * from encuestas.preguntas p where p.cue_codigo = 27 and p.pre_estado = 1 --27
select * from encuestas.preguntas p where p.cue_codigo = 30 and p.pre_estado = 1 --28
select * from encuestas.preguntas p where p.cue_codigo = 31 and p.pre_estado = 1 --28

select * from encuestas.preguntas p where p.cue_codigo = 31 and p.pre_estado = 1 --28

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 27 --in (27,30,31)

select rc.rcu_codigo, s.sed_nombre from encuestas.respuestas_cuestionarios rc 
inner join persona p on rc.per_codigo = p.per_codigo 
inner join estudiante e on p.per_codigo = e.per_codigo 
inner join programa p2 on e.pro_codigo = p2.pro_codigo 
inner join sede s on p2.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 11


select count(*) from encuestas.respuestas_cuestionarios rc 
inner join uaa_personal up on rc.per_codigo = up.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join sede s on u.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 30

--ENCUESTA BIENESTAR TIPO RADIO BUTTOM 27
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 27
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([767],[768],[769],[770],[771],[772],[773],[774],[775],[776],[777],[778],[779],[780],[781],[782],[783],[784],[785],[786],[787],[788],[789],[790],[791],[792],[793])) as pvt


--ENCUESTA BIENESTAR DE TIPO TEXTO 27
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 27
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([767],[768],[769],[770],[771],[772],[773],[774],[775],[776],[777],[778],[779],[780],[781],[782],[783],[784],[785],[786],[787],[788],[789],[790],[791],[792],[793])) as pvt


--ENCUESTA BIENESTAR SEYSATRA TIPO RADIO BUTTOM 30
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 30
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([819],[820],[821],[822],[823],[824],[825],[826],[827],[828],[829],[830],[831],[832],[833],[834],[835],[836],[837],[838],[839],[840],[841],[842],[843],[844],[845],[846])) as pvt

--ENCUESTA BIENESTAR DE TIPO TEXTO 30
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 30
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([819],[820],[821],[822],[823],[824],[825],[826],[827],[828],[829],[830],[831],[832],[833],[834],[835],[836],[837],[838],[839],[840],[841],[842],[843],[844],[845],[846])) as pvt


--ENCUESTA BIENESTAR SEYSATRA TIPO RADIO BUTTOM 31
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 31
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([847],[848],[849],[850],[851],[852],[853],[854],[855],[856],[857],[858],[859],[860],[861],[862],[863],[864],[865],[866],[867],[868],[869],[870],[871],[872],[873],[874])) as pvt

--ENCUESTA BIENESTAR DE TIPO TEXTO 31
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 31
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([847],[848],[849],[850],[851],[852],[853],[854],[855],[856],[857],[858],[859],[860],[861],[862],[863],[864],[865],[866],[867],[868],[869],[870],[871],[872],[873],[874])) as pvt



select * from acreditacion.campo_amplio ca 
select * from acreditacion.campo_especifico ce  

SELECT count(*) FROM encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32

select * from sibusco.restauarante_matriculados rm 

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 100675
select * from persona p where p.per_identificacion = '38943401'

select * from usuario_general_login ugl where ugl.us = '38943401'

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionarios c --- 22
select * from encuestas.preguntas p where p.cue_codigo = 22 and p.pre_estado = 1
select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32 and rc.rcu_estamento = 2
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32 and rc.rcu_estamento = 4
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32 and rc.rcu_estamento = 3
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32 and rc.rcu_estamento = 1

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 22

--ENCUESTA SOCIODEMOGRAFICA SEYSATRA TIPO RADIO BUTTOM
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 22  
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([569],[570],[571],[572],[573],[574],[575],[576],[577],[578],[579],[580],[581],[582],[583],[584],[585],[586],[587],[588],[589],[590],[591],[592],[593],[594],[595],[596],[597],[598],[599],[600],[601],[697],[698],[699],[702],[703],[704],[705],[706],[707],[708],[709],[710],[711],[712],[713],[714],[715],[716],[718],[719],[720],[721],[722],[723],[724],[725],[726])) as pvt
--and convert(Date, rc.rcu_fecha) BETWEEN '2023-04-01' AND '2023-04-30'
--and convert(Date, rc.rcu_fecha) BETWEEN '2023-11-21' AND '2023-12-04'

select * fro

--ENCUESTA SOCIODEMOGRAFICA SEYSATRA DE TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 22 
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([569],[570],[571],[572],[573],[574],[575],[576],[577],[578],[579],[580],[581],[582],[583],[584],[585],[586],[587],[588],[589],[590],[591],[592],[593],[594],[595],[596],[597],[598],[599],[600],[601],[697],[698],[699],[702],[703],[704],[705],[706],[707],[708],[709],[710],[711],[712],[713],[714],[715],[716],[718],[719],[720],[721],[722],[723],[724],[725],[726])) as pvt
--and convert(Date, rc.rcu_fecha) BETWEEN '2022-05-18' AND '2022-06-24'


select rc.rcu_codigo, p.per_codigo, p.per_identificacion, p.per_fecha_nacimiento, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, p.per_nombre, p.per_apellido, p.per_genero, ec.esc_nombre, p.per_estrato, p.per_telefono_movil, p.per_email_interno, 
(select top 1 u.uaa_nombre from uaa_personal up  
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as dependencia, 
(select top 1 c.car_nombre from uaa_personal up
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as cargo,
(select top 1 na.nia_nombre from persona_historia_academica pha
inner join nivel_academico na on pha.nia_codigo = na.nia_codigo 
where pha.per_codigo = p.per_codigo 
ORDER by pha.pha_codigo desc) as escolaridad 
from encuestas.respuestas_cuestionarios rc 
left join persona p on rc.per_codigo = p.per_codigo 
left join estado_civil ec on p.per_estado_civil = ec.esc_codigo 
where rc.cue_codigo = 22 
--and convert(Date, rc.rcu_fecha) BETWEEN '2023-11-21' AND '2023-12-04'












-- ENCUESTA COVID SINTOMAS DIARIOS
with resultado(enc_codigo, enc_inicio, per_nombre, per_codigo, per_identificacion, est_codigo, uaa_nombre_corto, per_telefono_movil, per_email_interno,pre_codigo, opc_descripcion) as(
select e2.enc_codigo, e2.enc_inicio, p.per_apellido + ' ' + p.per_nombre as nombre ,e2.per_codigo, p.per_identificacion, e2.est_codigo, u.uaa_nombre_corto, p.per_telefono_movil, p.per_email_interno, r.pre_codigo, op.opc_descripcion  from covid.encuesta e2 
inner JOIN covid.respuesta r on r.enc_codigo = e2.enc_codigo 
inner JOIN covid.opciones op on op.opc_codigo = r.opc_codigo 
inner join persona p on e2.per_codigo = p.per_codigo 
left join estudiante e on e2.est_codigo = e.est_codigo 
left join programa pr on e.pro_codigo = pr.pro_codigo 
left join uaa u on pr.uaa_codigo = u.uaa_codigo 
where e2.cat_codigo = 8 and convert(Date,e2.enc_inicio) BETWEEN '2022-03-21' AND '2022-03-22'
) SELECT * from resultado pivot( max(opc_descripcion) FOR pre_codigo in ([39],[40],[41],[42],[43],[44],[45],[46],[47],[48])) as pvt
ORDER BY enc_inicio ASC


-- ENCUESTA ACREDITACION
with resultado(cue_nombre, tus_nombre, pre_codigo, pre_identificador, pre_descripcion, rop_descripcion) as(
select c.cue_nombre, tu.tus_nombre, p.pre_codigo, p.pre_identificador, p.pre_descripcion, ro.rop_descripcion from encuestas.respuestas_cuestionarios rc
inner join persona p2 on rc.per_codigo = p2.per_codigo 
inner join encuestas.respuestas r on rc.rcu_codigo = r.rcu_codigo 
left join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
left join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
left join encuestas.preguntas p on r.pre_codigo = p.pre_codigo 
left join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
left join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
inner join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo  
where c.cue_codigo = 3 and p.pre_estado = 1
) SELECT * from resultado pivot(max(rop_descripcion) FOR pre_codigo in ([26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38])) as pvt

-- ENCUESTA ACREDITACI�N DOCENTES
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 3
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38])) as pvt

-- ENCUESTA ACREDITACI�N ESTUDIANTES
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 4
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53],[54])) as pvt

-- ENCUESTA ACREDITACI�N GRADUADOS
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 5
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([55],[56],[57],[58],[59],[60],[61],[62],[63],[64])) as pvt

-- ENCUESTA ACREDITACI�N ADMINISTRATIVOS 
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 7
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([70],[71])) as pvt


-- ENCUESTA ACREDITACI�N ADMINISTRATIVOS 
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 9
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([151],[152],[153],[154],[155],[156],[157],[158],[159],[160],[161],[162],[164],[165],[166],[167],[169],[170])) as pvt


-- REPORTE ENCUESTA COVID
with resultado(enc_codigo,per_codigo,est_codigo,pre_codigo,opc_descripcion) as(
select e2.enc_codigo,e2.per_codigo,e2.est_codigo,r.pre_codigo, op.opc_descripcion  from covid.encuesta e2 
inner JOIN covid.respuesta r on r.enc_codigo = e2.enc_codigo 
inner JOIN covid.opciones op on r.opc_codigo = op.opc_codigo 
where est_codigo ='20161144636' and e2.cat_codigo = 8 
) SELECT * from resultado pivot( max(opc_descripcion) FOR pre_codigo in ([39],[40],[41],[42],[43],[44],[45],[46],[47],[48])) as pvt

--ENCUESTA VACAUNACI�N
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 10
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([180],[181],[182],[183],[184],[185],[187],[188])) as pvt

--ENCUESTA VACUNACION TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 10
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([181],[183],[185],[188])) as pvt

--ENCUESTA SEGURIDAD DE LA INFORMACI�N
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 9
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([151],[152],[153],[154],[155],[156],[157],[158],[159],[160],[161],[162],[164],[165],[166],[167],[169],[170])) as pvt

select count(*) FROM encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 9
select * from encuestas.preguntas p where p.cue_codigo = 9 and p.pre_estado = 1

--ENCUESTA SEGURIDAD DE LA INFORMACI�N DE TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 9
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([162],[169],[170])) as pvt


select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 8 and rc.rcu_estamento = 3


select * from persona p where p.per_identificacion = '55174439'
select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 8 and rc.rcu_estamento = 3

select * from encuestas.cuestionarios c where c.cue_codigo = 9


--ENCUESTA SOCIODEMOGRAFICA SEYSATRA TIPO RADIO BUTTOM
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 8 and rc.per_codigo = 137556
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([81],[82],[83],[84],[85],[86],[87],[88],[90],[91],[92],[93],[94],[95],[96],[97],[98],[100],[102],[108],[109],[110],[111],[112],[113],[114],[115],[116],[117],[118],[119],[120],[121],[128],[132],[133],[134],[135],[136],[138],[139],[140],[141],[143],[144],[145],[146],[147],[148],[149],[171],[172])) as pvt

--ENCUESTA SOCIODEMOGRAFICA SEYSATRA DE TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 8 and rc.per_codigo = 137556
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([81],[82],[83],[84],[87],[93],[94],[108],[120],[121],[135],[136],[141],[142],[172])) as pvt
--and convert(Date, rc.rcu_fecha) BETWEEN '2022-05-18' AND '2022-06-24'

---  524

select * from encuestas.respuestas_cuestionarios rc where convert(Date, rc.rcu_fecha) BETWEEN '2022-08-05' AND '2022-09-05'
inner join persona p on rc.per_codigo = p.per_codigo 

select * from encuestas.cuestionarios c 

select rc.rcu_codigo, p.per_codigo, p.per_identificacion, p.per_fecha_nacimiento, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, p.per_nombre, p.per_apellido, ec.esc_nombre, p.per_estrato, p.per_telefono_movil, p.per_email_interno, 
(select top 1 u.uaa_nombre from uaa_personal up  
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as dependencia, 
(select top 1 c.car_nombre from uaa_personal up
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as cargo,
(select top 1 na.nia_nombre from persona_historia_academica pha
inner join nivel_academico na on pha.nia_codigo = na.nia_codigo 
where pha.per_codigo = p.per_codigo 
ORDER by pha.pha_codigo desc) as escolaridad 
from encuestas.respuestas_cuestionarios rc 
left join persona p on rc.per_codigo = p.per_codigo 
left join estado_civil ec on p.per_estado_civil = ec.esc_codigo 
where rc.cue_codigo = 8 


select * from encuestas.respuestas_cuestionarios rc 

select * from encuestas.respuestas_cuestionarios rc 
left join persona p on rc.per_codigo = p.per_codigo 
left join estado_civil ec on p.per_estado_civil = ec.esc_codigo 
where rc.cue_codigo = 16 and convert(Date, rc.rcu_fecha) BETWEEN '2022-05-18' AND '2022-06-24'

select * from cargo c 
select * from uaa_personal up 
select * from persona_historia_academica pha 

select * from uaa_personal up  -- uac_codigo   -> uaa_cargo 108797

select * from uaa_cargo uc 

(select top 1 u.uaa_nombre from uaa_personal up  
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where p.per_codigo = 108797
order by up.uap_codigo desc) as dependencia

(select top 1 c.car_nombre from uaa_personal up
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
where up.per_codigo = p.per_codigo 
order by up.uap_codigo desc) as cargo

(select top 1 na.nia_nombre from persona_historia_academica 
inner join nivel_academico na on pha.nia_codigo = na.nia_codigo 
where pha.per_codigo = p.per_codigo 
ORDER by pha.pha_codigo desc) as escolaridad 

(select top 1 na.nia_nombre from persona_historia_academica pha inner join nivel_academico na on pha.nia_codigo = na.nia_codigo where pha.per_codigo = p.per_codigo ) as escolaridad

left join persona_historia_academica pha on p.per_codigo = pha.per_codigo
left join nivel_academico na on pha.nia_codigo = na.nia_codigo

select * from encuestas.preguntas p where p.pre_estado = 1 and p.cue_codigo = 8

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 4784

select * from docente_vinculacion dv where dv.per_codigo = 4784


SELECT c.cue_codigo, c.cue_nombre, c.cue_instrucciones, u.uaa_nombre_corto as uaa_encargado, cc.cuc_codigo, ut.tus_codigo, ut.tus_nombre, uc.uaa_codigo, uc.uaa_nombre, rc.rcu_codigo, c.cue_fecha_inicio, c.cue_fecha_fin, rc.rcu_fecha FROM encuestas.cuestionarios c INNER JOIN UAA u ON c.uaa_codigo = u.uaa_codigo INNER JOIN encuestas.cuestionario_configuracion cc ON (c.cue_codigo = cc.cue_codigo AND cc.cuc_estado = 1) INNER JOIN usuario_tipo ut ON cc.tus_codigo = ut.tus_codigo LEFT JOIN UAA uc ON (cc.uaa_codigo = uc.uaa_codigo) LEFT JOIN encuestas.respuestas_cuestionarios rc ON (rc.cue_codigo = c.cue_codigo AND rc.per_codigo = 2488) WHERE c.cue_estado = 1 AND (GETDATE() BETWEEN c.cue_fecha_inicio AND c.cue_fecha_fin) AND ( (ut.tus_codigo = 3 and (cc.uaa_codigo = 345 or cc.uaa_codigo is null or cc.uaa_codigo = 345 ) and (cc.vin_codigo = 14  or cc.vin_codigo is null)))

 
 
SELECT TOP 1 us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = '12125816'
SELECT us AS username, 'ROLE_ENCUESTA' as role FROM usuario_general_login WHERE state = 1 AND us = '12125816'

EXEC [vinculacion_actual] '1075303330',''

select * from encuestas.respuestas_cuestionarios rc 


SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre, p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno FROM usuario_general_login u INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo INNER JOIN persona p ON u.up = p.per_codigo WHERE u.us like '1079173721' order by tus_nombre
 
select * from usuario_general_login ugl 

SELECT * FROM encuestas.cuestionarios c where c.cue_codigo = 16

select * from encuestas.preguntas p where p.cue_codigo = 16 and p.pre_estado = 1 

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 16

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 16

--ENCUESTA LIQUIDACI�N
with resultado(per_nombre, per_apellido, per_identificacion, rcu_codigo, per_codigo, tus_nombre, pre_codigo, rcu_fecha, rop_descripcion) as(
select ps.per_nombre, ps.per_apellido, ps.per_identificacion, rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, rc.rcu_fecha, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
join persona ps on rc.per_codigo = ps.per_codigo
where rc.cue_codigo = 16 and convert(Date, rc.rcu_fecha) BETWEEN '2022-08-09' AND '2022-08-29'
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([347],[348],[349],[350],[351])) as pvt

select * from encuestas.preguntas p WHERE p.pre_codigo in (347, 348, 349, 350, 351);

select * from persona p WHERE p.per_nombre like '%Yohan Ernesto%' and p.per_apellido like  '%Perdomo Luna%'
select * from encuestas.aud_respuestas_cuestionarios arc 
select p.per_codigo, p.per_nombre, p.per_apellido, p.per_identificacion from encuestas.respuestas_cuestionarios rc 
join persona p on rc.per_codigo = p.per_codigo
where rc.cue_codigo = 16


select count(*) from encuestas.respuestas_cuestionarios rc 
join persona p on rc.per_codigo = p.per_codigo
where rc.cue_codigo = 16


select p.per_nombre, p.per_apellido, p.per_identificacion from encuestas.respuestas_cuestionarios rc 
join persona p on rc.per_codigo = p.per_codigo
where rc.cue_codigo = 16

select * from usuario_tipo ut

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 8

SELECT * FROM encuestas.cuestionarios c 

select * from encuestas.preguntas p where p.pre_estado = 1 and p.cue_codigo = 5


select * from encuestas.cuestionarios c 

-- 17 estudiantes
-- 18 docentes
-- 19 administrativos
-- 20 graduados

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo in (17,18,19,20)

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 17
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 18
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 19
select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 20

--GRAD
select s.sed_nombre, count(*) from encuestas.respuestas_cuestionarios rc 
inner join persona p on rc.per_codigo = p.per_codigo 
inner join estudiante e on p.per_codigo = e.per_codigo 
inner join graduado g on e.est_codigo = g.est_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 20
GROUP BY s.sed_nombre 

---EST
select count(*) from encuestas.respuestas_cuestionarios rc 
inner join persona p on rc.per_codigo = p.per_codigo 
inner join estudiante e on p.per_codigo = e.per_codigo  
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 17 and s.sed_codigo != 1 


select * from encuestas.respuestas_cuestionarios rc
inner join uaa_personal up on rc.per_codigo = up.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo  
where rc.cue_codigo = 18


-- Estudiantes 385
-- GARZON	55
-- PITALITO	229
-- LA PLATA 101
------------------
-- Docentes 22
-------------------
-- Administrativos 23
-- GARZON	1
-- NEIVA	17
-- PITALITO	4
-- LA PLATA 1
--------------------
-- Graduados 10
-- GARZON	3
-- NEIVA	2
-- PITALITO	3
-- LA PLATA 2
-------------------
-- Total 440


select p.per_nombre, p.per_apellido  from encuestas.respuestas_cuestionarios rc 
inner join persona p on rc.per_codigo = p.per_codigo 
where rc.cue_codigo = 18

-- Resultado Encuestas Estudiantes por Sedes 
with resultado(rcu_codigo, sed_nombre, uaa_nombre, per_codigo, est_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, s.sed_nombre, u.uaa_nombre , e.est_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
inner join persona pe on rc.per_codigo = pe.per_codigo 
inner join estudiante e on pe.per_codigo = e.per_codigo  
inner join programa pro on e.pro_codigo = pro.pro_codigo 
inner join uaa u on pro.uaa_codigo = u.uaa_codigo 
inner join sede s on pro.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 17 and s.sed_codigo != 1 
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([352],[354],[355],[356],[357],[358],[359],[360],[361],[362],[363],[364],[366],[367],[368],[369],[370],[371],[372],[373],[374],[375],[376],[377],[378],[379],[380],[381],[382],[383],[384],[385],[386],[387],[388],[389],[390],[391],[392],[393],[394],[395],[396],[397],[398],[399],[400],[401],[402],[403],[404],[405])) as pvt

select * from encuestas.preguntas p where p.pre_estado = 1 and p.cue_codigo = 17 and p.pre_codigo != 353 and p.pre_codigo != 365

-- Resultado Encuestas Graduados por Sedes 
with resultado(rcu_codigo, sed_nombre, uaa_nombre, per_codigo, est_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, s.sed_nombre, u.uaa_nombre , e.est_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
inner join persona per on rc.per_codigo = per.per_codigo 
inner join estudiante e on per.per_codigo = e.per_codigo 
inner join graduado g on e.est_codigo = g.est_codigo 
inner join programa pro on e.pro_codigo = pro.pro_codigo 
inner join uaa u on pro.uaa_codigo = u.uaa_codigo
inner join sede s on pro.sed_codigo = s.sed_codigo 
where rc.cue_codigo = 20 and s.sed_codigo != 1 
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([496],[497],[498],[499],[500],[501],[502],[504],[505],[506],[507],[508],[509],[510],[511],[512],[513],[514],[515],[516],[517],[518],[519],[520],[521],[522],[523],[524],[525],[526],[527])) as pvt

select * from encuestas.preguntas p where p.pre_estado = 1 and p.cue_codigo = 20 and p.pre_codigo != 503

-- Resultado Encuestas Docentes por Sedes 
with resultado(rcu_codigo, uaa_nombre, per_codigo, per_nombre, per_apellido, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, u.uaa_nombre, rc.per_codigo, per.per_nombre, per.per_apellido, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
inner join uaa_personal up on rc.per_codigo = up.per_codigo 
inner join persona per on up.per_codigo = per.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where rc.cue_codigo = 18
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([406],[408],[409],[410],[411],[412],[413],[414],[415],[416],[417],[418],[419],[421],[422],[423],[424],[425],[426],[427],[428],[429],[430],[431],[432],[433],[434],[435],[436],[437],[438],[439],[440],[441],[442],[443],[444],[445],[446],[447],[448],[449],[450],[451],[452],[453])) as pvt

select * from encuestas.preguntas p where p.pre_estado = 1 and p.cue_codigo = 18 and p.pre_codigo != 407 and p.pre_codigo != 420

-- Resultado Encuestas Adminitrativos por Sedes 
with resultado(rcu_codigo, uaa_nombre, per_codigo, per_nombre, per_apellido, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, u.uaa_nombre, rc.per_codigo, per.per_nombre, per.per_apellido, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
inner join uaa_personal up on rc.per_codigo = up.per_codigo 
inner join persona per on up.per_codigo = per.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where rc.cue_codigo = 19 
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([454],[455],[456],[458],[459],[460],[461],[462],[463],[464],[465],[466],[467],[468],[469],[470],[471],[472],[473],[474],[475],[476],[477],[478],[479],[480],[481],[482],[483],[484],[485],[486],[487],[488],[489],[490],[491],[492],[493],[494],[495])) as pvt

select * from encuestas.preguntas p where p.pre_estado = 1 and p.cue_codigo = 19 and p.pre_codigo != 457



select * from encuestas.cuestionarios c 

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 21


select * from encuestas.preguntas p where p.cue_codigo = 21 and p.pre_estado = 1

-- ENCUESTA MAESTRIA ACREDITACION
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 21
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([528],[529],[530],[531],[532],[533],[534],[535],[536],[537],[538],[539],[540],[541],[542],[543],[544],[545],[546],[547],[548],[549],[550],[551],[552],[553],[554],[555],[556],[557],[558],[559],[560],[561],[562],[563],[564],[565],[566])) as pvt


select * from encuestas.cuestionarios c 

select count(*) from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 22 AND rc.per_codigo = 6420

select * from encuestas.preguntas p where p.cue_codigo = 21 and p.pre_estado = 1

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionarios c 

select * from encuestas.respuestas r where r.pre_codigo = 528

select * from encuestas.preguntas_respuestas pr 
inner join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
where pr.pre_codigo = 528


select * from encuestas.respuestas_opciones ro

SELECT p.per_nombre, p.per_apellido, p.per_email_interno 
FROM persona p 
INNER JOIN usuario_docentes ud ON p.per_codigo =ud.up 
INNER JOIN uaa_personal up ON up.per_codigo =p.per_codigo 
INNER JOIN uaa uaa on up.uaa_codigo = uaa.uaa_codigo
INNER JOIN vinculacion v ON up.vin_codigo = v.vin_codigo
WHERE ud.state = 1 AND up.uap_cargo IN (3) AND p.per_apellido  NOT LIKE 'NN CATEDRA%'
AND (GETDATE() BETWEEN up.uap_fecha_inicio AND up.uap_fecha_fin OR up.uap_fecha_fin IS NULL)
GROUP BY p.per_nombre, p.per_apellido, p.per_email_interno

select * from persona p where p.per_identificacion = '1075305953'
select * from estudiante e where e.per_codigo = 119299
