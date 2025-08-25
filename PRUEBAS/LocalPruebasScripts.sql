select * from persona p where p.per_codigo = 118014select * from autorizacion_terminos aut where aut.per_codigo = 108797;DECLARE @exists INT; SELECT @exists = (SELECT COUNT(1) FROM sibusco.restaurante_grupo_gabu                   WHERE per_codigo = 163500 AND rgg_vigencia <= '2025-02-28'); IF (@exists > 0) BEGIN     UPDATE sibusco.restaurante_grupo_gabu     SET rgg_estado = 1, rgg_vigencia = '2025-02-28', rtg_codigo = 1     WHERE per_codigo = 163500END ELSE BEGIN     INSERT INTO sibusco.restaurante_grupo_gabu (rgg_vigencia, rtg_codigo, per_codigo, est_codigo)     VALUES ('2025-02-28', 1, 163500, '20221206668');     SELECT SCOPE_IDENTITY(); ENDselect * from sibusco.restaurante_grupo_gabu;select * from sibusco.restaurante_dias_beneficio select * from token.codigo_inicio_sesion c where c.uid = 146624and c.mod_codigo = 74 and c.cis_ip = '127.0.0.1' --and getdate() < c.cis_fecha_expira order by c.cis_codigo desc select * from token.codigo_inicio_sesion c where c.uid = 94851SELECT CONVERT(VARCHAR(10), GETDATE(), 105) AS FechaActual;
select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797select * from encuestas.cuestionarios

select * from web_parametro wp where wp.wep_nombre like '%virtual%'

select * from  curso_virtual cv where cv.cur_url is not null


select * from carnetizacion.ticket_estudiante_ileusco tei 

select * from uaa_personal up where up.per_codigo = 83865

select * from sibusco.restaurante_horario_servicio rhs where rhs.rhs_uaa_codigo = 645
select * from estudiante e where e.est_codigo = '20181166364'

SELECT * FROM matricula m 

select * from persona p where p.per_codigo = 108797;

UPDATE certificaciones.certificado_documento_vinculacion SET cdv_descripcion='', cdv_password='', per_codigo=0, per_codigo_admin=0, cdv_fecha='', doc_codigo=0 WHERE cdv_codigo=0;


select pe.per_codigo,  m.est_codigo, pe.per_identificacion, g.gra_fecha from dbo.graduado g 
INNER JOIN dbo.estudiante e on g.est_codigo = e.est_codigo 
INNER JOIN dbo.matricula m on e.est_codigo = m.est_codigo 
INNER JOIN dbo.persona pe on e.per_codigo = pe.per_codigo 
INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo 
INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo 
WHERE convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin;


select * from graduado g;

select pe.per_codigo, pe.per_identificacion, e.est_codigo, g.gra_fecha, p.per_fecha_inicio, p.per_fecha_fin from dbo.estudiante e 
INNER JOIN dbo.persona pe on e.per_codigo = pe.per_codigo 
inner join dbo.matricula m on e.est_codigo = m.est_codigo 
INNER JOIN dbo.calendario c ON m.cal_codigo = c.cal_codigo 
INNER JOIN dbo.periodo p ON c.per_codigo = p.per_codigo
left join dbo.graduado g on e.est_codigo = g.est_codigo 
WHERE (convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin) and g.gra_fecha is not null;


DECLARE @personaCodigo TABLE (per_codigo INT,per_identificacion varchar(100)) insert into @personaCodigo (per_codigo, per_identificacion) 
select top 1 p.per_codigo, p.per_identificacion from persona p 
inner join estudiante e on p.per_codigo = e.per_codigo
left join graduado g on e.est_codigo = g.est_codigo 
where (e.est_codigo = '20171157616' or p.per_identificacion  = '20171157616')

select * from persona p 
INNER JOIN @personaCodigo pc on p.per_codigo = pc.per_codigo
INNER JOIN estudiante e on p.per_codigo = e.per_codigo
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo  
INNER JOIN programa po on e.pro_codigo = po.pro_codigo 
INNER JOIN nivel_academico na on po.nia_codigo = na.nia_codigo 
INNER JOIN nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo and nat.nat_codigo in (1,2)
left join uaa u on po.uaa_codigo = u.uaa_codigo 
left join sede s on po.sed_codigo = s.sed_codigo 
left join municipio m on p.per_lugar_expedicion = m.mun_codigo
LEFT JOIN graduado g on e.est_codigo = g.est_codigo order by g.gra_fecha desc

select * from nivel_academico_tipo nat 

select * from programa p 

--and g.gra_fecha is null


select * from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
left join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
left join tipo_id ti on p.tii_codigo = ti.tii_codigo 
left join programa pr on e.pro_codigo = pr.pro_codigo 
left join nivel_academico na on pr.nia_codigo = na.nia_codigo 
left join uaa u on pr.uaa_codigo = u.uaa_codigo 
left join sede s on pr.sed_codigo = s.sed_codigo 
left join municipio m on p.per_lugar_expedicion = m.mun_codigo 
where (g.est_codigo = '1075303330' or p.per_identificacion  = '1075303330') order by g.gra_fecha desc 




select *, GETDATE() as horaInicioSesion from usuario_graduado_login ugl 
inner join persona p on ugl.up = p.per_codigo 
where  ugl.us = 'a1075303330' order by ugl.istipo asc;

SELECT * FROM dbo.matricula m 
INNER JOIN dbo.estudiante e on m.est_codigo = e.est_codigo 
INNER JOIN dbo.persona pe on e.per_codigo = pe.per_codigo 
INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo 
INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo 
WHERE (m.est_codigo = '1075226439' or pe.per_identificacion = '1075226439') AND convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio AND p.per_fecha_fin

--1075320675


select * from usuario_grupo ug where ug.usg_usuario = 146624 and ug.usg_estado = 1

select * from carnetizacion.inicio_sesion_vigilante isv 


SELECT
  p.per_codigo,
  ue.uid,
  p.per_identificacion,
  p.per_apellido,
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
    ue.us = ''
    or p.per_identificacion = '1075303330';

select * from uaa_personal up where up.per_codigo  = 108797

select * from uaa u where u.uaa_codigo = 315

select * from uaa_personal

select * from usuario_administrativo ua where ua.up = 144065 --164260

select * from grupo g 



select * from uaa_vinculacion uv 

select * from dbo.aud_usuario_grupo aug 

select * from grupo g 

select * from uaa_personal up 

select * from vinculacion v 
select count(*) from carnetizacion.empleados e 
select * from carnetizacion.estudiantes e2

select * from vinculacion v 

select * from dbo.usuario_grupo ug select count(*) from carnetizacion.empleados e 
select * from carnetizacion.estudiantes e2

select * from vinculacion v 
select count(*) from uaa_personal up where up.uap_id_carnet is not null

--update dbo.usuario_graduados set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
select * from dbo.usuario_graduados
select * from usuario_academia_login ual 

SELECT * from dbo.usuario_general_login

select * from dbo.usuario_estudiante_login uel 

select * from dbo.usuario_carnet_digital ucd where ucd.up = 108797

select * from dbo.usuario_carnet_digital_login ucdl where ucdl.up = 1087979

select  top 1 * from dbo.usuario_carnet_digital_login ucdl  
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where  us = 'u20171157616' order by ucdl.usg_codigo desc


select COUNT(ucdl.us) from dbo.usuario_carnet_digital_login ucdl 
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where us = 'a1075303330'

--CREATE VIEW [dbo].[usuario_alta_acreditacion_login]
AS
SELECT        p.per_codigo, ua.uid, ua.us, ua.sys, ua.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ua.state, ua.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_administrativos ua INNER JOIN
                         dbo.persona p ON ua.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ua.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ua.state = 1)
UNION
SELECT        p.per_codigo, ud.uid, ud.us, ud.sys, ud.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ud.state, ud.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_docentes ud INNER JOIN
                         dbo.persona p ON ud.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ud.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ud.state = 1)

select * from programa where pro_codigo =

select * from academia3000_daniel.dbo.campo_amplio ca 

select * from uaa

select * from modulo m  where mod_codigo

select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	full JOIN  uaa u on u.uaa_codigo = p.uaa_codigo
	full JOIN sede s on s.sed_codigo = u.sed_codigo
	full JOIN modalidad m on m.mod_codigo = p.mod_codigo
	full JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	full JOIN resolucion re on re.res_codigo = p.res_codigo
	full JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	full JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	full JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	full JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo
	full JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	full join persona pe on pe.per_codigo= ud.up
	where pro_codigo = $P{pro_codigo}  and ug.usg_grupo = 34  and ug.usg_estado = 1
	
	
	
	
	
	
	
	SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
INNER JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
 left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 165


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 445 





select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 0
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	
	
	DROP TABLE acreditacion.NewTable 
	
	CREATE TABLE academia3000_daniel.acreditacion.criterios (
	cri_codigo int IDENTITY(1,1) NOT NULL,
	cri_id varchar(100) NOT NULL,
	cri_titulo varchar(100) NOT NULL,
	cri_vigencia varchar(100) NULL,
	cri_descripcion varchar(100) NULL
	ALTER TABLE academia3000_daniel.acreditacion.criterios ADD CONSTRAINT criterios_PK PRIMARY KEY (cri_codigo);

);

