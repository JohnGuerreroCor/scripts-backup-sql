-------------------------
-------CONSULTAS---------
-------------------------

select * from carnetizacion.usuario_carnetizacion_control_acceso_admon_login uca 
inner join uaa u on u.uaa_codigo = uca.usg_uaa 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on p.per_codigo = uca.up 
where  us = 'a1075303330' 


select  top 1 * from carnetizacion.usuario_carnet_digital_login ucdl
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo
inner join sede s on s.sed_codigo = u.sed_codigo
inner join persona p on ucdl.up = p.per_codigo
where  ucdl.us = 'a1075303330' order by ucdl.usg_codigo, istipo desc

select * from estudiante e where e.per_codigo = 108797

Select *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where e.est_codigo = '20142128896'

select * from matricula m 

select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 108797

Select top 1 *, floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8), p.per_fecha_nacimiento ,112) as int) ) / 10000) as edad from carnetizacion.usuario_carnet_digital_login ucd 
inner join estudiante e on REPLACE(ucd.us, 'u', '') = e.est_codigo  
inner join persona p on e.per_codigo = p.per_codigo 
inner join grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
inner join tipo_id ti on p.tii_codigo = ti.tii_codigo 
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
inner join sede s on pr.sed_codigo = s.sed_codigo 
where ucd.us = 'u20171157616'


select * from modulo m 

select * from carnetizacion.inicio_sesion_vigilante

select top 1 * from carnetizacion.inicio_sesion_vigilante isv where isv.id = '88884444' and isv.cise_codigo = 1 ORDER by isv_codigo DESC  

select * from token.codigo_inicio_sesion cis 

select * from token.codigo_inicio_sesion_estado cise 



SELECT * FROM carnetizacion.puesto_vigilancia_tipo pvt 
select * from sub_sede ss 

select top 1 * from carnetizacion.vigilante v 
inner join tipo_id ti on v.tii_codigo = ti.tii_codigo 
inner join carnetizacion.asignacion_puesto ap on v.vig_codigo = ap.vig_codigo 
inner join carnetizacion.puesto_vigilancia pv on ap.puv_codigo = pv.puv_codigo 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
where v.vig_estado = 1 and pv.puv_estado = 1 and v.vig_identificacion = '88884444'


select count(v.vig_codigo) from carnetizacion.vigilante v 
inner join carnetizacion.asignacion_puesto ap on v.vig_codigo = ap.vig_codigo 
inner join carnetizacion.puesto_vigilancia pv on ap.puv_codigo = pv.puv_codigo 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
where v.vig_estado = 1 and pv.puv_estado = 1 and v.vig_identificacion = '88884444'


select COUNT(ucdl.us) from carnetizacion.usuario_carnet_digital_login ucdl 
inner join uaa u on ucdl.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on ucdl.up = p.per_codigo 
where us = ? 

select * from uaa u where u.uaa_nombre like '%CENTRO%'

select pv.puv_codigo, pv.puv_nombre, pv.puv_cupo_vigilante, pv.puv_estado from carnetizacion.puesto_vigilancia pv 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
inner join carnetizacion.horario_puesto_vigilancia hpv on pv.puv_codigo = hpv.puv_codigo  
where pv.puv_estado = 1 and pv.sus_codigo = 1 and pv.pvt_codigo = 1
group by pv.puv_codigo, pv.puv_nombre, pv.puv_cupo_vigilante, pv.puv_estado 

select * from carnetizacion.vigilante v
inner join tipo_id ti on v.tii_codigo = ti.tii_codigo 
select * from tipo_id ti2 
select * from persona
select * from tercero t 

select * from dbo.tipo_id ti 

select * from modulo m 

select * from carnetizacion.vigilante v
inner join tipo_id ti on v.tii_codigo = ti.tii_codigo 
where v.vig_identificacion = '' and v.vig_estado = 1 



--***********************************************--
--*CARNETIZACION ADMINISTRADOR PUESTO VIGILANCIA*--
--***********************************************--

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Control Acceso Administrador', 'Módulo administrador de los puestos de vigilancia y vigilantes de la institución', getdate(), 1);


SELECT * FROM modulo

--CREACIÓN DEL MÓDULO
INSERT INTO dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Control Acceso Administrador', 'Módulo administrador de los puestos de vigilancia y vigilantes de la institución', getdate(), 1);

-------------------------
--TABLAS Y DISPARADORES--
-------------------------

--TABLA TIPO DE PUESTO VIGILANCIA
--CREATE TABLE carnetizacion.puesto_vigilancia_tipo (
	pvt_codigo int IDENTITY(1,1) NOT NULL,
	pvt_nombre varchar(50) NOT NULL,
	pvt_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT puesto_vigilancia_tipo_PK PRIMARY KEY (pvt_codigo),
);
--INSERT INTO carnetizacion.puesto_vigilancia_tipo (pvt_nombre) VALUES('PEATONAL');
--INSERT INTO carnetizacion.puesto_vigilancia_tipo (pvt_nombre) VALUES('VEHICULAR');
--INSERT INTO carnetizacion.puesto_vigilancia_tipo (pvt_nombre) VALUES('BICICLETAS');


