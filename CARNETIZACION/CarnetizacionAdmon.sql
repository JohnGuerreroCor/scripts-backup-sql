-------------------------
-------CONSULTAS---------
-------------------------

-- CREACIÓN DE LA TABLA AUDITORIA PARA LLEVAR EL CONTROL DE EVADOC_DOCENTE ----->>> aud_evadoc_docente 

--TABLA AUDITORIA evadoc_docente
CREATE TABLE academia3000_daniela.dbo.aud_evadoc_docente (
	aud_codigo_evadoc_docente bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) NULL,
	evd_codigo bigint NOT NULL,
	evd_uaa int NOT NULL,
	evd_docente int NOT NULL,
	evd_periodo smallint NOT NULL,
	evd_observacion varchar(400) NOT NULL,
	evd_estado int NOT NULL,
	aud_user sysname DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) DEFAULT host_name() NULL,
	CONSTRAINT aud_evadoc_docente_PK PRIMARY KEY (aud_codigo_evadoc_docente)
);


-- --DISPARADOR ACREDITACION AUD evadoc_docente INSERT 
CREATE TRIGGER [dbo].[insert_evadoc_docente] 
   ON  dbo.evadoc_docente 
   AFTER INSERT
AS 
INSERT INTO aud_evadoc_docente 
(
aud_log_type,
evd_codigo,
evd_uaa,
evd_docente,
evd_periodo,
evd_observacion,
evd_estado
)
SELECT 'INSERT',
ins.evd_codigo,
ins.evd_uaa,
ins.evd_docente,
ins.evd_periodo,
ins.evd_observacion,
ins.evd_estado
FROM inserted ins
;

-- --DISPARADOR dbo AUD evadoc_docente UPDATE
CREATE TRIGGER [dbo].[actualizar_evadoc_docente]
ON
[dbo].[evadoc_docente]
FOR update
AS
INSERT  INTO  aud_evadoc_docente
(
aud_log_type, 
evd_codigo,
evd_uaa,
evd_docente,
evd_periodo,
evd_observacion,
evd_estado
)
SELECT 'NUEVO',
ins.evd_codigo,
ins.evd_uaa,
ins.evd_docente,
ins.evd_periodo,
ins.evd_observacion,
ins.evd_estado 
from inserted ins
INSERT  INTO  aud_evadoc_docente
(
aud_log_type, 
evd_codigo,
evd_uaa,
evd_docente,
evd_periodo,
evd_observacion,
evd_estado 
)
SELECT 'VIEJO',
del.evd_codigo,
del.evd_uaa,
del.evd_docente,
del.evd_periodo,
del.evd_observacion,
del.evd_estado 
from deleted del
;







--CREATE TABLE academia3000_john.graduado.prueba (
	pru_codigo int IDENTITY(1,1) NOT NULL,
	usuario varchar(200) NOT NULL,
	pass varchar(200) NOT NULL
);


select * from academia3000_john.graduado.prueba







select * from ileusco.estudiantes_activos_ileusco eai where eai.per_identificacion = '26584851'
select * from ileusco.registro r where r.reg_ter_codigo = 189269
UPDATE academia3000_john.ileusco.registro SET reg_email='luzed09@gmail.com' WHERE reg_ter_codigo=189269;
select * from carnetizacion.ticket_estudiante_ileusco tei where tei.eil_codigo = 189269 




INSERT INTO dbo.web_parametro (wep_nombre, wep_valor, wep_descripcion, wep_estado) VALUES(N'RESTAURANTE_SEMILLA_QR', N'4D4B1308E82BE63A', N'SEMILLA DE ENCRIPTACIÓN QR RESTAURANTE', 1);


select * from persona p where p.per_codigo  = 114480

select * from web_parametro wp 

CREATE VIEW [].[estudiantes_activos_ileusco] AS
select DISTINCT per.per_codigo as eil_codigo, tii.tii_nombre_corto, per.per_identificacion, (per.per_nombre+' '+per.per_apellido) as nombre, r.reg_email from ileusco.registro r
inner join persona per on per.per_codigo = r.reg_per_codigo
inner join tipo_id tii on tii.tii_codigo = per.tii_codigo
inner join ileusco.oferta o on o.ofe_codigo = r.reg_ofe_codigo
inner join ileusco.periodo p on p.per_codigo = o.ofe_per_codigo
where r.reg_estado = 2 and r.reg_fac_codigo is not null and p.per_codigo in (select top 12 p.per_codigo from ileusco.periodo p order by p.per_codigo desc)
UNION
select DISTINCT ter.ter_codigo as eil_codigo, tii.tii_nombre_corto, ter.ter_identificacion, ter_nombre, r.reg_email from ileusco.registro r
inner join tercero ter on ter.ter_codigo = r.reg_ter_codigo
inner join tipo_id tii on tii.tii_codigo = ter.tii_codigo
inner join ileusco.oferta o on o.ofe_codigo = r.reg_ofe_codigo
inner join ileusco.periodo p on p.per_codigo = o.ofe_per_codigo
where r.reg_estado = 2 and r.reg_fac_codigo is not null and p.per_codigo in (select top 12 p.per_codigo from ileusco.periodo p order by p.per_codigo desc)