select pro_registro_snies,pro_extension_snies from dbo.programa 
CREATE TABLE academia3000_daniel.acreditacion.variables (
	var_codigo int IDENTITY(1,1) NOT NULL,
	var_nombre varchar(100) NOT NULL,
	cri_codigo int NOT NULL,
	CONSTRAINT variables_PK PRIMARY KEY (var_codigo),
	CONSTRAINT variables_FK FOREIGN KEY (cri_codigo) REFERENCES academia3000_daniel.acreditacion.criterios(cri_codigo)
);
CREATE TABLE academia3000_daniel.acreditacion.items (
	ite_codigo int IDENTITY(1,1) NOT NULL,
	ite_nombre varchar(100) NOT NULL,
	var_codigo int NOT NULL,
	CONSTRAINT items_PK PRIMARY KEY (ite_codigo),
	CONSTRAINT items_FK FOREIGN KEY (var_codigo) REFERENCES academia3000_daniel.acreditacion.variables(var_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_acreditacion (
	noa_codigo int IDENTITY(1,1) NOT NULL,
	noa_nombre varchar(200) NOT NULL,
	noa_fecha_inicio date NOT NULL,
	noa_fecha_fin date NULL,
	CONSTRAINT norma_acreditacion_PK PRIMARY KEY (noa_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_nivel_academico (
	nna_codigo int IDENTITY(1,1) NOT NULL,
	nna_nombre varchar(200) NOT NULL,
	nia_codigo int NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT norma_nivel_academico_PK PRIMARY KEY (nna_codigo),
	CONSTRAINT norma_nivel_academico_FK FOREIGN KEY (nia_codigo) REFERENCES academia3000_daniel.dbo.nivel_academico(nia_codigo),
	CONSTRAINT norma_nivel_norma_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_criterio (
	noc_codigo int IDENTITY(1,1) NOT NULL,
	noc_nombre varchar(200) NOT NULL,
	nna_codigo int NOT NULL,
	tiempo int NOT NULL,
	CONSTRAINT norma_criterio_PK PRIMARY KEY (noc_codigo),
	CONSTRAINT norma_criterio_FK FOREIGN KEY (nna_codigo) REFERENCES academia3000_daniel.acreditacion.norma_nivel_academico(nna_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_acreditable (
	nac_codigo int  IDENTITY(1,1) NOT NULL,
	nac_nombre varchar(200) NOT NULL,
	noa_codigo int NOT NULL,
	pro_codigo int not null,
	creacion  date DEFAULT getDate() NOT NULL,
	CONSTRAINT norma_acreditable_PK PRIMARY KEY (nac_codigo),
	CONSTRAINT norma_acreditable_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo),
	CONSTRAINT norma_acreditable_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_daniel.dbo.programa(pro_codigo),
	
);

CREATE TABLE academia3000_daniel.acreditacion.grupos_acreditables (
	gru_codigo int IDENTITY(1,1) NOT NULL,
	gru_nombre varchar(100) NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT grupos_acreditables_PK PRIMARY KEY (gru_codigo),
	CONSTRAINT grupos_acreditables_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);


ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_estado int NOT NULL;

ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD  DEFAULT 1 FOR noa_estado;
ALTER TABLE academia3000_daniel.acreditacion.norma_nivel_academico ADD nna_estado int DEFAULT 1 NOT NULL;
ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_ruta varchar(200) NULL;

select dbo.getTokenDocumento("5453254684") as token
select * from acreditacion.norma_acreditacion
select * from sgd.documento where per_codigo=54684

INSERT INTO academia3000_daniel.acreditacion.norma_acreditacion (noa_nombre, noa_fecha_inicio, noa_fecha_fin, noa_estado, noa_ruta) VALUES('', '', '', 1, '');

ALTER TABLE academia3000_daniel.dbo.programa ADD pro_creacion_snies date NULL;

SELECT * from acreditacion.norma_criterio nc join acreditacion.norma_nivel_academico nna on nc.nna_codigo =nna.nna_codigo join acreditacion.norma_acreditacion na  on na.noa_codigo =nna.noa_codigo where nc.nac_estado=1

select mod_codigo from programa p 

SELECT * from acreditacion.norma_acreditable na join  acreditacion.norma_acreditacion na2 on na.noa_codigo =na2.noa_codigo join programa p2 on na.pro_codigo =p2.pro_codigo join nivel_academico na3 on p2.nia_codigo =na3.nia_codigo join modalidad m2 on p2.mod_codigo =m2.mod_codigo

select  from programa p 



select * from ( Select  pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,uaa_estado,uaa_nombre,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-
cast(convert(varchar(8),pro_creacion_snies,112) as int) ) / 10000)as tiempo from programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where pro_creacion_snies is not null  and ua.uaa_estado = 1

)temporal where tiempo>8 

select * from acreditacion.norma_nivel_academico nna where noa_codigo = ? and nna_estado =1

select *from uaa where uaa_nombre like'%facultad%'


SELECT * from acreditacion.norma_acreditable nac join  acreditacion.norma_acreditacion noa 
on nac.noa_codigo =noa.noa_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
 
 
 select * from acreditacion.grupos_acreditables ga join acreditacion.norma_acreditacion na on ga.noa_codigo = na.noa_codigo where noa_estado =1
 
 INSERT INTO acreditacion.grupos_acreditables (gru_nombre, noa_codigo) VALUES('', 0);

SELECT * from acreditacion.norma_acreditable nac join  acreditacion.grupos_acreditables gru 
on nac.gru_codigo = gru.gru_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo where gru.gru_codigo =1


select *from programa_estado pe 

select * from acreditacion.norma_acreditable na where gru_codigo =3

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_amplio (
	aud_codigo_campo_amplio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_codigo int NOT NULL,
	cam_estado int NOT NULL,
	cam_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_amplio_PK PRIMARY KEY (aud_codigo_campo_amplio)
);

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_detallado (
	aud_codigo_campo_detallado bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_det_codigo int NOT NULL,
	cam_det_estado int NOT NULL,
	cam_esp_codigo int NOT NULL,
	cam_det_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_detallado_PK PRIMARY KEY (aud_codigo_campo_detallado)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditable (
	aud_codigo_norma_acreditable bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nac_codigo int not null,
	nac_nombre varchar(200) not null,
	pro_codigo int not null,
	nac_creacion date not null,
	nac_estado int not null,
	gru_codigo int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditable_PK PRIMARY KEY (aud_codigo_norma_acreditable)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditacion (
	aud_codigo_norma_acreditacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noa_codigo int not null,
	noa_nombre varchar(200) not null,
	noa_fecha_inicio date not null,
	noa_fecha_fin date,
	noa_estado int not null,
	noa_ruta varchar(200),
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditacion_PK PRIMARY KEY (aud_codigo_norma_acreditacion)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_criterio (
	aud_codigo_norma_criterio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noc_codigo int not null,
	noc_nombre varchar(200) not null,
	nna_codigo int not null,
	noc_tiempo int not null,
	noc_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_criterio_PK PRIMARY KEY (aud_codigo_norma_criterio)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_nivel_academico (
	aud_codigo_norma_nivel_academico bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	nna_codigo int not null,
	nna_nombre varchar(200),
	nia_codigo int not null,
	noa_codigo int not null,
	nna_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_nivel_academico_PK PRIMARY KEY (aud_codigo_norma_nivel_academico)
);
SELECT * from encuestas.cuestionarios c 

SELECT * from encuestas.preguntas p join encuestas.tipo_respuestas tr on p.tre_codigo =tr.tre_codigo
 join encuestas.cuestionarios c on p.cue_codigo=c.cue_codigo left join encuestas.grupo_escala g on p.gre_codigo= g.gre_codigo
  where c.cue_codigo=:codigo AND (p.pre_tipo=0 OR p.pre_tipo=2) AND p.pre_estado=1 AND (p.tre_codigo=1 OR p.tre_codigo=4)

CREATE TABLE academia3000_daniel.acreditacion.aud_grupos_acreditables (
	aud_codigo_grupos_acreditables bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	gru_codigo int not null,
	gru_nombre varchar(200),
	noa_codigo int not null,
	gru_creacion date,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_grupos_acreditables_PK PRIMARY KEY (aud_codigo_grupos_acreditables)
);




aud_log_type, 
cam_det_codigo,
cam_det_estado,
cam_esp_codigo,
cam_det_nombre,
codigo_cine, 


select (select value from split(pro_estado ,'0') where value !='') as estado,pro_titulo_otorgado as titulo ,pro_codigo as codigo  from programa 

select * from split

update academia3000_daniel.dbo.programa 
set pro_estado = (
select * from split(pro_estado ,'0') where value !=''
)
from programa

select pro_estado from programa p 

where pro_codigo = pro_codigo 


SELECT * FROM SplitProEstado('05')

DECLARE @a char='05'
SELECT @a, cast(@a as int)


select * from acreditacion.norma_acreditacion na 
select  * FROM programa p 

select * from acreditacion.norma_criterio nc 


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN resolucion r on r.res_codigo = p.res_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
FULL JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
WHERE p.uaa_codigo = 29


select * from uaa_personal where uap_cargo=76 and vin_codigo =46 and uap_fecha_fin is null

select per_apellido, per_nombre from uaa_personal, persona where uap_cargo  = 76 and vin_codigo = 46 and uap_fecha_fin is null

select * from persona where per_codigo =  136709

select * from uaa_personal

select * from estudiante where est_registro_egresado = 0

select * from egresado 

select * from cargo

select * from programa where pro_estado=1

-- QUERY ESTUDIANTES POR PROGRAMAS
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where pro.pro_codigo = 418 and pro.pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = '20171157616' and pro.pro_codigo = 418 and pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa con variables
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = $P{est_codigo} and pro.pro_codigo = $P{pro_codigo} and pro_estado = 1 and e.est_registro_egresado = 0


-- Programa con Jefe de Programa
SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
WHERE p.pro_codigo = 456

-- QUERY JASPER ORIGINAL, DOCENTE CON FILTRO DISTINCT
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
    ELSE 'PREGRADO' END AS formacion
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
	where pro_codigo =$P{pro_codigo}

-- MODIFICACI�N QUERY JASPER DANIEL
select pro_registro_snies, pro_registro_icfes,p.uaa_codigo_unificado , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p join (select pr.uaa_codigo_unificado,pr.pro_codigo from programa pr group by uaa_codigo_unificado,pro_codigo)  pr
	on p.pro_codigo =pr.pro_codigo
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	GROUP by p.uaa_codigo_unificado

select * from academia3000_john.encuestas.cuestionario_configuracion cc 
	
-- VISTA DOCENTES Y DOCENTE
SELECT * from usuario_docente order by usg_usuario 	
    SELECT dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado,p.uaa_codigo_unificado
    FROM dbo.grupo INNER JOIN
            dbo.usuario_grupo ON dbo.grupo.gru_codigo = dbo.usuario_grupo.usg_grupo INNER JOIN
            dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
            join programa p on p.uaa_codigo =dbo.usuario_grupo.usg_uaa GROUP  by p.uaa_codigo_unificado, dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado order by                       
WHERE (dbo.grupo.gru_id = 'JEFE_PROGRAMA')                
    select * from usuario_grupo ug 
    select * from uaa where uaa_codigo = 794
    SELECT * FRom programa where uaa_codigo_unificado  = 794
    
UPDATE acreditacion.campo_detallado SET cam_det_nombre=:nombre, cam_det_estado=:estado,cam_esp_codigo=:esp, codigo_cine=:cine WHERE cam_det_codigo=:codigo



SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = ua.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
WHERE ua.sed_codigo = $P{pro_codigo} and ua.uaa_estado = 1 order by ua.uaa_nombre asc

SELECT * from sede s 


--CAMBIO DE CLAVE ADMINISTRATIVOS
--update dbo.usuario_administrativos set uwd2 =HASHBYTES('MD5',HASHBYTES('SHA1','12345'))
--update dbo.usuario_docentes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update dbo.usuario_estudiantes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update persona set per_email = 'guerrerocordobajohn@gmail.com', per_email_interno = 'john.guerrero@usco.edu.co'

select * from web_parametro wp where wp.wep_nombre like '%TOKEN%' --http://sergio.usco.edu.co/iniciosesion/


select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
WHERE ca.cam_estado = 1

select ro.rop_descripcion,p.pre_descripcion,p.pre_identificador,c.cue_nombre,tu.tus_nombre,per.per_nombre,u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, ro.rop_descripcion, p.pre_descripcion, p.pre_identificador, c.cue_nombre, tu.tus_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, per.per_apellido, per.per_nombre, 
e.est_codigo, s.sed_nombre, u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from uaa


select * from usuario_general_login ugl WHERE ugl.us = '12113154'
EXECUTE vinculacion_actual '1080266346', 0
EXECUTE vinculacion_actual '1075232353', 0
EXECUTE academia3000_john.vinculacion_actual(:@per_identificacion, :@uaa_codigo) 
select * from programa

 select * from programa

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion,CASE WHEN res_texto != null THEN res_texto ELSE rop_descripcion END AS respuesta , c.cue_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.preguntas p on c.cue_codigo  = p.cue_codigo  
join encuestas.preguntas_respuestas pr on p.pre_codigo = pr.pre_codigo  
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
join dbo.persona per on rc.per_codigo = per.per_codigo 
join dbo.estudiante e on per.per_codigo = e.per_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join dbo.programa pro on e.pro_codigo = pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from encuestas.respuestas r 
select * from encuestas.preguntas_respuestas pr  

CASE WHEN r.res_texto != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,

select * from encuestas.respuestas_cuestionarios rc  
select * from encuestas.preguntas p  
select * from encuestas.respuestas r 


select * from uaa u WHERE u.uaa_nombre like '%VICE%'

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, ro.rop_descripcion, r.res_texto, c.cue_nombre from encuestas.respuestas r 
LEFT JOIN encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
LEFT JOIN encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
LEFT JOIN encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo
LEFT JOIN encuestas.preguntas p on c.cue_codigo = p.cue_codigo  
LEFT JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
LEFT JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join dbo.persona per on rc.per_codigo = per.per_codigo 
join dbo.estudiante e on e.per_codigo = per.per_codigo 
join dbo.programa pro on e.pro_codigo = pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo  
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo =:programa ) and c.uaa_codigo =:uaa

select * from persona where per_apellido like '%ROJAS ROJAS%'

select * from encuestas.respuestas r -- res_codigo, rcu_codigo, prr_codigo, res_texto, pre_codigo
select * from encuestas.cuestionarios c -- cue_codigo
join uaa u on c.uaa_codigo = u.uaa_codigo 
select * from encuestas.cuestionario_configuracion cc 
select * from encuestas.preguntas p -- pre_codigo, cue_codigo, pre_tipo, tre_codigo
select * from encuestas.preguntas_respuestas pr -- prr_codigo, rop_codigo, pre_codigo, tre_codigo
select * from encuestas.respuestas_opciones ro -- rop_codigo
select * from encuestas.tipo_respuestas tr 
select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo in (1,2) --where rc.per_codigo = 108797

select * from usuario_docente_general udg 

-- CASE WHEN r.prr_codigo != null THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta
-- CASE WHEN p.pre_tipo != 2 THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta


select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, CASE WHEN r.prr_codigo is null THEN r.res_texto ELSE ro.rop_descripcion END AS respuesta, c.cue_nombre from encuestas.respuestas r
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
left join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
left join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
left join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
left join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
left join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

SELECT * from programa p
join uaa u on p.uaa_codigo_unificado = u.uaa_dependencia  

SELECT p.pro_codigo, u.uaa_nombre_corto, u.uaa_dependencia  from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
WHERE p.uaa_codigo_unificado is not null and p.pro_estado = 1 and u.uaa_nombre like '%MAESTRIA EN PSICOLOGIA%'
ORDER by p.sed_codigo

select * from nivel_academico na na.nia_codigo in (9,11)

select * from persona p where p.per_identificacion = '1075303330' -- JS: 87855  JG: 108797

select * from uaa u WHERE uaa_codigo  = 24

select * FROM usuario u where usu_persona = 87855
select * from usuario_administrativo ua where ua.up = 87855

select * from usuario_administrativo ua where ua.us = 'a1075232353'

SELECT * from 

select * FROM usuario_grupo ug where ug.usg_usuario = 155684
select * FROM usuario_grupo ug where ug.usg_usuario = 146624
select * FROM usuario_grupo ug where ug.usg_usuario = 54684
select * from grupo g 
--insert usuario_grupo (usg_usuario,usg_grupo,usg_uaa) values(146624,239,554)

select * FROM usuario_grupo ug where ug.usg_usuario = 87855

select * from grupo g WHERE g.gru_codigo = 4



select * from persona p where p.per_identificacion = '1075220954' 


select * from academia3000_john.dbo.usuario_grupo ug where usg_grupo = 239
select * from persona where per_codigo = 87855

	54684	283	532	1
	
select * from uaa
select * from usuario_grupo ug where ug.usg_grupo = 276

select * from usuario_grupo ug where ug.usg_usuario in (146624, 96663)

select * from grupo g where gru_nombre like '%acreditacion%'

select * from grupo g where gru_codigo  = 106

select * from usuario_general ug where up in (108797,87855)
select * from usuario_administrativos ug where up = 108797

UPDATE usuario_administrativos set sys = 'jhonhenrysolorzanolozano' where uid = 146624

INSERT INTO usuario_grupo (usg_usuario,usg_grupo,usg_uaa,usg_estado) VALUES (146624,283,554,1);

SELECT * from usuario_general ug  where us like '%a1075303330%'  -- 146624  108797  a1075303330
 																--- 96663  87855  a1075232353
SELECT p.per_apellido, p.per_nombre, e.est_codigo, e.enc_inicio, p2.pre_descripcion, o.opc_descripcion FROM covid.encuesta e 
inner join dbo.persona p on e.per_codigo = p.per_codigo 
inner join covid.pregunta p2 on e.cat_codigo = p2.cat_codigo
inner join covid.respuesta r on p2.pre_codigo = r.pre_codigo 
inner join covid.opciones o on r.opc_codigo = o.opc_codigo  
where p2.cat_codigo = 8 and p2.pre_estado = 1


select * from covid.encuesta e
select * from covid.categoria c -- 7, 8
select * from covid.pregunta p
select * from covid.opciones o 
select * from covid.respuesta r 
select * from covid.respuesta_subopciones rs 
select * from covid.tipo_respuestas tr 

 
 select * from covid.encuesta e 
 ---
select * from promedio_ponderado pp  
select * from covid.autorizacion_ingreso ai
 
-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int,
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);


 
SELECT * FROM acreditacion.programas_registrados_snies prs 
select * from persona p 
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo where p.per_nombre = 'JOHAN MANUEL' AND pro_codigo = 418

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

	
select * from programa
select * from usuario_grupo
select * from grupo


-- TABLA MYSQL PROGRAMAS
/*
CREATE TABLE acreditacion.programas (
	pro_codigo int IDENTITY(1,1) NOT NULL,
	pro_codio_unificado int NULL,
	pro_registro_snies_codigo int NULL,
	pro_registro_icfes int NULL,
	pro_estado int NULL,
	pro_oferta varchar(10) NULL,
	pro_sede varchar(100) NULL,
	pro_formacion varchar(100) NULL,
	pro_nivel_academico varchar(100) NULL,
	pro_modalidad varchar(100) NULL,
	pro_facultad varchar(250) NULL,
	pro_nombre varchar(250) NULL,
	pro_creacion_snies date NULL,
	pro_resolucion varchar(250) NULL,
	pro_fecha_creacion date NULL,
	pro_jefe varchar(250) NULL,
	pro_email_jefe varchar(250) NULL,
);
*/


select * from encuestas.cuestionarios c

SELECT pre_descripcion FROM [covid].pregunta WHERE cat_codigo=8 ORDER BY pre_codigo ASC

SELECT * FROM [seysatra].encuesta_covid WHERE
            convert(varchar(10),ecov_fecha, 120) BETWEEN '2021-03-14' AND '2022-04-19' AND ecov_tipo=1
            ORDER BY
            ecov_fecha ASC
            
SELECT * FROM covid.encuesta e          




select * from encuestas.cuestionarios c 
select * from encuestas.preguntas p where p.cue_codigo = 9 and p.pre_estado = 1
select * from programa

SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo= ud.up
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo
where gru.gru_codigo = 14


SELECT *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 3 


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo = 3


select * from programa

select DISTINCT * from ( 
Select 
 pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,
pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres , pr.per_email_interno,
uaa_estado,uaa_nombre,uaa_dependencia,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-cast(convert(varchar(8),pro_creacion_snies,112) as int)
 ) / 10000)as tiempo from programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo = ud.up
where p.nia_codigo = 11
and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5

select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5


select * from persona 





SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 165


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 )temporal where tiempo > 8

select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
where ca.cam_estado = 1


select *,CASE WHEN ce.cam_esp_codigo = cd.cam_esp_codigo  THEN null ELSE ce.cam_esp_nombre END AS especifico  from acreditacion.campo_detallado cd
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
where cd.cam_det_estado = 1

with ts as (
      select cd.*, row_number() over (partition by cd.cam_esp_codigo order by cd.cam_esp_codigo) as seqnum
      from acreditacion.campo_detallado cd 
     )
select cd.cam_esp_codigo,
       (case when seqnum = 1 then cd.cam_esp_codigo end) as cd.cam_esp_codigo
from ts;


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE uaa_codigo = 318 and uap_fecha_fin is not null

select * from vinvul

select * from persona where per_nombre LIKE '%JULIO ROBERTO' AND per_apellido like '%CANO BARRERA'

select top 1 p.per_identificacion as est_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181' --36167024
ORDER BY up.uap_codigo DESC 

select * from programa where uaa_codigo = 318

select * from uaa where uaa_codigo = 318

select top 1 p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181'
ORDER BY up.uap_codigo DESC 


SELECT * FROM estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where pro_codigo = 8 and e.est_registro_egresado = 1

SELECT *, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia from acreditacion.norma_acreditable nac  
join acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 



select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 12 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


UPDATE acreditacion.institucion 
SET ins_nit=:nit, ins_ies=:ies, ins_ies_padre=:iespadre, ins_sector=:sector, ins_nombre=:nombre, ins_caracter_academico=:caracter, mun_codigo=:municipio, ins_direccion=:direccion, ins_telefonos=:telefonos, ins_web=:web, ins_norma=:norma, ins_fecha_creacion=:creacion, ins_existencia=:existencia, ins_ruta=:ruta 
WHERE ins_codigo=:codigo



INSERT INTO acreditacion.institucion 
(ins_nit, ins_ies, ins_ies_padre, ins_sector, ins_nombre, 
ins_caracter_academico, mun_codigo, ins_direccion, 
ins_telefonos, ins_web, ins_norma, ins_fecha_creacion, 
ins_existencia, ins_ruta) 
VALUES(:nit,:ies,:iespadre,:sector,:nombre,:caracteracade,:municipio,:direccion,:telefonos,:web,:nombrenorma,:creacion,:existencia,:ruta);

EXECUTE sibusco.jovenes_accion_periodo 20212


select m.cal_codigo, mu.SNIES_codigo,'1114' AS insti,
       p.pro_registro_snies, e.est_codigo, 
       t.snies_codigo,   
	   pe.per_identificacion,
       per_nombre1,      per_nombre2, 
       per_apellido1,      per_apellido2,
       pe.per_genero,      pe.per_fecha_nacimiento,
       mu.SNIES_codigo,    pe.per_email,
       pe.per_telefono_fijo, pe.per_telefono_movil,
       s.sed_nombre,     u.uaa_nombre,
       pe.per_genero,      m.mat_codigo , edps.est_dps as IDPERSONA,  m.mat_estado 
from estudiantes_dps edps 
INNER JOIN estudiante e ON (edps.est_codigo=e.est_codigo)
INNER JOIN r_personax4 pe ON (e.per_codigo=pe.per_codigo)
INNER JOIN matricula m ON (m.est_codigo=e.est_codigo)
INNER JOIN calendario ca ON (ca.cal_codigo=m.cal_codigo)
INNER JOIN programa p ON (e.pro_codigo=p.pro_codigo)
INNER JOIN uaa u ON (p.uaa_codigo=u.uaa_codigo)
INNER JOIN sede s ON (u.sed_codigo=s.sed_codigo)
INNER JOIN tipo_id t ON (pe.tii_codigo=t.tii_codigo)
INNER JOIN municipio mu ON (mu.mun_codigo=s.mun_codigo)
where edps.per_codigo=(SELECT per_codigo
						FROM periodo  WHERE per_nombre = '20212'  )
AND ca.per_codigo=edps.per_codigo
AND ( convert( int ,substring(e.est_codigo,0,5)) BETWEEN 2012 and year(getdate() ) )
order by  e.est_codigo  asc
END


select * from calendario c

select * from web_parametro wp where wp.wep_nombre  like '%%'

UPDATE acreditacion.institucion_acreditada 
SET ins_codigo=:instcodigo, ina_norma=:norma, ina_fecha_inicio=:inicio, ina_fecha_fin=:fin, 
ina_vigencia=:vigencia, ina_estado=:estado 
WHERE ina_codigo=:codigo

select * from acreditacion.institucion i 
select * from acreditacion.institucion_acreditada ia 

select * from matriculados_resumen mr  
select * from matricula_curso mc 
select *, LEFT(e.est_codigo , 5) as periodo from estudiante e 



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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up 
	where pro_codigo = 8

select * from uaa u
inner join programa pr on u.uaa_codigo = pr.uaa_codigo 
inner join acreditacion.comite_autoevaluacion ca on u.uaa_codigo = ca.uaa_codigo 
inner join acreditacion.integrante_comite_autoevaluacion ica on ca.coa_codigo = ica.coa_codigo 
inner join persona p on ica.per_codigo = p.per_codigo 
where pr.pro_codigo = 10


SELECT * from acreditacion.comite_autoevaluacion ca
inner join programa p on ca.uaa_codigo = p.uaa_codigo 
order by coa_fecha_creacion


select * from encuestas.cuestionarios c

select * from persona

select * from uaa where uaa_codigo = 627


select * from acreditacion.institucion i 

UPDATE academia3000_john.acreditacion.institucion SET ins_nit=N'891.180.084-2', ins_ies=1114, ins_ies_padre=1114, ins_sector=1, ins_nombre=N'UNIVERSIDAD SURCOLOMBIANA', ins_caracter_academico=4, mun_codigo=905, ins_direccion=N'Avenida Pastrana Borrero Carrera 1 ', ins_telefonos=N'8754753', ins_web=N'www.usco.edu.co', ins_norma=N'ACUERDO', ins_fecha_creacion='1976-01-30', ins_existencia=45, ins_ruta=N'140539', ins_estado=1 WHERE ins_codigo=2;


select * from acreditacion.institucion_acreditada ia 

-- ACREDITABLES Y COMITE DE AUTOEVALUACION
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


SELECT * , CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
inner JOIN resolucion re on re.res_codigo = p.res_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
inner join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17
--left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo
--CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite

-- 33 PROGRAMAS ACREDITABLES
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombre  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as correo, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17



select * from acreditacion.norma_acreditable na where na.gru_codigo = 17

inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 

select distinct u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
ORDER by u.uaa_nombre ASC 


select * from usuario_docente where state = 1
select * from usuario_grupo

select * from grupo


-- JEFES DE PROGRAMA POR GRUPO
select distinct  u.uaa_nombre_corto, u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and up.uap_fecha_fin is null
ORDER by u.uaa_nombre ASC 


select * from grupo
select * from cargo

-- JEFES DE PROGRAMA POR CARGO
select u.uaa_codigo, p.per_apellido, p.per_nombre, u.uaa_nombre_corto, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where c.car_codigo in (76, 77) and up.uap_fecha_fin is null and up.vin_codigo = 46

select * from usuario_grupo ug 
select * from uaa_personal where vin_codigo = 46 and uap_cargo in (76,77) and uap_fecha_fin is null

select * from uaa where uaa_nombre like '%ADMINISTRACION%' 


-- PROGRAMAS CON REGISTRO DE FECHA Y CAMPOS DETALLADOS
select * from programa p where p.uaa_codigo_unificado is not null and cam_det_codigo is not null


-- PROGRAMAS CON CONDICIONES PARA SER ACREDITABLES
select p.pro_codigo, u.uaa_codigo, u.uaa_nombre_corto from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join acreditacion.norma_acreditable na on p.pro_codigo = na.pro_codigo  
where p.pro_creacion_snies is not null and na.gru_codigo = 17
order by u.uaa_nombre



-- 33 PROGRAMAS ACREDITABLES EM TOTAL
select * from acreditacion.norma_acreditable na where na.gru_codigo = 17



-- PROGRAMAS JASPER EXCEL
select pro_registro_snies, p.pro_registro_icfes , CASE
    WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as
    pro_fecha_creacion, cd.codigo_cine as cam_det_codigo ,ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre,
    ce.cam_esp_nombre as cam_esp_nombre,ca.cam_nombre,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS academico,
    floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia,
    p.pro_creacion_snies
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	INNER JOIN resolucion re on re.res_codigo = p.res_codigo
	INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
	left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	where pro_codigo in (SELECT p.pro_codigo  FROM programa p
				INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo
				INNER JOIN sede s on s.sed_codigo = p.sed_codigo
				INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
				INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
				INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
				WHERE  ua.uaa_estado = 1) order by estado
				
				
select * from jornada j
select * from programa


Select p.pro_registro_snies, p.pro_registro_icfes, 
CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, 
CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = u.sed_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN resolucion re on re.res_codigo = p.res_codigo 
INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select * from encuestas.cuestionarios c 

EXEC vinculacion_actual '12113154'


SELECT * FROM programa p where pro_codigo = 375
select * from uaa where uaa_codigo = 480




select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
JOIN sede s on s.sed_codigo = u.sed_codigo 
JOIN modalidad m on m.mod_codigo = p.mod_codigo 
JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
JOIN resolucion re on re.res_codigo = p.res_codigo 
JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1


select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from dbo.uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from dbo.programa p 
JOIN dbo.uaa u on u.uaa_codigo = p.uaa_codigo 
JOIN dbo.sede s on s.sed_codigo = u.sed_codigo 
JOIN dbo.modalidad m on m.mod_codigo = p.mod_codigo 
JOIN dbo.nivel_academico na on na.nia_codigo = p.nia_codigo 
JOIN dbo.resolucion re on re.res_codigo = p.res_codigo 
JOIN dbo.jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select count(*) from acreditacion.programas_registrados_snies prs 
select * from acreditacion.programas_registrados_snies prs

select * from 

--select * from web_parametro wp where wp.wep_nombre = 'MATRICULA_PERIODO_ACTUAL'


select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_ACTIVO'
select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_MIGRACION'


SELECT * FROM acreditacion.programas_registrados_snies




select * from programa

select * from curso_virtual cv

INSERT INTO programas (pro_indicador, pro_codio_unificado, pro_registro_snies_codigo, pro_registro_icfes, pro_estado, pro_oferta, 
pro_sede, pro_formacion, pro_nivel_academico, pro_modalidad, pro_facultad, pro_nombre, pro_creacion_snies, pro_resolucion, 
pro_fecha_creacion, pro_jefe, pro_email_jefe) VALUES (,,,,,,,,,,,,,,,,);


UPDATE acreditacion.programas SET pro_codigo = ?, pro_codigo_unificado = ?, pro_registro_snies = ?, pro_registro_icfes = ?, 
pro_estado = ?, pro_oferta = ?, sed_nombre = ?, pro_formacion = ?, nia_nombre = ?, mod_nombre = ?, pro_facultad = ?, uaa_nombre = ?, 
pro_creacion_snies = ?, pro_resolucion = ?, pro_fecha_creacion = ?, pro_jefe = ?, pro_email_jefe = ? where pro_codigo = ?;

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 8
select * from usuario_tipo ut 

select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JUAN CARLOS%' and p.per_apellido like '%ALBARRACIN%'
--Guissela Alexandra L�pez Rodr�guez

select * from usuario_general_login ugl 


SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre,
 p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno
 FROM usuario_general_login u
 INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo
 INNER JOIN persona p ON u.up = p.per_codigo
 WHERE u.us like 7731066 order by u.uid DESC
 
 SELECT TOP 1 us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = 'a1075303330'
 
 SELECT us AS username, 'ROLE_ENCUESTA' as role FROM usuario_general_login WHERE state = 1 AND us = 'u20171157616'
 
 
 
SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, ss.sus_nombre FROM programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
inner join sub_sede ss on s.sed_codigo = ss.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 375

select * from sub_sede ss 

select * from uaa u where u.uat_codigo = 3

select * from uaa_tipo ut 

select * from acreditacion.integrante_comite_autoevaluacion ica 

select * from persona p where p.per_codigo = 71599

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 375

select distinct City, Country from Employees

select DISTINCT ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre from acreditacion.campo_detallado cd 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where ca.cam_estado = 1


select *, ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
where ca.cam_estado = 1

select * from sub_sede ss where ss.sus_estado = 1

select * from uaa u where u.uaa_codigo = 480 

select * from programa p 

select * from programa_titulo pt 

select * from plan_academico pa 

select DISTINCT p.pro_titulo_otorgado, (SELECT TOP 1 pla_total_creditos from plan_academico pa 
where pa.pro_codigo=p.pro_codigo and pla_total_creditos > 0 and pla_total_creditos is not null ORDER BY pla_codigo DESC) as totalCreditos  from programa p
where totalCreditos > 0

inner join plan_academico pa on p.pro_codigo = pa.pla_codigo
where pa.pla_total_creditos > 0
order by p.pro_titulo_otorgado 


select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JARO LEON%' and p.per_apellido like 'CASTRO ZAMORA'
select * from persona p where p.per_nombre like '%DIEGO ANDRES%' and p.per_apellido like '%CARVAJAL%'

select * from vinculacion_historico vh where vh.per_codigo = 2488

select * from estudiante e where e.per_codigo = 140591

select * from encuestas.cuestionarios c 

exec vinculacion_actual '12125816',''

SELECT u2.uaa_nombre AS dependencia, u1.uaa_nombre,pro.pro_registro_snies,  
            (CASE WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'A' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'C' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'D' THEN 'Distancia' END) as pro_calendario, 
            j.jor_nombre, (SELECT SUM(cup_cupo) FROM cupo c WHERE c.ofa_codigo =ofa.ofa_codigo) as cupo, 
            (SELECT TOP 1 pla_total_creditos from plan_academico pa 
            where pa.pro_codigo=pro.pro_codigo ORDER BY pla_codigo DESC) as totalCreditos 
            FROM oferta_academica ofa WITH (NOLOCK)  
            INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
            INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
            INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
            INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
            INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo  
            INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
            INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
            INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo  
            INNER JOIN jornada j WITH (NOLOCK) on pro.jor_codigo = j.jor_codigo  
--            WHERE per.per_nombre in (:periodo) AND sed.sed_codigo =1 
--            AND nia.nia_codigo in (9,11) 
            ORDER BY nat_nombre,dependencia,u1.uaa_nombre 
            
select * from acreditacion.institucion i 

select * from acreditacion.grupos_acreditables ga 

select * from matriculados_resumen mr 

select * from hecaa.colegios c 
select * from institucion_educativa ie 
select * from institucion_categoria ic 

select * from web_parametro wp

--SELECT per.per_nombre, per.per_apellido, per.per_identificacion, est.est_codigo, 
        floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
        tii.tii_nombre, pla.pla_nombre, pla.pla_codigo, pla.pla_creditos, pla.pla_total_creditos, 
        pla.pla_total_horas, pro.pro_codigo, pro.pro_registro_snies,  u1.uaa_nombre,  
        sed.sed_nombre, nia.nia_codigo, nia.nia_nombre, nat.nat_codigo,  nat.nat_nombre, cra.creditos_aprobados,  
        pcea.puntaje_calificado AS puntaje_calificado_estudiante,   
        pcaea.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_estudiante, 
        pcgcp.puntaje_calificado AS puntaje_calificado_graduado, 
        pcagcp.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_graduado, 
        (CASE WHEN pcea.puntaje_calificado IS NOT NULL THEN pcea.puntaje_calificado ELSE pcgcp.puntaje_calificado END ) AS promedio_ponderado, 
        (CASE WHEN pcaea.puntaje_calificado_aritmetico IS NOT NULL THEN pcaea.puntaje_calificado_aritmetico ELSE pcagcp.puntaje_calificado_aritmetico END ) AS promedio_aritmetico 
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
        LEFT JOIN puntaje_calificado_aritmetico_graduado_con_perdidas pcagcp ON est.est_codigo = pcagcp.est_codigo 
        WHERE est.est_codigo = 20171155993;

select * from usuario_administrativo ua 

select c.car_nombre, p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, p.per_email_interno, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where up.uap_fecha_fin is not null
ORDER BY up.uap_codigo DESC 

57003
1075226439

select * FROM encuestas.respuestas_cuestionarios rc where rc.per_codigo = 57003}


select * from resolucion r;



        
        
        
-- ACREDITACION INFORME DE PROGRAMAS 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_programa (
	asp_codigo int IDENTITY(1,1) NOT NULL,
	asp_item char (1) NULL,
	asp_aspecto varchar(1000) NOT NULL,
	asp_aprobado int NULL,
	asp_archivo varchar(250) NULL,
	asp_ruta varchar(250) NULL,
	asp_observacion varchar(1000) NULL,
	asp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_programa_PK PRIMARY KEY (asp_codigo)
);

select * from acreditacion.aspecto_programa ap 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_institucion (
	asi_codigo int IDENTITY(1,1) NOT NULL,
	asi_item char (1) NULL,
	asi_aspecto varchar(1000) NOT NULL,
	asi_aprobado int NULL,
	asi_archivo varchar(250) NULL,
	asi_ruta varchar(250) NULL,
	asi_observacion varchar(1000) NULL,
	asi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_institucion_PK PRIMARY KEY (asi_codigo)
);

select * from acreditacion.aspecto_institucion ai 

-- TABLA VARIABLES FORMULARIO
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);

-- TABLA INFORME PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_programa (
	inp_codigo int IDENTITY(1,1) NOT NULL,
	inp_fecha  date NOT NULL,
	pro_codigo int NOT NULL,
	inp_estado int DEFAULT 1 NOT NULL,
	gru_codigo int NOT NULL,
	CONSTRAINT informe_programa_PK PRIMARY KEY (inp_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_programa_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo)
);



-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);

select * from acreditacion.criterios_condiciones_iniciales cci 


-- TABLA INFORME CHEQUEO PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_programa (
	icp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	icp_item char (1) NULL,
	icp_aspecto varchar(1000) NOT NULL,
	icp_aprobado int NULL,
	icp_archivo varchar(250) NULL,
	icp_ruta varchar(250) NULL,
	icp_observacion varchar(1000) NULL,
	icp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_programa_PK PRIMARY KEY (icp_codigo),
	CONSTRAINT informe_chequeo_programa_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

-- TABLA INFORME CHEQUEO INSTITUCION
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_institucion (
	ici_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	ici_item char (1) NULL,
	ici_aspecto varchar(1000) NOT NULL,
	ici_aprobado int NULL,
	ici_archivo varchar(250) NULL,
	ici_ruta varchar(250) NULL,
	ici_observacion varchar(1000) NULL,
	ici_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_institucion_PK PRIMARY KEY (ici_codigo),
	CONSTRAINT informe_chequeo_institucion_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

select * from acreditacion.informe_chequeo_programa icp

select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.aspecto_institucion ai  

select * from acreditacion.informe_chequeo_programa where inp_codigo = 1 ORDER by icp_item

select * from acreditacion.informe_programa ip 

-- TABLA ESTADO NOTIFICACION
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);


-- TABLA INVITACION PROGRAMA ACREDITABLE
--CREATE TABLE academia3000_john.acreditacion.invitacion_programa_acreditable (
	ipa_codigo int IDENTITY(1,1) NOT NULL,
	gru_codigo int NOT NULL,
	pro_codigo int NOT NULL,
	ipa_fecha_envio date NOT NULL,
	ipa_fecha_respuesta date NULL,
	ipa_hash varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ipa_estado int NULL,
	CONSTRAINT invitacion_programa_acreditable_PK PRIMARY KEY (ipa_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK FOREIGN KEY (ipa_estado) REFERENCES academia3000_john.acreditacion.estado_invitacion(esi_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_2 FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo)
);


-- TABLA INFORME GENERAL PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_general_programa (
	igp_codigo int IDENTITY(1,1) NOT NULL,
	pro_codigo int NOT NULL,
	inp_codigo int NOT NULL,
	igp_facultad varchar(500) NULL,
	igp_departamento varchar(250) NULL,
	igp_denominacion varchar(500) NULL,
	igp_snies varchar(250) NULL,
	igp_jefe varchar(500) NULL,
	igp_coordinador varchar(500) NULL,
	igp_modalidad varchar(250) NULL,
	igp_jornada varchar(250) NULL,
	igp_nivel_formacion varchar(500) NULL,
	igp_duracion int NULL,
	igp_titulo varchar(500) NULL,
	igp_creditos int NULL,
	igp_amplio varchar(500) NULL,
	igp_especifico varchar(500) NULL,
	igp_detallado varchar(500) NULL,
	igp_nbc varchar(500) NULL,
	igp_area_nbc varchar(500) NULL,
	igp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_general_programa_PK PRIMARY KEY (igp_codigo),
	CONSTRAINT informe_general_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_general_programa_FK_1 FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo)
);

select * from acreditacion.informe_general_programa



select * from acreditacion.invitacion_programa_acreditable

select * from persona p where p.per_apellido likE '%GUERRERO FIERRO%'

select * from estudiante e where e.per_codigo = 26725

select * from programa p where p.pro_codigo = 12

select * from graduado g where g.est_codigo = '1993101130'


-- TABLA ESTADO INVITACION
--CREATE TABLE academia3000_john.acreditacion.estado_invitacion (
	esi_codigo int IDENTITY(1,1) NOT NULL,
	esi_nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT estado_invitacion_PK PRIMARY KEY (esi_codigo)
);

INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Enviado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Aceptado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Rechazado');

select * from acreditacion.estado_invitacion ei 



select * from acreditacion.aspecto_programa ap 
select * from acreditacion.aspecto_institucion ai 
select * from acreditacion.criterios_condiciones_iniciales cci 
update acreditacion.criterios_condiciones_iniciales cci values ()


select p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 


(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 


select * from plan_academico pa 

select * from EXCEL_NBC en
select * from snies_area sa 
select * from sede
select * from programa

select * from encuestas.cuestionarios c 
EXEC [vinculacion_actual] '1075226439',''

select * from estudiante e where e.per_codigo = 57003

select * from plan_academico pa where pro_codigo = 25

select * from acreditacion.aspecto_institucion ai  

SELECT 0 as uap_codigo, 0 as vin_codigo, e.est_codigo, u.uaa_codigo, u.uaa_nombre_corto, u.uaa_dependencia 
FROM estudiante e 
INNER JOIN programa p ON e.pro_codigo = p.pro_codigo 
INNER JOIN uaa u ON p.uaa_codigo = u.uaa_codigo 
WHERE e.est_codigo = '20171155993' AND e.ese_codigo = 1 

SELECT count(m.mat_codigo) FROM matricula m
 INNER JOIN calendario c ON m.cal_codigo = c.cal_codigo
 INNER JOIn periodo p ON c.per_codigo = p.per_codigo
 WHERE m.mat_estado = 'A' AND m.est_codigo = '20171155993'
 
 
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia,null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
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
inner join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 14


select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, p.per_email_interno, u.uaa_nombre, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select * from contrato.centro_trabajo ct 

select * from uaa_personal up where up.per_codigo = 108797
select * from persona p where p.per_identificacion = '1075303330'

select * from uaa u where u.uaa_nombre like '%OFICINA%'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797

select * from encuestas.respuestas r where r.rcu_codigo = 22486

select * from encuestas.cuestionarios c 
exec vinculacion_actual '1075303330'

select u.uaa_nombre, u.uaa_email, u.uaa_email_pqr, u.uaa_pagina, u.uaa_telefono, u.uaa_direccion, u.uaa_fax from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.cam_det_codigo is not null


select * from acreditacion.invitacion_programa_acreditable where ipa_invitacion_hash = ''

select * from acreditacion.estado_invitacion ei 

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa


-- PERSONA POR PROGRAMA
select * from persona p

--DOCENTE POR PROGRAMA

--ADMINISTRATIVO POR PROGRAMA

-- ESTUDIANTE POR PROGRAMA
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
where pr.pro_codigo = 375 and  est_registro_egresado = 0

.est_codigo = :codigoEst

select * from persona p where p.per_identificacion = '1075303330'

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
where pr.pro_codigo = 375  and e.est_registro_egresado = 0


select * from persona p where p.per_nombre like '%ARLYN'

select * from uaa_personal up 
inner join uaa u on up.uaa_codigo = u.uaa_codigo
where up.per_codigo = 95604

SELECT * FROM acreditacion.integrante_comite_autoevaluacion ica 

select * from estudiante e where e.per_codigo = 153265

select * from persona p where p.per_codigo = 153265

select * from web_parametro wp where wp.wep_nombre like '%ARCHIVO%'


SELECT top 1 per.per_a�o AS ano, per.per_nombre AS periodo, sed_nombre, nat_nombre, nia_nombre,
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia, pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo=pro.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as totalSemestres 
FROM oferta_academica ofa WITH (NOLOCK)
INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo
INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo
where pro.pro_codigo = 401
order by per.per_codigo desc


select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as semestres
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where p.pro_codigo = 401






select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select * from programa

select * from nivel_academico na 






--ACREDITABLES NUEVO PARAMETRO MATRICULADOS
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo IN (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select na.pro_codigo from acreditacion.norma_acreditable na where na.gru_codigo = 15

select * from programa where pro_codigo = 3


-- QUERY ACREDITABLES CON MATRICULADOS


select p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, p.pro_creacion_snies, p2.per_fecha_inicio, DATEADD(year, 8, p.pro_creacion_snies) AS pro_vigencia_cna, p2.per_fecha_fin, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join acreditacion.norma_acreditable na on e.pro_codigo = na.pro_codigo
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where convert(Date, p2.per_fecha_inicio) BETWEEN DATEADD(year, -1, p.pro_creacion_snies) AND DATEADD(year, 8, p.pro_creacion_snies) and convert(Date, p2.per_fecha_fin)  BETWEEN p.pro_creacion_snies AND DATEADD(year, 9, p.pro_creacion_snies) and na.gru_codigo = 15
group by p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, pro_creacion_snies, p2.per_fecha_inicio, p2.per_fecha_fin




select * from matricula


select count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 3

select * from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 3


select * from programa
--PARAMETRIZAR POR LAS FECHAS DE PERIODO EL INTERVALO, LUEGO AGRUPAR POR PERIODOS Y CANTIDAD DE MATRICULADOS

--m.mat_fecha BETWEEN p.pro_creacion_snies AND DATEADD(year, 8, p.pro_creacion_snies)

select p.pro_codigo, u.uaa_nombre, p.pro_creacion_snies, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_creacion_snies is not null 
group by p.pro_codigo, u.uaa_nombre, pro_creacion_snies


select p.pro_codigo, p.pro_creacion_snies from programa p where p.pro_creacion_snies is not null

select * from matricula m 
select * from calendario c 
select * from periodo p 






select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALAUACI�N') as coordinador
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  
where p.pro_codigo = 375


select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_general_programa igp 

select * from acreditacion.informe_programa ip 

select * from acreditacion.informe_general_programa igp 

--PROCESO ALMACENADOTASA DE DESERCI�N
EXEC dbo.acreditacion_tasa_desercion '20222', 1 

select DISTINCT oaa.facultad_codigo, oaa.facultad from acreditacion.oferta_academica_acreditacion oaa 

select * from acreditacion.oferta_academica_acreditacion oaa where oaa.facultad_codigo in (19, 20, 21, 22, 23, 24, 258)




-- Programa con Jefe de Programa
SELECT p.pro_codigo, u.uaa_nombre_corto, p.pro_creacion_snies, pr.per_nombre, pr.per_apellido, aug.aud_changed  FROM programa p  
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner join aud_usuario_grupo aug on ug.usg_codigo = aug.usg_codigo
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
GROUP by u.uaa_nombre_corto 


select * from usuario_grupo

select * from aud_usuario_grupo


select * from uaa_personal

select count(*) from usuario_grupo ug  
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
where ud.usg_grupo = 34 and ug.usg_estado = 1 


select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, up.uap_fecha_inicio, up.uap_fecha_fin from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
left join uaa_personal up  on pe.per_codigo = up.per_codigo
where ug.usg_grupo = 34 and p.pro_codigo = 418 and up.uap_cargo = 76
order by ug.usg_usuario desc

select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo  
where ug.usg_grupo = 34 and p.pro_codigo = 418 
order by ug.usg_usuario desc


select pe.per_nombre, pe.per_apellido, pe.per_email_interno , ug.up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
where p.pro_codigo = 418 and ug.usg_grupo = 34 
order by ug.usg_usuario desc


select * from vinculacion v 

select * from usuario_docentes ud  

select * from uaa_personal

select * from aud_usuario_grupo aug where usg_grupo = 34 and usg_uaa = 601 

select * from usuario_docente where usg_grupo = 34 and usg_uaa = 676

select * from usuario_grupo where usg_grupo = 34 and usg_uaa = 676


select * from grupo



uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 


select * from uaa_personal where per_codigo = 5529--100472 --23742--100472 -- 5529


select * from cargo

select * from uaa

select * from usuario_grupo

select count(*) from usuario_docente where usg_grupo = 34 

usg_grupo = 34





-- p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select count(*) from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select * from 


select * 


select * from contrato

select * from 

select * from usuario_docente 










select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_creacion_snies,
CASE WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado ,
CASE WHEN pro_estado = 01 THEN 'SI' ELSE 'NO' END AS oferta,
p.pro_creacion_snies, p.pro_fecha_creacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,
p.pro_registro_snies, p.pro_registro_icfes, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, c.con_descripcion, pe.pre_nombre, r.res_numero, tn.tin_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ca.cam_codigo, ce.cam_esp_nombre, ce.cam_esp_codigo, cd.cam_det_nombre, cd.cam_det_codigo, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+ pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo 
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 165


select * from convenio

SELECT *,nat.nat_nombre as formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, u.uaa_nombre as facultad FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 433




SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
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
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 15




select p.pro_codigo, p.pro_registro_icfes, p.pro_registro_snies, u.uaa_nombre, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo
where p.pro_creacion_snies is not null and floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) >= 8



select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  
where pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8

select * from nivel_academico na2 
select * from acreditacion.grupos_acreditables gru
select * from acreditacion.norma_acreditable na

select count(*) from acreditacion.norma_acreditable na
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where gru_codigo = 18

select * from acreditacion.norma_nivel_academico nna where nna.noa_codigo = 1

select * from acreditacion.norma_criterio nc

SELECT * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo
where nc.noc_estado = 1 and nc.nna_codigo = 15





Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, 
pro_registro_snies, pro_calendario, pro_horario, pro_fecha_creacion, pro_extension_snies, 
pro_propio, pro_creacion_snies, p.uaa_codigo, ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, 
ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as tiempo, 
nat.nat_nombre, nia_nombre, nia_estado, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 and floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) >= 8

select * from notas_total

SELECT * FROM acreditacion.norma_nivel_academico

select * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo 
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo 
where nc.noc_estado = 1 and nc.nna_codigo = 13 and nna.nna_estado != 0



select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.invitacion_programa_acreditable where ipa_hash = '466cfb0b4fec46c69d6cd2196e305c54'



SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombre_jefe_programa,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as apellido_jefe_programa,
(select top 1 pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as per_email_interno, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
Inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 18


SELECT * FROM acreditacion.grupos_acreditables ga 

SELECT * FROM acreditacion. 

select * from proyectos.investigadorexternoxgrupo i  

select count(*) from acreditacion.norma_acreditable na where gru_codigo = 18


INSERT INTO academia3000_john.acreditacion.invitacion_programa_acreditable (gru_codigo, pro_codigo, ipa_fecha_envio, ipa_fecha_respuesta, ipa_hash, ipa_estado) VALUES(17, 383, '2022-10-12', NULL, N'499523da3d514f82837f003dccdc081c', 1);

select pe.per_nombre, pe.per_apellido, pe.per_codigo, p.pro_codigo, pe.per_email_interno, ug.up, u.uaa_nombre, ug.gru_nombre, 
CASE WHEN ug.usg_estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END AS usg_estado from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
where p.pro_codigo = 8 and ug.usg_grupo = 34 order by ug.usg_estado desc 


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.matriculados_acreditacion ma 


-- VISTA MATRICULADOS PARA ACREDITACION
CREATE VIEW [acreditacion].[matriculados_acreditacion] AS
SELECT mat.mat_codigo, mat.mat_observacion, mat.mat_cliente, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico,
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
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A'

select count(*) from acreditacion.matriculados_acreditacion ma where ma.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio >= 2022

select count(*) from acreditacion.inscritos_acreditacion ia where ia.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio 

select * from uaa_personal up where up.per_codigo = 108797


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_chequeo_institucion ici

select * from acreditacion.informe_general_programa igp 

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
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 383



select * from acreditacion.aprobacion_informe_programa aip 


select * from acreditacion.aprobacion_informe_programa where pro_codigo = 383 and igp_codigo = 1


select * from acreditacion.informe_chequeo_institucion ici 


DECLARE @T TABLE (
     col1 float,
     col2 int
 );
    
 INSERT INTO @T VALUES
 (1.5,8),
 (1.5,1),
 (2.0,1),
 (3.0,1),
 (4.5,1),
 (4.5,2),
 (5.0,3),
 (6.0,4);   
 SELECT col1, col2 FROM @T order by col1 asc, col2 DESC
 
 SELECT * FROM persona p WHERE p.per_apellido like '%FAJARDO OROZCO%' 


select count(*) from uaa_personal up where up.uap_id_carnet is not null

--update dbo.usuario_graduados set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
select * from dbo.usuario_graduados
select * from usuario_academia_login ual 

SELECT * from dbo.usuario_general_login

select * from dbo.usuario_estudiante_login uel 

select * from dbo.usuario_carnet_digital ucd where ucd.up = 108797

select * from dbo.usuario_carnet_digital_login ucdl where ucdl.up = 1087979

select  top 1 * from dbo.usuario_carnet_digital_login ucdl  
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where  us = 'u20171157616' order by ucdl.usg_codigo desc


select COUNT(ucdl.us) from dbo.usuario_carnet_digital_login ucdl 
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where us = 'a1075303330'

--CREATE VIEW [dbo].[usuario_alta_acreditacion_login]
AS
SELECT        p.per_codigo, ua.uid, ua.us, ua.sys, ua.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ua.state, ua.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_administrativos ua INNER JOIN
                         dbo.persona p ON ua.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ua.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ua.state = 1)
UNION
SELECT        p.per_codigo, ud.uid, ud.us, ud.sys, ud.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ud.state, ud.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_docentes ud INNER JOIN
                         dbo.persona p ON ud.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ud.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ud.state = 1)

select * from programa where pro_codigo =

select * from academia3000_daniel.dbo.campo_amplio ca 

select * from uaa

select * from modulo m  where mod_codigo

select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	full JOIN  uaa u on u.uaa_codigo = p.uaa_codigo
	full JOIN sede s on s.sed_codigo = u.sed_codigo
	full JOIN modalidad m on m.mod_codigo = p.mod_codigo
	full JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	full JOIN resolucion re on re.res_codigo = p.res_codigo
	full JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	full JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	full JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	full JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo
	full JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	full join persona pe on pe.per_codigo= ud.up
	where pro_codigo = $P{pro_codigo}  and ug.usg_grupo = 34  and ug.usg_estado = 1
	
	
	
	
	
	
	
	SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
INNER JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
 left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 165


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 445 





select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 0
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	
	
	DROP TABLE acreditacion.NewTable 
	
	CREATE TABLE academia3000_daniel.acreditacion.criterios (
	cri_codigo int IDENTITY(1,1) NOT NULL,
	cri_id varchar(100) NOT NULL,
	cri_titulo varchar(100) NOT NULL,
	cri_vigencia varchar(100) NULL,
	cri_descripcion varchar(100) NULL
	ALTER TABLE academia3000_daniel.acreditacion.criterios ADD CONSTRAINT criterios_PK PRIMARY KEY (cri_codigo);

);

select pro_registro_snies,pro_extension_snies from dbo.programa 
CREATE TABLE academia3000_daniel.acreditacion.variables (
	var_codigo int IDENTITY(1,1) NOT NULL,
	var_nombre varchar(100) NOT NULL,
	cri_codigo int NOT NULL,
	CONSTRAINT variables_PK PRIMARY KEY (var_codigo),
	CONSTRAINT variables_FK FOREIGN KEY (cri_codigo) REFERENCES academia3000_daniel.acreditacion.criterios(cri_codigo)
);
CREATE TABLE academia3000_daniel.acreditacion.items (
	ite_codigo int IDENTITY(1,1) NOT NULL,
	ite_nombre varchar(100) NOT NULL,
	var_codigo int NOT NULL,
	CONSTRAINT items_PK PRIMARY KEY (ite_codigo),
	CONSTRAINT items_FK FOREIGN KEY (var_codigo) REFERENCES academia3000_daniel.acreditacion.variables(var_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_acreditacion (
	noa_codigo int IDENTITY(1,1) NOT NULL,
	noa_nombre varchar(200) NOT NULL,
	noa_fecha_inicio date NOT NULL,
	noa_fecha_fin date NULL,
	CONSTRAINT norma_acreditacion_PK PRIMARY KEY (noa_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_nivel_academico (
	nna_codigo int IDENTITY(1,1) NOT NULL,
	nna_nombre varchar(200) NOT NULL,
	nia_codigo int NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT norma_nivel_academico_PK PRIMARY KEY (nna_codigo),
	CONSTRAINT norma_nivel_academico_FK FOREIGN KEY (nia_codigo) REFERENCES academia3000_daniel.dbo.nivel_academico(nia_codigo),
	CONSTRAINT norma_nivel_norma_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_criterio (
	noc_codigo int IDENTITY(1,1) NOT NULL,
	noc_nombre varchar(200) NOT NULL,
	nna_codigo int NOT NULL,
	tiempo int NOT NULL,
	CONSTRAINT norma_criterio_PK PRIMARY KEY (noc_codigo),
	CONSTRAINT norma_criterio_FK FOREIGN KEY (nna_codigo) REFERENCES academia3000_daniel.acreditacion.norma_nivel_academico(nna_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_acreditable (
	nac_codigo int  IDENTITY(1,1) NOT NULL,
	nac_nombre varchar(200) NOT NULL,
	noa_codigo int NOT NULL,
	pro_codigo int not null,
	creacion  date DEFAULT getDate() NOT NULL,
	CONSTRAINT norma_acreditable_PK PRIMARY KEY (nac_codigo),
	CONSTRAINT norma_acreditable_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo),
	CONSTRAINT norma_acreditable_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_daniel.dbo.programa(pro_codigo),
	
);

CREATE TABLE academia3000_daniel.acreditacion.grupos_acreditables (
	gru_codigo int IDENTITY(1,1) NOT NULL,
	gru_nombre varchar(100) NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT grupos_acreditables_PK PRIMARY KEY (gru_codigo),
	CONSTRAINT grupos_acreditables_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);


ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_estado int NOT NULL;

ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD  DEFAULT 1 FOR noa_estado;
ALTER TABLE academia3000_daniel.acreditacion.norma_nivel_academico ADD nna_estado int DEFAULT 1 NOT NULL;
ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_ruta varchar(200) NULL;

select dbo.getTokenDocumento("5453254684") as token
select * from acreditacion.norma_acreditacion
select * from sgd.documento where per_codigo=54684

INSERT INTO academia3000_daniel.acreditacion.norma_acreditacion (noa_nombre, noa_fecha_inicio, noa_fecha_fin, noa_estado, noa_ruta) VALUES('', '', '', 1, '');

ALTER TABLE academia3000_daniel.dbo.programa ADD pro_creacion_snies date NULL;

SELECT * from acreditacion.norma_criterio nc join acreditacion.norma_nivel_academico nna on nc.nna_codigo =nna.nna_codigo join acreditacion.norma_acreditacion na  on na.noa_codigo =nna.noa_codigo where nc.nac_estado=1

select mod_codigo from programa p 

SELECT * from acreditacion.norma_acreditable na join  acreditacion.norma_acreditacion na2 on na.noa_codigo =na2.noa_codigo join programa p2 on na.pro_codigo =p2.pro_codigo join nivel_academico na3 on p2.nia_codigo =na3.nia_codigo join modalidad m2 on p2.mod_codigo =m2.mod_codigo

select  from programa p 



select * from ( Select  pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,uaa_estado,uaa_nombre,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-
cast(convert(varchar(8),pro_creacion_snies,112) as int) ) / 10000)as tiempo from programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where pro_creacion_snies is not null  and ua.uaa_estado = 1

)temporal where tiempo>8 

select * from acreditacion.norma_nivel_academico nna where noa_codigo = ? and nna_estado =1

select *from uaa where uaa_nombre like'%facultad%'


SELECT * from acreditacion.norma_acreditable nac join  acreditacion.norma_acreditacion noa 
on nac.noa_codigo =noa.noa_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
 
 
 select * from acreditacion.grupos_acreditables ga join acreditacion.norma_acreditacion na on ga.noa_codigo = na.noa_codigo where noa_estado =1
 
 INSERT INTO acreditacion.grupos_acreditables (gru_nombre, noa_codigo) VALUES('', 0);

SELECT * from acreditacion.norma_acreditable nac join  acreditacion.grupos_acreditables gru 
on nac.gru_codigo = gru.gru_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo where gru.gru_codigo =1


select *from programa_estado pe 

select * from acreditacion.norma_acreditable na where gru_codigo =3

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_amplio (
	aud_codigo_campo_amplio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_codigo int NOT NULL,
	cam_estado int NOT NULL,
	cam_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_amplio_PK PRIMARY KEY (aud_codigo_campo_amplio)
);

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_detallado (
	aud_codigo_campo_detallado bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_det_codigo int NOT NULL,
	cam_det_estado int NOT NULL,
	cam_esp_codigo int NOT NULL,
	cam_det_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_detallado_PK PRIMARY KEY (aud_codigo_campo_detallado)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditable (
	aud_codigo_norma_acreditable bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nac_codigo int not null,
	nac_nombre varchar(200) not null,
	pro_codigo int not null,
	nac_creacion date not null,
	nac_estado int not null,
	gru_codigo int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditable_PK PRIMARY KEY (aud_codigo_norma_acreditable)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditacion (
	aud_codigo_norma_acreditacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noa_codigo int not null,
	noa_nombre varchar(200) not null,
	noa_fecha_inicio date not null,
	noa_fecha_fin date,
	noa_estado int not null,
	noa_ruta varchar(200),
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditacion_PK PRIMARY KEY (aud_codigo_norma_acreditacion)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_criterio (
	aud_codigo_norma_criterio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noc_codigo int not null,
	noc_nombre varchar(200) not null,
	nna_codigo int not null,
	noc_tiempo int not null,
	noc_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_criterio_PK PRIMARY KEY (aud_codigo_norma_criterio)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_nivel_academico (
	aud_codigo_norma_nivel_academico bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	nna_codigo int not null,
	nna_nombre varchar(200),
	nia_codigo int not null,
	noa_codigo int not null,
	nna_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_nivel_academico_PK PRIMARY KEY (aud_codigo_norma_nivel_academico)
);
SELECT * from encuestas.cuestionarios c 

SELECT * from encuestas.preguntas p join encuestas.tipo_respuestas tr on p.tre_codigo =tr.tre_codigo
 join encuestas.cuestionarios c on p.cue_codigo=c.cue_codigo left join encuestas.grupo_escala g on p.gre_codigo= g.gre_codigo
  where c.cue_codigo=:codigo AND (p.pre_tipo=0 OR p.pre_tipo=2) AND p.pre_estado=1 AND (p.tre_codigo=1 OR p.tre_codigo=4)

CREATE TABLE academia3000_daniel.acreditacion.aud_grupos_acreditables (
	aud_codigo_grupos_acreditables bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	gru_codigo int not null,
	gru_nombre varchar(200),
	noa_codigo int not null,
	gru_creacion date,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_grupos_acreditables_PK PRIMARY KEY (aud_codigo_grupos_acreditables)
);




aud_log_type, 
cam_det_codigo,
cam_det_estado,
cam_esp_codigo,
cam_det_nombre,
codigo_cine, 


select (select value from split(pro_estado ,'0') where value !='') as estado,pro_titulo_otorgado as titulo ,pro_codigo as codigo  from programa 

select * from split

update academia3000_daniel.dbo.programa 
set pro_estado = (
select * from split(pro_estado ,'0') where value !=''
)
from programa

select pro_estado from programa p 

where pro_codigo = pro_codigo 


SELECT * FROM SplitProEstado('05')

DECLARE @a char='05'
SELECT @a, cast(@a as int)


select * from acreditacion.norma_acreditacion na 
select  * FROM programa p 

select * from acreditacion.norma_criterio nc 


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN resolucion r on r.res_codigo = p.res_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
FULL JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
WHERE p.uaa_codigo = 29


select * from uaa_personal where uap_cargo=76 and vin_codigo =46 and uap_fecha_fin is null

select per_apellido, per_nombre from uaa_personal, persona where uap_cargo  = 76 and vin_codigo = 46 and uap_fecha_fin is null

select * from persona where per_codigo =  136709

select * from uaa_personal

select * from estudiante where est_registro_egresado = 0

select * from egresado 

select * from cargo

select * from programa where pro_estado=1

-- QUERY ESTUDIANTES POR PROGRAMAS
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where pro.pro_codigo = 418 and pro.pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = '20171157616' and pro.pro_codigo = 418 and pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa con variables
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = $P{est_codigo} and pro.pro_codigo = $P{pro_codigo} and pro_estado = 1 and e.est_registro_egresado = 0


-- Programa con Jefe de Programa
SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
WHERE p.pro_codigo = 456

-- QUERY JASPER ORIGINAL, DOCENTE CON FILTRO DISTINCT
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
    ELSE 'PREGRADO' END AS formacion
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
	where pro_codigo =$P{pro_codigo}

-- MODIFICACI�N QUERY JASPER DANIEL
select pro_registro_snies, pro_registro_icfes,p.uaa_codigo_unificado , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p join (select pr.uaa_codigo_unificado,pr.pro_codigo from programa pr group by uaa_codigo_unificado,pro_codigo)  pr
	on p.pro_codigo =pr.pro_codigo
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	GROUP by p.uaa_codigo_unificado

select * from academia3000_john.encuestas.cuestionario_configuracion cc 
	
-- VISTA DOCENTES Y DOCENTE
SELECT * from usuario_docente order by usg_usuario 	
    SELECT dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado,p.uaa_codigo_unificado
    FROM dbo.grupo INNER JOIN
            dbo.usuario_grupo ON dbo.grupo.gru_codigo = dbo.usuario_grupo.usg_grupo INNER JOIN
            dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
            join programa p on p.uaa_codigo =dbo.usuario_grupo.usg_uaa GROUP  by p.uaa_codigo_unificado, dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado order by                       
WHERE (dbo.grupo.gru_id = 'JEFE_PROGRAMA')                
    select * from usuario_grupo ug 
    select * from uaa where uaa_codigo = 794
    SELECT * FRom programa where uaa_codigo_unificado  = 794
    
UPDATE acreditacion.campo_detallado SET cam_det_nombre=:nombre, cam_det_estado=:estado,cam_esp_codigo=:esp, codigo_cine=:cine WHERE cam_det_codigo=:codigo



SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = ua.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
WHERE ua.sed_codigo = $P{pro_codigo} and ua.uaa_estado = 1 order by ua.uaa_nombre asc

SELECT * from sede s 


--CAMBIO DE CLAVE ADMINISTRATIVOS
--update dbo.usuario_administrativos set uwd2 =HASHBYTES('MD5',HASHBYTES('SHA1','12345'))
--update dbo.usuario_docentes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update dbo.usuario_estudiantes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update persona set per_email = 'guerrerocordobajohn@gmail.com', per_email_interno = 'john.guerrero@usco.edu.co'

select * from web_parametro wp where wp.wep_nombre like '%TOKEN%' --http://sergio.usco.edu.co/iniciosesion/


select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
WHERE ca.cam_estado = 1

select ro.rop_descripcion,p.pre_descripcion,p.pre_identificador,c.cue_nombre,tu.tus_nombre,per.per_nombre,u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, ro.rop_descripcion, p.pre_descripcion, p.pre_identificador, c.cue_nombre, tu.tus_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, per.per_apellido, per.per_nombre, 
e.est_codigo, s.sed_nombre, u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from uaa


select * from usuario_general_login ugl WHERE ugl.us = '12113154'
EXECUTE vinculacion_actual '1080266346', 0
EXECUTE vinculacion_actual '1075232353', 0
EXECUTE academia3000_john.vinculacion_actual(:@per_identificacion, :@uaa_codigo) 
select * from programa

 select * from programa

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion,CASE WHEN res_texto != null THEN res_texto ELSE rop_descripcion END AS respuesta , c.cue_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.preguntas p on c.cue_codigo  = p.cue_codigo  
join encuestas.preguntas_respuestas pr on p.pre_codigo = pr.pre_codigo  
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
join dbo.persona per on rc.per_codigo = per.per_codigo 
join dbo.estudiante e on per.per_codigo = e.per_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join dbo.programa pro on e.pro_codigo = pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from encuestas.respuestas r 
select * from encuestas.preguntas_respuestas pr  

CASE WHEN r.res_texto != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,

select * from encuestas.respuestas_cuestionarios rc  
select * from encuestas.preguntas p  
select * from encuestas.respuestas r 


select * from uaa u WHERE u.uaa_nombre like '%VICE%'

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, ro.rop_descripcion, r.res_texto, c.cue_nombre from encuestas.respuestas r 
LEFT JOIN encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
LEFT JOIN encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
LEFT JOIN encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo
LEFT JOIN encuestas.preguntas p on c.cue_codigo = p.cue_codigo  
LEFT JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
LEFT JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join dbo.persona per on rc.per_codigo = per.per_codigo 
join dbo.estudiante e on e.per_codigo = per.per_codigo 
join dbo.programa pro on e.pro_codigo = pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo  
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo =:programa ) and c.uaa_codigo =:uaa

select * from persona where per_apellido like '%ROJAS ROJAS%'

select * from encuestas.respuestas r -- res_codigo, rcu_codigo, prr_codigo, res_texto, pre_codigo
select * from encuestas.cuestionarios c -- cue_codigo
join uaa u on c.uaa_codigo = u.uaa_codigo 
select * from encuestas.cuestionario_configuracion cc 
select * from encuestas.preguntas p -- pre_codigo, cue_codigo, pre_tipo, tre_codigo
select * from encuestas.preguntas_respuestas pr -- prr_codigo, rop_codigo, pre_codigo, tre_codigo
select * from encuestas.respuestas_opciones ro -- rop_codigo
select * from encuestas.tipo_respuestas tr 
select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo in (1,2) --where rc.per_codigo = 108797

select * from usuario_docente_general udg 

-- CASE WHEN r.prr_codigo != null THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta
-- CASE WHEN p.pre_tipo != 2 THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta


select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, CASE WHEN r.prr_codigo is null THEN r.res_texto ELSE ro.rop_descripcion END AS respuesta, c.cue_nombre from encuestas.respuestas r
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
left join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
left join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
left join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
left join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
left join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

SELECT * from programa p
join uaa u on p.uaa_codigo_unificado = u.uaa_dependencia  

SELECT p.pro_codigo, u.uaa_nombre_corto, u.uaa_dependencia  from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
WHERE p.uaa_codigo_unificado is not null and p.pro_estado = 1 and u.uaa_nombre like '%MAESTRIA EN PSICOLOGIA%'
ORDER by p.sed_codigo

select * from nivel_academico na na.nia_codigo in (9,11)

select * from persona p where p.per_identificacion = '1075303330' -- JS: 87855  JG: 108797

select * from uaa u WHERE uaa_codigo  = 24

select * FROM usuario u where usu_persona = 87855
select * from usuario_administrativo ua where ua.up = 87855

select * from usuario_administrativo ua where ua.us = 'a1075232353'

SELECT * from 

select * FROM usuario_grupo ug where ug.usg_usuario = 155684
select * FROM usuario_grupo ug where ug.usg_usuario = 146624
select * FROM usuario_grupo ug where ug.usg_usuario = 54684
select * from grupo g 
--insert usuario_grupo (usg_usuario,usg_grupo,usg_uaa) values(146624,239,554)

select * FROM usuario_grupo ug where ug.usg_usuario = 87855

select * from grupo g WHERE g.gru_codigo = 4



select * from persona p where p.per_identificacion = '1075220954' 


select * from academia3000_john.dbo.usuario_grupo ug where usg_grupo = 239
select * from persona where per_codigo = 87855

	54684	283	532	1
	
select * from uaa
select * from usuario_grupo ug where ug.usg_grupo = 276

select * from usuario_grupo ug where ug.usg_usuario in (146624, 96663)

select * from grupo g where gru_nombre like '%acreditacion%'

select * from grupo g where gru_codigo  = 106

select * from usuario_general ug where up in (108797,87855)
select * from usuario_administrativos ug where up = 108797

UPDATE usuario_administrativos set sys = 'jhonhenrysolorzanolozano' where uid = 146624

INSERT INTO usuario_grupo (usg_usuario,usg_grupo,usg_uaa,usg_estado) VALUES (146624,283,554,1);

SELECT * from usuario_general ug  where us like '%a1075303330%'  -- 146624  108797  a1075303330
 																--- 96663  87855  a1075232353
SELECT p.per_apellido, p.per_nombre, e.est_codigo, e.enc_inicio, p2.pre_descripcion, o.opc_descripcion FROM covid.encuesta e 
inner join dbo.persona p on e.per_codigo = p.per_codigo 
inner join covid.pregunta p2 on e.cat_codigo = p2.cat_codigo
inner join covid.respuesta r on p2.pre_codigo = r.pre_codigo 
inner join covid.opciones o on r.opc_codigo = o.opc_codigo  
where p2.cat_codigo = 8 and p2.pre_estado = 1


select * from covid.encuesta e
select * from covid.categoria c -- 7, 8
select * from covid.pregunta p
select * from covid.opciones o 
select * from covid.respuesta r 
select * from covid.respuesta_subopciones rs 
select * from covid.tipo_respuestas tr 

 
 select * from covid.encuesta e 
 ---
select * from promedio_ponderado pp  
select * from covid.autorizacion_ingreso ai
 
-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int,
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);


 
SELECT * FROM acreditacion.programas_registrados_snies prs 
select * from persona p 
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo where p.per_nombre = 'JOHAN MANUEL' AND pro_codigo = 418

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

	
select * from programa
select * from usuario_grupo
select * from grupo


-- TABLA MYSQL PROGRAMAS
/*
CREATE TABLE acreditacion.programas (
	pro_codigo int IDENTITY(1,1) NOT NULL,
	pro_codio_unificado int NULL,
	pro_registro_snies_codigo int NULL,
	pro_registro_icfes int NULL,
	pro_estado int NULL,
	pro_oferta varchar(10) NULL,
	pro_sede varchar(100) NULL,
	pro_formacion varchar(100) NULL,
	pro_nivel_academico varchar(100) NULL,
	pro_modalidad varchar(100) NULL,
	pro_facultad varchar(250) NULL,
	pro_nombre varchar(250) NULL,
	pro_creacion_snies date NULL,
	pro_resolucion varchar(250) NULL,
	pro_fecha_creacion date NULL,
	pro_jefe varchar(250) NULL,
	pro_email_jefe varchar(250) NULL,
);
*/


select * from encuestas.cuestionarios c

SELECT pre_descripcion FROM [covid].pregunta WHERE cat_codigo=8 ORDER BY pre_codigo ASC

SELECT * FROM [seysatra].encuesta_covid WHERE
            convert(varchar(10),ecov_fecha, 120) BETWEEN '2021-03-14' AND '2022-04-19' AND ecov_tipo=1
            ORDER BY
            ecov_fecha ASC
            
SELECT * FROM covid.encuesta e          




select * from encuestas.cuestionarios c 
select * from encuestas.preguntas p where p.cue_codigo = 9 and p.pre_estado = 1
select * from programa

SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo= ud.up
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo
where gru.gru_codigo = 14


SELECT *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 3 


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo = 3


select * from programa

select DISTINCT * from ( 
Select 
 pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,
pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres , pr.per_email_interno,
uaa_estado,uaa_nombre,uaa_dependencia,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-cast(convert(varchar(8),pro_creacion_snies,112) as int)
 ) / 10000)as tiempo from programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo = ud.up
where p.nia_codigo = 11
and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5

select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5


select * from persona 





SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 165


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 )temporal where tiempo > 8

select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
where ca.cam_estado = 1


select *,CASE WHEN ce.cam_esp_codigo = cd.cam_esp_codigo  THEN null ELSE ce.cam_esp_nombre END AS especifico  from acreditacion.campo_detallado cd
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
where cd.cam_det_estado = 1

with ts as (
      select cd.*, row_number() over (partition by cd.cam_esp_codigo order by cd.cam_esp_codigo) as seqnum
      from acreditacion.campo_detallado cd 
     )
select cd.cam_esp_codigo,
       (case when seqnum = 1 then cd.cam_esp_codigo end) as cd.cam_esp_codigo
from ts;


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE uaa_codigo = 318 and uap_fecha_fin is not null

select * from vinvul

select * from persona where per_nombre LIKE '%JULIO ROBERTO' AND per_apellido like '%CANO BARRERA'

select top 1 p.per_identificacion as est_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181' --36167024
ORDER BY up.uap_codigo DESC 

select * from programa where uaa_codigo = 318

select * from uaa where uaa_codigo = 318

select top 1 p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181'
ORDER BY up.uap_codigo DESC 


SELECT * FROM estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where pro_codigo = 8 and e.est_registro_egresado = 1

SELECT *, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia from acreditacion.norma_acreditable nac  
join acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 



select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 12 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


UPDATE acreditacion.institucion 
SET ins_nit=:nit, ins_ies=:ies, ins_ies_padre=:iespadre, ins_sector=:sector, ins_nombre=:nombre, ins_caracter_academico=:caracter, mun_codigo=:municipio, ins_direccion=:direccion, ins_telefonos=:telefonos, ins_web=:web, ins_norma=:norma, ins_fecha_creacion=:creacion, ins_existencia=:existencia, ins_ruta=:ruta 
WHERE ins_codigo=:codigo



INSERT INTO acreditacion.institucion 
(ins_nit, ins_ies, ins_ies_padre, ins_sector, ins_nombre, 
ins_caracter_academico, mun_codigo, ins_direccion, 
ins_telefonos, ins_web, ins_norma, ins_fecha_creacion, 
ins_existencia, ins_ruta) 
VALUES(:nit,:ies,:iespadre,:sector,:nombre,:caracteracade,:municipio,:direccion,:telefonos,:web,:nombrenorma,:creacion,:existencia,:ruta);

EXECUTE sibusco.jovenes_accion_periodo 20212


select m.cal_codigo, mu.SNIES_codigo,'1114' AS insti,
       p.pro_registro_snies, e.est_codigo, 
       t.snies_codigo,   
	   pe.per_identificacion,
       per_nombre1,      per_nombre2, 
       per_apellido1,      per_apellido2,
       pe.per_genero,      pe.per_fecha_nacimiento,
       mu.SNIES_codigo,    pe.per_email,
       pe.per_telefono_fijo, pe.per_telefono_movil,
       s.sed_nombre,     u.uaa_nombre,
       pe.per_genero,      m.mat_codigo , edps.est_dps as IDPERSONA,  m.mat_estado 
from estudiantes_dps edps 
INNER JOIN estudiante e ON (edps.est_codigo=e.est_codigo)
INNER JOIN r_personax4 pe ON (e.per_codigo=pe.per_codigo)
INNER JOIN matricula m ON (m.est_codigo=e.est_codigo)
INNER JOIN calendario ca ON (ca.cal_codigo=m.cal_codigo)
INNER JOIN programa p ON (e.pro_codigo=p.pro_codigo)
INNER JOIN uaa u ON (p.uaa_codigo=u.uaa_codigo)
INNER JOIN sede s ON (u.sed_codigo=s.sed_codigo)
INNER JOIN tipo_id t ON (pe.tii_codigo=t.tii_codigo)
INNER JOIN municipio mu ON (mu.mun_codigo=s.mun_codigo)
where edps.per_codigo=(SELECT per_codigo
						FROM periodo  WHERE per_nombre = '20212'  )
AND ca.per_codigo=edps.per_codigo
AND ( convert( int ,substring(e.est_codigo,0,5)) BETWEEN 2012 and year(getdate() ) )
order by  e.est_codigo  asc
END


select * from calendario c

select * from web_parametro wp where wp.wep_nombre  like '%%'

UPDATE acreditacion.institucion_acreditada 
SET ins_codigo=:instcodigo, ina_norma=:norma, ina_fecha_inicio=:inicio, ina_fecha_fin=:fin, 
ina_vigencia=:vigencia, ina_estado=:estado 
WHERE ina_codigo=:codigo

select * from acreditacion.institucion i 
select * from acreditacion.institucion_acreditada ia 

select * from matriculados_resumen mr  
select * from matricula_curso mc 
select *, LEFT(e.est_codigo , 5) as periodo from estudiante e 



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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up 
	where pro_codigo = 8

select * from uaa u
inner join programa pr on u.uaa_codigo = pr.uaa_codigo 
inner join acreditacion.comite_autoevaluacion ca on u.uaa_codigo = ca.uaa_codigo 
inner join acreditacion.integrante_comite_autoevaluacion ica on ca.coa_codigo = ica.coa_codigo 
inner join persona p on ica.per_codigo = p.per_codigo 
where pr.pro_codigo = 10


SELECT * from acreditacion.comite_autoevaluacion ca
inner join programa p on ca.uaa_codigo = p.uaa_codigo 
order by coa_fecha_creacion


select * from encuestas.cuestionarios c

select * from persona

select * from uaa where uaa_codigo = 627


select * from acreditacion.institucion i 

UPDATE academia3000_john.acreditacion.institucion SET ins_nit=N'891.180.084-2', ins_ies=1114, ins_ies_padre=1114, ins_sector=1, ins_nombre=N'UNIVERSIDAD SURCOLOMBIANA', ins_caracter_academico=4, mun_codigo=905, ins_direccion=N'Avenida Pastrana Borrero Carrera 1 ', ins_telefonos=N'8754753', ins_web=N'www.usco.edu.co', ins_norma=N'ACUERDO', ins_fecha_creacion='1976-01-30', ins_existencia=45, ins_ruta=N'140539', ins_estado=1 WHERE ins_codigo=2;


select * from acreditacion.institucion_acreditada ia 

-- ACREDITABLES Y COMITE DE AUTOEVALUACION
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


SELECT * , CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
inner JOIN resolucion re on re.res_codigo = p.res_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
inner join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17
--left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo
--CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite

-- 33 PROGRAMAS ACREDITABLES
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombre  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as correo, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17



select * from acreditacion.norma_acreditable na where na.gru_codigo = 17

inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 

select distinct u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
ORDER by u.uaa_nombre ASC 


select * from usuario_docente where state = 1
select * from usuario_grupo

select * from grupo


-- JEFES DE PROGRAMA POR GRUPO
select distinct  u.uaa_nombre_corto, u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and up.uap_fecha_fin is null
ORDER by u.uaa_nombre ASC 


select * from grupo
select * from cargo

-- JEFES DE PROGRAMA POR CARGO
select u.uaa_codigo, p.per_apellido, p.per_nombre, u.uaa_nombre_corto, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where c.car_codigo in (76, 77) and up.uap_fecha_fin is null and up.vin_codigo = 46

select * from usuario_grupo ug 
select * from uaa_personal where vin_codigo = 46 and uap_cargo in (76,77) and uap_fecha_fin is null

select * from uaa where uaa_nombre like '%ADMINISTRACION%' 


-- PROGRAMAS CON REGISTRO DE FECHA Y CAMPOS DETALLADOS
select * from programa p where p.uaa_codigo_unificado is not null and cam_det_codigo is not null


-- PROGRAMAS CON CONDICIONES PARA SER ACREDITABLES
select p.pro_codigo, u.uaa_codigo, u.uaa_nombre_corto from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join acreditacion.norma_acreditable na on p.pro_codigo = na.pro_codigo  
where p.pro_creacion_snies is not null and na.gru_codigo = 17
order by u.uaa_nombre



-- 33 PROGRAMAS ACREDITABLES EM TOTAL
select * from acreditacion.norma_acreditable na where na.gru_codigo = 17



-- PROGRAMAS JASPER EXCEL
select pro_registro_snies, p.pro_registro_icfes , CASE
    WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as
    pro_fecha_creacion, cd.codigo_cine as cam_det_codigo ,ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre,
    ce.cam_esp_nombre as cam_esp_nombre,ca.cam_nombre,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS academico,
    floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia,
    p.pro_creacion_snies
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	INNER JOIN resolucion re on re.res_codigo = p.res_codigo
	INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
	left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	where pro_codigo in (SELECT p.pro_codigo  FROM programa p
				INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo
				INNER JOIN sede s on s.sed_codigo = p.sed_codigo
				INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
				INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
				INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
				WHERE  ua.uaa_estado = 1) order by estado
				
				
select * from jornada j
select * from programa


Select p.pro_registro_snies, p.pro_registro_icfes, 
CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, 
CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = u.sed_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN resolucion re on re.res_codigo = p.res_codigo 
INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select * from encuestas.cuestionarios c 

EXEC vinculacion_actual '12113154'


SELECT * FROM programa p where pro_codigo = 375
select * from uaa where uaa_codigo = 480




select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
JOIN sede s on s.sed_codigo = u.sed_codigo 
JOIN modalidad m on m.mod_codigo = p.mod_codigo 
JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
JOIN resolucion re on re.res_codigo = p.res_codigo 
JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1


select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from dbo.uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from dbo.programa p 
JOIN dbo.uaa u on u.uaa_codigo = p.uaa_codigo 
JOIN dbo.sede s on s.sed_codigo = u.sed_codigo 
JOIN dbo.modalidad m on m.mod_codigo = p.mod_codigo 
JOIN dbo.nivel_academico na on na.nia_codigo = p.nia_codigo 
JOIN dbo.resolucion re on re.res_codigo = p.res_codigo 
JOIN dbo.jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select count(*) from acreditacion.programas_registrados_snies prs 
select * from acreditacion.programas_registrados_snies prs

select * from 

--select * from web_parametro wp where wp.wep_nombre = 'MATRICULA_PERIODO_ACTUAL'


select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_ACTIVO'
select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_MIGRACION'


SELECT * FROM acreditacion.programas_registrados_snies




select * from programa

select * from curso_virtual cv

INSERT INTO programas (pro_indicador, pro_codio_unificado, pro_registro_snies_codigo, pro_registro_icfes, pro_estado, pro_oferta, 
pro_sede, pro_formacion, pro_nivel_academico, pro_modalidad, pro_facultad, pro_nombre, pro_creacion_snies, pro_resolucion, 
pro_fecha_creacion, pro_jefe, pro_email_jefe) VALUES (,,,,,,,,,,,,,,,,);


UPDATE acreditacion.programas SET pro_codigo = ?, pro_codigo_unificado = ?, pro_registro_snies = ?, pro_registro_icfes = ?, 
pro_estado = ?, pro_oferta = ?, sed_nombre = ?, pro_formacion = ?, nia_nombre = ?, mod_nombre = ?, pro_facultad = ?, uaa_nombre = ?, 
pro_creacion_snies = ?, pro_resolucion = ?, pro_fecha_creacion = ?, pro_jefe = ?, pro_email_jefe = ? where pro_codigo = ?;

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 8
select * from usuario_tipo ut 

select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JUAN CARLOS%' and p.per_apellido like '%ALBARRACIN%'
--Guissela Alexandra L�pez Rodr�guez

select * from usuario_general_login ugl 


SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre,
 p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno
 FROM usuario_general_login u
 INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo
 INNER JOIN persona p ON u.up = p.per_codigo
 WHERE u.us like 7731066 order by u.uid DESC
 
 SELECT TOP 1 us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = 'a1075303330'
 
 SELECT us AS username, 'ROLE_ENCUESTA' as role FROM usuario_general_login WHERE state = 1 AND us = 'u20171157616'
 
 
 
SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, ss.sus_nombre FROM programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
inner join sub_sede ss on s.sed_codigo = ss.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 375

select * from sub_sede ss 

select * from uaa u where u.uat_codigo = 3

select * from uaa_tipo ut 

select * from acreditacion.integrante_comite_autoevaluacion ica 

select * from persona p where p.per_codigo = 71599

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 375

select distinct City, Country from Employees

select DISTINCT ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre from acreditacion.campo_detallado cd 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where ca.cam_estado = 1


select *, ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
where ca.cam_estado = 1

select * from sub_sede ss where ss.sus_estado = 1

select * from uaa u where u.uaa_codigo = 480 

select * from programa p 

select * from programa_titulo pt 

select * from plan_academico pa 

select DISTINCT p.pro_titulo_otorgado, (SELECT TOP 1 pla_total_creditos from plan_academico pa 
where pa.pro_codigo=p.pro_codigo and pla_total_creditos > 0 and pla_total_creditos is not null ORDER BY pla_codigo DESC) as totalCreditos  from programa p
where totalCreditos > 0

inner join plan_academico pa on p.pro_codigo = pa.pla_codigo
where pa.pla_total_creditos > 0
order by p.pro_titulo_otorgado 


select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JARO LEON%' and p.per_apellido like 'CASTRO ZAMORA'
select * from persona p where p.per_nombre like '%DIEGO ANDRES%' and p.per_apellido like '%CARVAJAL%'

select * from vinculacion_historico vh where vh.per_codigo = 2488

select * from estudiante e where e.per_codigo = 140591

select * from encuestas.cuestionarios c 

exec vinculacion_actual '12125816',''

SELECT u2.uaa_nombre AS dependencia, u1.uaa_nombre,pro.pro_registro_snies,  
            (CASE WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'A' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'C' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'D' THEN 'Distancia' END) as pro_calendario, 
            j.jor_nombre, (SELECT SUM(cup_cupo) FROM cupo c WHERE c.ofa_codigo =ofa.ofa_codigo) as cupo, 
            (SELECT TOP 1 pla_total_creditos from plan_academico pa 
            where pa.pro_codigo=pro.pro_codigo ORDER BY pla_codigo DESC) as totalCreditos 
            FROM oferta_academica ofa WITH (NOLOCK)  
            INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
            INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
            INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
            INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
            INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo  
            INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
            INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
            INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo  
            INNER JOIN jornada j WITH (NOLOCK) on pro.jor_codigo = j.jor_codigo  
--            WHERE per.per_nombre in (:periodo) AND sed.sed_codigo =1 
--            AND nia.nia_codigo in (9,11) 
            ORDER BY nat_nombre,dependencia,u1.uaa_nombre 
            
select * from acreditacion.institucion i 

select * from acreditacion.grupos_acreditables ga 

select * from matriculados_resumen mr 

select * from hecaa.colegios c 
select * from institucion_educativa ie 
select * from institucion_categoria ic 

select * from web_parametro wp

--SELECT per.per_nombre, per.per_apellido, per.per_identificacion, est.est_codigo, 
        floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
        tii.tii_nombre, pla.pla_nombre, pla.pla_codigo, pla.pla_creditos, pla.pla_total_creditos, 
        pla.pla_total_horas, pro.pro_codigo, pro.pro_registro_snies,  u1.uaa_nombre,  
        sed.sed_nombre, nia.nia_codigo, nia.nia_nombre, nat.nat_codigo,  nat.nat_nombre, cra.creditos_aprobados,  
        pcea.puntaje_calificado AS puntaje_calificado_estudiante,   
        pcaea.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_estudiante, 
        pcgcp.puntaje_calificado AS puntaje_calificado_graduado, 
        pcagcp.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_graduado, 
        (CASE WHEN pcea.puntaje_calificado IS NOT NULL THEN pcea.puntaje_calificado ELSE pcgcp.puntaje_calificado END ) AS promedio_ponderado, 
        (CASE WHEN pcaea.puntaje_calificado_aritmetico IS NOT NULL THEN pcaea.puntaje_calificado_aritmetico ELSE pcagcp.puntaje_calificado_aritmetico END ) AS promedio_aritmetico 
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
        LEFT JOIN puntaje_calificado_aritmetico_graduado_con_perdidas pcagcp ON est.est_codigo = pcagcp.est_codigo 
        WHERE est.est_codigo = 20171155993;

select * from usuario_administrativo ua 

select c.car_nombre, p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, p.per_email_interno, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where up.uap_fecha_fin is not null
ORDER BY up.uap_codigo DESC 

57003
1075226439

select * FROM encuestas.respuestas_cuestionarios rc where rc.per_codigo = 57003}


select * from resolucion r;



        
        
        
-- ACREDITACION INFORME DE PROGRAMAS 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_programa (
	asp_codigo int IDENTITY(1,1) NOT NULL,
	asp_item char (1) NULL,
	asp_aspecto varchar(1000) NOT NULL,
	asp_aprobado int NULL,
	asp_archivo varchar(250) NULL,
	asp_ruta varchar(250) NULL,
	asp_observacion varchar(1000) NULL,
	asp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_programa_PK PRIMARY KEY (asp_codigo)
);

select * from acreditacion.aspecto_programa ap 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_institucion (
	asi_codigo int IDENTITY(1,1) NOT NULL,
	asi_item char (1) NULL,
	asi_aspecto varchar(1000) NOT NULL,
	asi_aprobado int NULL,
	asi_archivo varchar(250) NULL,
	asi_ruta varchar(250) NULL,
	asi_observacion varchar(1000) NULL,
	asi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_institucion_PK PRIMARY KEY (asi_codigo)
);

select * from acreditacion.aspecto_institucion ai 

-- TABLA VARIABLES FORMULARIO
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);

-- TABLA INFORME PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_programa (
	inp_codigo int IDENTITY(1,1) NOT NULL,
	inp_fecha  date NOT NULL,
	pro_codigo int NOT NULL,
	inp_estado int DEFAULT 1 NOT NULL,
	gru_codigo int NOT NULL,
	CONSTRAINT informe_programa_PK PRIMARY KEY (inp_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_programa_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo)
);



-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);

select * from acreditacion.criterios_condiciones_iniciales cci 


-- TABLA INFORME CHEQUEO PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_programa (
	icp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	icp_item char (1) NULL,
	icp_aspecto varchar(1000) NOT NULL,
	icp_aprobado int NULL,
	icp_archivo varchar(250) NULL,
	icp_ruta varchar(250) NULL,
	icp_observacion varchar(1000) NULL,
	icp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_programa_PK PRIMARY KEY (icp_codigo),
	CONSTRAINT informe_chequeo_programa_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

-- TABLA INFORME CHEQUEO INSTITUCION
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_institucion (
	ici_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	ici_item char (1) NULL,
	ici_aspecto varchar(1000) NOT NULL,
	ici_aprobado int NULL,
	ici_archivo varchar(250) NULL,
	ici_ruta varchar(250) NULL,
	ici_observacion varchar(1000) NULL,
	ici_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_institucion_PK PRIMARY KEY (ici_codigo),
	CONSTRAINT informe_chequeo_institucion_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

select * from acreditacion.informe_chequeo_programa icp

select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.aspecto_institucion ai  

select * from acreditacion.informe_chequeo_programa where inp_codigo = 1 ORDER by icp_item

select * from acreditacion.informe_programa ip 

-- TABLA ESTADO NOTIFICACION
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);


-- TABLA INVITACION PROGRAMA ACREDITABLE
--CREATE TABLE academia3000_john.acreditacion.invitacion_programa_acreditable (
	ipa_codigo int IDENTITY(1,1) NOT NULL,
	gru_codigo int NOT NULL,
	pro_codigo int NOT NULL,
	ipa_fecha_envio date NOT NULL,
	ipa_fecha_respuesta date NULL,
	ipa_hash varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ipa_estado int NULL,
	CONSTRAINT invitacion_programa_acreditable_PK PRIMARY KEY (ipa_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK FOREIGN KEY (ipa_estado) REFERENCES academia3000_john.acreditacion.estado_invitacion(esi_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_2 FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo)
);


-- TABLA INFORME GENERAL PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_general_programa (
	igp_codigo int IDENTITY(1,1) NOT NULL,
	pro_codigo int NOT NULL,
	inp_codigo int NOT NULL,
	igp_facultad varchar(500) NULL,
	igp_departamento varchar(250) NULL,
	igp_denominacion varchar(500) NULL,
	igp_snies varchar(250) NULL,
	igp_jefe varchar(500) NULL,
	igp_coordinador varchar(500) NULL,
	igp_modalidad varchar(250) NULL,
	igp_jornada varchar(250) NULL,
	igp_nivel_formacion varchar(500) NULL,
	igp_duracion int NULL,
	igp_titulo varchar(500) NULL,
	igp_creditos int NULL,
	igp_amplio varchar(500) NULL,
	igp_especifico varchar(500) NULL,
	igp_detallado varchar(500) NULL,
	igp_nbc varchar(500) NULL,
	igp_area_nbc varchar(500) NULL,
	igp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_general_programa_PK PRIMARY KEY (igp_codigo),
	CONSTRAINT informe_general_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_general_programa_FK_1 FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo)
);

select * from acreditacion.informe_general_programa



select * from acreditacion.invitacion_programa_acreditable

select * from persona p where p.per_apellido likE '%GUERRERO FIERRO%'

select * from estudiante e where e.per_codigo = 26725

select * from programa p where p.pro_codigo = 12

select * from graduado g where g.est_codigo = '1993101130'


-- TABLA ESTADO INVITACION
--CREATE TABLE academia3000_john.acreditacion.estado_invitacion (
	esi_codigo int IDENTITY(1,1) NOT NULL,
	esi_nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT estado_invitacion_PK PRIMARY KEY (esi_codigo)
);

INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Enviado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Aceptado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Rechazado');

select * from acreditacion.estado_invitacion ei 



select * from acreditacion.aspecto_programa ap 
select * from acreditacion.aspecto_institucion ai 
select * from acreditacion.criterios_condiciones_iniciales cci 
update acreditacion.criterios_condiciones_iniciales cci values ()


select p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 


(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 


select * from plan_academico pa 

select * from EXCEL_NBC en
select * from snies_area sa 
select * from sede
select * from programa

select * from encuestas.cuestionarios c 
EXEC [vinculacion_actual] '1075226439',''

select * from estudiante e where e.per_codigo = 57003

select * from plan_academico pa where pro_codigo = 25

select * from acreditacion.aspecto_institucion ai  

SELECT 0 as uap_codigo, 0 as vin_codigo, e.est_codigo, u.uaa_codigo, u.uaa_nombre_corto, u.uaa_dependencia 
FROM estudiante e 
INNER JOIN programa p ON e.pro_codigo = p.pro_codigo 
INNER JOIN uaa u ON p.uaa_codigo = u.uaa_codigo 
WHERE e.est_codigo = '20171155993' AND e.ese_codigo = 1 

SELECT count(m.mat_codigo) FROM matricula m
 INNER JOIN calendario c ON m.cal_codigo = c.cal_codigo
 INNER JOIn periodo p ON c.per_codigo = p.per_codigo
 WHERE m.mat_estado = 'A' AND m.est_codigo = '20171155993'
 
 
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia,null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
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
inner join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 14


select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, p.per_email_interno, u.uaa_nombre, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select * from contrato.centro_trabajo ct 

select * from uaa_personal up where up.per_codigo = 108797
select * from persona p where p.per_identificacion = '1075303330'

select * from uaa u where u.uaa_nombre like '%OFICINA%'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797

select * from encuestas.respuestas r where r.rcu_codigo = 22486

select * from encuestas.cuestionarios c 
exec vinculacion_actual '1075303330'

select u.uaa_nombre, u.uaa_email, u.uaa_email_pqr, u.uaa_pagina, u.uaa_telefono, u.uaa_direccion, u.uaa_fax from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.cam_det_codigo is not null


select * from acreditacion.invitacion_programa_acreditable where ipa_invitacion_hash = ''

select * from acreditacion.estado_invitacion ei 

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa


-- PERSONA POR PROGRAMA
select * from persona p

--DOCENTE POR PROGRAMA

--ADMINISTRATIVO POR PROGRAMA

-- ESTUDIANTE POR PROGRAMA
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
where pr.pro_codigo = 375 and  est_registro_egresado = 0

.est_codigo = :codigoEst

select * from persona p where p.per_identificacion = '1075303330'

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
where pr.pro_codigo = 375  and e.est_registro_egresado = 0


select * from persona p where p.per_nombre like '%ARLYN'

select * from uaa_personal up 
inner join uaa u on up.uaa_codigo = u.uaa_codigo
where up.per_codigo = 95604

SELECT * FROM acreditacion.integrante_comite_autoevaluacion ica 

select * from estudiante e where e.per_codigo = 153265

select * from persona p where p.per_codigo = 153265

select * from web_parametro wp where wp.wep_nombre like '%ARCHIVO%'


SELECT top 1 per.per_a�o AS ano, per.per_nombre AS periodo, sed_nombre, nat_nombre, nia_nombre,
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia, pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo=pro.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as totalSemestres 
FROM oferta_academica ofa WITH (NOLOCK)
INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo
INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo
where pro.pro_codigo = 401
order by per.per_codigo desc


select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as semestres
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where p.pro_codigo = 401






select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select * from programa

select * from nivel_academico na 






--ACREDITABLES NUEVO PARAMETRO MATRICULADOS
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo IN (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select na.pro_codigo from acreditacion.norma_acreditable na where na.gru_codigo = 15

select * from programa where pro_codigo = 3


-- QUERY ACREDITABLES CON MATRICULADOS


select p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, p.pro_creacion_snies, p2.per_fecha_inicio, DATEADD(year, 8, p.pro_creacion_snies) AS pro_vigencia_cna, p2.per_fecha_fin, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join acreditacion.norma_acreditable na on e.pro_codigo = na.pro_codigo
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where convert(Date, p2.per_fecha_inicio) BETWEEN DATEADD(year, -1, p.pro_creacion_snies) AND DATEADD(year, 8, p.pro_creacion_snies) and convert(Date, p2.per_fecha_fin)  BETWEEN p.pro_creacion_snies AND DATEADD(year, 9, p.pro_creacion_snies) and na.gru_codigo = 15
group by p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, pro_creacion_snies, p2.per_fecha_inicio, p2.per_fecha_fin




select * from matricula


select count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 3

select * from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 3


select * from programa
--PARAMETRIZAR POR LAS FECHAS DE PERIODO EL INTERVALO, LUEGO AGRUPAR POR PERIODOS Y CANTIDAD DE MATRICULADOS

--m.mat_fecha BETWEEN p.pro_creacion_snies AND DATEADD(year, 8, p.pro_creacion_snies)

select p.pro_codigo, u.uaa_nombre, p.pro_creacion_snies, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_creacion_snies is not null 
group by p.pro_codigo, u.uaa_nombre, pro_creacion_snies


select p.pro_codigo, p.pro_creacion_snies from programa p where p.pro_creacion_snies is not null

select * from matricula m 
select * from calendario c 
select * from periodo p 






select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALAUACI�N') as coordinador
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  
where p.pro_codigo = 375


select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_general_programa igp 

select * from acreditacion.informe_programa ip 

select * from acreditacion.informe_general_programa igp 

--PROCESO ALMACENADOTASA DE DESERCI�N
EXEC dbo.acreditacion_tasa_desercion '20222', 1 

select DISTINCT oaa.facultad_codigo, oaa.facultad from acreditacion.oferta_academica_acreditacion oaa 

select * from acreditacion.oferta_academica_acreditacion oaa where oaa.facultad_codigo in (19, 20, 21, 22, 23, 24, 258)




-- Programa con Jefe de Programa
SELECT p.pro_codigo, u.uaa_nombre_corto, p.pro_creacion_snies, pr.per_nombre, pr.per_apellido, aug.aud_changed  FROM programa p  
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner join aud_usuario_grupo aug on ug.usg_codigo = aug.usg_codigo
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
GROUP by u.uaa_nombre_corto 


select * from usuario_grupo

select * from aud_usuario_grupo


select * from uaa_personal

select count(*) from usuario_grupo ug  
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
where ud.usg_grupo = 34 and ug.usg_estado = 1 


select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, up.uap_fecha_inicio, up.uap_fecha_fin from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
left join uaa_personal up  on pe.per_codigo = up.per_codigo
where ug.usg_grupo = 34 and p.pro_codigo = 418 and up.uap_cargo = 76
order by ug.usg_usuario desc

select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo  
where ug.usg_grupo = 34 and p.pro_codigo = 418 
order by ug.usg_usuario desc


select pe.per_nombre, pe.per_apellido, pe.per_email_interno , ug.up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
where p.pro_codigo = 418 and ug.usg_grupo = 34 
order by ug.usg_usuario desc


select * from vinculacion v 

select * from usuario_docentes ud  

select * from uaa_personal

select * from aud_usuario_grupo aug where usg_grupo = 34 and usg_uaa = 601 

select * from usuario_docente where usg_grupo = 34 and usg_uaa = 676

select * from usuario_grupo where usg_grupo = 34 and usg_uaa = 676


select * from grupo



uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 


select * from uaa_personal where per_codigo = 5529--100472 --23742--100472 -- 5529


select * from cargo

select * from uaa

select * from usuario_grupo

select count(*) from usuario_docente where usg_grupo = 34 

usg_grupo = 34





-- p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select count(*) from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select * from 


select * 


select * from contrato

select * from 

select * from usuario_docente 










select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_creacion_snies,
CASE WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado ,
CASE WHEN pro_estado = 01 THEN 'SI' ELSE 'NO' END AS oferta,
p.pro_creacion_snies, p.pro_fecha_creacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,
p.pro_registro_snies, p.pro_registro_icfes, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, c.con_descripcion, pe.pre_nombre, r.res_numero, tn.tin_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ca.cam_codigo, ce.cam_esp_nombre, ce.cam_esp_codigo, cd.cam_det_nombre, cd.cam_det_codigo, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+ pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo 
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 165


select * from convenio

SELECT *,nat.nat_nombre as formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, u.uaa_nombre as facultad FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 433




SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
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
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 15




select p.pro_codigo, p.pro_registro_icfes, p.pro_registro_snies, u.uaa_nombre, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo
where p.pro_creacion_snies is not null and floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) >= 8



select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  
where pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8

select * from nivel_academico na2 
select * from acreditacion.grupos_acreditables gru
select * from acreditacion.norma_acreditable na

select count(*) from acreditacion.norma_acreditable na
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where gru_codigo = 18

select * from acreditacion.norma_nivel_academico nna where nna.noa_codigo = 1

select * from acreditacion.norma_criterio nc

SELECT * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo
where nc.noc_estado = 1 and nc.nna_codigo = 15





Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, 
pro_registro_snies, pro_calendario, pro_horario, pro_fecha_creacion, pro_extension_snies, 
pro_propio, pro_creacion_snies, p.uaa_codigo, ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, 
ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as tiempo, 
nat.nat_nombre, nia_nombre, nia_estado, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 and floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) >= 8

select * from notas_total

SELECT * FROM acreditacion.norma_nivel_academico

select * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo 
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo 
where nc.noc_estado = 1 and nc.nna_codigo = 13 and nna.nna_estado != 0



select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.invitacion_programa_acreditable where ipa_hash = '466cfb0b4fec46c69d6cd2196e305c54'



SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombre_jefe_programa,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as apellido_jefe_programa,
(select top 1 pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as per_email_interno, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
Inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 18


SELECT * FROM acreditacion.grupos_acreditables ga 

SELECT * FROM acreditacion. 

select * from proyectos.investigadorexternoxgrupo i  

select count(*) from acreditacion.norma_acreditable na where gru_codigo = 18


INSERT INTO academia3000_john.acreditacion.invitacion_programa_acreditable (gru_codigo, pro_codigo, ipa_fecha_envio, ipa_fecha_respuesta, ipa_hash, ipa_estado) VALUES(17, 383, '2022-10-12', NULL, N'499523da3d514f82837f003dccdc081c', 1);

select pe.per_nombre, pe.per_apellido, pe.per_codigo, p.pro_codigo, pe.per_email_interno, ug.up, u.uaa_nombre, ug.gru_nombre, 
CASE WHEN ug.usg_estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END AS usg_estado from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
where p.pro_codigo = 8 and ug.usg_grupo = 34 order by ug.usg_estado desc 


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.matriculados_acreditacion ma 


-- VISTA MATRICULADOS PARA ACREDITACION
CREATE VIEW [acreditacion].[matriculados_acreditacion] AS
SELECT mat.mat_codigo, mat.mat_observacion, mat.mat_cliente, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico,
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
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A'

select count(*) from acreditacion.matriculados_acreditacion ma where ma.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio >= 2022

select count(*) from acreditacion.inscritos_acreditacion ia where ia.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio 

select * from uaa_personal up where up.per_codigo = 108797


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_chequeo_institucion ici

select * from acreditacion.informe_general_programa igp 

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
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 383



select * from acreditacion.aprobacion_informe_programa aip 


select * from acreditacion.aprobacion_informe_programa where pro_codigo = 383 and igp_codigo = 1


select * from acreditacion.informe_chequeo_institucion ici 


DECLARE @T TABLE (
     col1 float,
     col2 int
 );
    
 INSERT INTO @T VALUES
 (1.5,8),
 (1.5,1),
 (2.0,1),
 (3.0,1),
 (4.5,1),
 (4.5,2),
 (5.0,3),
 (6.0,4);   
 SELECT col1, col2 FROM @T order by col1 asc, col2 DESC
 
 SELECT * FROM persona p WHERE p.per_apellido like '%FAJARDO OROZCO%' 



select * from grupo g select count(*) from carnetizacion.empleados e 
select * from carnetizacion.estudiantes e2

select * from vinculacion v 
select count(*) from uaa_personal up where up.uap_id_carnet is not null

--update dbo.usuario_graduados set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
select * from dbo.usuario_graduados
select * from usuario_academia_login ual 

SELECT * from dbo.usuario_general_login

select * from dbo.usuario_estudiante_login uel 

select * from dbo.usuario_carnet_digital ucd where ucd.up = 108797

select * from dbo.usuario_carnet_digital_login ucdl where ucdl.up = 1087979

select  top 1 * from dbo.usuario_carnet_digital_login ucdl  
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where  us = 'u20171157616' order by ucdl.usg_codigo desc


select COUNT(ucdl.us) from dbo.usuario_carnet_digital_login ucdl 
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where us = 'a1075303330'

--CREATE VIEW [dbo].[usuario_alta_acreditacion_login]
AS
SELECT        p.per_codigo, ua.uid, ua.us, ua.sys, ua.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ua.state, ua.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_administrativos ua INNER JOIN
                         dbo.persona p ON ua.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ua.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ua.state = 1)
UNION
SELECT        p.per_codigo, ud.uid, ud.us, ud.sys, ud.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ud.state, ud.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_docentes ud INNER JOIN
                         dbo.persona p ON ud.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ud.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ud.state = 1)

select * from programa where pro_codigo =

select * from academia3000_daniel.dbo.campo_amplio ca 

select * from uaa

select * from modulo m  where mod_codigo

select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	full JOIN  uaa u on u.uaa_codigo = p.uaa_codigo
	full JOIN sede s on s.sed_codigo = u.sed_codigo
	full JOIN modalidad m on m.mod_codigo = p.mod_codigo
	full JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	full JOIN resolucion re on re.res_codigo = p.res_codigo
	full JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	full JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	full JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	full JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo
	full JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	full join persona pe on pe.per_codigo= ud.up
	where pro_codigo = $P{pro_codigo}  and ug.usg_grupo = 34  and ug.usg_estado = 1
	
	
	
	
	
	
	
	SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
INNER JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
 left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 165


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 445 





select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 0
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	
	
	DROP TABLE acreditacion.NewTable 
	
	CREATE TABLE academia3000_daniel.acreditacion.criterios (
	cri_codigo int IDENTITY(1,1) NOT NULL,
	cri_id varchar(100) NOT NULL,
	cri_titulo varchar(100) NOT NULL,
	cri_vigencia varchar(100) NULL,
	cri_descripcion varchar(100) NULL
	ALTER TABLE academia3000_daniel.acreditacion.criterios ADD CONSTRAINT criterios_PK PRIMARY KEY (cri_codigo);

);

select pro_registro_snies,pro_extension_snies from dbo.programa 
CREATE TABLE academia3000_daniel.acreditacion.variables (
	var_codigo int IDENTITY(1,1) NOT NULL,
	var_nombre varchar(100) NOT NULL,
	cri_codigo int NOT NULL,
	CONSTRAINT variables_PK PRIMARY KEY (var_codigo),
	CONSTRAINT variables_FK FOREIGN KEY (cri_codigo) REFERENCES academia3000_daniel.acreditacion.criterios(cri_codigo)
);
CREATE TABLE academia3000_daniel.acreditacion.items (
	ite_codigo int IDENTITY(1,1) NOT NULL,
	ite_nombre varchar(100) NOT NULL,
	var_codigo int NOT NULL,
	CONSTRAINT items_PK PRIMARY KEY (ite_codigo),
	CONSTRAINT items_FK FOREIGN KEY (var_codigo) REFERENCES academia3000_daniel.acreditacion.variables(var_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_acreditacion (
	noa_codigo int IDENTITY(1,1) NOT NULL,
	noa_nombre varchar(200) NOT NULL,
	noa_fecha_inicio date NOT NULL,
	noa_fecha_fin date NULL,
	CONSTRAINT norma_acreditacion_PK PRIMARY KEY (noa_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_nivel_academico (
	nna_codigo int IDENTITY(1,1) NOT NULL,
	nna_nombre varchar(200) NOT NULL,
	nia_codigo int NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT norma_nivel_academico_PK PRIMARY KEY (nna_codigo),
	CONSTRAINT norma_nivel_academico_FK FOREIGN KEY (nia_codigo) REFERENCES academia3000_daniel.dbo.nivel_academico(nia_codigo),
	CONSTRAINT norma_nivel_norma_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_criterio (
	noc_codigo int IDENTITY(1,1) NOT NULL,
	noc_nombre varchar(200) NOT NULL,
	nna_codigo int NOT NULL,
	tiempo int NOT NULL,
	CONSTRAINT norma_criterio_PK PRIMARY KEY (noc_codigo),
	CONSTRAINT norma_criterio_FK FOREIGN KEY (nna_codigo) REFERENCES academia3000_daniel.acreditacion.norma_nivel_academico(nna_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_acreditable (
	nac_codigo int  IDENTITY(1,1) NOT NULL,
	nac_nombre varchar(200) NOT NULL,
	noa_codigo int NOT NULL,
	pro_codigo int not null,
	creacion  date DEFAULT getDate() NOT NULL,
	CONSTRAINT norma_acreditable_PK PRIMARY KEY (nac_codigo),
	CONSTRAINT norma_acreditable_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo),
	CONSTRAINT norma_acreditable_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_daniel.dbo.programa(pro_codigo),
	
);

CREATE TABLE academia3000_daniel.acreditacion.grupos_acreditables (
	gru_codigo int IDENTITY(1,1) NOT NULL,
	gru_nombre varchar(100) NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT grupos_acreditables_PK PRIMARY KEY (gru_codigo),
	CONSTRAINT grupos_acreditables_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);


ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_estado int NOT NULL;

ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD  DEFAULT 1 FOR noa_estado;
ALTER TABLE academia3000_daniel.acreditacion.norma_nivel_academico ADD nna_estado int DEFAULT 1 NOT NULL;
ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_ruta varchar(200) NULL;

select dbo.getTokenDocumento("5453254684") as token
select * from acreditacion.norma_acreditacion
select * from sgd.documento where per_codigo=54684

INSERT INTO academia3000_daniel.acreditacion.norma_acreditacion (noa_nombre, noa_fecha_inicio, noa_fecha_fin, noa_estado, noa_ruta) VALUES('', '', '', 1, '');

ALTER TABLE academia3000_daniel.dbo.programa ADD pro_creacion_snies date NULL;

SELECT * from acreditacion.norma_criterio nc join acreditacion.norma_nivel_academico nna on nc.nna_codigo =nna.nna_codigo join acreditacion.norma_acreditacion na  on na.noa_codigo =nna.noa_codigo where nc.nac_estado=1

select mod_codigo from programa p 

SELECT * from acreditacion.norma_acreditable na join  acreditacion.norma_acreditacion na2 on na.noa_codigo =na2.noa_codigo join programa p2 on na.pro_codigo =p2.pro_codigo join nivel_academico na3 on p2.nia_codigo =na3.nia_codigo join modalidad m2 on p2.mod_codigo =m2.mod_codigo

select  from programa p 



select * from ( Select  pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,uaa_estado,uaa_nombre,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-
cast(convert(varchar(8),pro_creacion_snies,112) as int) ) / 10000)as tiempo from programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where pro_creacion_snies is not null  and ua.uaa_estado = 1

)temporal where tiempo>8 

select * from acreditacion.norma_nivel_academico nna where noa_codigo = ? and nna_estado =1

select *from uaa where uaa_nombre like'%facultad%'


SELECT * from acreditacion.norma_acreditable nac join  acreditacion.norma_acreditacion noa 
on nac.noa_codigo =noa.noa_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
 
 
 select * from acreditacion.grupos_acreditables ga join acreditacion.norma_acreditacion na on ga.noa_codigo = na.noa_codigo where noa_estado =1
 
 INSERT INTO acreditacion.grupos_acreditables (gru_nombre, noa_codigo) VALUES('', 0);

SELECT * from acreditacion.norma_acreditable nac join  acreditacion.grupos_acreditables gru 
on nac.gru_codigo = gru.gru_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo where gru.gru_codigo =1


select *from programa_estado pe 

select * from acreditacion.norma_acreditable na where gru_codigo =3

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_amplio (
	aud_codigo_campo_amplio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_codigo int NOT NULL,
	cam_estado int NOT NULL,
	cam_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_amplio_PK PRIMARY KEY (aud_codigo_campo_amplio)
);

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_detallado (
	aud_codigo_campo_detallado bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_det_codigo int NOT NULL,
	cam_det_estado int NOT NULL,
	cam_esp_codigo int NOT NULL,
	cam_det_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_detallado_PK PRIMARY KEY (aud_codigo_campo_detallado)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditable (
	aud_codigo_norma_acreditable bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nac_codigo int not null,
	nac_nombre varchar(200) not null,
	pro_codigo int not null,
	nac_creacion date not null,
	nac_estado int not null,
	gru_codigo int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditable_PK PRIMARY KEY (aud_codigo_norma_acreditable)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditacion (
	aud_codigo_norma_acreditacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noa_codigo int not null,
	noa_nombre varchar(200) not null,
	noa_fecha_inicio date not null,
	noa_fecha_fin date,
	noa_estado int not null,
	noa_ruta varchar(200),
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditacion_PK PRIMARY KEY (aud_codigo_norma_acreditacion)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_criterio (
	aud_codigo_norma_criterio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noc_codigo int not null,
	noc_nombre varchar(200) not null,
	nna_codigo int not null,
	noc_tiempo int not null,
	noc_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_criterio_PK PRIMARY KEY (aud_codigo_norma_criterio)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_nivel_academico (
	aud_codigo_norma_nivel_academico bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	nna_codigo int not null,
	nna_nombre varchar(200),
	nia_codigo int not null,
	noa_codigo int not null,
	nna_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_nivel_academico_PK PRIMARY KEY (aud_codigo_norma_nivel_academico)
);
SELECT * from encuestas.cuestionarios c 

SELECT * from encuestas.preguntas p join encuestas.tipo_respuestas tr on p.tre_codigo =tr.tre_codigo
 join encuestas.cuestionarios c on p.cue_codigo=c.cue_codigo left join encuestas.grupo_escala g on p.gre_codigo= g.gre_codigo
  where c.cue_codigo=:codigo AND (p.pre_tipo=0 OR p.pre_tipo=2) AND p.pre_estado=1 AND (p.tre_codigo=1 OR p.tre_codigo=4)

CREATE TABLE academia3000_daniel.acreditacion.aud_grupos_acreditables (
	aud_codigo_grupos_acreditables bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	gru_codigo int not null,
	gru_nombre varchar(200),
	noa_codigo int not null,
	gru_creacion date,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_grupos_acreditables_PK PRIMARY KEY (aud_codigo_grupos_acreditables)
);




aud_log_type, 
cam_det_codigo,
cam_det_estado,
cam_esp_codigo,
cam_det_nombre,
codigo_cine, 


select (select value from split(pro_estado ,'0') where value !='') as estado,pro_titulo_otorgado as titulo ,pro_codigo as codigo  from programa 

select * from split

update academia3000_daniel.dbo.programa 
set pro_estado = (
select * from split(pro_estado ,'0') where value !=''
)
from programa

select pro_estado from programa p 

where pro_codigo = pro_codigo 


SELECT * FROM SplitProEstado('05')

DECLARE @a char='05'
SELECT @a, cast(@a as int)


select * from acreditacion.norma_acreditacion na 
select  * FROM programa p 

select * from acreditacion.norma_criterio nc 


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN resolucion r on r.res_codigo = p.res_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
FULL JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
WHERE p.uaa_codigo = 29


select * from uaa_personal where uap_cargo=76 and vin_codigo =46 and uap_fecha_fin is null

select per_apellido, per_nombre from uaa_personal, persona where uap_cargo  = 76 and vin_codigo = 46 and uap_fecha_fin is null

select * from persona where per_codigo =  136709

select * from uaa_personal

select * from estudiante where est_registro_egresado = 0

select * from egresado 

select * from cargo

select * from programa where pro_estado=1

-- QUERY ESTUDIANTES POR PROGRAMAS
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where pro.pro_codigo = 418 and pro.pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = '20171157616' and pro.pro_codigo = 418 and pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa con variables
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = $P{est_codigo} and pro.pro_codigo = $P{pro_codigo} and pro_estado = 1 and e.est_registro_egresado = 0


-- Programa con Jefe de Programa
SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
WHERE p.pro_codigo = 456

-- QUERY JASPER ORIGINAL, DOCENTE CON FILTRO DISTINCT
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
    ELSE 'PREGRADO' END AS formacion
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
	where pro_codigo =$P{pro_codigo}

-- MODIFICACI�N QUERY JASPER DANIEL
select pro_registro_snies, pro_registro_icfes,p.uaa_codigo_unificado , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p join (select pr.uaa_codigo_unificado,pr.pro_codigo from programa pr group by uaa_codigo_unificado,pro_codigo)  pr
	on p.pro_codigo =pr.pro_codigo
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	GROUP by p.uaa_codigo_unificado

select * from academia3000_john.encuestas.cuestionario_configuracion cc 
	
-- VISTA DOCENTES Y DOCENTE
SELECT * from usuario_docente order by usg_usuario 	
    SELECT dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado,p.uaa_codigo_unificado
    FROM dbo.grupo INNER JOIN
            dbo.usuario_grupo ON dbo.grupo.gru_codigo = dbo.usuario_grupo.usg_grupo INNER JOIN
            dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
            join programa p on p.uaa_codigo =dbo.usuario_grupo.usg_uaa GROUP  by p.uaa_codigo_unificado, dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado order by                       
WHERE (dbo.grupo.gru_id = 'JEFE_PROGRAMA')                
    select * from usuario_grupo ug 
    select * from uaa where uaa_codigo = 794
    SELECT * FRom programa where uaa_codigo_unificado  = 794
    
UPDATE acreditacion.campo_detallado SET cam_det_nombre=:nombre, cam_det_estado=:estado,cam_esp_codigo=:esp, codigo_cine=:cine WHERE cam_det_codigo=:codigo



SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = ua.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
WHERE ua.sed_codigo = $P{pro_codigo} and ua.uaa_estado = 1 order by ua.uaa_nombre asc

SELECT * from sede s 


--CAMBIO DE CLAVE ADMINISTRATIVOS
--update dbo.usuario_administrativos set uwd2 =HASHBYTES('MD5',HASHBYTES('SHA1','12345'))
--update dbo.usuario_docentes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update dbo.usuario_estudiantes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update persona set per_email = 'guerrerocordobajohn@gmail.com', per_email_interno = 'john.guerrero@usco.edu.co'

select * from web_parametro wp where wp.wep_nombre like '%TOKEN%' --http://sergio.usco.edu.co/iniciosesion/


select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
WHERE ca.cam_estado = 1

select ro.rop_descripcion,p.pre_descripcion,p.pre_identificador,c.cue_nombre,tu.tus_nombre,per.per_nombre,u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, ro.rop_descripcion, p.pre_descripcion, p.pre_identificador, c.cue_nombre, tu.tus_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, per.per_apellido, per.per_nombre, 
e.est_codigo, s.sed_nombre, u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from uaa


select * from usuario_general_login ugl WHERE ugl.us = '12113154'
EXECUTE vinculacion_actual '1080266346', 0
EXECUTE vinculacion_actual '1075232353', 0
EXECUTE academia3000_john.vinculacion_actual(:@per_identificacion, :@uaa_codigo) 
select * from programa

 select * from programa

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion,CASE WHEN res_texto != null THEN res_texto ELSE rop_descripcion END AS respuesta , c.cue_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.preguntas p on c.cue_codigo  = p.cue_codigo  
join encuestas.preguntas_respuestas pr on p.pre_codigo = pr.pre_codigo  
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
join dbo.persona per on rc.per_codigo = per.per_codigo 
join dbo.estudiante e on per.per_codigo = e.per_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join dbo.programa pro on e.pro_codigo = pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from encuestas.respuestas r 
select * from encuestas.preguntas_respuestas pr  

CASE WHEN r.res_texto != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,

select * from encuestas.respuestas_cuestionarios rc  
select * from encuestas.preguntas p  
select * from encuestas.respuestas r 


select * from uaa u WHERE u.uaa_nombre like '%VICE%'

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, ro.rop_descripcion, r.res_texto, c.cue_nombre from encuestas.respuestas r 
LEFT JOIN encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
LEFT JOIN encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
LEFT JOIN encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo
LEFT JOIN encuestas.preguntas p on c.cue_codigo = p.cue_codigo  
LEFT JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
LEFT JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join dbo.persona per on rc.per_codigo = per.per_codigo 
join dbo.estudiante e on e.per_codigo = per.per_codigo 
join dbo.programa pro on e.pro_codigo = pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo  
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo =:programa ) and c.uaa_codigo =:uaa

select * from persona where per_apellido like '%ROJAS ROJAS%'

select * from encuestas.respuestas r -- res_codigo, rcu_codigo, prr_codigo, res_texto, pre_codigo
select * from encuestas.cuestionarios c -- cue_codigo
join uaa u on c.uaa_codigo = u.uaa_codigo 
select * from encuestas.cuestionario_configuracion cc 
select * from encuestas.preguntas p -- pre_codigo, cue_codigo, pre_tipo, tre_codigo
select * from encuestas.preguntas_respuestas pr -- prr_codigo, rop_codigo, pre_codigo, tre_codigo
select * from encuestas.respuestas_opciones ro -- rop_codigo
select * from encuestas.tipo_respuestas tr 
select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo in (1,2) --where rc.per_codigo = 108797

select * from usuario_docente_general udg 

-- CASE WHEN r.prr_codigo != null THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta
-- CASE WHEN p.pre_tipo != 2 THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta


select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, CASE WHEN r.prr_codigo is null THEN r.res_texto ELSE ro.rop_descripcion END AS respuesta, c.cue_nombre from encuestas.respuestas r
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
left join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
left join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
left join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
left join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
left join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

SELECT * from programa p
join uaa u on p.uaa_codigo_unificado = u.uaa_dependencia  

SELECT p.pro_codigo, u.uaa_nombre_corto, u.uaa_dependencia  from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
WHERE p.uaa_codigo_unificado is not null and p.pro_estado = 1 and u.uaa_nombre like '%MAESTRIA EN PSICOLOGIA%'
ORDER by p.sed_codigo

select * from nivel_academico na na.nia_codigo in (9,11)

select * from persona p where p.per_identificacion = '1075303330' -- JS: 87855  JG: 108797

select * from uaa u WHERE uaa_codigo  = 24

select * FROM usuario u where usu_persona = 87855
select * from usuario_administrativo ua where ua.up = 87855

select * from usuario_administrativo ua where ua.us = 'a1075232353'

SELECT * from 

select * FROM usuario_grupo ug where ug.usg_usuario = 155684
select * FROM usuario_grupo ug where ug.usg_usuario = 146624
select * FROM usuario_grupo ug where ug.usg_usuario = 54684
select * from grupo g 
--insert usuario_grupo (usg_usuario,usg_grupo,usg_uaa) values(146624,239,554)

select * FROM usuario_grupo ug where ug.usg_usuario = 87855

select * from grupo g WHERE g.gru_codigo = 4



select * from persona p where p.per_identificacion = '1075220954' 


select * from academia3000_john.dbo.usuario_grupo ug where usg_grupo = 239
select * from persona where per_codigo = 87855

	54684	283	532	1
	
select * from uaa
select * from usuario_grupo ug where ug.usg_grupo = 276

select * from usuario_grupo ug where ug.usg_usuario in (146624, 96663)

select * from grupo g where gru_nombre like '%acreditacion%'

select * from grupo g where gru_codigo  = 106

select * from usuario_general ug where up in (108797,87855)
select * from usuario_administrativos ug where up = 108797

UPDATE usuario_administrativos set sys = 'jhonhenrysolorzanolozano' where uid = 146624

INSERT INTO usuario_grupo (usg_usuario,usg_grupo,usg_uaa,usg_estado) VALUES (146624,283,554,1);

SELECT * from usuario_general ug  where us like '%a1075303330%'  -- 146624  108797  a1075303330
 																--- 96663  87855  a1075232353
SELECT p.per_apellido, p.per_nombre, e.est_codigo, e.enc_inicio, p2.pre_descripcion, o.opc_descripcion FROM covid.encuesta e 
inner join dbo.persona p on e.per_codigo = p.per_codigo 
inner join covid.pregunta p2 on e.cat_codigo = p2.cat_codigo
inner join covid.respuesta r on p2.pre_codigo = r.pre_codigo 
inner join covid.opciones o on r.opc_codigo = o.opc_codigo  
where p2.cat_codigo = 8 and p2.pre_estado = 1


select * from covid.encuesta e
select * from covid.categoria c -- 7, 8
select * from covid.pregunta p
select * from covid.opciones o 
select * from covid.respuesta r 
select * from covid.respuesta_subopciones rs 
select * from covid.tipo_respuestas tr 

 
 select * from covid.encuesta e 
 ---
select * from promedio_ponderado pp  
select * from covid.autorizacion_ingreso ai
 
-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int,
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);


 
SELECT * FROM acreditacion.programas_registrados_snies prs 
select * from persona p 
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo where p.per_nombre = 'JOHAN MANUEL' AND pro_codigo = 418

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

	
select * from programa
select * from usuario_grupo
select * from grupo


-- TABLA MYSQL PROGRAMAS
/*
CREATE TABLE acreditacion.programas (
	pro_codigo int IDENTITY(1,1) NOT NULL,
	pro_codio_unificado int NULL,
	pro_registro_snies_codigo int NULL,
	pro_registro_icfes int NULL,
	pro_estado int NULL,
	pro_oferta varchar(10) NULL,
	pro_sede varchar(100) NULL,
	pro_formacion varchar(100) NULL,
	pro_nivel_academico varchar(100) NULL,
	pro_modalidad varchar(100) NULL,
	pro_facultad varchar(250) NULL,
	pro_nombre varchar(250) NULL,
	pro_creacion_snies date NULL,
	pro_resolucion varchar(250) NULL,
	pro_fecha_creacion date NULL,
	pro_jefe varchar(250) NULL,
	pro_email_jefe varchar(250) NULL,
);
*/


select * from encuestas.cuestionarios c

SELECT pre_descripcion FROM [covid].pregunta WHERE cat_codigo=8 ORDER BY pre_codigo ASC

SELECT * FROM [seysatra].encuesta_covid WHERE
            convert(varchar(10),ecov_fecha, 120) BETWEEN '2021-03-14' AND '2022-04-19' AND ecov_tipo=1
            ORDER BY
            ecov_fecha ASC
            
SELECT * FROM covid.encuesta e          




select * from encuestas.cuestionarios c 
select * from encuestas.preguntas p where p.cue_codigo = 9 and p.pre_estado = 1
select * from programa

SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo= ud.up
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo
where gru.gru_codigo = 14


SELECT *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 3 


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo = 3


select * from programa

select DISTINCT * from ( 
Select 
 pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,
pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres , pr.per_email_interno,
uaa_estado,uaa_nombre,uaa_dependencia,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-cast(convert(varchar(8),pro_creacion_snies,112) as int)
 ) / 10000)as tiempo from programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo = ud.up
where p.nia_codigo = 11
and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5

select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5


select * from persona 





SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 165


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 )temporal where tiempo > 8

select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
where ca.cam_estado = 1


select *,CASE WHEN ce.cam_esp_codigo = cd.cam_esp_codigo  THEN null ELSE ce.cam_esp_nombre END AS especifico  from acreditacion.campo_detallado cd
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
where cd.cam_det_estado = 1

with ts as (
      select cd.*, row_number() over (partition by cd.cam_esp_codigo order by cd.cam_esp_codigo) as seqnum
      from acreditacion.campo_detallado cd 
     )
select cd.cam_esp_codigo,
       (case when seqnum = 1 then cd.cam_esp_codigo end) as cd.cam_esp_codigo
from ts;


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE uaa_codigo = 318 and uap_fecha_fin is not null

select * from vinvul

select * from persona where per_nombre LIKE '%JULIO ROBERTO' AND per_apellido like '%CANO BARRERA'

select top 1 p.per_identificacion as est_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181' --36167024
ORDER BY up.uap_codigo DESC 

select * from programa where uaa_codigo = 318

select * from uaa where uaa_codigo = 318

select top 1 p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181'
ORDER BY up.uap_codigo DESC 


SELECT * FROM estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where pro_codigo = 8 and e.est_registro_egresado = 1

SELECT *, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia from acreditacion.norma_acreditable nac  
join acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 



select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 12 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


UPDATE acreditacion.institucion 
SET ins_nit=:nit, ins_ies=:ies, ins_ies_padre=:iespadre, ins_sector=:sector, ins_nombre=:nombre, ins_caracter_academico=:caracter, mun_codigo=:municipio, ins_direccion=:direccion, ins_telefonos=:telefonos, ins_web=:web, ins_norma=:norma, ins_fecha_creacion=:creacion, ins_existencia=:existencia, ins_ruta=:ruta 
WHERE ins_codigo=:codigo



INSERT INTO acreditacion.institucion 
(ins_nit, ins_ies, ins_ies_padre, ins_sector, ins_nombre, 
ins_caracter_academico, mun_codigo, ins_direccion, 
ins_telefonos, ins_web, ins_norma, ins_fecha_creacion, 
ins_existencia, ins_ruta) 
VALUES(:nit,:ies,:iespadre,:sector,:nombre,:caracteracade,:municipio,:direccion,:telefonos,:web,:nombrenorma,:creacion,:existencia,:ruta);

EXECUTE sibusco.jovenes_accion_periodo 20212


select m.cal_codigo, mu.SNIES_codigo,'1114' AS insti,
       p.pro_registro_snies, e.est_codigo, 
       t.snies_codigo,   
	   pe.per_identificacion,
       per_nombre1,      per_nombre2, 
       per_apellido1,      per_apellido2,
       pe.per_genero,      pe.per_fecha_nacimiento,
       mu.SNIES_codigo,    pe.per_email,
       pe.per_telefono_fijo, pe.per_telefono_movil,
       s.sed_nombre,     u.uaa_nombre,
       pe.per_genero,      m.mat_codigo , edps.est_dps as IDPERSONA,  m.mat_estado 
from estudiantes_dps edps 
INNER JOIN estudiante e ON (edps.est_codigo=e.est_codigo)
INNER JOIN r_personax4 pe ON (e.per_codigo=pe.per_codigo)
INNER JOIN matricula m ON (m.est_codigo=e.est_codigo)
INNER JOIN calendario ca ON (ca.cal_codigo=m.cal_codigo)
INNER JOIN programa p ON (e.pro_codigo=p.pro_codigo)
INNER JOIN uaa u ON (p.uaa_codigo=u.uaa_codigo)
INNER JOIN sede s ON (u.sed_codigo=s.sed_codigo)
INNER JOIN tipo_id t ON (pe.tii_codigo=t.tii_codigo)
INNER JOIN municipio mu ON (mu.mun_codigo=s.mun_codigo)
where edps.per_codigo=(SELECT per_codigo
						FROM periodo  WHERE per_nombre = '20212'  )
AND ca.per_codigo=edps.per_codigo
AND ( convert( int ,substring(e.est_codigo,0,5)) BETWEEN 2012 and year(getdate() ) )
order by  e.est_codigo  asc
END


select * from calendario c

select * from web_parametro wp where wp.wep_nombre  like '%%'

UPDATE acreditacion.institucion_acreditada 
SET ins_codigo=:instcodigo, ina_norma=:norma, ina_fecha_inicio=:inicio, ina_fecha_fin=:fin, 
ina_vigencia=:vigencia, ina_estado=:estado 
WHERE ina_codigo=:codigo

select * from acreditacion.institucion i 
select * from acreditacion.institucion_acreditada ia 

select * from matriculados_resumen mr  
select * from matricula_curso mc 
select *, LEFT(e.est_codigo , 5) as periodo from estudiante e 



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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up 
	where pro_codigo = 8

select * from uaa u
inner join programa pr on u.uaa_codigo = pr.uaa_codigo 
inner join acreditacion.comite_autoevaluacion ca on u.uaa_codigo = ca.uaa_codigo 
inner join acreditacion.integrante_comite_autoevaluacion ica on ca.coa_codigo = ica.coa_codigo 
inner join persona p on ica.per_codigo = p.per_codigo 
where pr.pro_codigo = 10


SELECT * from acreditacion.comite_autoevaluacion ca
inner join programa p on ca.uaa_codigo = p.uaa_codigo 
order by coa_fecha_creacion


select * from encuestas.cuestionarios c

select * from persona

select * from uaa where uaa_codigo = 627


select * from acreditacion.institucion i 

UPDATE academia3000_john.acreditacion.institucion SET ins_nit=N'891.180.084-2', ins_ies=1114, ins_ies_padre=1114, ins_sector=1, ins_nombre=N'UNIVERSIDAD SURCOLOMBIANA', ins_caracter_academico=4, mun_codigo=905, ins_direccion=N'Avenida Pastrana Borrero Carrera 1 ', ins_telefonos=N'8754753', ins_web=N'www.usco.edu.co', ins_norma=N'ACUERDO', ins_fecha_creacion='1976-01-30', ins_existencia=45, ins_ruta=N'140539', ins_estado=1 WHERE ins_codigo=2;


select * from acreditacion.institucion_acreditada ia 

-- ACREDITABLES Y COMITE DE AUTOEVALUACION
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


SELECT * , CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
inner JOIN resolucion re on re.res_codigo = p.res_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
inner join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17
--left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo
--CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite

-- 33 PROGRAMAS ACREDITABLES
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombre  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as correo, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17



select * from acreditacion.norma_acreditable na where na.gru_codigo = 17

inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 

select distinct u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
ORDER by u.uaa_nombre ASC 


select * from usuario_docente where state = 1
select * from usuario_grupo

select * from grupo


-- JEFES DE PROGRAMA POR GRUPO
select distinct  u.uaa_nombre_corto, u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and up.uap_fecha_fin is null
ORDER by u.uaa_nombre ASC 


select * from grupo
select * from cargo

-- JEFES DE PROGRAMA POR CARGO
select u.uaa_codigo, p.per_apellido, p.per_nombre, u.uaa_nombre_corto, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where c.car_codigo in (76, 77) and up.uap_fecha_fin is null and up.vin_codigo = 46

select * from usuario_grupo ug 
select * from uaa_personal where vin_codigo = 46 and uap_cargo in (76,77) and uap_fecha_fin is null

select * from uaa where uaa_nombre like '%ADMINISTRACION%' 


-- PROGRAMAS CON REGISTRO DE FECHA Y CAMPOS DETALLADOS
select * from programa p where p.uaa_codigo_unificado is not null and cam_det_codigo is not null


-- PROGRAMAS CON CONDICIONES PARA SER ACREDITABLES
select p.pro_codigo, u.uaa_codigo, u.uaa_nombre_corto from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join acreditacion.norma_acreditable na on p.pro_codigo = na.pro_codigo  
where p.pro_creacion_snies is not null and na.gru_codigo = 17
order by u.uaa_nombre



-- 33 PROGRAMAS ACREDITABLES EM TOTAL
select * from acreditacion.norma_acreditable na where na.gru_codigo = 17



-- PROGRAMAS JASPER EXCEL
select pro_registro_snies, p.pro_registro_icfes , CASE
    WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as
    pro_fecha_creacion, cd.codigo_cine as cam_det_codigo ,ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre,
    ce.cam_esp_nombre as cam_esp_nombre,ca.cam_nombre,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS academico,
    floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia,
    p.pro_creacion_snies
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	INNER JOIN resolucion re on re.res_codigo = p.res_codigo
	INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
	left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	where pro_codigo in (SELECT p.pro_codigo  FROM programa p
				INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo
				INNER JOIN sede s on s.sed_codigo = p.sed_codigo
				INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
				INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
				INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
				WHERE  ua.uaa_estado = 1) order by estado
				
				
select * from jornada j
select * from programa


Select p.pro_registro_snies, p.pro_registro_icfes, 
CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, 
CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = u.sed_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN resolucion re on re.res_codigo = p.res_codigo 
INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select * from encuestas.cuestionarios c 

EXEC vinculacion_actual '12113154'


SELECT * FROM programa p where pro_codigo = 375
select * from uaa where uaa_codigo = 480




select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
JOIN sede s on s.sed_codigo = u.sed_codigo 
JOIN modalidad m on m.mod_codigo = p.mod_codigo 
JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
JOIN resolucion re on re.res_codigo = p.res_codigo 
JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1


select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from dbo.uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from dbo.programa p 
JOIN dbo.uaa u on u.uaa_codigo = p.uaa_codigo 
JOIN dbo.sede s on s.sed_codigo = u.sed_codigo 
JOIN dbo.modalidad m on m.mod_codigo = p.mod_codigo 
JOIN dbo.nivel_academico na on na.nia_codigo = p.nia_codigo 
JOIN dbo.resolucion re on re.res_codigo = p.res_codigo 
JOIN dbo.jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select count(*) from acreditacion.programas_registrados_snies prs 
select * from acreditacion.programas_registrados_snies prs

select * from 

--select * from web_parametro wp where wp.wep_nombre = 'MATRICULA_PERIODO_ACTUAL'


select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_ACTIVO'
select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_MIGRACION'


SELECT * FROM acreditacion.programas_registrados_snies




select * from programa

select * from curso_virtual cv

INSERT INTO programas (pro_indicador, pro_codio_unificado, pro_registro_snies_codigo, pro_registro_icfes, pro_estado, pro_oferta, 
pro_sede, pro_formacion, pro_nivel_academico, pro_modalidad, pro_facultad, pro_nombre, pro_creacion_snies, pro_resolucion, 
pro_fecha_creacion, pro_jefe, pro_email_jefe) VALUES (,,,,,,,,,,,,,,,,);


UPDATE acreditacion.programas SET pro_codigo = ?, pro_codigo_unificado = ?, pro_registro_snies = ?, pro_registro_icfes = ?, 
pro_estado = ?, pro_oferta = ?, sed_nombre = ?, pro_formacion = ?, nia_nombre = ?, mod_nombre = ?, pro_facultad = ?, uaa_nombre = ?, 
pro_creacion_snies = ?, pro_resolucion = ?, pro_fecha_creacion = ?, pro_jefe = ?, pro_email_jefe = ? where pro_codigo = ?;

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 8
select * from usuario_tipo ut 

select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JUAN CARLOS%' and p.per_apellido like '%ALBARRACIN%'
--Guissela Alexandra L�pez Rodr�guez

select * from usuario_general_login ugl 


SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre,
 p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno
 FROM usuario_general_login u
 INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo
 INNER JOIN persona p ON u.up = p.per_codigo
 WHERE u.us like 7731066 order by u.uid DESC
 
 SELECT TOP 1 us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = 'a1075303330'
 
 SELECT us AS username, 'ROLE_ENCUESTA' as role FROM usuario_general_login WHERE state = 1 AND us = 'u20171157616'
 
 
 
SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, ss.sus_nombre FROM programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
inner join sub_sede ss on s.sed_codigo = ss.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 375

select * from sub_sede ss 

select * from uaa u where u.uat_codigo = 3

select * from uaa_tipo ut 

select * from acreditacion.integrante_comite_autoevaluacion ica 

select * from persona p where p.per_codigo = 71599

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 375

select distinct City, Country from Employees

select DISTINCT ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre from acreditacion.campo_detallado cd 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where ca.cam_estado = 1


select *, ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca 
inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo 
inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo 
where ca.cam_estado = 1

select * from sub_sede ss where ss.sus_estado = 1

select * from uaa u where u.uaa_codigo = 480 

select * from programa p 

select * from programa_titulo pt 

select * from plan_academico pa 

select DISTINCT p.pro_titulo_otorgado, (SELECT TOP 1 pla_total_creditos from plan_academico pa 
where pa.pro_codigo=p.pro_codigo and pla_total_creditos > 0 and pla_total_creditos is not null ORDER BY pla_codigo DESC) as totalCreditos  from programa p
where totalCreditos > 0

inner join plan_academico pa on p.pro_codigo = pa.pla_codigo
where pa.pla_total_creditos > 0
order by p.pro_titulo_otorgado 


select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JARO LEON%' and p.per_apellido like 'CASTRO ZAMORA'
select * from persona p where p.per_nombre like '%DIEGO ANDRES%' and p.per_apellido like '%CARVAJAL%'

select * from vinculacion_historico vh where vh.per_codigo = 2488

select * from estudiante e where e.per_codigo = 140591

select * from encuestas.cuestionarios c 

exec vinculacion_actual '12125816',''

SELECT u2.uaa_nombre AS dependencia, u1.uaa_nombre,pro.pro_registro_snies,  
            (CASE WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'A' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'C' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'D' THEN 'Distancia' END) as pro_calendario, 
            j.jor_nombre, (SELECT SUM(cup_cupo) FROM cupo c WHERE c.ofa_codigo =ofa.ofa_codigo) as cupo, 
            (SELECT TOP 1 pla_total_creditos from plan_academico pa 
            where pa.pro_codigo=pro.pro_codigo ORDER BY pla_codigo DESC) as totalCreditos 
            FROM oferta_academica ofa WITH (NOLOCK)  
            INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
            INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
            INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
            INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
            INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo  
            INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
            INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
            INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo  
            INNER JOIN jornada j WITH (NOLOCK) on pro.jor_codigo = j.jor_codigo  
--            WHERE per.per_nombre in (:periodo) AND sed.sed_codigo =1 
--            AND nia.nia_codigo in (9,11) 
            ORDER BY nat_nombre,dependencia,u1.uaa_nombre 
            
select * from acreditacion.institucion i 

select * from acreditacion.grupos_acreditables ga 

select * from matriculados_resumen mr 

select * from hecaa.colegios c 
select * from institucion_educativa ie 
select * from institucion_categoria ic 

select * from web_parametro wp

--SELECT per.per_nombre, per.per_apellido, per.per_identificacion, est.est_codigo, 
        floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
        tii.tii_nombre, pla.pla_nombre, pla.pla_codigo, pla.pla_creditos, pla.pla_total_creditos, 
        pla.pla_total_horas, pro.pro_codigo, pro.pro_registro_snies,  u1.uaa_nombre,  
        sed.sed_nombre, nia.nia_codigo, nia.nia_nombre, nat.nat_codigo,  nat.nat_nombre, cra.creditos_aprobados,  
        pcea.puntaje_calificado AS puntaje_calificado_estudiante,   
        pcaea.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_estudiante, 
        pcgcp.puntaje_calificado AS puntaje_calificado_graduado, 
        pcagcp.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_graduado, 
        (CASE WHEN pcea.puntaje_calificado IS NOT NULL THEN pcea.puntaje_calificado ELSE pcgcp.puntaje_calificado END ) AS promedio_ponderado, 
        (CASE WHEN pcaea.puntaje_calificado_aritmetico IS NOT NULL THEN pcaea.puntaje_calificado_aritmetico ELSE pcagcp.puntaje_calificado_aritmetico END ) AS promedio_aritmetico 
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
        LEFT JOIN puntaje_calificado_aritmetico_graduado_con_perdidas pcagcp ON est.est_codigo = pcagcp.est_codigo 
        WHERE est.est_codigo = 20171155993;

select * from usuario_administrativo ua 

select c.car_nombre, p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, p.per_email_interno, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where up.uap_fecha_fin is not null
ORDER BY up.uap_codigo DESC 

57003
1075226439

select * FROM encuestas.respuestas_cuestionarios rc where rc.per_codigo = 57003}


select * from resolucion r;



        
        
        
-- ACREDITACION INFORME DE PROGRAMAS 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_programa (
	asp_codigo int IDENTITY(1,1) NOT NULL,
	asp_item char (1) NULL,
	asp_aspecto varchar(1000) NOT NULL,
	asp_aprobado int NULL,
	asp_archivo varchar(250) NULL,
	asp_ruta varchar(250) NULL,
	asp_observacion varchar(1000) NULL,
	asp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_programa_PK PRIMARY KEY (asp_codigo)
);

select * from acreditacion.aspecto_programa ap 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_institucion (
	asi_codigo int IDENTITY(1,1) NOT NULL,
	asi_item char (1) NULL,
	asi_aspecto varchar(1000) NOT NULL,
	asi_aprobado int NULL,
	asi_archivo varchar(250) NULL,
	asi_ruta varchar(250) NULL,
	asi_observacion varchar(1000) NULL,
	asi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_institucion_PK PRIMARY KEY (asi_codigo)
);

select * from acreditacion.aspecto_institucion ai 

-- TABLA VARIABLES FORMULARIO
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);

-- TABLA INFORME PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_programa (
	inp_codigo int IDENTITY(1,1) NOT NULL,
	inp_fecha  date NOT NULL,
	pro_codigo int NOT NULL,
	inp_estado int DEFAULT 1 NOT NULL,
	gru_codigo int NOT NULL,
	CONSTRAINT informe_programa_PK PRIMARY KEY (inp_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_programa_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo)
);



-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);

select * from acreditacion.criterios_condiciones_iniciales cci 


-- TABLA INFORME CHEQUEO PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_programa (
	icp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	icp_item char (1) NULL,
	icp_aspecto varchar(1000) NOT NULL,
	icp_aprobado int NULL,
	icp_archivo varchar(250) NULL,
	icp_ruta varchar(250) NULL,
	icp_observacion varchar(1000) NULL,
	icp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_programa_PK PRIMARY KEY (icp_codigo),
	CONSTRAINT informe_chequeo_programa_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

-- TABLA INFORME CHEQUEO INSTITUCION
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_institucion (
	ici_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	ici_item char (1) NULL,
	ici_aspecto varchar(1000) NOT NULL,
	ici_aprobado int NULL,
	ici_archivo varchar(250) NULL,
	ici_ruta varchar(250) NULL,
	ici_observacion varchar(1000) NULL,
	ici_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_institucion_PK PRIMARY KEY (ici_codigo),
	CONSTRAINT informe_chequeo_institucion_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

select * from acreditacion.informe_chequeo_programa icp

select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.aspecto_institucion ai  

select * from acreditacion.informe_chequeo_programa where inp_codigo = 1 ORDER by icp_item

select * from acreditacion.informe_programa ip 

-- TABLA ESTADO NOTIFICACION
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);


-- TABLA INVITACION PROGRAMA ACREDITABLE
--CREATE TABLE academia3000_john.acreditacion.invitacion_programa_acreditable (
	ipa_codigo int IDENTITY(1,1) NOT NULL,
	gru_codigo int NOT NULL,
	pro_codigo int NOT NULL,
	ipa_fecha_envio date NOT NULL,
	ipa_fecha_respuesta date NULL,
	ipa_hash varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ipa_estado int NULL,
	CONSTRAINT invitacion_programa_acreditable_PK PRIMARY KEY (ipa_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK FOREIGN KEY (ipa_estado) REFERENCES academia3000_john.acreditacion.estado_invitacion(esi_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_2 FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo)
);


-- TABLA INFORME GENERAL PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_general_programa (
	igp_codigo int IDENTITY(1,1) NOT NULL,
	pro_codigo int NOT NULL,
	inp_codigo int NOT NULL,
	igp_facultad varchar(500) NULL,
	igp_departamento varchar(250) NULL,
	igp_denominacion varchar(500) NULL,
	igp_snies varchar(250) NULL,
	igp_jefe varchar(500) NULL,
	igp_coordinador varchar(500) NULL,
	igp_modalidad varchar(250) NULL,
	igp_jornada varchar(250) NULL,
	igp_nivel_formacion varchar(500) NULL,
	igp_duracion int NULL,
	igp_titulo varchar(500) NULL,
	igp_creditos int NULL,
	igp_amplio varchar(500) NULL,
	igp_especifico varchar(500) NULL,
	igp_detallado varchar(500) NULL,
	igp_nbc varchar(500) NULL,
	igp_area_nbc varchar(500) NULL,
	igp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_general_programa_PK PRIMARY KEY (igp_codigo),
	CONSTRAINT informe_general_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_general_programa_FK_1 FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo)
);

select * from acreditacion.informe_general_programa



select * from acreditacion.invitacion_programa_acreditable

select * from persona p where p.per_apellido likE '%GUERRERO FIERRO%'

select * from estudiante e where e.per_codigo = 26725

select * from programa p where p.pro_codigo = 12

select * from graduado g where g.est_codigo = '1993101130'


-- TABLA ESTADO INVITACION
--CREATE TABLE academia3000_john.acreditacion.estado_invitacion (
	esi_codigo int IDENTITY(1,1) NOT NULL,
	esi_nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT estado_invitacion_PK PRIMARY KEY (esi_codigo)
);

INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Enviado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Aceptado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Rechazado');

select * from acreditacion.estado_invitacion ei 



select * from acreditacion.aspecto_programa ap 
select * from acreditacion.aspecto_institucion ai 
select * from acreditacion.criterios_condiciones_iniciales cci 
update acreditacion.criterios_condiciones_iniciales cci values ()


select p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 


(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 


select * from plan_academico pa 

select * from EXCEL_NBC en
select * from snies_area sa 
select * from sede
select * from programa

select * from encuestas.cuestionarios c 
EXEC [vinculacion_actual] '1075226439',''

select * from estudiante e where e.per_codigo = 57003

select * from plan_academico pa where pro_codigo = 25

select * from acreditacion.aspecto_institucion ai  

SELECT 0 as uap_codigo, 0 as vin_codigo, e.est_codigo, u.uaa_codigo, u.uaa_nombre_corto, u.uaa_dependencia 
FROM estudiante e 
INNER JOIN programa p ON e.pro_codigo = p.pro_codigo 
INNER JOIN uaa u ON p.uaa_codigo = u.uaa_codigo 
WHERE e.est_codigo = '20171155993' AND e.ese_codigo = 1 

SELECT count(m.mat_codigo) FROM matricula m
 INNER JOIN calendario c ON m.cal_codigo = c.cal_codigo
 INNER JOIn periodo p ON c.per_codigo = p.per_codigo
 WHERE m.mat_estado = 'A' AND m.est_codigo = '20171155993'
 
 
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia,null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
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
inner join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 14


select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, p.per_email_interno, u.uaa_nombre, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select * from contrato.centro_trabajo ct 

select * from uaa_personal up where up.per_codigo = 108797
select * from persona p where p.per_identificacion = '1075303330'

select * from uaa u where u.uaa_nombre like '%OFICINA%'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797

select * from encuestas.respuestas r where r.rcu_codigo = 22486

select * from encuestas.cuestionarios c 
exec vinculacion_actual '1075303330'

select u.uaa_nombre, u.uaa_email, u.uaa_email_pqr, u.uaa_pagina, u.uaa_telefono, u.uaa_direccion, u.uaa_fax from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.cam_det_codigo is not null


select * from acreditacion.invitacion_programa_acreditable where ipa_invitacion_hash = ''

select * from acreditacion.estado_invitacion ei 

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa


-- PERSONA POR PROGRAMA
select * from persona p

--DOCENTE POR PROGRAMA

--ADMINISTRATIVO POR PROGRAMA

-- ESTUDIANTE POR PROGRAMA
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
where pr.pro_codigo = 375 and  est_registro_egresado = 0

.est_codigo = :codigoEst

select * from persona p where p.per_identificacion = '1075303330'

select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
where pr.pro_codigo = 375  and e.est_registro_egresado = 0


select * from persona p where p.per_nombre like '%ARLYN'

select * from uaa_personal up 
inner join uaa u on up.uaa_codigo = u.uaa_codigo
where up.per_codigo = 95604

SELECT * FROM acreditacion.integrante_comite_autoevaluacion ica 

select * from estudiante e where e.per_codigo = 153265

select * from persona p where p.per_codigo = 153265

select * from web_parametro wp where wp.wep_nombre like '%ARCHIVO%'


SELECT top 1 per.per_a�o AS ano, per.per_nombre AS periodo, sed_nombre, nat_nombre, nia_nombre,
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia, pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo=pro.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as totalSemestres 
FROM oferta_academica ofa WITH (NOLOCK)
INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo
INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo
where pro.pro_codigo = 401
order by per.per_codigo desc


select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as semestres
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where p.pro_codigo = 401






select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select * from programa

select * from nivel_academico na 






--ACREDITABLES NUEVO PARAMETRO MATRICULADOS
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo IN (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select na.pro_codigo from acreditacion.norma_acreditable na where na.gru_codigo = 15

select * from programa where pro_codigo = 3


-- QUERY ACREDITABLES CON MATRICULADOS


select p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, p.pro_creacion_snies, p2.per_fecha_inicio, DATEADD(year, 8, p.pro_creacion_snies) AS pro_vigencia_cna, p2.per_fecha_fin, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join acreditacion.norma_acreditable na on e.pro_codigo = na.pro_codigo
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where convert(Date, p2.per_fecha_inicio) BETWEEN DATEADD(year, -1, p.pro_creacion_snies) AND DATEADD(year, 8, p.pro_creacion_snies) and convert(Date, p2.per_fecha_fin)  BETWEEN p.pro_creacion_snies AND DATEADD(year, 9, p.pro_creacion_snies) and na.gru_codigo = 15
group by p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, pro_creacion_snies, p2.per_fecha_inicio, p2.per_fecha_fin




select * from matricula


select count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 3

select * from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 3


select * from programa
--PARAMETRIZAR POR LAS FECHAS DE PERIODO EL INTERVALO, LUEGO AGRUPAR POR PERIODOS Y CANTIDAD DE MATRICULADOS

--m.mat_fecha BETWEEN p.pro_creacion_snies AND DATEADD(year, 8, p.pro_creacion_snies)

select p.pro_codigo, u.uaa_nombre, p.pro_creacion_snies, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_creacion_snies is not null 
group by p.pro_codigo, u.uaa_nombre, pro_creacion_snies


select p.pro_codigo, p.pro_creacion_snies from programa p where p.pro_creacion_snies is not null

select * from matricula m 
select * from calendario c 
select * from periodo p 






select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALAUACI�N') as coordinador
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  
where p.pro_codigo = 375


select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_general_programa igp 

select * from acreditacion.informe_programa ip 

select * from acreditacion.informe_general_programa igp 

--PROCESO ALMACENADOTASA DE DESERCI�N
EXEC dbo.acreditacion_tasa_desercion '20222', 1 

select DISTINCT oaa.facultad_codigo, oaa.facultad from acreditacion.oferta_academica_acreditacion oaa 

select * from acreditacion.oferta_academica_acreditacion oaa where oaa.facultad_codigo in (19, 20, 21, 22, 23, 24, 258)




-- Programa con Jefe de Programa
SELECT p.pro_codigo, u.uaa_nombre_corto, p.pro_creacion_snies, pr.per_nombre, pr.per_apellido, aug.aud_changed  FROM programa p  
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner join aud_usuario_grupo aug on ug.usg_codigo = aug.usg_codigo
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
GROUP by u.uaa_nombre_corto 


select * from usuario_grupo

select * from aud_usuario_grupo


select * from uaa_personal

select count(*) from usuario_grupo ug  
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
where ud.usg_grupo = 34 and ug.usg_estado = 1 


select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, up.uap_fecha_inicio, up.uap_fecha_fin from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
left join uaa_personal up  on pe.per_codigo = up.per_codigo
where ug.usg_grupo = 34 and p.pro_codigo = 418 and up.uap_cargo = 76
order by ug.usg_usuario desc

select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo  
where ug.usg_grupo = 34 and p.pro_codigo = 418 
order by ug.usg_usuario desc


select pe.per_nombre, pe.per_apellido, pe.per_email_interno , ug.up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
where p.pro_codigo = 418 and ug.usg_grupo = 34 
order by ug.usg_usuario desc


select * from vinculacion v 

select * from usuario_docentes ud  

select * from uaa_personal

select * from aud_usuario_grupo aug where usg_grupo = 34 and usg_uaa = 601 

select * from usuario_docente where usg_grupo = 34 and usg_uaa = 676

select * from usuario_grupo where usg_grupo = 34 and usg_uaa = 676


select * from grupo



uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 


select * from uaa_personal where per_codigo = 5529--100472 --23742--100472 -- 5529


select * from cargo

select * from uaa

select * from usuario_grupo

select count(*) from usuario_docente where usg_grupo = 34 

usg_grupo = 34





-- p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select count(*) from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select * from 


select * 


select * from contrato

select * from 

select * from usuario_docente 










select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_creacion_snies,
CASE WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado ,
CASE WHEN pro_estado = 01 THEN 'SI' ELSE 'NO' END AS oferta,
p.pro_creacion_snies, p.pro_fecha_creacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,
p.pro_registro_snies, p.pro_registro_icfes, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, c.con_descripcion, pe.pre_nombre, r.res_numero, tn.tin_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ca.cam_codigo, ce.cam_esp_nombre, ce.cam_esp_codigo, cd.cam_det_nombre, cd.cam_det_codigo, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+ pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa 
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) 
ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo 
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 165


select * from convenio

SELECT *,nat.nat_nombre as formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, u.uaa_nombre as facultad FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo 
LEFT join persona per on per.per_codigo = ud.up 
WHERE p.pro_codigo = 433




SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
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
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 15




select p.pro_codigo, p.pro_registro_icfes, p.pro_registro_snies, u.uaa_nombre, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo
where p.pro_creacion_snies is not null and floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) >= 8



select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  
where pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8

select * from nivel_academico na2 
select * from acreditacion.grupos_acreditables gru
select * from acreditacion.norma_acreditable na

select count(*) from acreditacion.norma_acreditable na
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where gru_codigo = 18

select * from acreditacion.norma_nivel_academico nna where nna.noa_codigo = 1

select * from acreditacion.norma_criterio nc

SELECT * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo
where nc.noc_estado = 1 and nc.nna_codigo = 15





Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, 
pro_registro_snies, pro_calendario, pro_horario, pro_fecha_creacion, pro_extension_snies, 
pro_propio, pro_creacion_snies, p.uaa_codigo, ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, 
ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as tiempo, 
nat.nat_nombre, nia_nombre, nia_estado, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 and floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) >= 8

select * from notas_total

SELECT * FROM acreditacion.norma_nivel_academico

select * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo 
inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo 
where nc.noc_estado = 1 and nc.nna_codigo = 13 and nna.nna_estado != 0



select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.invitacion_programa_acreditable where ipa_hash = '466cfb0b4fec46c69d6cd2196e305c54'



SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombre_jefe_programa,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as apellido_jefe_programa,
(select top 1 pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as per_email_interno, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
Inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 18


SELECT * FROM acreditacion.grupos_acreditables ga 

SELECT * FROM acreditacion. 

select * from proyectos.investigadorexternoxgrupo i  

select count(*) from acreditacion.norma_acreditable na where gru_codigo = 18


INSERT INTO academia3000_john.acreditacion.invitacion_programa_acreditable (gru_codigo, pro_codigo, ipa_fecha_envio, ipa_fecha_respuesta, ipa_hash, ipa_estado) VALUES(17, 383, '2022-10-12', NULL, N'499523da3d514f82837f003dccdc081c', 1);

select pe.per_nombre, pe.per_apellido, pe.per_codigo, p.pro_codigo, pe.per_email_interno, ug.up, u.uaa_nombre, ug.gru_nombre, 
CASE WHEN ug.usg_estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END AS usg_estado from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
where p.pro_codigo = 8 and ug.usg_grupo = 34 order by ug.usg_estado desc 


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.matriculados_acreditacion ma 


-- VISTA MATRICULADOS PARA ACREDITACION
CREATE VIEW [acreditacion].[matriculados_acreditacion] AS
SELECT mat.mat_codigo, mat.mat_observacion, mat.mat_cliente, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico,
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
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A'

select count(*) from acreditacion.matriculados_acreditacion ma where ma.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio >= 2022

select count(*) from acreditacion.inscritos_acreditacion ia where ia.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio 

select * from uaa_personal up where up.per_codigo = 108797


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_chequeo_institucion ici

select * from acreditacion.informe_general_programa igp 

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
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 383



select * from acreditacion.aprobacion_informe_programa aip 


select * from acreditacion.aprobacion_informe_programa where pro_codigo = 383 and igp_codigo = 1


select * from acreditacion.informe_chequeo_institucion ici 


DECLARE @T TABLE (
     col1 float,
     col2 int
 );
    
 INSERT INTO @T VALUES
 (1.5,8),
 (1.5,1),
 (2.0,1),
 (3.0,1),
 (4.5,1),
 (4.5,2),
 (5.0,3),
 (6.0,4);   
 SELECT col1, col2 FROM @T order by col1 asc, col2 DESC
 
 SELECT * FROM persona p WHERE p.per_apellido like '%FAJARDO OROZCO%' 


select count(*) from carnetizacion.empleados e 
select * from carnetizacion.estudiantes e2

select * from vinculacion v 
select count(*) from uaa_personal up where up.uap_id_carnet is not null

--update dbo.usuario_graduados set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
select * from dbo.usuario_graduados
select * from usuario_academia_login ual 

SELECT * from dbo.usuario_general_login

select * from dbo.usuario_estudiante_login uel 

select * from dbo.usuario_carnet_digital ucd where ucd.up = 108797

select * from dbo.usuario_carnet_digital_login ucdl where ucdl.up = 1087979

select  top 1 * from dbo.usuario_carnet_digital_login ucdl  inner join uaa u on ucdl.usg_uaa = u.uaa_codigo inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on ucdl.up = p.per_codigo where  us = 'u20171157616' order by ucdl.usg_codigo desc


select COUNT(ucdl.us) from dbo.usuario_carnet_digital_login ucdl inner join uaa u on ucdl.usg_uaa = u.uaa_codigo inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on ucdl.up = p.per_codigo where us = 'a1075303330'

--CREATE VIEW [dbo].[usuario_alta_acreditacion_login]
AS
SELECT        p.per_codigo, ua.uid, ua.us, ua.sys, ua.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ua.state, ua.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_administrativos ua INNER JOIN
                         dbo.persona p ON ua.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ua.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ua.state = 1)
UNION
SELECT        p.per_codigo, ud.uid, ud.us, ud.sys, ud.ischange, p.per_nombre, p.per_apellido, ti.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, p.per_identificacion, p.per_email_interno, u.uaa_codigo, u.uaa_nombre, 
                         u.uaa_nombre_corto, s.sed_codigo, s.sed_nombre, ud.state, ud.uwd2, ug.usg_estado, g.gru_codigo, g.gru_id, g.gru_nombre
FROM            dbo.usuario_docentes ud INNER JOIN
                         dbo.persona p ON ud.up = p.per_codigo LEFT JOIN
                         dbo.tipo_id ti ON p.tii_codigo = ti.tii_codigo INNER JOIN
                         dbo.usuario_grupo ug ON ud.uid = ug.usg_usuario INNER JOIN
                         dbo.grupo g ON ug.usg_grupo = g.gru_codigo INNER JOIN
                         dbo.uaa u ON ug.usg_uaa = u.uaa_codigo INNER JOIN
                         dbo.sede s ON u.sed_codigo = s.sed_codigo
WHERE        (g.gru_id LIKE 'ALTA_ACREDITACION') AND (g.gru_estado = 1) AND (ug.usg_estado = 1) AND (ud.state = 1)

select * from programa where pro_codigo =

select * from academia3000_daniel.dbo.campo_amplio ca 

select * from uaa

select * from modulo m  where mod_codigo

select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	full JOIN  uaa u on u.uaa_codigo = p.uaa_codigo
	full JOIN sede s on s.sed_codigo = u.sed_codigo
	full JOIN modalidad m on m.mod_codigo = p.mod_codigo
	full JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	full JOIN resolucion re on re.res_codigo = p.res_codigo
	full JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	full JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	full JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	full JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo
	full JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	full join persona pe on pe.per_codigo= ud.up
	where pro_codigo = $P{pro_codigo}  and ug.usg_grupo = 34  and ug.usg_estado = 1
	
	
	
	
	
	
	
	SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
INNER JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
 left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 165


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join campo_amplio ca on ca.cam_codigo = ce.cam_codigo 

WHERE p.pro_codigo = 445 





select pro_registro_snies, pro_registro_icfes , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 0
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	
	
	DROP TABLE acreditacion.NewTable 
	
	CREATE TABLE academia3000_daniel.acreditacion.criterios (
	cri_codigo int IDENTITY(1,1) NOT NULL,
	cri_id varchar(100) NOT NULL,
	cri_titulo varchar(100) NOT NULL,
	cri_vigencia varchar(100) NULL,
	cri_descripcion varchar(100) NULL
	ALTER TABLE academia3000_daniel.acreditacion.criterios ADD CONSTRAINT criterios_PK PRIMARY KEY (cri_codigo);

);

select pro_registro_snies,pro_extension_snies from dbo.programa 
CREATE TABLE academia3000_daniel.acreditacion.variables (
	var_codigo int IDENTITY(1,1) NOT NULL,
	var_nombre varchar(100) NOT NULL,
	cri_codigo int NOT NULL,
	CONSTRAINT variables_PK PRIMARY KEY (var_codigo),
	CONSTRAINT variables_FK FOREIGN KEY (cri_codigo) REFERENCES academia3000_daniel.acreditacion.criterios(cri_codigo)
);
CREATE TABLE academia3000_daniel.acreditacion.items (
	ite_codigo int IDENTITY(1,1) NOT NULL,
	ite_nombre varchar(100) NOT NULL,
	var_codigo int NOT NULL,
	CONSTRAINT items_PK PRIMARY KEY (ite_codigo),
	CONSTRAINT items_FK FOREIGN KEY (var_codigo) REFERENCES academia3000_daniel.acreditacion.variables(var_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_acreditacion (
	noa_codigo int IDENTITY(1,1) NOT NULL,
	noa_nombre varchar(200) NOT NULL,
	noa_fecha_inicio date NOT NULL,
	noa_fecha_fin date NULL,
	CONSTRAINT norma_acreditacion_PK PRIMARY KEY (noa_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_nivel_academico (
	nna_codigo int IDENTITY(1,1) NOT NULL,
	nna_nombre varchar(200) NOT NULL,
	nia_codigo int NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT norma_nivel_academico_PK PRIMARY KEY (nna_codigo),
	CONSTRAINT norma_nivel_academico_FK FOREIGN KEY (nia_codigo) REFERENCES academia3000_daniel.dbo.nivel_academico(nia_codigo),
	CONSTRAINT norma_nivel_norma_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);

CREATE TABLE academia3000_daniel.acreditacion.norma_criterio (
	noc_codigo int IDENTITY(1,1) NOT NULL,
	noc_nombre varchar(200) NOT NULL,
	nna_codigo int NOT NULL,
	tiempo int NOT NULL,
	CONSTRAINT norma_criterio_PK PRIMARY KEY (noc_codigo),
	CONSTRAINT norma_criterio_FK FOREIGN KEY (nna_codigo) REFERENCES academia3000_daniel.acreditacion.norma_nivel_academico(nna_codigo),
	
);
CREATE TABLE academia3000_daniel.acreditacion.norma_acreditable (
	nac_codigo int  IDENTITY(1,1) NOT NULL,
	nac_nombre varchar(200) NOT NULL,
	noa_codigo int NOT NULL,
	pro_codigo int not null,
	creacion  date DEFAULT getDate() NOT NULL,
	CONSTRAINT norma_acreditable_PK PRIMARY KEY (nac_codigo),
	CONSTRAINT norma_acreditable_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo),
	CONSTRAINT norma_acreditable_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_daniel.dbo.programa(pro_codigo),
	
);

CREATE TABLE academia3000_daniel.acreditacion.grupos_acreditables (
	gru_codigo int IDENTITY(1,1) NOT NULL,
	gru_nombre varchar(100) NOT NULL,
	noa_codigo int NOT NULL,
	CONSTRAINT grupos_acreditables_PK PRIMARY KEY (gru_codigo),
	CONSTRAINT grupos_acreditables_FK FOREIGN KEY (noa_codigo) REFERENCES academia3000_daniel.acreditacion.norma_acreditacion(noa_codigo)
);


ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_estado int NOT NULL;

ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD  DEFAULT 1 FOR noa_estado;
ALTER TABLE academia3000_daniel.acreditacion.norma_nivel_academico ADD nna_estado int DEFAULT 1 NOT NULL;
ALTER TABLE academia3000_daniel.acreditacion.norma_acreditacion ADD noa_ruta varchar(200) NULL;

select dbo.getTokenDocumento("5453254684") as token
select * from acreditacion.norma_acreditacion
select * from sgd.documento where per_codigo=54684

INSERT INTO academia3000_daniel.acreditacion.norma_acreditacion (noa_nombre, noa_fecha_inicio, noa_fecha_fin, noa_estado, noa_ruta) VALUES('', '', '', 1, '');

ALTER TABLE academia3000_daniel.dbo.programa ADD pro_creacion_snies date NULL;

SELECT * from acreditacion.norma_criterio nc join acreditacion.norma_nivel_academico nna on nc.nna_codigo =nna.nna_codigo join acreditacion.norma_acreditacion na  on na.noa_codigo =nna.noa_codigo where nc.nac_estado=1

select mod_codigo from programa p 

SELECT * from acreditacion.norma_acreditable na join  acreditacion.norma_acreditacion na2 on na.noa_codigo =na2.noa_codigo join programa p2 on na.pro_codigo =p2.pro_codigo join nivel_academico na3 on p2.nia_codigo =na3.nia_codigo join modalidad m2 on p2.mod_codigo =m2.mod_codigo

select  from programa p 



select * from ( Select  pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,uaa_estado,uaa_nombre,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado
,floor( (cast(convert(varchar(8),getdate(),112) as int)-
cast(convert(varchar(8),pro_creacion_snies,112) as int) ) / 10000)as tiempo from programa p
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
where pro_creacion_snies is not null  and ua.uaa_estado = 1

)temporal where tiempo>8 

select * from acreditacion.norma_nivel_academico nna where noa_codigo = ? and nna_estado =1

select *from uaa where uaa_nombre like'%facultad%'


SELECT * from acreditacion.norma_acreditable nac join  acreditacion.norma_acreditacion noa 
on nac.noa_codigo =noa.noa_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
 
 
 select * from acreditacion.grupos_acreditables ga join acreditacion.norma_acreditacion na on ga.noa_codigo = na.noa_codigo where noa_estado =1
 
 INSERT INTO acreditacion.grupos_acreditables (gru_nombre, noa_codigo) VALUES('', 0);

SELECT * from acreditacion.norma_acreditable nac join  acreditacion.grupos_acreditables gru 
on nac.gru_codigo = gru.gru_codigo join programa p on nac.pro_codigo =p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
 INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
 INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo where gru.gru_codigo =1


select *from programa_estado pe 

select * from acreditacion.norma_acreditable na where gru_codigo =3

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_amplio (
	aud_codigo_campo_amplio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_codigo int NOT NULL,
	cam_estado int NOT NULL,
	cam_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_amplio_PK PRIMARY KEY (aud_codigo_campo_amplio)
);

-- academia3000_daniel.acreditacion.aud_campo_amplio definition

-- Drop table

-- DROP TABLE academia3000_daniel.acreditacion.aud_campo_amplio;

CREATE TABLE academia3000_daniel.acreditacion.aud_campo_detallado (
	aud_codigo_campo_detallado bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_det_codigo int NOT NULL,
	cam_det_estado int NOT NULL,
	cam_esp_codigo int NOT NULL,
	cam_det_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_detallado_PK PRIMARY KEY (aud_codigo_campo_detallado)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditable (
	aud_codigo_norma_acreditable bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nac_codigo int not null,
	nac_nombre varchar(200) not null,
	pro_codigo int not null,
	nac_creacion date not null,
	nac_estado int not null,
	gru_codigo int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditable_PK PRIMARY KEY (aud_codigo_norma_acreditable)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditacion (
	aud_codigo_norma_acreditacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noa_codigo int not null,
	noa_nombre varchar(200) not null,
	noa_fecha_inicio date not null,
	noa_fecha_fin date,
	noa_estado int not null,
	noa_ruta varchar(200),
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_acreditacion_PK PRIMARY KEY (aud_codigo_norma_acreditacion)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_criterio (
	aud_codigo_norma_criterio bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	noc_codigo int not null,
	noc_nombre varchar(200) not null,
	nna_codigo int not null,
	noc_tiempo int not null,
	noc_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_criterio_PK PRIMARY KEY (aud_codigo_norma_criterio)
);

CREATE TABLE academia3000_daniel.acreditacion.aud_norma_nivel_academico (
	aud_codigo_norma_nivel_academico bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	nna_codigo int not null,
	nna_nombre varchar(200),
	nia_codigo int not null,
	noa_codigo int not null,
	nna_estado int not null,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_norma_nivel_academico_PK PRIMARY KEY (aud_codigo_norma_nivel_academico)
);
SELECT * from encuestas.cuestionarios c 

SELECT * from encuestas.preguntas p join encuestas.tipo_respuestas tr on p.tre_codigo =tr.tre_codigo
 join encuestas.cuestionarios c on p.cue_codigo=c.cue_codigo left join encuestas.grupo_escala g on p.gre_codigo= g.gre_codigo
  where c.cue_codigo=:codigo AND (p.pre_tipo=0 OR p.pre_tipo=2) AND p.pre_estado=1 AND (p.tre_codigo=1 OR p.tre_codigo=4)

CREATE TABLE academia3000_daniel.acreditacion.aud_grupos_acreditables (
	aud_codigo_grupos_acreditables bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	gru_codigo int not null,
	gru_nombre varchar(200),
	noa_codigo int not null,
	gru_creacion date,
	
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_grupos_acreditables_PK PRIMARY KEY (aud_codigo_grupos_acreditables)
);




aud_log_type, 
cam_det_codigo,
cam_det_estado,
cam_esp_codigo,
cam_det_nombre,
codigo_cine, 


select (select value from split(pro_estado ,'0') where value !='') as estado,pro_titulo_otorgado as titulo ,pro_codigo as codigo  from programa 

select * from split

update academia3000_daniel.dbo.programa 
set pro_estado = (
select * from split(pro_estado ,'0') where value !=''
)
from programa

select pro_estado from programa p 

where pro_codigo = pro_codigo 


SELECT * FROM SplitProEstado('05')

DECLARE @a char='05'
SELECT @a, cast(@a as int)


select * from acreditacion.norma_acreditacion na 
select  * FROM programa p 

select * from acreditacion.norma_criterio nc 


SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN resolucion r on r.res_codigo = p.res_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN jornada j on j.jor_codigo = p.jor_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN convenio c on c.con_codigo = p.con_codigo 
FULL JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
WHERE p.uaa_codigo = 29


select * from uaa_personal where uap_cargo=76 and vin_codigo =46 and uap_fecha_fin is null

select per_apellido, per_nombre from uaa_personal, persona where uap_cargo  = 76 and vin_codigo = 46 and uap_fecha_fin is null

select * from persona where per_codigo =  136709

select * from uaa_personal

select * from estudiante where est_registro_egresado = 0

select * from egresado 

select * from cargo

select * from programa where pro_estado=1

-- QUERY ESTUDIANTES POR PROGRAMAS
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where pro.pro_codigo = 418 and pro.pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = '20171157616' and pro.pro_codigo = 418 and pro_estado = 1 and e.est_registro_egresado = 0

--Estudainte por c�digo y programa con variables
select per_apellido, per_nombre as nombre, uaa_nombre_corto, pro.uaa_codigo as pro_uaa_codigo, e.est_codigo, pro.pro_codigo
from estudiante e
left join persona p on p.per_codigo = e.per_codigo
left join programa pro on pro.pro_codigo = e.pro_codigo
left join uaa on uaa.uaa_codigo = pro.uaa_codigo
where est_codigo = $P{est_codigo} and pro.pro_codigo = $P{pro_codigo} and pro_estado = 1 and e.est_registro_egresado = 0


-- Programa con Jefe de Programa
SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
left JOIN sede s on s.sed_codigo = p.sed_codigo 
left JOIN jornada j on j.jor_codigo = p.jor_codigo 
left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left JOIN convenio c on c.con_codigo = p.con_codigo 
left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo 
left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo 
left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo 
left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
WHERE p.pro_codigo = 456

-- QUERY JASPER ORIGINAL, DOCENTE CON FILTRO DISTINCT
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
    ELSE 'PREGRADO' END AS formacion
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
	where pro_codigo =$P{pro_codigo}

-- MODIFICACI�N QUERY JASPER DANIEL
select pro_registro_snies, pro_registro_icfes,p.uaa_codigo_unificado , CASE
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
    ELSE 'PREGRADO' END AS formacion
	from programa p join (select pr.uaa_codigo_unificado,pr.pro_codigo from programa pr group by uaa_codigo_unificado,pro_codigo)  pr
	on p.pro_codigo =pr.pro_codigo
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}
	GROUP by p.uaa_codigo_unificado

select * from academia3000_john.encuestas.cuestionario_configuracion cc 
	
-- VISTA DOCENTES Y DOCENTE
SELECT * from usuario_docente order by usg_usuario 	
    SELECT dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado,p.uaa_codigo_unificado
    FROM dbo.grupo INNER JOIN
            dbo.usuario_grupo ON dbo.grupo.gru_codigo = dbo.usuario_grupo.usg_grupo INNER JOIN
            dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
            join programa p on p.uaa_codigo =dbo.usuario_grupo.usg_uaa GROUP  by p.uaa_codigo_unificado, dbo.usuario_docentes.up, dbo.usuario_docentes.us, dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state, 
            dbo.usuario_docentes.sys, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_usuario, dbo.usuario_docentes.uid, dbo.grupo.gru_id, 
            dbo.usuario_grupo.usg_estado, dbo.usuario_grupo.usg_uaa, dbo.usuario_docentes.us_encriptado order by                       
WHERE (dbo.grupo.gru_id = 'JEFE_PROGRAMA')                
    select * from usuario_grupo ug 
    select * from uaa where uaa_codigo = 794
    SELECT * FRom programa where uaa_codigo_unificado  = 794
    
UPDATE acreditacion.campo_detallado SET cam_det_nombre=:nombre, cam_det_estado=:estado,cam_esp_codigo=:esp, codigo_cine=:cine WHERE cam_det_codigo=:codigo



SELECT * FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = ua.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
WHERE ua.sed_codigo = $P{pro_codigo} and ua.uaa_estado = 1 order by ua.uaa_nombre asc

SELECT * from sede s 


--CAMBIO DE CLAVE ADMINISTRATIVOS
--update dbo.usuario_administrativos set uwd2 =HASHBYTES('MD5',HASHBYTES('SHA1','12345'))
--update dbo.usuario_docentes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update dbo.usuario_estudiantes set uwd2=hashbytes('md5',hashbytes('sha1','12345'))
--update persona set per_email = 'guerrerocordobajohn@gmail.com', per_email_interno = 'john.guerrero@usco.edu.co'

select * from web_parametro wp where wp.wep_nombre like '%TOKEN%' --http://sergio.usco.edu.co/iniciosesion/


select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo WHERE ca.cam_estado = 1

select ro.rop_descripcion,p.pre_descripcion,p.pre_identificador,c.cue_nombre,tu.tus_nombre,per.per_nombre,u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, ro.rop_descripcion, p.pre_descripcion, p.pre_identificador, c.cue_nombre, tu.tus_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, per.per_apellido, per.per_nombre, 
e.est_codigo, s.sed_nombre, u.uaa_nombre from encuestas.respuestas r 
join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join dbo.persona per on rc.per_codigo =per.per_codigo 
join dbo.estudiante e on e.per_codigo =per.per_codigo 
join dbo.programa pro on e.pro_codigo =pro.pro_codigo 
join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo 
join dbo.sede s on u.sed_codigo = s.sed_codigo
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo 
join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.preguntas p on r.pre_codigo =p.pre_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo where (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from uaa


select * from usuario_general_login ugl WHERE ugl.us = '12113154'
EXECUTE vinculacion_actual '1080266346', 0
EXECUTE vinculacion_actual '1075232353', 0
EXECUTE academia3000_john.vinculacion_actual(:@per_identificacion, :@uaa_codigo) 
select * from programa

 select * from programa

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion,CASE WHEN res_texto != null THEN res_texto ELSE rop_descripcion END AS respuesta , c.cue_nombre from encuestas.respuestas r join encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
join encuestas.preguntas p on c.cue_codigo  = p.cue_codigo  
join encuestas.preguntas_respuestas pr on p.pre_codigo = pr.pre_codigo  
join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
join encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo 
join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigojoin dbo.persona per on rc.per_codigo = per.per_codigo join dbo.estudiante e on per.per_codigo = e.per_codigo 
join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo join dbo.programa pro on e.pro_codigo = pro.pro_codigo join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo join dbo.sede s on u.sed_codigo = s.sed_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

select * from encuestas.respuestas r 
select * from encuestas.preguntas_respuestas pr  

CASE WHEN r.res_texto != null THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,

select * from encuestas.respuestas_cuestionarios rc  
select * from encuestas.preguntas p  
select * from encuestas.respuestas r 


select * from uaa u WHERE u.uaa_nombre like '%VICE%'

select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, ro.rop_descripcion, r.res_texto, c.cue_nombre from encuestas.respuestas r LEFT JOIN encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo 
LEFT JOIN encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
LEFT JOIN encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo
LEFT JOIN encuestas.preguntas p on c.cue_codigo = p.cue_codigo  
LEFT JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
LEFT JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo join dbo.persona per on rc.per_codigo = per.per_codigo join dbo.estudiante e on e.per_codigo = per.per_codigo join dbo.programa pro on e.pro_codigo = pro.pro_codigo join dbo.uaa u on pro.uaa_codigo = u.uaa_codigo join dbo.sede s on u.sed_codigo = s.sed_codigo join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo  join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo 
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo =:programa ) and c.uaa_codigo =:uaa

select * from persona where per_apellido like '%ROJAS ROJAS%'

select * from encuestas.respuestas r -- res_codigo, rcu_codigo, prr_codigo, res_texto, pre_codigo
select * from encuestas.cuestionarios c -- cue_codigo
join uaa u on c.uaa_codigo = u.uaa_codigo 
select * from encuestas.cuestionario_configuracion cc 
select * from encuestas.preguntas p -- pre_codigo, cue_codigo, pre_tipo, tre_codigo
select * from encuestas.preguntas_respuestas pr -- prr_codigo, rop_codigo, pre_codigo, tre_codigo
select * from encuestas.respuestas_opciones ro -- rop_codigo
select * from encuestas.tipo_respuestas tr 
select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo in (1,2) --where rc.per_codigo = 108797

select * from usuario_docente_general udg 

-- CASE WHEN r.prr_codigo != null THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta
-- CASE WHEN p.pre_tipo != 2 THEN ro.rop_descripcion ELSE r.res_texto END AS respuesta


select tu.tus_nombre, e.est_codigo, per.per_apellido, per.per_nombre, 
ti.tii_nombre_corto, per.per_identificacion, per.per_fecha_expedicion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad,
s.sed_nombre, u.uaa_nombre,p.pre_identificador, p.pre_descripcion, CASE WHEN r.prr_codigo is null THEN r.res_texto ELSE ro.rop_descripcion END AS respuesta, c.cue_nombre from encuestas.respuestas rjoin encuestas.respuestas_cuestionarios rc on r.rcu_codigo = rc.rcu_codigo join dbo.persona per on rc.per_codigo =per.per_codigo join dbo.estudiante e on e.per_codigo =per.per_codigo join dbo.programa pro on e.pro_codigo =pro.pro_codigo join dbo.uaa u on pro.uaa_codigo =u.uaa_codigo join dbo.sede s on u.sed_codigo = s.sed_codigo join dbo.tipo_id ti on per.tii_codigo = ti.tii_codigo left join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo left join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo left join encuestas.preguntas p on r.pre_codigo =p.pre_codigo left join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo left join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo join dbo.usuario_tipo tu on cc.tus_codigo = tu.tus_codigo
where p.pre_estado = 1 and (tu.tus_codigo = 2 and pro.pro_codigo=:programa ) and c.uaa_codigo =:uaa

SELECT * from programa p
join uaa u on p.uaa_codigo_unificado = u.uaa_dependencia  

SELECT p.pro_codigo, u.uaa_nombre_corto, u.uaa_dependencia  from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
WHERE p.uaa_codigo_unificado is not null and p.pro_estado = 1 and u.uaa_nombre like '%MAESTRIA EN PSICOLOGIA%'
ORDER by p.sed_codigo

select * from nivel_academico na na.nia_codigo in (9,11)

select * from persona p where p.per_identificacion = '1075303330' -- JS: 87855  JG: 108797

select * from uaa u WHERE uaa_codigo  = 24

select * FROM usuario u where usu_persona = 87855
select * from usuario_administrativo ua where ua.up = 87855

select * from usuario_administrativo ua where ua.us = 'a1075232353'

SELECT * from 

select * FROM usuario_grupo ug where ug.usg_usuario = 155684
select * FROM usuario_grupo ug where ug.usg_usuario = 146624
select * FROM usuario_grupo ug where ug.usg_usuario = 54684
select * from grupo g 
--insert usuario_grupo (usg_usuario,usg_grupo,usg_uaa) values(146624,239,554)

select * FROM usuario_grupo ug where ug.usg_usuario = 87855

select * from grupo g WHERE g.gru_codigo = 4



select * from persona p where p.per_identificacion = '1075220954' 


select * from academia3000_john.dbo.usuario_grupo ug where usg_grupo = 239
select * from persona where per_codigo = 87855

	54684	283	532	1
	
select * from uaa
select * from usuario_grupo ug where ug.usg_grupo = 276

select * from usuario_grupo ug where ug.usg_usuario in (146624, 96663)

select * from grupo g where gru_nombre like '%acreditacion%'

select * from grupo g where gru_codigo  = 106

select * from usuario_general ug where up in (108797,87855)
select * from usuario_administrativos ug where up = 108797

UPDATE usuario_administrativos set sys = 'jhonhenrysolorzanolozano' where uid = 146624

INSERT INTO usuario_grupo (usg_usuario,usg_grupo,usg_uaa,usg_estado) VALUES (146624,283,554,1);

SELECT * from usuario_general ug  where us like '%a1075303330%'  -- 146624  108797  a1075303330
 																--- 96663  87855  a1075232353
SELECT p.per_apellido, p.per_nombre, e.est_codigo, e.enc_inicio, p2.pre_descripcion, o.opc_descripcion FROM covid.encuesta e 
inner join dbo.persona p on e.per_codigo = p.per_codigo 
inner join covid.pregunta p2 on e.cat_codigo = p2.cat_codigo
inner join covid.respuesta r on p2.pre_codigo = r.pre_codigo 
inner join covid.opciones o on r.opc_codigo = o.opc_codigo  
where p2.cat_codigo = 8 and p2.pre_estado = 1


select * from covid.encuesta e
select * from covid.categoria c -- 7, 8
select * from covid.pregunta p
select * from covid.opciones o 
select * from covid.respuesta r 
select * from covid.respuesta_subopciones rs 
select * from covid.tipo_respuestas tr 

 
 select * from covid.encuesta e 
 ---
select * from promedio_ponderado pp  
select * from covid.autorizacion_ingreso ai
 
-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int,
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);


 
SELECT * FROM acreditacion.programas_registrados_snies prs 
select * from persona p 
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo where p.per_nombre = 'JOHAN MANUEL' AND pro_codigo = 418

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

	
select * from programa
select * from usuario_grupo
select * from grupo


-- TABLA MYSQL PROGRAMAS
/*
CREATE TABLE acreditacion.programas (
	pro_codigo int IDENTITY(1,1) NOT NULL,
	pro_codio_unificado int NULL,
	pro_registro_snies_codigo int NULL,
	pro_registro_icfes int NULL,
	pro_estado int NULL,
	pro_oferta varchar(10) NULL,
	pro_sede varchar(100) NULL,
	pro_formacion varchar(100) NULL,
	pro_nivel_academico varchar(100) NULL,
	pro_modalidad varchar(100) NULL,
	pro_facultad varchar(250) NULL,
	pro_nombre varchar(250) NULL,
	pro_creacion_snies date NULL,
	pro_resolucion varchar(250) NULL,
	pro_fecha_creacion date NULL,
	pro_jefe varchar(250) NULL,
	pro_email_jefe varchar(250) NULL,
);
*/


select * from encuestas.cuestionarios c

SELECT pre_descripcion FROM [covid].pregunta WHERE cat_codigo=8 ORDER BY pre_codigo ASC

SELECT * FROM [seysatra].encuesta_covid WHERE
            convert(varchar(10),ecov_fecha, 120) BETWEEN '2021-03-14' AND '2022-04-19' AND ecov_tipo=1
            ORDER BY
            ecov_fecha ASC
            
SELECT * FROM covid.encuesta e          




select * from encuestas.cuestionarios c 
select * from encuestas.preguntas p where p.cue_codigo = 9 and p.pre_estado = 1
select * from programa

SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo
join programa p on nac.pro_codigo =p.pro_codigo INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo INNER JOIN sede s on s.sed_codigo = p.sed_codigo INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estadoINNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigoINNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docentes ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo= ud.upjoin acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo
where gru.gru_codigo = 14


SELECT *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo left JOIN sede s on s.sed_codigo = p.sed_codigo left JOIN jornada j on j.jor_codigo = p.jor_codigo left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo left JOIN modalidad m on m.mod_codigo = p.mod_codigo left JOIN convenio c on c.con_codigo = p.con_codigo left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado left JOIN resolucion r on r.res_codigo = p.res_codigo left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1 LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo LEFT join persona per on per.per_codigo = ud.up WHERE p.pro_codigo = 3 


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo = 3


select * from programa

select DISTINCT * from ( Select  pro_codigo,pre_codigo,pre_nombre,pro_titulo_otorgado,pro_registro_icfes,pro_registro_snies,pro_calendario,pro_horario,pro_fecha_creacion,pro_extension_snies,pro_propio,pro_creacion_snies,p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres , pr.per_email_interno,uaa_estado,uaa_nombre,uaa_dependencia,uaa_nombre_corto,p.sed_codigo,sed_nombre,p.mod_codigo,mod_nombre,p.nia_codigo,nia_nombre,nia_estado,floor( (cast(convert(varchar(8),getdate(),112) as int)-cast(convert(varchar(8),pro_creacion_snies,112) as int) ) / 10000)as tiempo from programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo INNER JOIN sede s on s.sed_codigo = p.sed_codigo INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on pr.per_codigo = ud.upwhere p.nia_codigo = 11and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5

select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) ) / 10000) as tiempo from programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo INNER JOIN sede s on s.sed_codigo = p.sed_codigo INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuarioLEFT join persona pr on ud.up = pr.per_codigowhere p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 5


select * from persona 





SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia FROM programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo left JOIN sede s on s.sed_codigo = p.sed_codigo left JOIN jornada j on j.jor_codigo = p.jor_codigo left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo left JOIN modalidad m on m.mod_codigo = p.mod_codigo left JOIN convenio c on c.con_codigo = p.con_codigo left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado left JOIN resolucion r on r.res_codigo = p.res_codigo left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo LEFT join persona per on per.per_codigo = ud.up WHERE p.pro_codigo = 165


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 )temporal where tiempo > 8

select ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo where ca.cam_estado = 1


select *,CASE WHEN ce.cam_esp_codigo = cd.cam_esp_codigo  THEN null ELSE ce.cam_esp_nombre END AS especifico  from acreditacion.campo_detallado cd
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
where cd.cam_det_estado = 1

with ts as (
      select cd.*, row_number() over (partition by cd.cam_esp_codigo order by cd.cam_esp_codigo) as seqnum
      from acreditacion.campo_detallado cd 
     )
select cd.cam_esp_codigo,
       (case when seqnum = 1 then cd.cam_esp_codigo end) as cd.cam_esp_codigo
from ts;


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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up
	where pro_codigo =$P{pro_codigo}

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
WHERE uaa_codigo = 318 and uap_fecha_fin is not null

select * from vinvul

select * from persona where per_nombre LIKE '%JULIO ROBERTO' AND per_apellido like '%CANO BARRERA'

select top 1 p.per_identificacion as est_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where up.uap_fecha_fin is not null and p.per_identificacion = '4263181' --36167024
ORDER BY up.uap_codigo DESC 

select * from programa where uaa_codigo = 318

select * from uaa where uaa_codigo = 318

select top 1 p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, u.uaa_nombre as uaa_nombre_corto from uaa_personal up inner join persona p on up.per_codigo = p.per_codigo inner join uaa u on up.uaa_codigo = u.uaa_codigo where up.uap_fecha_fin is not null and p.per_identificacion = '4263181'ORDER BY up.uap_codigo DESC 


SELECT * FROM estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where pro_codigo = 8 and e.est_registro_egresado = 1

SELECT *, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia from acreditacion.norma_acreditable nac  
join acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo INNER JOIN sede s on s.sed_codigo = p.sed_codigo INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 



select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
where p.nia_codigo = 12 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


UPDATE acreditacion.institucion SET ins_nit=:nit, ins_ies=:ies, ins_ies_padre=:iespadre, ins_sector=:sector, ins_nombre=:nombre, ins_caracter_academico=:caracter, mun_codigo=:municipio, ins_direccion=:direccion, ins_telefonos=:telefonos, ins_web=:web, ins_norma=:norma, ins_fecha_creacion=:creacion, ins_existencia=:existencia, ins_ruta=:ruta WHERE ins_codigo=:codigo



INSERT INTO acreditacion.institucion (ins_nit, ins_ies, ins_ies_padre, ins_sector, ins_nombre, ins_caracter_academico, mun_codigo, ins_direccion, ins_telefonos, ins_web, ins_norma, ins_fecha_creacion, ins_existencia, ins_ruta) VALUES(:nit,:ies,:iespadre,:sector,:nombre,:caracteracade,:municipio,:direccion,:telefonos,:web,:nombrenorma,:creacion,:existencia,:ruta);

EXECUTE sibusco.jovenes_accion_periodo 20212


select m.cal_codigo, mu.SNIES_codigo,'1114' AS insti,
       p.pro_registro_snies, e.est_codigo, 
       t.snies_codigo,   
	   pe.per_identificacion,
       per_nombre1,      per_nombre2, 
       per_apellido1,      per_apellido2,
       pe.per_genero,      pe.per_fecha_nacimiento,
       mu.SNIES_codigo,    pe.per_email,
       pe.per_telefono_fijo, pe.per_telefono_movil,
       s.sed_nombre,     u.uaa_nombre,
       pe.per_genero,      m.mat_codigo , edps.est_dps as IDPERSONA,  m.mat_estado 
from estudiantes_dps edps 
INNER JOIN estudiante e ON (edps.est_codigo=e.est_codigo)
INNER JOIN r_personax4 pe ON (e.per_codigo=pe.per_codigo)
INNER JOIN matricula m ON (m.est_codigo=e.est_codigo)
INNER JOIN calendario ca ON (ca.cal_codigo=m.cal_codigo)
INNER JOIN programa p ON (e.pro_codigo=p.pro_codigo)
INNER JOIN uaa u ON (p.uaa_codigo=u.uaa_codigo)
INNER JOIN sede s ON (u.sed_codigo=s.sed_codigo)
INNER JOIN tipo_id t ON (pe.tii_codigo=t.tii_codigo)
INNER JOIN municipio mu ON (mu.mun_codigo=s.mun_codigo)
where edps.per_codigo=(SELECT per_codigo
						FROM periodo  WHERE per_nombre = '20212'  )
AND ca.per_codigo=edps.per_codigo
AND ( convert( int ,substring(e.est_codigo,0,5)) BETWEEN 2012 and year(getdate() ) )
order by  e.est_codigo  asc
END


select * from calendario c

select * from web_parametro wp where wp.wep_nombre  like '%%'

UPDATE acreditacion.institucion_acreditada SET ins_codigo=:instcodigo, ina_norma=:norma, ina_fecha_inicio=:inicio, ina_fecha_fin=:fin, ina_vigencia=:vigencia, ina_estado=:estado WHERE ina_codigo=:codigo

select * from acreditacion.institucion i 
select * from acreditacion.institucion_acreditada ia 

select * from matriculados_resumen mr  
select * from matricula_curso mc 
select *, LEFT(e.est_codigo , 5) as periodo from estudiante e 



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
    ELSE 'PREGRADO' END AS formacion, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	LEFT JOIN resolucion re on re.res_codigo = p.res_codigo
	LEFT JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	LEFT JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	LEFT JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	LEFT JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo and ug.usg_grupo =34 and ug.usg_estado = 1
	LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
	LEFT join persona pe on pe.per_codigo= ud.up 
	where pro_codigo = 8

select * from uaa u
inner join programa pr on u.uaa_codigo = pr.uaa_codigo 
inner join acreditacion.comite_autoevaluacion ca on u.uaa_codigo = ca.uaa_codigo 
inner join acreditacion.integrante_comite_autoevaluacion ica on ca.coa_codigo = ica.coa_codigo 
inner join persona p on ica.per_codigo = p.per_codigo 
where pr.pro_codigo = 10


SELECT * from acreditacion.comite_autoevaluacion ca
inner join programa p on ca.uaa_codigo = p.uaa_codigo order by coa_fecha_creacion


select * from encuestas.cuestionarios c

select * from persona

select * from uaa where uaa_codigo = 627


select * from acreditacion.institucion i 

UPDATE academia3000_john.acreditacion.institucion SET ins_nit=N'891.180.084-2', ins_ies=1114, ins_ies_padre=1114, ins_sector=1, ins_nombre=N'UNIVERSIDAD SURCOLOMBIANA', ins_caracter_academico=4, mun_codigo=905, ins_direccion=N'Avenida Pastrana Borrero Carrera 1 ', ins_telefonos=N'8754753', ins_web=N'www.usco.edu.co', ins_norma=N'ACUERDO', ins_fecha_creacion='1976-01-30', ins_existencia=45, ins_ruta=N'140539', ins_estado=1 WHERE ins_codigo=2;


select * from acreditacion.institucion_acreditada ia 

-- ACREDITABLES Y COMITE DE AUTOEVALUACION
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 11 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


SELECT * , CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo, pr.per_nombre +' '+ pr.per_apellido as nombres from acreditacion.norma_acreditable nac join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo join programa p on nac.pro_codigo =p.pro_codigo INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo INNER JOIN sede s on s.sed_codigo = p.sed_codigo INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo inner JOIN resolucion re on re.res_codigo = p.res_codigo inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario inner join persona pr on pr.per_codigo= ud.up inner join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo where gru.gru_codigo = 17
--left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo
--CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite

-- 33 PROGRAMAS ACREDITABLES
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombre  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as correo, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo =p.pro_codigo INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo INNER JOIN sede s on s.sed_codigo = p.sed_codigo INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estadoINNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigoINNER JOIN modalidad m on m.mod_codigo = p.mod_codigo join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 17



select * from acreditacion.norma_acreditable na where na.gru_codigo = 17

inner JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
select distinct u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
ORDER by u.uaa_nombre ASC 


select * from usuario_docente where state = 1
select * from usuario_grupo

select * from grupo


-- JEFES DE PROGRAMA POR GRUPO
select distinct  u.uaa_nombre_corto, u.uaa_nombre, pr.per_apellido, ug.usg_codigo, ug.usg_usuario, ug.usg_grupo, ug.usg_uaa, ug.usg_estado, ud.gru_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and up.uap_fecha_fin is null
ORDER by u.uaa_nombre ASC 


select * from grupo
select * from cargo

-- JEFES DE PROGRAMA POR CARGO
select u.uaa_codigo, p.per_apellido, p.per_nombre, u.uaa_nombre_corto, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
where c.car_codigo in (76, 77) and up.uap_fecha_fin is null and up.vin_codigo = 46

select * from usuario_grupo ug 
select * from uaa_personal where vin_codigo = 46 and uap_cargo in (76,77) and uap_fecha_fin is null

select * from uaa where uaa_nombre like '%ADMINISTRACION%' 


-- PROGRAMAS CON REGISTRO DE FECHA Y CAMPOS DETALLADOS
select * from programa p where p.uaa_codigo_unificado is not null and cam_det_codigo is not null


-- PROGRAMAS CON CONDICIONES PARA SER ACREDITABLES
select p.pro_codigo, u.uaa_codigo, u.uaa_nombre_corto from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join acreditacion.norma_acreditable na on p.pro_codigo = na.pro_codigo  
where p.pro_creacion_snies is not null and na.gru_codigo = 17
order by u.uaa_nombre



-- 33 PROGRAMAS ACREDITABLES EM TOTAL
select * from acreditacion.norma_acreditable na where na.gru_codigo = 17



-- PROGRAMAS JASPER EXCEL
select pro_registro_snies, p.pro_registro_icfes , CASE
    WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO'
    ELSE 'DESACTIVO' END AS estado ,
	CASE
    WHEN pro_estado = 01 THEN 'SI'
    ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as
    pro_fecha_creacion, cd.codigo_cine as cam_det_codigo ,ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre,
    ce.cam_esp_nombre as cam_esp_nombre,ca.cam_nombre,
	(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre,
	CASE
    WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO'
    ELSE 'PREGRADO' END AS academico,
    floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia,
    p.pro_creacion_snies
	from programa p
	INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo
	INNER JOIN sede s on s.sed_codigo = u.sed_codigo
	INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
	INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
	INNER JOIN resolucion re on re.res_codigo = p.res_codigo
	INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
	left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo
	left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo
	left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo
	where pro_codigo in (SELECT p.pro_codigo  FROM programa p
				INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo
				INNER JOIN sede s on s.sed_codigo = p.sed_codigo
				INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado
				INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo
				INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo
				WHERE  ua.uaa_estado = 1) order by estado
				
				
select * from jornada j
select * from programa


Select p.pro_registro_snies, p.pro_registro_icfes, 
CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, 
CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, 
s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, 
ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, 
(select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, 
CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p 
INNER JOIN uaa u on u.uaa_codigo = p.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = u.sed_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN resolucion re on re.res_codigo = p.res_codigo 
INNER JOIN jornada j on p.jor_codigo = j.jor_codigo 
left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo 
left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo 
left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo 
where u.uaa_estado = 1

select * from encuestas.cuestionarios c 

EXEC vinculacion_actual '12113154'


SELECT * FROM programa p where pro_codigo = 375
select * from uaa where uaa_codigo = 480




select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, (select uaa_nombre from uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from programa p JOIN uaa u on u.uaa_codigo = p.uaa_codigo JOIN sede s on s.sed_codigo = u.sed_codigo JOIN modalidad m on m.mod_codigo = p.mod_codigo JOIN nivel_academico na on na.nia_codigo = p.nia_codigo JOIN resolucion re on re.res_codigo = p.res_codigo JOIN jornada j on p.jor_codigo = j.jor_codigo left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo where u.uaa_estado = 1


select p.pro_registro_snies, p.pro_registro_icfes, CASE WHEN pro_registro_snies = 'NULL' or pro_registro_snies = ' ' or pro_registro_snies != '0' THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado, CASE WHEN pro_estado = 1 THEN 'SI' ELSE 'NO' END AS oferta, s.sed_nombre,m.mod_nombre , na.nia_nombre,u.uaa_nombre,re.res_numero,p.pro_fecha_creacion as pro_fecha_creacion, cd.codigo_cine as cam_det_codigo, ce.codigo_cine as cam_exp_codigo,ca.codigo_cine  as cam_codigo, cd.cam_det_nombre, ce.cam_esp_nombre as cam_exp_nombre,ca.cam_nombre, (select uaa_nombre from dbo.uaa where uaa_codigo = u.uaa_dependencia) as dependencia, j.jor_nombre, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS academico, floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as vigencia, p.pro_creacion_snies from dbo.programa p JOIN dbo.uaa u on u.uaa_codigo = p.uaa_codigo JOIN dbo.sede s on s.sed_codigo = u.sed_codigo JOIN dbo.modalidad m on m.mod_codigo = p.mod_codigo JOIN dbo.nivel_academico na on na.nia_codigo = p.nia_codigo JOIN dbo.resolucion re on re.res_codigo = p.res_codigo JOIN dbo.jornada j on p.jor_codigo = j.jor_codigo left JOIN acreditacion.campo_detallado cd on cd.cam_det_codigo = p.cam_det_codigo left JOIN acreditacion.campo_especifico ce on ce.cam_esp_codigo = cd.cam_esp_codigo left JOIN acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo where u.uaa_estado = 1

select count(*) from acreditacion.programas_registrados_snies prs 
select * from acreditacion.programas_registrados_snies prs

select * from 

--select * from web_parametro wp where wp.wep_nombre = 'MATRICULA_PERIODO_ACTUAL'


select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_ACTIVO'
select * from web_parametro wp where wp.wep_nombre = 'EDUCACION_VIRTUAL_SINCRONIZADOR_MIGRACION'


SELECT * FROM acreditacion.programas_registrados_snies




select * from programa

select * from curso_virtual cv

INSERT INTO programas (pro_indicador, pro_codio_unificado, pro_registro_snies_codigo, pro_registro_icfes, pro_estado, pro_oferta, pro_sede, pro_formacion, pro_nivel_academico, pro_modalidad, pro_facultad, pro_nombre, pro_creacion_snies, pro_resolucion, pro_fecha_creacion, pro_jefe, pro_email_jefe) VALUES (,,,,,,,,,,,,,,,,);


UPDATE acreditacion.programas SET pro_codigo = ?, pro_codigo_unificado = ?, pro_registro_snies = ?, pro_registro_icfes = ?, pro_estado = ?, pro_oferta = ?, sed_nombre = ?, pro_formacion = ?, nia_nombre = ?, mod_nombre = ?, pro_facultad = ?, uaa_nombre = ?, pro_creacion_snies = ?, pro_resolucion = ?, pro_fecha_creacion = ?, pro_jefe = ?, pro_email_jefe = ? where pro_codigo = ?;

select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 8
select * from usuario_tipo ut 

select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JUAN CARLOS%' and p.per_apellido like '%ALBARRACIN%'
--Guissela Alexandra L�pez Rodr�guez

select * from usuario_general_login ugl 


SELECT u.uid, u.us, u.state, t.tus_codigo, t.tus_nombre, p.per_codigo, p.per_identificacion, p.per_nombre, p.per_apellido, p.per_email, p.per_email_interno FROM usuario_general_login u INNER JOIN usuario_tipo t ON u.istipo = t.tus_codigo INNER JOIN persona p ON u.up = p.per_codigo WHERE u.us like 7731066 order by u.uid DESC
 
 SELECT TOP 1 us AS username, uwd2 AS password, state AS enabled FROM usuario_general_login WHERE state = 1 AND istipo in (1,2,3) AND us = 'a1075303330'
 
 SELECT us AS username, 'ROLE_ENCUESTA' as role FROM usuario_general_login WHERE state = 1 AND us = 'u20171157616'
 
 
 
SELECT *,CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, ss.sus_nombre FROM programa pINNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo left JOIN sede s on s.sed_codigo = p.sed_codigo 
inner join sub_sede ss on s.sed_codigo = ss.sed_codigo left JOIN jornada j on j.jor_codigo = p.jor_codigo left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo left JOIN modalidad m on m.mod_codigo = p.mod_codigo left JOIN convenio c on c.con_codigo = p.con_codigo left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado left JOIN resolucion r on r.res_codigo = p.res_codigo left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo LEFT join persona per on per.per_codigo = ud.up WHERE p.pro_codigo = 375

select * from sub_sede ss 

select * from uaa u where u.uat_codigo = 3

select * from uaa_tipo ut 

select * from acreditacion.integrante_comite_autoevaluacion ica 

select * from persona p where p.per_codigo = 71599

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 375

select distinct City, Country from Employees

select DISTINCT ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre from acreditacion.campo_detallado cd 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 
where ca.cam_estado = 1


select *, ca.codigo_cine + ' - ' + ca.cam_nombre as amplio, ce.codigo_cine + ' - ' + ce.cam_esp_nombre as especifico, cd.codigo_cine + ' - ' + cd.cam_det_nombre as detallado from acreditacion.campo_amplio ca inner join acreditacion.campo_especifico ce on ca.cam_codigo = ce.cam_codigo inner join acreditacion.campo_detallado cd on ce.cam_esp_codigo = cd.cam_esp_codigo where ca.cam_estado = 1

select * from sub_sede ss where ss.sus_estado = 1

select * from uaa u where u.uaa_codigo = 480 

select * from programa p 

select * from programa_titulo pt 

select * from plan_academico pa 

select DISTINCT p.pro_titulo_otorgado, (SELECT TOP 1 pla_total_creditos from plan_academico pa 
where pa.pro_codigo=p.pro_codigo and pla_total_creditos > 0 and pla_total_creditos is not null ORDER BY pla_codigo DESC) as totalCreditos  from programa p
where totalCreditos > 0

inner join plan_academico pa on p.pro_codigo = pa.pla_codigo
where pa.pla_total_creditos > 0
order by p.pro_titulo_otorgado 


select * from encuestas.cuestionarios c 

select * from persona p where p.per_nombre like '%JARO LEON%' and p.per_apellido like 'CASTRO ZAMORA'
select * from persona p where p.per_nombre like '%DIEGO ANDRES%' and p.per_apellido like '%CARVAJAL%'

select * from vinculacion_historico vh where vh.per_codigo = 2488

select * from estudiante e where e.per_codigo = 140591

select * from encuestas.cuestionarios c 

exec vinculacion_actual '12125816',''

SELECT u2.uaa_nombre AS dependencia, u1.uaa_nombre,pro.pro_registro_snies,  
            (CASE WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'A' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'C' THEN 'Presencial' 
            WHEN LTRIM(RTRIM(pro.pro_calendario)) = 'D' THEN 'Distancia' END) as pro_calendario, 
            j.jor_nombre, (SELECT SUM(cup_cupo) FROM cupo c WHERE c.ofa_codigo =ofa.ofa_codigo) as cupo, 
            (SELECT TOP 1 pla_total_creditos from plan_academico pa 
            where pa.pro_codigo=pro.pro_codigo ORDER BY pla_codigo DESC) as totalCreditos 
            FROM oferta_academica ofa WITH (NOLOCK)  
            INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo  
            INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo  
            INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo  
            INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo  
            INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo  
            INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo  
            INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo  
            INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo  
            INNER JOIN jornada j WITH (NOLOCK) on pro.jor_codigo = j.jor_codigo  
--            WHERE per.per_nombre in (:periodo) AND sed.sed_codigo =1 
--            AND nia.nia_codigo in (9,11) 
            ORDER BY nat_nombre,dependencia,u1.uaa_nombre 
            
select * from acreditacion.institucion i 

select * from acreditacion.grupos_acreditables ga 

select * from matriculados_resumen mr 

select * from hecaa.colegios c 
select * from institucion_educativa ie 
select * from institucion_categoria ic 

select * from web_parametro wp

--SELECT per.per_nombre, per.per_apellido, per.per_identificacion, est.est_codigo, 
        floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), per.per_fecha_nacimiento ,112) as int) ) / 10000) as edad, 
        tii.tii_nombre, pla.pla_nombre, pla.pla_codigo, pla.pla_creditos, pla.pla_total_creditos, 
        pla.pla_total_horas, pro.pro_codigo, pro.pro_registro_snies,  u1.uaa_nombre,  
        sed.sed_nombre, nia.nia_codigo, nia.nia_nombre, nat.nat_codigo,  nat.nat_nombre, cra.creditos_aprobados,  
        pcea.puntaje_calificado AS puntaje_calificado_estudiante,   
        pcaea.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_estudiante, 
        pcgcp.puntaje_calificado AS puntaje_calificado_graduado, 
        pcagcp.puntaje_calificado_aritmetico AS puntaje_calificado_aritmetico_graduado, 
        (CASE WHEN pcea.puntaje_calificado IS NOT NULL THEN pcea.puntaje_calificado ELSE pcgcp.puntaje_calificado END ) AS promedio_ponderado, 
        (CASE WHEN pcaea.puntaje_calificado_aritmetico IS NOT NULL THEN pcaea.puntaje_calificado_aritmetico ELSE pcagcp.puntaje_calificado_aritmetico END ) AS promedio_aritmetico 
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
        LEFT JOIN puntaje_calificado_aritmetico_graduado_con_perdidas pcagcp ON est.est_codigo = pcagcp.est_codigo 
        WHERE est.est_codigo = 20171155993;

select * from usuario_administrativo ua 

select c.car_nombre, p.per_codigo, p.per_identificacion as est_codigo, u.uaa_codigo as pro_uaa_codigo, p.per_nombre +' '+ p.per_apellido as nombre, p.per_email_interno, u.uaa_nombre as uaa_nombre_corto from uaa_personal up inner join persona p on up.per_codigo = p.per_codigo inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo where up.uap_fecha_fin is not nullORDER BY up.uap_codigo DESC 

57003
1075226439

select * FROM encuestas.respuestas_cuestionarios rc where rc.per_codigo = 57003}


select * from resolucion r;



        
        
        
-- ACREDITACION INFORME DE PROGRAMAS 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_programa (
	asp_codigo int IDENTITY(1,1) NOT NULL,
	asp_item char (1) NULL,
	asp_aspecto varchar(1000) NOT NULL,
	asp_aprobado int NULL,
	asp_archivo varchar(250) NULL,
	asp_ruta varchar(250) NULL,
	asp_observacion varchar(1000) NULL,
	asp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_programa_PK PRIMARY KEY (asp_codigo)
);

select * from acreditacion.aspecto_programa ap 


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_institucion (
	asi_codigo int IDENTITY(1,1) NOT NULL,
	asi_item char (1) NULL,
	asi_aspecto varchar(1000) NOT NULL,
	asi_aprobado int NULL,
	asi_archivo varchar(250) NULL,
	asi_ruta varchar(250) NULL,
	asi_observacion varchar(1000) NULL,
	asi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_institucion_PK PRIMARY KEY (asi_codigo)
);

select * from acreditacion.aspecto_institucion ai 

-- TABLA VARIABLES FORMULARIO
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);