--TABLA PUESTO VIGILANCIA
--CREATE TABLE carnetizacion.puesto_vigilancia (
	puv_codigo int IDENTITY(1,1) NOT NULL,
	puv_nombre varchar (200) NOT NULL,
	sed_codigo int NOT NULL,
	sus_codigo int NOT NULL,
	blo_codigo int NOT NULL,
	puv_fecha_creacion date DEFAULT getdate() NOT NULL,
	puv_fecha_cierre date NULL,
	puv_cupo_carro int NULL,
	puv_cupo_moto int NULL,
	puv_cupo_bicicleta int NULL,
	puv_cupo_vigilante int NOT NULL,
	puv_estado int DEFAULT 1 NOT NULL,
	pvt_codigo int NOT NULL,
	CONSTRAINT puesto_vigilancia_PK PRIMARY KEY (puv_codigo),
	CONSTRAINT puesto_vigilancia_FK_sede FOREIGN KEY (sed_codigo) REFERENCES academia3000_john.dbo.sede(sed_codigo),
	CONSTRAINT puesto_vigilancia_FK_subsede FOREIGN KEY (sus_codigo) REFERENCES academia3000_john.dbo.sub_sede(sus_codigo),
	CONSTRAINT puesto_vigilancia_FK_bloque FOREIGN KEY (blo_codigo) REFERENCES academia3000_john.dbo.bloque(blo_codigo),
	CONSTRAINT puesto_vigilancia_FK_tipo FOREIGN KEY (pvt_codigo) REFERENCES academia3000_john.carnetizacion.puesto_vigilancia_tipo(pvt_codigo),
);


--TABLA HORARIO PUESTO VIGILANCIA
--CREATE TABLE carnetizacion.horario_puesto_vigilancia (
	hpv_codigo int IDENTITY(1,1) NOT NULL,
	puv_codigo int NOT NULL,
	hpv_hora_apertura varchar(50) NOT NULL,
	hpv_hora_cierre varchar(50) NOT NULL,
	hpv_fecha_creacion date DEFAULT getdate() NOT NULL,
	hpv_fecha_cierre date NULL,
	dia_codigo int NOT NULL,
	hpv_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT horario_puesto_vigilancia_PK PRIMARY KEY (hpv_codigo),
	CONSTRAINT horario_puesto_vigilancia_FK_puesto FOREIGN KEY (puv_codigo) REFERENCES academia3000_john.carnetizacion.puesto_vigilancia(puv_codigo),
	CONSTRAINT horario_puesto_vigilancia_FK_dia FOREIGN KEY (dia_codigo) REFERENCES academia3000_john.dbo.dia(dia_codigo),
);


--TABLA VIGILANTE
--CREATE TABLE carnetizacion.vigilante (
	vig_codigo int IDENTITY(1,1) NOT NULL,
	tii_codigo int NOT NULL,
	vig_identificacion varchar(15) NOT NULL,
	vig_nombre varchar(60) NOT NULL,
	vig_apellido varchar(80) NOT NULL,
	vig_email varchar(50) NOT NULL,
	vig_empresa varchar(100) NOT NULL,
	vig_fecha_creacion date DEFAULT getdate() NOT NULL,
	vig_fecha_retiro date NULL,
	vig_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT vigilante_PK PRIMARY KEY (vig_codigo),
	CONSTRAINT vigilante_FK_tipo FOREIGN KEY (tii_codigo) REFERENCES academia3000_john.dbo.tipo_id(tii_codigo)
);


--TABLA ASIGMACION PUESTO
--CREATE TABLE carnetizacion.asignacion_puesto (
	asp_codigo int IDENTITY(1,1) NOT NULL,
	puv_codigo int NOT NULL,
	vig_codigo int NOT NULL,
	asp_observacion varchar(100) NOT NULL,
	asp_fecha_creacion date DEFAULT getdate() NOT NULL,
	asp_fecha_retiro date NULL,
	asp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT asignacion_puesto_PK PRIMARY KEY (vig_codigo),
	CONSTRAINT asignacion_puesto_FK_puesto FOREIGN KEY (puv_codigo) REFERENCES academia3000_john.carnetizacion.puesto_vigilancia(puv_codigo),
	CONSTRAINT asignacion_puesto_FK_vigilante FOREIGN KEY (vig_codigo) REFERENCES academia3000_john.carnetizacion.vigilante(vig_codigo)
);

--CREATE TABLE academia3000_john.carnetizacion.inicio_sesion_vigilante (
	isv_codigo int IDENTITY(1,1) NOT NULL,
	mod_codigo int NOT NULL,
	id varchar(20) NOT NULL,
	isv_token varchar(100) NOT NULL,
	isv_intento int NULL,
	cise_codigo int NULL,
	isv_ip varchar(100) NULL,
	isv_fecha_generacion datetime DEFAULT getdate() NULL,
	isv_fecha_expira datetime NULL,
	isv_fecha_fin_sesion datetime NULL,
	CONSTRAINT inicio_sesion_vigilante_PK PRIMARY KEY (isv_codigo),
	CONSTRAINT inicio_sesion_vigilante_FK_estado_inicio_sesion FOREIGN KEY (cise_codigo) REFERENCES academia3000_john.token.codigo_inicio_sesion_estado(cise_codigo),
	CONSTRAINT inicio_sesion_vigilante_FK_modulo FOREIGN KEY (mod_codigo) REFERENCES academia3000_john.dbo.modulo(mod_codigo)
);