select * from ileusco.estudiantes_activos_ileusco ei where ei.per_identificacion = '1004300349'

select * from web_parametro wp where wp.wep_codigo = 204

select * from periodo p 

select * from ileusco.registro r where r.reg_estado = 2 and r.reg_per_codigo = 81737

select * from ileusco.nivel n 

select * from ileusco.oferta o 

select * from ileusco 

select * from carnetizacion.ticket_estudiante_ileusco tei

select count(*) from carnetizacion.ticket_estudiante_ileusco tei

UPDATE carnetizacion.ticket_estudiante_ileusco SET tei_estado=0 
WHERE tei_codigo=40;


UPDATE carnetizacion.ticket_estudiante_ileusco SET tei_fecha_vigencia= GETDATE() , tei_estado=1 
WHERE tei_codigo=42;

WITH CTE AS (SELECT eai.eil_codigo, eai.tii_nombre_corto, eai.per_identificacion, eai.nombre, eai.reg_email, tei.tei_estado, tei.tei_fecha_vigencia,
        ROW_NUMBER() OVER (PARTITION BY eai.per_identificacion ORDER BY tei.tei_fecha_vigencia DESC) AS RowNumber FROM ileusco.estudiantes_activos_ileusco eai
		LEFT JOIN carnetizacion.ticket_estudiante_ileusco tei ON eai.eil_codigo = tei.eil_codigo)
SELECT eil_codigo, tii_nombre_corto, per_identificacion, nombre, reg_email, tei_estado, tei_fecha_vigencia FROM CTE
WHERE RowNumber = 1
ORDER BY tei_fecha_vigencia desc


select *, GETDATE() as horaSesion  from carnetizacion.usuario_carnetizacion_admon_login uca 
inner join uaa u on u.uaa_codigo = uca.usg_uaa 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on p.per_codigo = uca.up 
where  us = 'a1075303330' 

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where p.per_identificacion = '1075214508'


select * from persona p where p.per_identificacion = '1095581534'

select * from persona p where p.per_apellido like 'ORDOÑEZ%'

select * from estudiante e where e.est_codigo = '20241221957'
select * from persona p where p.per_codigo = 177499

select * from persona p where p.per_codigo in (80043,177140)


select * from persona p where p.per_identificacion = '1075278293'

select * from tercero t where t.ter_identificacion like '%1004300349%'
--exec BuscarEstudiante '20112105161'

--select estudianteActivo('20112105161')

select top 20 t.ter_codigo, ti.snies_codigo, t.tii_codigo, t.ter_identificacion, t.ter_nombre, t.ter_email, tei.tei_fecha_vigencia from dbo.tercero t 
inner join tipo_id ti on t.tii_codigo = ti.tii_codigo 
left join carnetizacion.ticket_estudiante_ileusco tei on t.ter_codigo = tei.ter_codigo


WITH CTE AS (SELECT t.ter_codigo, ti.snies_codigo, t.tii_codigo, t.ter_identificacion, t.ter_nombre, t.ter_email, tei.tei_fecha_vigencia,
        ROW_NUMBER() OVER (PARTITION BY t.ter_identificacion ORDER BY tei.tei_fecha_vigencia DESC) AS RowNumber FROM dbo.tercero t 
		INNER JOIN tipo_id ti ON t.tii_codigo = ti.tii_codigo 
		LEFT JOIN carnetizacion.ticket_estudiante_ileusco tei ON t.ter_codigo = tei.ter_codigo)
SELECT ter_codigo, snies_codigo, tii_codigo, ter_identificacion, ter_nombre, ter_email, tei_fecha_vigencia FROM CTE
WHERE RowNumber = 1
ORDER BY tei_fecha_vigencia desc

select * from ileusco.estudiantes_periodo

select * from carnetizacion.ticket_estudiante_ileusco tei 

select * from uaa u where u.uaa_dependencia is not null and u.uat_codigo in (1,2,6,9,11,26) and u.sed_codigo in (1,2,3,4) and u.uaa_estado = 1

select * from uaa_tipo ut 