-- TABLA INFORME PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_programa (
	inp_codigo int IDENTITY(1,1) NOT NULL,
	inp_fecha  date NOT NULL,
	pro_codigo int NOT NULL,
	inp_estado int DEFAULT 1 NOT NULL,
	gru_codigo int NOT NULL,
	CONSTRAINT informe_programa_PK PRIMARY KEY (inp_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_programa_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo)
);



-- TABLA INFORME VARIABLES PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_variables_programa (
	ivp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int
	ivp_nombre varchar(250) NOT NULL,
	ivp_valor varchar(500) NULL,
	ivp_etiqueta varchar(250) NOT NULL,
	ivp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_variables_programa_PK PRIMARY KEY (cci_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
);

select * from acreditacion.criterios_condiciones_iniciales cci 


-- TABLA INFORME CHEQUEO PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_programa (
	icp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	icp_item char (1) NULL,
	icp_aspecto varchar(1000) NOT NULL,
	icp_aprobado int NULL,
	icp_archivo varchar(250) NULL,
	icp_ruta varchar(250) NULL,
	icp_observacion varchar(1000) NULL,
	icp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_programa_PK PRIMARY KEY (icp_codigo),
	CONSTRAINT informe_chequeo_programa_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

-- TABLA INFORME CHEQUEO INSTITUCION
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_institucion (
	ici_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	ici_item char (1) NULL,
	ici_aspecto varchar(1000) NOT NULL,
	ici_aprobado int NULL,
	ici_archivo varchar(250) NULL,
	ici_ruta varchar(250) NULL,
	ici_observacion varchar(1000) NULL,
	ici_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_institucion_PK PRIMARY KEY (ici_codigo),
	CONSTRAINT informe_chequeo_institucion_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

select * from acreditacion.informe_chequeo_programa icp

select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.aspecto_institucion ai  

select * from acreditacion.informe_chequeo_programa where inp_codigo = 1 ORDER by icp_item

select * from acreditacion.informe_programa ip 

-- TABLA ESTADO NOTIFICACION
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);


-- TABLA INVITACION PROGRAMA ACREDITABLE
--CREATE TABLE academia3000_john.acreditacion.invitacion_programa_acreditable (
	ipa_codigo int IDENTITY(1,1) NOT NULL,
	gru_codigo int NOT NULL,
	pro_codigo int NOT NULL,
	ipa_fecha_envio date NOT NULL,
	ipa_fecha_respuesta date NULL,
	ipa_hash varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ipa_estado int NULL,
	CONSTRAINT invitacion_programa_acreditable_PK PRIMARY KEY (ipa_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK FOREIGN KEY (ipa_estado) REFERENCES academia3000_john.acreditacion.estado_invitacion(esi_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_2 FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo)
);


-- TABLA INFORME GENERAL PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_general_programa (
	igp_codigo int IDENTITY(1,1) NOT NULL,
	pro_codigo int NOT NULL,
	inp_codigo int NOT NULL,
	igp_facultad varchar(500) NULL,
	igp_departamento varchar(250) NULL,
	igp_denominacion varchar(500) NULL,
	igp_snies varchar(250) NULL,
	igp_jefe varchar(500) NULL,
	igp_coordinador varchar(500) NULL,
	igp_modalidad varchar(250) NULL,
	igp_jornada varchar(250) NULL,
	igp_nivel_formacion varchar(500) NULL,
	igp_duracion int NULL,
	igp_titulo varchar(500) NULL,
	igp_creditos int NULL,
	igp_amplio varchar(500) NULL,
	igp_especifico varchar(500) NULL,
	igp_detallado varchar(500) NULL,
	igp_nbc varchar(500) NULL,
	igp_area_nbc varchar(500) NULL,
	igp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_general_programa_PK PRIMARY KEY (igp_codigo),
	CONSTRAINT informe_general_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_general_programa_FK_1 FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo)
);

select * from acreditacion.informe_general_programa



select * from acreditacion.invitacion_programa_acreditable

select * from persona p where p.per_apellido likE '%GUERRERO FIERRO%'

select * from estudiante e where e.per_codigo = 26725

select * from programa p where p.pro_codigo = 12

select * from graduado g where g.est_codigo = '1993101130'


-- TABLA ESTADO INVITACION
--CREATE TABLE academia3000_john.acreditacion.estado_invitacion (
	esi_codigo int IDENTITY(1,1) NOT NULL,
	esi_nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT estado_invitacion_PK PRIMARY KEY (esi_codigo)
);

INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Enviado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Aceptado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Rechazado');

select * from acreditacion.estado_invitacion ei 



select * from acreditacion.aspecto_programa ap 
select * from acreditacion.aspecto_institucion ai 
select * from acreditacion.criterios_condiciones_iniciales cci 
update acreditacion.criterios_condiciones_iniciales cci values ()


select p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, 
p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, 
(select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe
from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on s.sed_codigo = p.sed_codigo 
inner join municipio mu on s.mun_codigo = mu.mun_codigo 
inner join departamento d on mu.dep_codigo = d.dep_codigo 
inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join jornada j on p.jor_codigo = j.jor_codigo 
left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo 
left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo 
inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo 
inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo 


(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 


select * from plan_academico pa 

select * from EXCEL_NBC en
select * from snies_area sa 
select * from sede
select * from programa

select * from encuestas.cuestionarios c 
EXEC [vinculacion_actual] '1075226439',''

select * from estudiante e where e.per_codigo = 57003

select * from plan_academico pa where pro_codigo = 25

select * from acreditacion.aspecto_institucion ai  

SELECT 0 as uap_codigo, 0 as vin_codigo, e.est_codigo, u.uaa_codigo, u.uaa_nombre_corto, u.uaa_dependencia 
FROM estudiante e 
INNER JOIN programa p ON e.pro_codigo = p.pro_codigo 
INNER JOIN uaa u ON p.uaa_codigo = u.uaa_codigo 
WHERE e.est_codigo = '20171155993' AND e.ese_codigo = 1 

SELECT count(m.mat_codigo) FROM matricula m INNER JOIN calendario c ON m.cal_codigo = c.cal_codigo INNER JOIn periodo p ON c.per_codigo = p.per_codigo WHERE m.mat_estado = 'A' AND m.est_codigo = '20171155993'
 
 
SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia,null as tiempo,
(select distinct pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombres, 
(select distinct pr.per_email_interno from programa p 
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
inner join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 14


select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, p.per_email_interno, u.uaa_nombre, c.car_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join uaa_cargo uc on up.uac_codigo = uc.uac_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
inner join cargo c on uc.uac_cargo = c.car_codigo 
WHERE up.uaa_codigo = 554 order by uap_codigo desc

select * from contrato.centro_trabajo ct 

select * from uaa_personal up where up.per_codigo = 108797
select * from persona p where p.per_identificacion = '1075303330'

select * from uaa u where u.uaa_nombre like '%OFICINA%'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797

select * from encuestas.respuestas r where r.rcu_codigo = 22486

select * from encuestas.cuestionarios c 
exec vinculacion_actual '1075303330'

select u.uaa_nombre, u.uaa_email, u.uaa_email_pqr, u.uaa_pagina, u.uaa_telefono, u.uaa_direccion, u.uaa_fax from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.cam_det_codigo is not null


select * from acreditacion.invitacion_programa_acreditable where ipa_invitacion_hash = ''

select * from acreditacion.estado_invitacion ei 

select * from acreditacion.comite_autoevaluacion ca 

select * from uaa


-- PERSONA POR PROGRAMA
select * from persona p

--DOCENTE POR PROGRAMA

--ADMINISTRATIVO POR PROGRAMA

-- ESTUDIANTE POR PROGRAMA
select * from estudiante e
inner join persona p on e.per_codigo = p.per_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo
where pr.pro_codigo = 375 and  est_registro_egresado = 0

.est_codigo = :codigoEst

select * from persona p where p.per_identificacion = '1075303330'

select * from estudiante e inner join persona p on e.per_codigo = p.per_codigo inner join programa pr on e.pro_codigo = pr.pro_codigo inner join uaa u on pr.uaa_codigo = u.uaa_codigo where pr.pro_codigo = 375  and e.est_registro_egresado = 0


select * from persona p where p.per_nombre like '%ARLYN'

select * from uaa_personal up 
inner join uaa u on up.uaa_codigo = u.uaa_codigo
where up.per_codigo = 95604

SELECT * FROM acreditacion.integrante_comite_autoevaluacion ica 

select * from estudiante e where e.per_codigo = 153265

select * from persona p where p.per_codigo = 153265

select * from web_parametro wp where wp.wep_nombre like '%ARCHIVO%'


SELECT top 1 per.per_a�o AS ano, per.per_nombre AS periodo, sed_nombre, nat_nombre, nia_nombre,
u2.uaa_codigo AS dependencia_codigo, u2.uaa_nombre AS dependencia, pro.pro_codigo, pro.pro_registro_snies,u1.uaa_nombre, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo=pro.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as totalSemestres 
FROM oferta_academica ofa WITH (NOLOCK)
INNER JOIN programa pro WITH (NOLOCK) ON ofa.pro_codigo = pro.pro_codigo
INNER JOIN uaa u1 WITH (NOLOCK) ON pro.uaa_codigo = u1.uaa_codigo
INNER JOIN uaa u2 WITH (NOLOCK) ON u1.uaa_dependencia = u2.uaa_codigo
INNER JOIN sede sed WITH (NOLOCK) ON pro.sed_codigo = sed.sed_codigo
INNER JOIN nivel_academico nia WITH (NOLOCK) ON  pro.nia_codigo = nia.nia_codigo
INNER JOIN nivel_academico_tipo nat WITH (NOLOCK) ON nia.nat_codigo = nat.nat_codigo
INNER JOIN calendario cal WITH (NOLOCK) ON ofa.cal_codigo = cal.cal_codigo
INNER JOIN periodo per WITH (NOLOCK) ON cal.per_codigo = per.per_codigo
where pro.pro_codigo = 401
order by per.per_codigo desc


select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, (select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, (select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario inner join persona pr on pr.per_codigo= ud.up where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, 
(SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in 
(SELECT TOP 1 pla_codigo  from plan_academico pa
where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC)
ORDER BY paa_semestre DESC) as semestresfrom programa p inner join uaa u on p.uaa_codigo = u.uaa_codigo inner join sede s on s.sed_codigo = p.sed_codigo inner join municipio mu on s.mun_codigo = mu.mun_codigo inner join departamento d on mu.dep_codigo = d.dep_codigo inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo inner join modalidad m on p.mod_codigo = m.mod_codigo inner join jornada j on p.jor_codigo = j.jor_codigo left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo inner join nivel_academico na on p.nia_codigo = na.nia_codigo inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo where p.pro_codigo = 401






select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8


select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo where p.nia_codigo in (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select * from programa

select * from nivel_academico na 






--ACREDITABLES NUEVO PARAMETRO MATRICULADOS
select DISTINCT * from (Select (select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, CASE WHEN na.nia_codigo in (12,13,14,19) THEN 'POSGRADO' ELSE 'PREGRADO' END AS formacion, pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario,
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo,
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno,
uaa_estado, uaa_nombre, uaa_dependencia, uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nia_nombre, nia_estado,
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario
LEFT join persona pr on ud.up = pr.per_codigo
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo where p.nia_codigo IN (9,11,12,13,14) and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo > 8

select na.pro_codigo from acreditacion.norma_acreditable na where na.gru_codigo = 15

select * from programa where pro_codigo = 3


-- QUERY ACREDITABLES CON MATRICULADOS


select p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, p.pro_creacion_snies, p2.per_fecha_inicio, DATEADD(year, 8, p.pro_creacion_snies) AS pro_vigencia_cna, p2.per_fecha_fin, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join acreditacion.norma_acreditable na on e.pro_codigo = na.pro_codigo
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join calendario c on m.cal_codigo = c.cal_codigo 
inner join periodo p2 on c.per_codigo = p2.per_codigo  
where convert(Date, p2.per_fecha_inicio) BETWEEN DATEADD(year, -1, p.pro_creacion_snies) AND DATEADD(year, 8, p.pro_creacion_snies) and convert(Date, p2.per_fecha_fin)  BETWEEN p.pro_creacion_snies AND DATEADD(year, 9, p.pro_creacion_snies) and na.gru_codigo = 15
group by p.pro_codigo, p2.per_nombre, u.uaa_nombre, s.sed_nombre, pro_creacion_snies, p2.per_fecha_inicio, p2.per_fecha_fin




select * from matricula


select count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.pro_codigo = 3

select * from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 3


select * from programa
--PARAMETRIZAR POR LAS FECHAS DE PERIODO EL INTERVALO, LUEGO AGRUPAR POR PERIODOS Y CANTIDAD DE MATRICULADOS

--m.mat_fecha BETWEEN p.pro_creacion_snies AND DATEADD(year, 8, p.pro_creacion_snies)

select p.pro_codigo, u.uaa_nombre, p.pro_creacion_snies, count(*) from matricula m 
inner join estudiante e on m.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_creacion_snies is not null 
group by p.pro_codigo, u.uaa_nombre, pro_creacion_snies


select p.pro_codigo, p.pro_creacion_snies from programa p where p.pro_creacion_snies is not null

select * from matricula m 
select * from calendario c 
select * from periodo p 






select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_registro_snies, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, m.mod_nombre, j.jor_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, sa.sar_nombre, ca.cam_nombre, ce.cam_esp_nombre, cd.cam_det_nombre, (select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, (select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario inner join persona pr on pr.per_codigo= ud.up where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, (SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in (SELECT TOP 1 pla_codigo  from plan_academico pa where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 
left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo 
inner join persona p2 on ica.per_codigo = p2.per_codigo
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALAUACI�N') as coordinadorfrom programa p inner join uaa u on p.uaa_codigo = u.uaa_codigo inner join sede s on s.sed_codigo = p.sed_codigo inner join municipio mu on s.mun_codigo = mu.mun_codigo inner join departamento d on mu.dep_codigo = d.dep_codigo inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo inner join modalidad m on p.mod_codigo = m.mod_codigo inner join jornada j on p.jor_codigo = j.jor_codigo left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo inner join nivel_academico na on p.nia_codigo = na.nia_codigo inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  where p.pro_codigo = 375


select * from acreditacion.informe_chequeo_institucion ici 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_general_programa igp 

select * from acreditacion.informe_programa ip 

select * from acreditacion.informe_general_programa igp 

--PROCESO ALMACENADOTASA DE DESERCI�N
EXEC dbo.acreditacion_tasa_desercion '20222', 1 

select DISTINCT oaa.facultad_codigo, oaa.facultad from acreditacion.oferta_academica_acreditacion oaa 

select * from acreditacion.oferta_academica_acreditacion oaa where oaa.facultad_codigo in (19, 20, 21, 22, 23, 24, 258)




-- Programa con Jefe de Programa
SELECT p.pro_codigo, u.uaa_nombre_corto, p.pro_creacion_snies, pr.per_nombre, pr.per_apellido, aug.aud_changed  FROM programa p  
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u.uaa_codigo 
inner join aud_usuario_grupo aug on ug.usg_codigo = aug.usg_codigo
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up 
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa'
GROUP by u.uaa_nombre_corto 


select * from usuario_grupo

select * from aud_usuario_grupo


select * from uaa_personal

select count(*) from usuario_grupo ug  
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
where ud.usg_grupo = 34 and ug.usg_estado = 1 


select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, up.uap_fecha_inicio, up.uap_fecha_fin from usuario_docente ug 
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo 
left join uaa_personal up  on pe.per_codigo = up.per_codigo
where ug.usg_grupo = 34 and p.pro_codigo = 418 and up.uap_cargo = 76
order by ug.usg_usuario desc

select pe.per_nombre, pe.per_apellido, up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug
inner join uaa u on ug.usg_uaa = u.uaa_codigo 
inner join programa p on u.uaa_codigo = p.uaa_codigo 
inner join persona pe on ug.up = pe.per_codigo  
where ug.usg_grupo = 34 and p.pro_codigo = 418 
order by ug.usg_usuario desc


select pe.per_nombre, pe.per_apellido, pe.per_email_interno , ug.up, u.uaa_nombre, ug.gru_nombre, ug.usg_estado from usuario_docente ug inner join uaa u on ug.usg_uaa = u.uaa_codigo inner join programa p on u.uaa_codigo = p.uaa_codigo inner join persona pe on ug.up = pe.per_codigo where p.pro_codigo = 418 and ug.usg_grupo = 34 order by ug.usg_usuario desc


select * from vinculacion v 

select * from usuario_docentes ud  

select * from uaa_personal

select * from aud_usuario_grupo aug where usg_grupo = 34 and usg_uaa = 601 

select * from usuario_docente where usg_grupo = 34 and usg_uaa = 676

select * from usuario_grupo where usg_grupo = 34 and usg_uaa = 676


select * from grupo



uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 


select * from uaa_personal where per_codigo = 5529--100472 --23742--100472 -- 5529


select * from cargo

select * from uaa

select * from usuario_grupo

select count(*) from usuario_docente where usg_grupo = 34 

usg_grupo = 34





-- p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre

select p.per_nombre, p.per_apellido, up.uap_fecha_inicio, up.uap_fecha_fin, c.car_nombre, u.uaa_nombre from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select count(*) from uaa_personal up 
inner join persona p on up.per_codigo = p.per_codigo 
inner join cargo c on up.uap_cargo = c.car_codigo 
inner join uaa u on up.uaa_codigo = u.uaa_codigo 
where c.car_codigo = 76 

select * from 


select * 


select * from contrato

select * from 

select * from usuario_docente 










select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_creacion_snies,
CASE WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado ,
CASE WHEN pro_estado = 01 THEN 'SI' ELSE 'NO' END AS oferta,
p.pro_creacion_snies, p.pro_fecha_creacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,p.pro_registro_snies, p.pro_registro_icfes, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, m.mod_nombre, j.jor_nombre, c.con_descripcion, pe.pre_nombre, r.res_numero, tn.tin_nombre, na.nia_nombre, nat.nat_nombre, sn.nbc_nombre, sa.sar_nombre, ca.cam_nombre, ca.cam_codigo, ce.cam_esp_nombre, ce.cam_esp_codigo, cd.cam_det_nombre, cd.cam_det_codigo, (select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, (select top 1 pr.per_nombre +' '+ pr.per_apellido as nombres  from programa p inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario inner join persona pr on pr.per_codigo= ud.up where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = u.uaa_codigo) as jefe, (SELECT top 1 paa_semestre  FROM plan_academico_asignatura paa where pla_codigo in (SELECT TOP 1 pla_codigo  from plan_academico pa where pa.pro_codigo = p.pro_codigo and pa.pla_estado=1  ORDER BY pla_codigo DESC) ORDER BY paa_semestre DESC) as semestres , (select p2.per_nombre + ' ' + p2.per_apellido from acreditacion.comite_autoevaluacion ca2 left join acreditacion.integrante_comite_autoevaluacion ica on ca2.coa_codigo = ica.coa_codigo inner join persona p2 on ica.per_codigo = p2.per_codigo where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador from programa p inner join uaa u on p.uaa_codigo = u.uaa_codigo inner join sede s on s.sed_codigo = p.sed_codigo inner join municipio mu on s.mun_codigo = mu.mun_codigo inner join departamento d on mu.dep_codigo = d.dep_codigo inner join uaa uf on u.uaa_dependencia = uf.uaa_codigo inner join modalidad m on p.mod_codigo = m.mod_codigo 
left join convenio c on c.con_codigo = p.con_codigo 
left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
left JOIN resolucion r on r.res_codigo = p.res_codigo 
left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo inner join jornada j on p.jor_codigo = j.jor_codigo left join snies_nbc sn on p.nbc_codigo = sn.nbc_codigo left join snies_area sa on sn.nbc_area_hecaa = sa.sar_codigo inner join nivel_academico na on p.nia_codigo = na.nia_codigo inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo inner join acreditacion.campo_detallado cd on p.cam_det_codigo = cd.cam_det_codigo inner join acreditacion.campo_especifico ce on cd.cam_esp_codigo = ce.cam_esp_codigo inner join acreditacion.campo_amplio ca on ce.cam_codigo = ca.cam_codigo  where p.pro_codigo = 165


select * from convenio

SELECT *,nat.nat_nombre as formacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia, u.uaa_nombre as facultad FROM programa p INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo left JOIN sede s on s.sed_codigo = p.sed_codigo left JOIN jornada j on j.jor_codigo = p.jor_codigo left JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
left join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo left JOIN modalidad m on m.mod_codigo = p.mod_codigo left JOIN convenio c on c.con_codigo = p.con_codigo left JOIN snies_nbc nbc on nbc.nbc_codigo = p.nbc_codigo left JOIN programa_estado pe on pe.pre_codigo = p.pro_estado left JOIN resolucion r on r.res_codigo = p.res_codigo left join tipo_normativa tn on tn.tin_codigo = r.tin_codigo left join acreditacion.campo_detallado cd on cd.cam_det_codigo =p.cam_det_codigo left join acreditacion.campo_especifico ce on ce.cam_esp_codigo =cd.cam_esp_codigo left join acreditacion.campo_amplio ca on ca.cam_codigo = ce.cam_codigo LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario and ud.gru_id like '%JEFE_PROGRAMA%' and ud.usg_estado = 1 and ud.usg_uaa = p.uaa_codigo LEFT join persona per on per.per_codigo = ud.up WHERE p.pro_codigo = 433




SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
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
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 15




select p.pro_codigo, p.pro_registro_icfes, p.pro_registro_snies, u.uaa_nombre, p.pro_creacion_snies, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia from programa p
inner join uaa u on p.uaa_codigo = u.uaa_codigo
where p.pro_creacion_snies is not null and floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) >= 8



select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  where pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8


select DISTINCT * from (Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, pro_registro_snies, pro_calendario, pro_horario, 
pro_fecha_creacion, pro_extension_snies, pro_propio, pro_creacion_snies, p.uaa_codigo, 
pr.per_nombre +' '+ pr.per_apellido as nombres, pr.per_email_interno, 
ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, nat.nat_nombre, nia_nombre, nia_estado, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int) 
 ) / 10000) as tiempo, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
LEFT JOIN usuario_grupo ug on ug.usg_uaa = ua.uaa_codigo and ug.usg_grupo = 34 and ug.usg_estado = 1 
LEFT JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
LEFT join persona pr on ud.up = pr.per_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo  where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo=1 )temporal where tiempo >= 8

select * from nivel_academico na2 
select * from acreditacion.grupos_acreditables gru
select * from acreditacion.norma_acreditable na

select count(*) from acreditacion.norma_acreditable na
inner join programa p on na.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where gru_codigo = 18

select * from acreditacion.norma_nivel_academico nna where nna.noa_codigo = 1

select * from acreditacion.norma_criterio nc

SELECT * from acreditacion.norma_criterio nc 
inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo 
inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigoinner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo
where nc.noc_estado = 1 and nc.nna_codigo = 15





Select pro_codigo, pre_codigo, pre_nombre, pro_titulo_otorgado, pro_registro_icfes, 
pro_registro_snies, pro_calendario, pro_horario, pro_fecha_creacion, pro_extension_snies, 
pro_propio, pro_creacion_snies, p.uaa_codigo, ua.uaa_estado, ua.uaa_nombre, u.uaa_nombre as dependencia, 
ua.uaa_dependencia, ua.uaa_nombre_corto, p.sed_codigo, sed_nombre, p.mod_codigo,mod_nombre, p.nia_codigo, 
floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) as tiempo, 
nat.nat_nombre, nia_nombre, nia_estado, CASE WHEN ca.coa_codigo is not null THEN 'SI' ELSE 'NO' END AS comite from programa p 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
inner join uaa u on ua.uaa_dependencia = u.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.comite_autoevaluacion ca on p.uaa_codigo = ca.uaa_codigo 
where p.nia_codigo = 13 and pro_creacion_snies is not null and ua.uaa_estado = 1 and pre_codigo = 1 and floor((cast(convert(varchar(8), getdate(), 112) as int)-cast(convert(varchar(8), pro_creacion_snies, 112) as int)) / 10000) >= 8

select * from notas_total

SELECT * FROM acreditacion.norma_nivel_academico

select * from acreditacion.norma_criterio nc inner join acreditacion.norma_nivel_academico nna  on nc.nna_codigo = nna.nna_codigo inner join acreditacion.norma_acreditacion na on na.noa_codigo = nna.noa_codigo inner join nivel_academico niv on niv.nia_codigo = nna.nia_codigo where nc.noc_estado = 1 and nc.nna_codigo = 13 and nna.nna_estado != 0



select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.invitacion_programa_acreditable where ipa_hash = '466cfb0b4fec46c69d6cd2196e305c54'



SELECT *,(select uaa_nombre from uaa where uaa_codigo = ua.uaa_dependencia) as dependencia, null as tiempo,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as nombre_jefe_programa,
(select top 1 pr.per_nombre +' '+pr.per_apellido as nombres  from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as apellido_jefe_programa,
(select top 1 pr.per_email_interno from programa p 
inner join uaa u2 on p.uaa_codigo = u2.uaa_codigo 
inner JOIN usuario_grupo ug on ug.usg_uaa = u2.uaa_codigo 
inner JOIN usuario_docente ud on ud.uid = ug.usg_usuario 
inner join persona pr on pr.per_codigo= ud.up
where ug.usg_grupo = 34 and ug.usg_estado = 1 and ud.gru_nombre = 'Jefe de Programa' and u2.uaa_codigo = ua.uaa_codigo) as per_email_interno, na.nia_nombre as formacion 
from acreditacion.norma_acreditable nac 
join  acreditacion.grupos_acreditables gru on nac.gru_codigo = gru.gru_codigo 
join programa p on nac.pro_codigo = p.pro_codigo 
INNER JOIN uaa ua on p.uaa_codigo = ua.uaa_codigo 
INNER JOIN sede s on s.sed_codigo = p.sed_codigo 
INNER JOIN programa_estado pe on pe.pre_codigo = p.pro_estado 
INNER JOIN nivel_academico na on na.nia_codigo = p.nia_codigo 
Inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo INNER JOIN modalidad m on m.mod_codigo = p.mod_codigo 
left join acreditacion.invitacion_programa_acreditable ipa on p.pro_codigo = ipa.pro_codigo and gru.gru_codigo = ipa.gru_codigo
join acreditacion.norma_acreditacion n on n.noa_codigo = gru.noa_codigo 
where gru.gru_codigo = 18


SELECT * FROM acreditacion.grupos_acreditables ga 

SELECT * FROM acreditacion. 

select * from proyectos.investigadorexternoxgrupo i  

select count(*) from acreditacion.norma_acreditable na where gru_codigo = 18


INSERT INTO academia3000_john.acreditacion.invitacion_programa_acreditable (gru_codigo, pro_codigo, ipa_fecha_envio, ipa_fecha_respuesta, ipa_hash, ipa_estado) VALUES(17, 383, '2022-10-12', NULL, N'499523da3d514f82837f003dccdc081c', 1);

select pe.per_nombre, pe.per_apellido, pe.per_codigo, p.pro_codigo, pe.per_email_interno, ug.up, u.uaa_nombre, ug.gru_nombre, 
CASE WHEN ug.usg_estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END AS usg_estado from usuario_docente ug inner join uaa u on ug.usg_uaa = u.uaa_codigo inner join programa p on u.uaa_codigo = p.uaa_codigo inner join persona pe on ug.up = pe.per_codigo where p.pro_codigo = 8 and ug.usg_grupo = 34 order by ug.usg_estado desc 


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.matriculados_acreditacion ma 


-- VISTA MATRICULADOS PARA ACREDITACION
CREATE VIEW [acreditacion].[matriculados_acreditacion] AS
SELECT mat.mat_codigo, mat.mat_observacion, mat.mat_cliente, pe.per_a�o AS anio, pe.per_nombre AS periodo, sed.sed_nombre, nat.nat_nombre as nivel_academico,
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
WHERE ple.ple_estado = 1 AND mat.mat_estado= 'A'

select count(*) from acreditacion.matriculados_acreditacion ma where ma.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio >= 2022

select count(*) from acreditacion.inscritos_acreditacion ia where ia.anio >= 2022

select count(*) from acreditacion.admitidos_acreditacion aa where aa.anio 

select * from uaa_personal up where up.per_codigo = 108797


select * from acreditacion.invitacion_programa_acreditable ipa 

select * from acreditacion.informe_chequeo_programa icp 

select * from acreditacion.informe_chequeo_institucion ici

select * from acreditacion.informe_general_programa igp 

select u.uaa_codigo, p.pro_codigo, uf.uaa_nombre as facultad, mu.mun_nombre, d.dep_nombre, p.pro_creacion_snies,
CASE WHEN pro_registro_snies > 1 or pro_registro_snies != null THEN 'ACTIVO' ELSE 'DESACTIVO' END AS estado ,
CASE WHEN pro_estado = 01 THEN 'SI' ELSE 'NO' END AS oferta,
p.pro_creacion_snies, p.pro_fecha_creacion, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.pro_creacion_snies ,112) as int) ) / 10000) as vigencia,
p.pro_registro_snies, p.pro_registro_icfes, u.uaa_nombre, p.pro_titulo_otorgado, s.sed_nombre, 
m.mod_nombre, j.jor_nombre, c.con_descripcion, pe.pre_nombre, r.res_numero, tn.tin_nombre, nat.nat_nombre, na.nia_nombre, sn.nbc_nombre, 
sa.sar_nombre, ca.cam_nombre, ca.cam_codigo, ce.cam_esp_nombre, ce.cam_esp_codigo, cd.cam_det_nombre, cd.cam_det_codigo, (select top 1 pla_total_creditos from plan_academico where pro_codigo = p.pro_codigo order by pla_codigo desc ) as creditos, 
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
where ca2.uaa_codigo = p.uaa_codigo and ica.ica_roll = 'COORDINADOR DE AUTOEVALUACI�N' and ica.ica_estado = 1) as coordinador 
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
where p.pro_codigo = 383



select * from acreditacion.aprobacion_informe_programa aip 


select * from acreditacion.aprobacion_informe_programa where pro_codigo = 383 and igp_codigo = 1


select * from acreditacion.informe_chequeo_institucion ici 


DECLARE @T TABLE (
     col1 float,
     col2 int
 );
    
 INSERT INTO @T VALUES
 (1.5,8),
 (1.5,1),
 (2.0,1),
 (3.0,1),
 (4.5,1),
 (4.5,2),
 (5.0,3),
 (6.0,4);   
 SELECT col1, col2 FROM @T order by col1 asc, col2 DESC
 
 SELECT * FROM persona p WHERE p.per_apellido like '%FAJARDO OROZCO%' 
