--************************************--
--*CARNETIZACION PUESTO DE VIGILANCIA*--
--************************************--

select * from modulo m 

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Control Acceso', 'Módulo que gestiona el registro de ingreso y salida de los diferentes peustos de acceso la institución', '2023-02-24 15:45:08.230', 1);

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

-------------------------
--TABLAS Y DISPARADORES--
-------------------------

--TABLA ACCESO
--CREATE TABLE academia3000_john.carnetizacion.acceso (
	acc_codigo int IDENTITY(1,1) NOT NULL,
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


--TABLA CONTROL ACCESO TIPO
--CREATE TABLE academia3000_john.carnetizacion.control_acceso_tipo (
	cat_codigo int IDENTITY(1,1) NOT NULL,
	cat_nombre varchar(50) NOT NULL,
	cat_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT control_acceso_tipo_PK PRIMARY KEY (cat_codigo),
);
--INSERT INTO carnetizacion.control_acceso_tipo (cat_nombre) VALUES('INGRESO');
--INSERT INTO carnetizacion.control_acceso_tipo (cat_nombre) VALUES('SALIDA');

select * from carnetizacion.control_acceso_tipo cat 


--TABLA CONTROL ACCESO
--CREATE TABLE academia3000_john.carnetizacion.control_acceso (
	coa_codigo int IDENTITY(1,1) NOT NULL,
	coa_identificacion varchar(15) NOT NULL,
	coa_usuario_tipo int NOT NULL,
	puv_codigo int NOT NULL,
	cat_codigo int NOT NULL,
	coa_fecha_acceso datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT control_acceso_PK PRIMARY KEY (coa_codigo),
	CONSTRAINT control_acceso_FK_puesto_vigilancia FOREIGN KEY (puv_codigo) REFERENCES academia3000_john.carnetizacion.puesto_vigilancia(puv_codigo),
	CONSTRAINT control_acceso_FK_control_acceso_tipo FOREIGN KEY (cat_codigo) REFERENCES academia3000_john.carnetizacion.control_acceso_tipo(cat_codigo)
);

select * from carnetizacion.control_acceso

select * from carnetizacion.ticket_visitante tv 

select * from carnetizacion.inicio_sesion_vigilante isv where isv.id = '36306400'


select * from carnetizacion.puesto_vigilancia pv 

INSERT INTO academia3000_john.carnetizacion.control_acceso
(coa_identificacion, coa_usuario_tipo, puv_codigo, cat_codigo, coa_fecha_acceso)
VALUES(NULL, NULL, NULL, NULL, NULL);


select * from sede s 
select * from uaa u where u.uaa_nombre_corto like '%FACULTAD%' 

-------------------------
-------CONSULTAS---------
-------------------------

select * from modulo m 

SELECT * FROM carnetizacion.vigilantes v 

select * from carnetizacion.vigilante v where

select * from carnetizacion.control_acceso ca 
select * from carnetizacion.control_acceso_tipo cat 

SELECT wep_valor FROM dbo.web_parametro wp where wp.wep_codigo = 377

select top 1 * from carnetizacion.vigilante v 
inner join tipo_id ti on v.tii_codigo = ti.tii_codigo 
inner join carnetizacion.asignacion_puesto ap on v.vig_codigo = ap.vig_codigo 
inner join carnetizacion.puesto_vigilancia pv on ap.puv_codigo = pv.puv_codigo 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
where v.vig_estado = 1 and pv.puv_estado = 1 and v.vig_identificacion = '777333777'


select * from 

CREATE VIEW [carnetizacion].[vigilantes] AS
select v.vig_codigo, v.tii_codigo, ti.tii_nombre, ti.tii_nombre_corto, ti.snies_codigo, v.vig_identificacion, v.vig_nombre, v.vig_apellido, v.vig_email, v.vig_empresa, v.vig_fecha_creacion, 
v.vig_fecha_retiro, v.vig_estado, ap.asp_codigo, s.sed_codigo, s.sed_nombre, ss.sus_codigo, ss.sus_nombre, 
ss.sus_direccion, b.blo_codigo, b.blo_nombre, pv.puv_codigo, pv.puv_nombre, pv.puv_fecha_creacion, pv.puv_fecha_cierre, pv.puv_cupo_carro, 
pv.puv_cupo_moto, pv.puv_cupo_bicicleta, pv.puv_cupo_vigilante, pv.puv_estado, pv.pvt_codigo, pvt.pvt_nombre, pvt.pvt_estado from carnetizacion.vigilante v
inner join tipo_id ti on v.tii_codigo = ti.tii_codigo 
inner join carnetizacion.asignacion_puesto ap on v.vig_codigo = ap.vig_codigo 
inner join carnetizacion.puesto_vigilancia pv on ap.puv_codigo = pv.puv_codigo 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
				