select * from carnetizacion.usuario_carnet_digital_login ucdl where ucdl.istipo = 6

select * from estudiante e where e.est_codigo = '20192185029'

select * from ileusco i 

select * from usuario_graduado_login ugl 
inner join persona p on ugl.up = p.per_codigo 
where  ugl.us = '1075303330' order by ugl.istipo asc

select COUNT(ugl.us) from usuario_graduado_login ugl  
inner join persona p on ugl.up = p.per_codigo 
where ugl.us = '1075303330'


select * from persona p where p.per_identificacion = '1075303330'

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from persona p where p.per_identificacion = '1075320464'


inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo
inner join programa pr on e.pro_codigo = pr.pro_codigo
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
inner join sede s on pr.sed_codigo = s.sed_codigo
where e.est_codigo = '20171157616'

select * from estudiante e where e.per_codigo = 168576


select * from web_parametro wp 

select * from estudiante e 

Select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from docente_vinculacion dv inner join persona p on dv.per_codigo = p.per_codigo inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo inner join tipo_id ti on p.tii_codigo = ti.tii_codigo inner join uaa u on dv.uaa_codigo = u.uaa_codigo inner join sede s on u.sed_codigo = s.sed_codigo where dv.per_identificacion  = '1075282351' order by dv.uap_codigo asc

Exec vinculacion_actual '1075282351', 0

select * from carnetizacion.usuario_carnet_digital_login ucdl where ucdl.istipo = 6

SELECT * FROM estudiante e WHERE e.est_codigo = '20191182017'

select * from graduado g 

select * from persona p 

select * from carnetizacion.ticket_visitante tv 

select * from carnetizacion.usuario_carnet_digital ucd where ucd.istipo = 5

Exec vinculacion_actual '1075282351', 0

select p.per_codigo, ti.tii_nombre, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email_interno from persona p 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
where p.per_email_interno is not null


select t.ter_codigo, ti.tii_nombre, t.ter_identificacion, t.ter_nombre1 + ' ' + t.ter_nombre2 as nombre, t.ter_apellido1 + ' ' + t.ter_apellido2 as apellido, t.ter_email from tercero t 
inner join tipo_id ti on ti.tii_codigo = t.tii_codigo 
where t.ter_email is not null

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e inner join persona p on e.per_codigo = p.per_codigo inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo inner join tipo_id ti on p.tii_codigo = ti.tii_codigo inner join programa pr on e.pro_codigo = pr.pro_codigo inner join uaa u on pr.uaa_codigo = u.uaa_codigo inner join sede s on pr.sed_codigo = s.sed_codigo where p.per_identificacion = '1075313373' order by ins_codigo desc 

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where e.est_codigo = '20192185029' order by ins_codigo desc

select *  from dbo.usuario_carnet_digital ucd where ucd.istipo = 5 --VIRTUALES
select *  from dbo.usuario_carnet_digital ucd where ucd.istipo = 6 --INTERCAMBIO

select * from estudiante e where e.est_codigo = '20191182017'
select * from estudiante e where e.est_codigo = '20191182017'
select * from programa p where p.pro_codigo = 503

select * from usuario_carnet_digital_login ucdl where ucdl.up = 147630 
select * from persona p where p.per_codigo = 147630

--update dbo.usuario_estudiantes_intercambio set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update dbo.usuario_estudiantes_virtual set uwd2=hashbytes('md5',hashbytes('sha1','12345'))

select * from dbo.usuario_estudiantes_intercambio uei 
select * from dbo.usuario_estudiantes_virtual uev 

select * from usuario_tipo utinner join usuario_tipo ut on ucd.istipo = ut.tus_codigo where ucd.up = 121026 

select count(*) from dbo.usuario_carnet_digital ucd where ucd.istipo = 6
select * from carnetizacion.usuario_carnet_digital ucd where ucd.istipo = 6
select * from carnetizacion.usuario_carnet_digital ucd where ucd.istipo = 5
where ucd.up = 83865 

select * from usuario_tipo ut 

select * from carnetizacion.horario_puesto_vigilancia hpv 


select * from persona p where p.per_codigo = 108797

select * from dbo.usuario_carnet_digital_login ucdl
select * from carnetizacion.ticket_visitante tv 
select * from encuestas.respuestas_cuestionarios rc 
select * from encuestas.cuestionarios c 
SELECT * FROM persona p where p.per_nombre = 'WILMER' and p.per_apellido like '%ALARCÓN%'
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
select * from persona p where p.per_nombre like '%JOSE ESTEBAN%' and p.per_apellido like '%CORDOBA%'
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
select * from persona p where p.per_nombre like '%juan david%' and p.per_apellido like '%garzon%'
select * from persona p where p.per_nombre like '%sergio andres%' and p.per_apellido like '%ninco%'
select * from persona p where p.per_nombre like '%zully%' and p.per_apellido like '%cuellar lopez%'
select * from persona p where p.per_apellido like '%GALIDON CHARRY%'
select * from persona p where p.per_identificacion = '1075242590'
Yina Olaya losada 

select * from estudiante e where e.per_codigo = 119299

select * from modulo m 

select * from tipo_id ti 

select * from snies_genero sg 

zully cuellar lopez


select * from persona p 

select * from sgd.documento d 


select * from graduado.

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from persona p 
inner join tipo_id t on p.tii_codigo = t.tii_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo  
where per_codigo = 54033 and per_estado = 1

Ramón Eduardo Bautista Oviedo
Alfonso Manrique Medina
--6108 es
--23182 machete

Select  *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from docente_vinculacion dv 
inner join persona p on dv.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join uaa u on dv.uaa_codigo = u.uaa_codigo 
inner join sede s on u.sed_codigo = s.sed_codigo 
where dv.per_identificacion  = '1075282351'
order by case when dv.uap_fecha_fin is null then 0 else 1 end, dv.uap_fecha_fin desc, dv.uap_fecha_inicio desc


Select  *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from docente_vinculacion dv 
inner join persona p on dv.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join uaa u on dv.uaa_codigo = u.uaa_codigo 
inner join sede s on u.sed_codigo = s.sed_codigo 
where dv.per_identificacion  = '26421468'
order by case when dv.uap_fecha_fin is null then 0 else 1 end, dv.uap_fecha_fin desc, dv.uap_fecha_inicio desc


Select  *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from docente_vinculacion dv 
inner join persona p on dv.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join uaa u on dv.uaa_codigo = u.uaa_codigo 
inner join sede s on u.sed_codigo = s.sed_codigo 
where dv.per_identificacion  = '79523543'
order by case when dv.uap_fecha_fin is null then 0 else 1 end, dv.uap_fecha_fin desc, dv.uap_fecha_inicio desc

--ORDER BY CASE WHEN uaap.uap_fecha_fin IS NULL THEN 0 ELSE 1 END, uaap.uap_fecha_fin  DESC, uaap.uap_fecha_inicio DESC

select * from uaa_personal up where up.per_codigo = 83865
select * from usuario_tipo ut 
select * from uaa u where u.uaa_codigo = 979
SELECT * FROM estudiante e where e.per_codigo = 128884


select * from uaa_personal up where up.per_codigo = 101825

select * from graduado g where g.est_codigo = '20132122391'


select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 11198

select * from carnetizacion.inicio_sesion_vigilante isv 

Exec vinculacion_actual '1075279435', 0

select * from persona p where p.per_identificacion = '12105811'

select * from uaa_personal up where up.per_codigo  = 1556

select * from tercero t
select * from uaa u 
select dbo.get

select * from persona p where p.per_identificacion = '55172390'
select * from persona p where p.per_codigo = 147606

select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.ticket_visitante tv left join tercero t on tv.ter_codigo = t.ter_codigo left join persona p on tv.per_codigo = p.per_codigo left join tipo_id ti on p.tii_codigo = ti.tii_codigo left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo inner join sede s on tv.sed_codigo = s.sed_codigo inner join sub_sede ss on tv.sus_codigo = ss.sus_codigo left join bloque b on tv.blo_codigo = b.blo_codigo left join uaa u on tv.uaa_codigo = u.uaa_codigo where p.per_identificacion = '55172390' or t.ter_identificacion = '55172390' order by tv.tiv_codigo desc


select * from carnetizacion.ticket_visitante_tipo tvt 
select * from tercero t order by t.ter_codigo desc
select * from carnetizacion.ticket_visitante tv 
select * from carnetizacion.puesto_vigilancia pv 
select * from persona p2 where p2.per_identificacion = '1004300349'
select * from carnetizacion.horario_puesto_vigilancia hpv 

select * from carnetizacion.horario_puesto_vigilancia hpv 
inner join carnetizacion.puesto_vigilancia pv on hpv.puv_codigo = pv.puv_codigo 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
inner join dia d on hpv.dia_codigo = d.dia_codigo 
ORDER BY hpv.puv_codigo, hpv.dia_codigo 

select * from carnetizacion.puesto_vigilancia pv 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
where pv.puv_estado = 1

select * from persona p where p.per_identificacion = '1003895686'

select * from estudiante e where e.per_codigo = 163858

select * from carnetizacion.puesto_vigilancia pv 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
where pv.puv_estado = 1 and pv.blo_codigo = ? and pv.pvt_codigo = ? 

select * from dia d 

select d.dia_codigo, RTRIM(d.dia_nombre) as dia_nombre, d.dia_posicion_semana from dbo.dia d where d.dia_codigo != 8

select * from dbo.hora h  

select * from usuario_tipo ut 

--CAMBIO DE CLAVE MASIVO
--update dbo.usuario_administrativos set uwd2 =HASHBYTES('MD5',HASHBYTES('SHA1','12345'))
--update dbo.usuario_docentes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update dbo.usuario_estudiantes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--CAMBIO DE CORREO MASIVO
--update uaa set uaa_email = 'guerrerocordobajohn@gmail.com'

select * from uaa u 

select * from carnetizacion.politica_estamento pe inner join dbo.usuario_tipo u on pe.tus_codigo = u.tus_codigo
where pe.tus_codigo = 

select * from carnetizacion.ticket_visitante tv where tv.tvt_codigo = 1
select * from carnetizacion.ticket_visitante_tipo tvt 
select * from dbo.tercero t 
select * from persona p where p.per_nombre like '%JONATHAN%' and p.per_apellido like '%CANO%'
select * from persona p where p.per_identificacion = '55174439'

select * from web_parametro wp 


select * from carnetizacion.politica_estamento pe 
inner join dbo.usuario_tipo u on pe.tus_codigo = u.tus_codigo 
select * from carnetizacion.politica_estamento pe 
select * from dbo.usuario_tipo ut  

select * from carnetizacion.ticket_visitante tv

select * from carnetizacion.ticket_visitante_tipo tvt 

select * from graduado g where g.est_codigo = '20142128896'

select * from estudiante e where e.per_codigo = 108797

select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.firma_digital fd 
inner join persona p on fd.per_codigo = p.per_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo order by fd.fid_codigo desc

select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.firma_digital fd 
inner join persona p on fd.per_codigo = p.per_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
where fd.fid_estado = 1 and fid_fecha_fin is null 

select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uac_codigo = 1 and uap_fecha_fin is null

select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.ticket_visitante tv 
left join tercero t on tv.ter_codigo = t.ter_codigo 
left join persona p on tv.per_codigo = p.per_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join sede s on tv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on tv.sus_codigo = ss.sus_codigo 
left join bloque b on tv.blo_codigo = b.blo_codigo 
left join uaa u on tv.uaa_codigo = u.uaa_codigo 
where tvt_codigo = 1 order by tv.tiv_codigo desc


select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.ticket_visitante tv 
left join tercero t on tv.ter_codigo = t.ter_codigo 
left join persona p on tv.per_codigo = p.per_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join sede s on tv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on tv.sus_codigo = ss.sus_codigo 
left join bloque b on tv.blo_codigo = b.blo_codigo 
left join uaa u on tv.uaa_codigo = u.uaa_codigo 
where tv.ter_codigo = 0 and tv.tvt_codigo = 2 order by tv.tiv_codigo desc

select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.ticket_visitante tv 
left join tercero t on tv.ter_codigo = t.ter_codigo 
left join persona p on tv.per_codigo = p.per_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join sede s on tv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on tv.sus_codigo = ss.sus_codigo 
left join bloque b on tv.blo_codigo = b.blo_codigo 
left join uaa u on tv.uaa_codigo = u.uaa_codigo 
where tv.per_codigo = 108797 and tv.tvt_codigo = 2 order by tv.tiv_codigo desc


select * from estudiante e 

select * from plan_academico pa 

select * FROM matricula m 

select * from matricula_curso mc 

select * from plan_academico_asignatura paa 


select * from matricula_curso mc 

select p.pro_codigo, s.sed_nombre, u2.uaa_nombre,nat.nat_nombre, nia.nia_nombre, u.uaa_nombre, p.pro_registro_snies, p2.per_nombre, e.est_codigo from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
INNER JOIN nivel_academico nia ON p.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat ON nia.nat_codigo = nat.nat_codigo
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo
where p2.per_nombre = '20171'


select * from creditos_aprobados_por_calendario capc 

select * from plan_academico pa 

WITH resultado (pro_codigo, facultad, nat_nombre, nia_nombre, sed_nombre, uaa_nombre, pro_registro_snies, per_nombre, est_codigo, pla_codigo, pla_total_creditos, creditos) AS(
SELECT p.pro_codigo, u2.uaa_nombre, nat.nat_nombre, nia.nia_nombre, s.sed_nombre, u.uaa_nombre, p.pro_registro_snies, p2.per_nombre, mat.est_codigo, paa.pla_codigo,  pla.pla_total_creditos,
(CASE WHEN paa.paa_multi_asignatura = 's' AND cur.cur_codigo IS NOT NULL THEN asi.asi_creditos 
WHEN paa.paa_multi_asignatura = 'n' THEN paa.paa_credito END) AS creditos 
FROM matricula_curso mac
INNER JOIN matricula mat ON mac.mat_codigo = mat.mat_codigo
INNER JOIN calendario cal ON mat.cal_codigo = cal.cal_codigo
inner join periodo p2 on cal.per_codigo = p2.per_codigo
LEFT JOIN curso cur ON mac.cur_codigo = cur.cur_codigo
LEFT JOIN asignatura asi ON cur.asi_codigo = asi.asi_codigo
INNER JOIN plan_academico_asignatura paa ON mac.paa_codigo = paa.paa_codigo 
INNER JOIN plan_academico pla ON paa.pla_codigo = pla.pla_codigo 
inner join programa p on pla.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
LEFT JOIN uaa u2 ON u.uaa_dependencia = u2.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
INNER JOIN nivel_academico nia ON p.nia_codigo = nia.nia_codigo   
INNER JOIN nivel_academico_tipo nat ON nia.nat_codigo = nat.nat_codigo
where mac.maa_codigo IN (1, 2) AND paa.paa_plan_academico = 0 and p2.per_nombre = '20222'
)SELECT pro_codigo, facultad, nat_nombre, nia_nombre, sed_nombre, uaa_nombre, pro_registro_snies, per_nombre, est_codigo, pla_codigo, pla_total_creditos, SUM(creditos) AS creditos_aprobados FROM resultado
GROUP BY pro_codigo, facultad, nat_nombre, nia_nombre, sed_nombre, uaa_nombre, pro_registro_snies, per_nombre, est_codigo, pla_codigo, pla_total_creditos;

inner join promedio_ponderado_con_perdidas ppcp on mat.mat_codigo = ppcp.mat_codigo

promedio_ponderado por periodo 

select * from promedio_ponderado_con_perdidas ppcp where est_codigo = '20181170326'

puntaje_calificado toda la carrera


select * from puntaje_calificado_graduado_con_perdidas pcgcp 

select * from puntaje_calificado_graduado_sin_perdidas pcgsp 

select * from web_parametro wp where wp.wep_nombre like '%TOKEN%'

select * from persona p where p.per_identificacion = '1075303330'

select * from uaa_personal up where up.per_codigo = 153123


select * from persona
select * from tipo_id


select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from persona p
inner join tipo_id t on p.tii_codigo = t.tii_codigo  
where per_estado = 1 and per_identificacion = '1075303330'



select * from estudiante e 

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where vd.est_codigo = '20171157616'

Select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from docente_vinculacion dv
inner join persona p on dv.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo  
inner join uaa u on dv.uaa_codigo = u.uaa_codigo  
inner join sede s on u.sed_codigo = s.sed_codigo 
where dv.per_identificacion  = '1075282351' order by dv.uap_codigo asc


select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from vinculacion_historico vh 
inner join persona p on vh.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo  
inner join uaa u on vh.uaa_codigo = u.uaa_codigo  
inner join sede s on u.sed_codigo = s.sed_codigo
where vh.per_identificacion = '55157810' and vh.car_codigo != 3 order by vh.uap_codigo asc


select * from uaa u where u.uaa_codigo = 615

select * from grupo_sanguineo gs 

select * from persona p where p.per_nombre = 'LEIDY DAYANA'

SELECT * FROM estudiante e where e.per_codigo  = 103982

select * from programa p where p.uaa_codigo_unificado = 615

select * from docente_vinculacion dv 
1075282351

select * from vinculacion v

select * from dedicacion d 

select * from vinculacion_historico vh 

select * from uaa u where u.uaa_codigo = 20

SELECT * from uaa_personal up where up.per_codigo = 57003

EXEC vinculacion_actual '1075320464', 0 

select * from carnetizacion.ticket_visitante tv 

select * from graduado g 



Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where g.est_codigo = '2008172797'


Select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where p.per_identificacion  = '55157810' order by g.gra_codigo desc

select * from usuario_estudiantes
Select count(*) from estudiante e where e.est_registro_egresado != 1 

select * from acreditacion.matriculados_acreditacion ma 
select * from persona p 
select * from carnetizacion.ticket_visitante tv 
inner join tercero t on tv.ter_codigo = t.ter_codigo 
inner join sede s on tv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on tv.sus_codigo = ss.sus_codigo 
left join bloque b on tv.blo_codigo = b.blo_codigo 
left join uaa u on tv.uaa_codigo = u.uaa_codigo 
where tvt_codigo = 2

select * from carnetizacion.ticket_visitante tv 
select * from dbo.tercero t where t.ter_identificacion = '1004300349'

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where e.pro_codigo = 418 and p.per_apellido like '%MARTINEZ%'
--1075251625  57817 20182173888
select * from programa p where p.pro_titulo_otorgado like '%INGENIER%'

select * from graduado g 

--update persona set per_email = 'guerrerocordobajohn@gmail.com', per_email_interno = 'john.guerrero@usco.edu.co'

select * from calendario c 

select * from periodo p 

select top 1 * from matricula m 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p on c.per_codigo = p.per_codigo 
where m.est_codigo = '20171157616' ORDER BY m.mat_codigo desc

select ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 25094 group by ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us



select ut.tus_codigo, ut.tus_nombre from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo 
where ucd.up = 143881 group by ut.tus_codigo, ut.tus_nombre

select * from persona p where p.per_identificacion = '1003916328'


Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where p.per_identificacion = '1075303330' order by ins_codigo desc



select ucd.usg_usuario, ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us from carnetizacion.usuario_carnet_digital ucd 
inner join usuario_tipo ut on ucd.istipo = ut.tus_codigo
where ucd.up = 143881 group by ucd.usg_usuario, ut.tus_codigo, ut.tus_nombre, ucd.usg_uaa, ucd.us 
order by ucd.usg_usuario desc


select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 143881
--ti.tii_nombre_corto, p.per_codigo, p.per_identificacion, p.per_apellido, p.per_nombre, vp.vop_nombre
--count
--
SELECT s.sed_nombre, u2.uaa_nombre, nat.nat_nombre, u.uaa_nombre, p.per_nombre, p.per_apellido, ti.tii_nombre_corto, p.per_identificacion
FROM persona p
INNER JOIN tipo_id ti ON p.tii_codigo = ti.tii_codigo
INNER JOIN estudiante e ON p.per_codigo = e.per_codigo
INNER JOIN programa pr ON e.pro_codigo = pr.pro_codigo
INNER JOIN nivel_academico na ON pr.nia_codigo = na.nia_codigo
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN graduado g ON e.est_codigo = g.est_codigo
inner join sede s on pr.sed_codigo = s.sed_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join uaa u2 on u.uaa_dependencia = u2.uaa_codigo 
WHERE pr.pro_propio = 'S' AND na.nia_codigo IN (4, 9, 11, 12, 13, 14)



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

-------------------------------------------------------------------------------------------

select * from graduado graduado
GROUP BY ti.tii_nombre_corto, p.per_codigo, p.per_identificacion, p.per_apellido, p.per_nombre
ORDER BY p.per_apellido ASC


select * from nivel_academico na where na.nia_codigo IN (4, 9, 11, 12, 13, 14)

SELECT  u.uaa_codigo, u.uaa_nombre, s.sed_nombre FROM persona p
INNER JOIN estudiante e ON p.per_codigo = e.per_codigo
INNER JOIN programa pr ON e.pro_codigo = pr.pro_codigo
INNER JOIN nivel_academico na ON pr.nia_codigo = na.nia_codigo
INNER JOIN uaa u ON pr.uaa_codigo = u.uaa_codigo
INNER JOIN sede s ON u.sed_codigo = s.sed_codigo
INNER JOIN graduado g ON e.est_codigo = g.est_codigo
WHERE pr.pro_propio = 'S' AND na.nia_codigo IN (4, 9, 11, 12, 13, 14)
AND p.per_codigo = 108797;

select * from tercero t 

selec

CREATE SCHEMA carnetizacion;

--*****************************--
--*CARNETIZACION ADMINISTRADOR*--
--*****************************--

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Carnetizacion Administrador', 'Módulo administrador del carné intitucional', '2023-02-24 15:45:08.230', 1);

-------------------------
--TABLAS Y DISPARADORES--
-------------------------


--TABLA TICKET ILEUSCO
--CREATE TABLE carnetizacion.ticket (
	tic_codigo int IDENTITY(1,1) NOT NULL,
	eil_codigo int NOT NULL,
	uaa_codigo int NOT NULL,
	tei_fecha_creacion date NOT NULL,
	tei_fecha_vigencia date NOT NULL,
	tei_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT ticket_estudiante_ileusco_PK PRIMARY KEY (tei_codigo)
);

--TABLA TIPO DE TIQUETE
--CREATE TABLE academia3000_john.carnetizacion.ticket_visitante_tipo (
	tvt_codigo int IDENTITY(1,1) NOT NULL,
	tvt_nombre varchar(50) NOT NULL,
	tvt_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT ticket_visitante_tipo_PK PRIMARY KEY (tvt_codigo)
);
--INSERT INTO academia3000_john.carnetizacion.ticket_visitante_tipo (tvt_nombre) VALUES('INVITADO');
--INSERT INTO academia3000_john.carnetizacion.ticket_visitante_tipo (tvt_nombre) VALUES('EXTERNO');

--TABLA TIQUETE
--CREATE TABLE academia3000_john.carnetizacion.ticket_visitante (
	tiv_codigo int IDENTITY(1,1) NOT NULL,
	ter_codigo int NULL,
	per_codigo int NULL,
	sed_codigo int NOT NULL,
	sus_codigo int NOT NULL,
	tvt_codigo int NOT NULL,
	tiv_tipo_lugar int NOT NULL,
	blo_codigo int NULL,
	uaa_codigo int NULL,
	tiv_fecha_creacion datetime NOT NULL,
	tiv_fecha_vigencia datetime NOT NULL,
	tiv_graduado int NOT NULL,
	tiv_qr varchar(200) NOT NULL,
	CONSTRAINT ticket_visitante_PK PRIMARY KEY (tiv_codigo),
	CONSTRAINT ticket_visitante_FK_1 FOREIGN KEY (sed_codigo) REFERENCES academia3000_john.dbo.sede(sed_codigo),
	CONSTRAINT ticket_visitante_FK_2 FOREIGN KEY (sus_codigo) REFERENCES academia3000_john.dbo.sub_sede(sus_codigo),
	CONSTRAINT ticket_visitante_FK_3 FOREIGN KEY (tvt_codigo) REFERENCES academia3000_john.carnetizacion.ticket_visitante_tipo(tvt_codigo)
);


--TALBA LEYENDA ESTAMENTO
--CREATE TABLE academia3000_john.carnetizacion.politica_estamento (
	poe_codigo int IDENTITY(1,1) NOT NULL,
	tus_codigo int NOT NULL,
	poe_fecha_creacion date DEFAULT getdate() NOT NULL,
	poe_fecha_modificacion datetime DEFAULT getdate() NOT NULL,
	poe_descripcion varchar(500) NOT NULL,
	CONSTRAINT politica_estamento_PK PRIMARY KEY (poe_codigo),
	CONSTRAINT politica_estamento_FK_1 FOREIGN KEY (tus_codigo) REFERENCES academia3000_john.dbo.usuario_tipo(tus_codigo)
);

--INSERT INTO academia3000_john.carnetizacion.politica_estamento (tus_codigo, poe_descripcion) VALUES(2, 'Este carné identifica al titular como Estudiante de la Universidad Surcolombiana, es personal e intransferible y su único responsable es el portador. En caso de pérdida, instaure la denuncia respectiva.');
--INSERT INTO academia3000_john.carnetizacion.politica_estamento (tus_codigo, poe_descripcion) VALUES(4, 'Este carné identifica al titular como Graduado de la Universidad Surcolombiana, es personal e intransferible y su único responsable es el portador. En caso de pérdida, instaure la denuncia respectiva.');
--INSERT INTO academia3000_john.carnetizacion.politica_estamento (tus_codigo, poe_descripcion) VALUES(3, 'Este carné identifica al titular como Docente de la Universidad Surcolombiana, es personal e intransferible y su único responsable es el portador. En caso de pérdida, instaure la denuncia respectiva.');
--INSERT INTO academia3000_john.carnetizacion.politica_estamento (tus_codigo, poe_descripcion) VALUES(1, 'Este carné identifica al titular como Administrativo de la Universidad Surcolombiana, es personal e intransferible y su único responsable es el portador. En caso de pérdida, instaure la denuncia respectiva.');

--TABLA FIRMA DIGITAL RECTOR
--CREATE TABLE academia3000_john.carnetizacion.firma_digital (
	fid_codigo int IDENTITY(1,1) NOT NULL,
	per_codigo int NOT NULL,
	uap_codigo int NOT NULL,
	fid_nombre varchar(200) NULL,
	fid_fecha_creacion date DEFAULT getdate() NOT NULL,
	fid_fecha_fin date NULL,
	fid_estado int DEFAULT 1 NOT NULL,
	fid_ruta int NOT NULL,
	CONSTRAINT firma_digital_PK PRIMARY KEY (fid_codigo),
	CONSTRAINT firma_digital_FK_1 FOREIGN KEY (per_codigo) REFERENCES academia3000_john.dbo.persona(per_codigo),
	CONSTRAINT firma_digital_FK_2 FOREIGN KEY (uap_codigo) REFERENCES academia3000_john.dbo.uaa_personal(uap_codigo)
);
 
