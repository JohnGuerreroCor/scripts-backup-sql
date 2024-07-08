---------------------------------
---- AUDITORIAS ACREDITACION ----
---------------------------------


--TABLA AUDITORIA CAMPO AMPLIO
CREATE TABLE academia3000.acreditacion.aud_campo_amplio (
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
--DISPARADOR ACREDITACION AUD CAMPO AMPLIO INSERT 
CREATE TRIGGER [acreditacion].[insert_campo_amplio] 
   ON  acreditacion.campo_amplio 
   AFTER INSERT
AS 
INSERT INTO aud_campo_amplio 
(
aud_log_type,
cam_codigo,
cam_estado,
cam_nombre,
codigo_cine
)
SELECT 'INSERT',
ins.cam_codigo,
ins.cam_estado,
ins.cam_nombre,
ins.codigo_cine
FROM inserted ins
;

--DISPARADOR ACREDITACION AUD CAMPO AMPLIO UPDATE
CREATE TRIGGER [acreditacion].[actualizar_campo_amplio]
ON
[acreditacion].[campo_amplio]
FOR update
AS
INSERT  INTO  aud_campo_amplio
(
aud_log_type, 
cam_codigo,
cam_estado,
cam_nombre,
codigo_cine 
)
SELECT 'NUEVO',
ins.cam_codigo,
ins.cam_estado,
ins.cam_nombre,
ins.codigo_cine 
from inserted ins
INSERT  INTO  aud_campo_amplio
(
aud_log_type, 
cam_codigo,
cam_estado,
cam_nombre,
codigo_cine 
)
SELECT 'VIEJO',
del.cam_codigo,
del.cam_estado,
del.cam_nombre,
del.codigo_cine 
from deleted del
;



--TABLA AUDITORIA CAMPO ESPECIFICO
CREATE TABLE academia3000.acreditacion.aud_campo_especifico (
	aud_codigo_campo_especifico bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cam_esp_codigo int NOT NULL,
	cam_esp_nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	cam_esp_estado int NOT NULL,
	cam_codigo int NOT NULL,
	codigo_cine varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_campo_especifico_PK PRIMARY KEY (aud_codigo_campo_especifico)
);
--DISPARADOR ACREDITACION AUD CAMPO ESPECIFICO INSERT 
CREATE TRIGGER [acreditacion].[insert_campo_especifico] 
   ON  acreditacion.campo_especifico 
   AFTER INSERT
AS 
INSERT INTO aud_campo_especifico 
(
aud_log_type,
cam_esp_codigo,
cam_esp_nombre,
cam_esp_estado,
cam_codigo,
codigo_cine
)
SELECT 'INSERT',
ins.cam_esp_codigo,
ins.cam_esp_nombre,
ins.cam_esp_estado,
ins.cam_codigo,
ins.codigo_cine
FROM inserted ins
;
--DISPARADOR ACREDITACION AUD CAMPO ESPECIFICO UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_campo_especifico]
ON
[acreditacion].[campo_especifico]
FOR update
AS
INSERT  INTO  aud_campo_especifico
(
aud_log_type, 
cam_esp_codigo,
cam_esp_nombre,
cam_esp_estado,
cam_codigo,
codigo_cine 
)
SELECT 'NUEVO',
ins.cam_esp_codigo,
ins.cam_esp_nombre,
ins.cam_esp_estado,
ins.cam_codigo,
ins.codigo_cine 
from inserted ins
INSERT  INTO  aud_campo_especifico
(
aud_log_type, 
cam_esp_codigo,
cam_esp_nombre,
cam_esp_estado,
cam_codigo,
codigo_cine 
)
SELECT 'VIEJO',
del.cam_esp_codigo,
del.cam_esp_nombre,
del.cam_esp_estado,
del.cam_codigo,
del.codigo_cine 
from deleted del
;



--TABLA AUDITORIA CAMPO DETALLADO
CREATE TABLE academia3000.acreditacion.aud_campo_detallado (
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
--DISPARADOR ACREDITACION AUD CAMPO DETALLADO INSERT 
CREATE TRIGGER [acreditacion].[insert_campo_detallado] 
   ON  acreditacion.campo_detallado 
   AFTER INSERT
AS 
INSERT INTO aud_campo_detallado
(
aud_log_type,
cam_det_codigo,
cam_det_estado,
cam_det_nombre,
cam_esp_codigo,
codigo_cine
)
SELECT 'INSERT',
ins.cam_det_codigo,
ins.cam_det_estado,
ins.cam_det_nombre,
ins.cam_esp_codigo,
ins.codigo_cine
FROM inserted ins
;
--DISPARADOR ACREDITACION AUD CAMPO DETALLADO UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_campo_detallado]
ON
[acreditacion].[campo_detallado]
FOR update
AS
INSERT INTO aud_campo_detallado
(
aud_log_type, 
cam_det_codigo,
cam_det_estado,
cam_det_nombre,
cam_esp_codigo,
codigo_cine 
)
SELECT 'NUEVO',
ins.cam_det_codigo,
ins.cam_det_estado,
ins.cam_det_nombre,
ins.cam_esp_codigo,
ins.codigo_cine 
from inserted ins
INSERT  INTO  aud_campo_detallado
(
aud_log_type, 
cam_det_codigo,
cam_det_estado,
cam_esp_codigo,
cam_det_nombre,
codigo_cine 
)
SELECT 'VIEJO',
del.cam_det_codigo,
del.cam_det_estado,
del.cam_esp_codigo,
del.cam_det_nombre,
del.codigo_cine 
from deleted del
;



--TABLA AUDITORIA NORMA ACREDITABLE
CREATE TABLE academia3000.acreditacion.aud_norma_acreditable (
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
--DISPARADOR ACREDITACION AUD NORMA ACREDITABLE INSERT 
CREATE TRIGGER [acreditacion].[insert_norma_acreditable] 
   ON  acreditacion.norma_acreditable 
   AFTER INSERT
AS 
INSERT INTO aud_norma_acreditable
(
aud_log_type,
nac_codigo,
nac_nombre,
pro_codigo,
nac_creacion,
nac_estado,
gru_codigo
)
SELECT 'INSERT',
ins.nac_codigo,
ins.nac_nombre,
ins.pro_codigo,
ins.nac_creacion,
ins.nac_estado,
ins.gru_codigo
FROM inserted ins
;
--DISPARADOR ACREDITACION AUD NORMA ACREDITABLE UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_norma_acreditable]
ON
[acreditacion].[norma_acreditable]
FOR update
AS
INSERT  INTO  aud_norma_acreditable
(
aud_log_type,
nac_codigo,
nac_nombre,
pro_codigo,
nac_creacion,
nac_estado,
gru_codigo
)
SELECT 'NUEVO',
ins.nac_codigo,
ins.nac_nombre,
ins.pro_codigo,
ins.nac_creacion,
ins.nac_estado,
ins.gru_codigo
from inserted ins
INSERT  INTO  aud_norma_acreditable
(
aud_log_type, 
nac_codigo,
nac_nombre,
pro_codigo,
nac_creacion,
nac_estado,
gru_codigo 
)
SELECT 'VIEJO',
del.nac_codigo,
del.nac_nombre,
del.pro_codigo,
del.nac_creacion,
del.nac_estado,
del.gru_codigo 
from deleted del
;



--TABLA AUDITORIA NORMA ACREDITACION
CREATE TABLE academia3000.acreditacion.aud_norma_acreditacion (
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
--DISPARADOR ACREDITACION AUD NORMA ACREDITACION INSERT 
CREATE TRIGGER [acreditacion].[insert_norma_acreditacion] 
   ON  acreditacion.norma_acreditacion 
   AFTER INSERT
AS 
INSERT INTO aud_norma_acreditacion
(
aud_log_type,
noa_codigo,
noa_nombre,
noa_fecha_inicio,
noa_fecha_fin,
noa_estado,
noa_ruta
)
SELECT 'INSERT',
ins.noa_codigo,
ins.noa_nombre,
ins.noa_fecha_inicio,
ins.noa_fecha_fin,
ins.noa_estado,
ins.noa_ruta
FROM inserted ins
;
--DISPARADOR ACREDITACION AUD NORMA ACREDITACION UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_norma_acreditacion]
ON
[acreditacion].[norma_acreditacion]
FOR update
AS
INSERT  INTO  aud_norma_acreditacion
(	
aud_log_type,
noa_codigo,
noa_nombre,
noa_fecha_inicio,
noa_fecha_fin,
noa_estado,
noa_ruta
)
SELECT 'NUEVO',
ins.noa_codigo,
ins.noa_nombre,
ins.noa_fecha_inicio,
ins.noa_fecha_fin,
ins.noa_estado,
ins.noa_ruta
from inserted ins
INSERT  INTO  aud_norma_acreditacion
(
aud_log_type, 
noa_codigo,
noa_nombre,
noa_fecha_inicio,
noa_fecha_fin,
noa_estado,
noa_ruta 
)
SELECT 'VIEJO',
del.noa_codigo,
del.noa_nombre,
del.noa_fecha_inicio,
del.noa_fecha_fin,
del.noa_estado,
del.noa_ruta 
from deleted del
;



--TABLA AUDITORIA NORMA CRITERIO
CREATE TABLE academia3000.acreditacion.aud_norma_criterio (
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
--DISPARADOR ACREDITACION AUD NORMA CRITERIO INSERT 
CREATE TRIGGER [acreditacion].[insert_norma_criterio] 
   ON  acreditacion.norma_criterio 
   AFTER INSERT
AS 
INSERT INTO aud_norma_criterio
(
aud_log_type,
noc_codigo,
noc_nombre,
nna_codigo,
noc_tiempo,
noc_estado
)
SELECT 'INSERT',
ins.noc_codigo,
ins.noc_nombre,
ins.nna_codigo,
ins.noc_tiempo,
ins.noc_estado
FROM inserted ins
;
--DISPARADOR ACREDITACION AUD NORMA CRITERIO UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_norma_criterio]
ON
[acreditacion].[norma_criterio]
FOR update
AS
INSERT  INTO  aud_norma_criterio
(
aud_log_type, 
noc_codigo,
noc_nombre,
nna_codigo,
noc_tiempo,
noc_estado
)
SELECT 'NUEVO',
ins.noc_codigo,
ins.noc_nombre,
ins.nna_codigo,
ins.noc_tiempo,
ins.noc_estado
from inserted ins
INSERT  INTO  aud_norma_criterio
(
aud_log_type, 
noc_codigo,
noc_nombre,
nna_codigo,
noc_tiempo,
noc_estado 
)
SELECT 'VIEJO',
del.noc_codigo,
del.noc_nombre,
del.nna_codigo,
del.noc_tiempo,
del.noc_estado 
from deleted del
;



--TABLA AUDITORIA NORMA NIVEL ACADEMICO
CREATE TABLE academia3000.acreditacion.aud_norma_nivel_academico (
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
--DISPARADOR ACREDITACION AUD NORMA NIVEL ACADEMICO INSERT 
CREATE TRIGGER [acreditacion].[insert_norma_nivel_academico] 
   ON  acreditacion.norma_nivel_academico 
   AFTER INSERT
AS 
INSERT INTO aud_norma_nivel_academico
(
aud_log_type,
nna_codigo,
nna_nombre,
nia_codigo,
noa_codigo,
nna_estado
)
SELECT 'INSERT',
ins.nna_codigo,
ins.nna_nombre,
ins.nia_codigo,
ins.noa_codigo,
ins.nna_estado
FROM inserted ins
;
--DISPARADOR ACREDITACION AUD NORMA NIVEL ACADEMICO UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_norma_nivel_academico]
ON
[acreditacion].[norma_nivel_academico]
FOR update
AS
INSERT  INTO  aud_norma_nivel_academico
(
aud_log_type,
nna_codigo,
nna_nombre,
nia_codigo,
noa_codigo,
nna_estado
)
SELECT 'NUEVO',
ins.nna_codigo,
ins.nna_nombre,
ins.nia_codigo,
ins.noa_codigo,
ins.nna_estado
from inserted ins
INSERT  INTO  aud_norma_nivel_academico
(
aud_log_type, 
nna_codigo,
nna_nombre,
nia_codigo,
noa_codigo,
nna_estado 
)
SELECT 'VIEJO',
del.nna_codigo,
del.nna_nombre,
del.nia_codigo,
del.noa_codigo,
del.nna_estado 
from deleted del
;



--TABLA AUDITORIA INSTITUCION
CREATE TABLE academia3000.acreditacion.aud_institucion (
	aud_codigo_institucion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ins_codigo int not null,
	ins_nit varchar(20),
	ins_ies int NOT NULL,
	ins_ies_padre int NOT NULL,
	ins_sector int NOT NULL,
	ins_nombre varchar(200) NOT NULL,
	ins_caracter_academico int NOT NULL,
	mun_codigo int NOT NULL,
	ins_direccion varchar(200) NOT NULL,
	ins_telefonos varchar(200) NOT NULL,
	ins_web varchar(200) NULL,
	ins_norma varchar(200) NOT NULL,
	ins_fecha_creacion date NOT NULL,
	ins_existencia int NOT NULL,
	ins_ruta varchar(200) NOT NULL,
	ins_estado int not null,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_institucion_PK PRIMARY KEY (aud_codigo_institucion)
);
--DISPARADOR ACREDITACION AUD INSTITUCION INSERT 
CREATE TRIGGER [acreditacion].[insert_institucion] 
   ON  acreditacion.institucion 
   AFTER INSERT
AS 
INSERT INTO aud_institucion
(
aud_log_type,
ins_codigo,
ins_nit,
ins_ies,
ins_ies_padre,
ins_sector,
ins_nombre,
ins_caracter_academico,
mun_codigo,
ins_direccion,
ins_telefonos,
ins_web,
ins_norma,
ins_fecha_creacion,
ins_existencia,
ins_ruta,
ins_estado
)
SELECT 'INSERT',
ins.ins_codigo,
ins.ins_nit,
ins.ins_ies,
ins.ins_ies_padre,
ins.ins_sector,
ins.ins_nombre,
ins.ins_caracter_academico,
ins.mun_codigo,
ins.ins_direccion,
ins.ins_telefonos,
ins.ins_web,
ins.ins_norma,
ins.ins_fecha_creacion,
ins.ins_existencia,
ins.ins_ruta,
ins.ins_estado
FROM inserted ins
;
--DISPARADOR ACREDITACION INSTITUCION UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_institucion]
ON
[acreditacion].[institucion]
FOR update
AS
INSERT  INTO  aud_institucion
(
aud_log_type,
ins_codigo,
ins_nit,
ins_ies,
ins_ies_padre,
ins_sector,
ins_nombre,
ins_caracter_academico,
mun_codigo,
ins_direccion,
ins_telefonos,
ins_web,
ins_norma,
ins_fecha_creacion,
ins_existencia,
ins_ruta,
ins_estado
)
SELECT 'NUEVO',
ins.ins_codigo,
ins.ins_nit,
ins.ins_ies,
ins.ins_ies_padre,
ins.ins_sector,
ins.ins_nombre,
ins.ins_caracter_academico,
ins.mun_codigo,
ins.ins_direccion,
ins.ins_telefonos,
ins.ins_web,
ins.ins_norma,
ins.ins_fecha_creacion,
ins.ins_existencia,
ins.ins_ruta,
ins.ins_estado
from inserted ins
INSERT  INTO  aud_institucion
(
aud_log_type, 
ins_codigo,
ins_nit,
ins_ies,
ins_ies_padre,
ins_sector,
ins_nombre,
ins_caracter_academico,
mun_codigo,
ins_direccion,
ins_telefonos,
ins_web,
ins_norma,
ins_fecha_creacion,
ins_existencia,
ins_ruta,
ins_estado 
)
SELECT 'VIEJO',
del.ins_codigo,
del.ins_nit,
del.ins_ies,
del.ins_ies_padre,
del.ins_sector,
del.ins_nombre,
del.ins_caracter_academico,
del.mun_codigo,
del.ins_direccion,
del.ins_telefonos,
del.ins_web,
del.ins_norma,
del.ins_fecha_creacion,
del.ins_existencia,
del.ins_ruta,
del.ins_estado 
from deleted del
;



--TABLA AUDITORIA INSTITUCION ACREDITADA
CREATE TABLE academia3000.acreditacion.aud_institucion_acreditada (
	aud_codigo_institucion_acreditada bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ina_codigo int not null,
	ins_codigo int NOT NULL,
	ina_norma varchar(200) NULL,
	ina_fecha_inicio date NOT NULL,
	ina_fecha_fin date NULL,
	ina_vigencia int NOT NULL,
	ina_ruta varchar(200) NOT NULL,
	ina_estado int not null,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_institucion_acreditada_PK PRIMARY KEY (aud_codigo_institucion_acreditada)
);
--DISPARADOR ACREDITACION AUD INSTITUCION ACREDITADA INSERT 
CREATE TRIGGER [acreditacion].[insert_institucion_acreditada] 
   ON  acreditacion.institucion_acreditada 
   AFTER INSERT
AS 
INSERT INTO aud_institucion_acreditada
(
aud_log_type,
ina_codigo,
ins_codigo,
ina_norma,
ina_fecha_inicio,
ina_fecha_fin,
ina_vigencia,
ina_ruta,
ina_estado
)
SELECT 'INSERT',
ins.ina_codigo,
ins.ins_codigo,
ins.ina_norma,
ins.ina_fecha_inicio,
ins.ina_fecha_fin,
ins.ina_vigencia,
ins.ina_ruta,
ins.ina_estado
FROM inserted ins
;
--DISPARADOR ACREDITACION INSTITUCION ACREDITADA UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_institucion_acreditada]
ON
[acreditacion].[institucion_acreditada]
FOR update
AS
INSERT  INTO  aud_institucion_acreditada
(
aud_log_type,
ina_codigo,
ins_codigo,
ina_norma,
ina_fecha_inicio,
ina_fecha_fin,
ina_vigencia,
ina_ruta,
ina_estado
)
SELECT 'NUEVO',
ins.ina_codigo,
ins.ins_codigo,
ins.ina_norma,
ins.ina_fecha_inicio,
ins.ina_fecha_fin,
ins.ina_vigencia,
ins.ina_ruta,
ins.ina_estado
from inserted ins
INSERT  INTO  aud_institucion_acreditada
(
aud_log_type,
ina_codigo,
ins_codigo,
ina_norma,
ina_fecha_inicio,
ina_fecha_fin,
ina_vigencia,
ina_ruta,
ina_estado 
)
SELECT 'VIEJO',
del.ina_codigo,
del.ins_codigo,
del.ina_norma,
del.ina_fecha_inicio,
del.ina_fecha_fin,
del.ina_vigencia,
del.ina_ruta,
del.ina_estado 
from deleted del
;



--TABLA AUDITORIA COMITE AUTOEVALUCION
CREATE TABLE academia3000.acreditacion.aud_comite_autoevaluacion (
	aud_codigo_comite_autoevaluacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	coa_codigo int not null,
	uaa_codigo int NULL,
	coa_fecha_creacion date NOT NULL,
	coa_ruta varchar(200) NOT NULL,
	coa_objetivo varchar(2500) NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_comite_autoevaluacion_PK PRIMARY KEY (aud_codigo_comite_autoevaluacion)
);
--DISPARADOR ACREDITACION AUD COMITE AUTOEVALUACION INSERT 
CREATE TRIGGER [acreditacion].[insert_comite_autoevaluacion] 
   ON  acreditacion.comite_autoevaluacion 
   AFTER INSERT
AS 
INSERT INTO aud_comite_autoevaluacion
(
aud_log_type,
coa_codigo,
uaa_codigo,
coa_fecha_creacion,
coa_ruta,
coa_objetivo
)
SELECT 'INSERT',
ins.coa_codigo,
ins.uaa_codigo,
ins.coa_fecha_creacion,
ins.coa_ruta,
ins.coa_objetivo
FROM inserted ins
;
--DISPARADOR ACREDITACION COMITE AUTOEVALUACION UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_comite_autoevaluacion]
ON
[acreditacion].[comite_autoevaluacion]
FOR update
AS
INSERT  INTO  aud_comite_autoevaluacion
(
aud_log_type,
coa_codigo,
uaa_codigo,
coa_fecha_creacion,
coa_ruta,
coa_objetivo
)
SELECT 'NUEVO',
ins.coa_codigo,
ins.uaa_codigo,
ins.coa_fecha_creacion,
ins.coa_ruta,
ins.coa_objetivo
from inserted ins
INSERT  INTO  aud_comite_autoevaluacion
(
aud_log_type,
coa_codigo,
uaa_codigo,
coa_fecha_creacion,
coa_ruta,
coa_objetivo 
)
SELECT 'VIEJO',
del.coa_codigo,
del.uaa_codigo,
del.coa_fecha_creacion,
del.coa_ruta,
del.coa_objetivo 
from deleted del
;



--TABLA AUDITORIA INTEGRANTE COMITE AUTOEVALUACION
CREATE TABLE academia3000.acreditacion.aud_integrante_comite_autoevaluacion (
	aud_codigo_integrante_comite_autoevaluacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ica_codigo int not null,
	coa_codigo int NOT NULL,
	per_codigo int NOT NULL,
	ica_ruta varchar(200) NOT NULL,
	ica_estamento varchar(200) NULL,
	ica_fecha_vinculacion date NOT NULL,
	ica_fecha_retiro date NULL,
	ica_estado int not null,
	ica_roll varchar(200) NULL,
	ica_justificacion varchar(2500) NOT NULL,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_integrante_comite_autoevaluacion_PK PRIMARY KEY (aud_codigo_integrante_comite_autoevaluacion)
);
--DISPARADOR ACREDITACION AUD INTEGRANTE COMITE AUTOEVALUACION INSERT 
CREATE TRIGGER [acreditacion].[insert_integrante_comite_autoevaluacion] 
   ON  acreditacion.integrante_comite_autoevaluacion 
   AFTER INSERT
AS 
INSERT INTO aud_integrante_comite_autoevaluacion
(
aud_log_type,
ica_codigo,
coa_codigo,
per_codigo,
ica_ruta,
ica_estamento,
ica_fecha_vinculacion,
ica_fecha_retiro,
ica_estado,
ica_roll,
ica_justificacion
)
SELECT 'INSERT',
ins.ica_codigo,
ins.coa_codigo,
ins.per_codigo,
ins.ica_ruta,
ins.ica_estamento,
ins.ica_fecha_vinculacion,
ins.ica_fecha_retiro,
ins.ica_estado,
ins.ica_roll,
ins.ica_justificacion
FROM inserted ins
;
--DISPARADOR ACREDITACION COMITE AUTOEVALUACION UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_integrante_comite_autoevaluacion]
ON
[acreditacion].[integrante_comite_autoevaluacion]
FOR update
AS
INSERT  INTO  aud_integrante_comite_autoevaluacion
(
aud_log_type,
ica_codigo,
coa_codigo,
per_codigo,
ica_ruta,
ica_estamento,
ica_fecha_vinculacion,
ica_fecha_retiro,
ica_estado,
ica_roll,
ica_justificacion
)
SELECT 'NUEVO',
ins.ica_codigo,
ins.coa_codigo,
ins.per_codigo,
ins.ica_ruta,
ins.ica_estamento,
ins.ica_fecha_vinculacion,
ins.ica_fecha_retiro,
ins.ica_estado,
ins.ica_roll,
ins.ica_justificacion
from inserted ins
INSERT  INTO  aud_integrante_comite_autoevaluacion
(
aud_log_type,
ica_codigo,
coa_codigo,
per_codigo,
ica_ruta,
ica_estamento,
ica_fecha_vinculacion,
ica_fecha_retiro,
ica_estado,
ica_roll,
ica_justificacion 
)
SELECT 'VIEJO',
del.ica_codigo,
del.coa_codigo,
del.per_codigo,
del.ica_ruta,
del.ica_estamento,
del.ica_fecha_vinculacion,
del.ica_fecha_retiro,
del.ica_estado,
del.ica_roll,
del.ica_justificacion 
from deleted del
;



--CREATE TABLE academia3000_john.acreditacion.rol_comite_autoevaluacion (
	rca_codigo int IDENTITY(1,1) NOT NULL,
	rca_nombre varchar(200) NOT NULL,
	rca_estamento varchar(200) NOT NULL,
	rca_descripcion varchar(2500) NOT NULL,
	rca_estado int DEFAULT 1 NULL,
	CONSTRAINT rol_comite_autoevaluacion_PK PRIMARY KEY (rca_codigo));
	


--TABLA AUDITORIA ROL COMITE AUTOEVALUACION
CREATE TABLE academia3000_john.acreditacion.aud_rol_comite_autoevaluacion (
	aud_codigo_rol_comite_autoevaluacion bigint IDENTITY(1,1) NOT NULL,
	aud_log_type char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	rca_codigo int not null,
	rca_nombre varchar(200) NOT NULL,
	rca_estamento varchar(200) NULL,
	rca_descripcion varchar(2500) NOT NULL,
	rca_estado int not null,
	aud_user sysname COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT suser_sname() NOT NULL,
	aud_changed datetime DEFAULT getdate() NOT NULL,
	aud_ip varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
	aud_host varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT host_name() NULL,
	CONSTRAINT aud_rol_comite_autoevaluacion_PK PRIMARY KEY (aud_codigo_rol_comite_autoevaluacion)
);
--DISPARADOR ACREDITACION AUD ROL COMITE AUTOEVALUACION INSERT 
CREATE TRIGGER [acreditacion].[insert_rol_comite_autoevaluacion] 
   ON  acreditacion.rol_comite_autoevaluacion 
   AFTER INSERT
AS 
INSERT INTO aud_rol_comite_autoevaluacion
(
aud_log_type,
rca_codigo,
rca_nombre,
rca_estamento,
rca_descripcion,
rca_estado
)
SELECT 'INSERT',
ins.rca_codigo,
ins.rca_nombre,
ins.rca_estamento,
ins.rca_descripcion,
ins.rca_estado
FROM inserted ins
;
--DISPARADOR ACREDITACION ROL COMITE AUTOEVALUACION UPDATE & DELETE
CREATE TRIGGER [acreditacion].[actualizar_rol_comite_autoevaluacion]
ON
[acreditacion].[rol_comite_autoevaluacion]
FOR update
AS
INSERT  INTO  aud_rol_comite_autoevaluacion
(
aud_log_type,
rca_codigo,
rca_nombre,
rca_estamento,
rca_descripcion,
rca_estado
)
SELECT 'NUEVO',
ins.rca_codigo,
ins.rca_nombre,
ins.rca_estamento,
ins.rca_descripcion,
ins.rca_estado
from inserted ins
INSERT  INTO  aud_rol_comite_autoevaluacion
(
aud_log_type,
rca_codigo,
rca_nombre,
rca_estamento,
rca_descripcion,
rca_estado 
)
SELECT 'VIEJO',
del.rca_codigo,
del.rca_nombre,
del.rca_estamento,
del.rca_descripcion,
del.rca_estado 
from deleted del
;



----------------- AUDITORIAS ACREDITACION -----------------------------


--CREATE TABLE academia3000_daniel.acreditacion.aud_campo_detallado (
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

--CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditable (
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

--CREATE TABLE academia3000_daniel.acreditacion.aud_norma_acreditacion (
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

--CREATE TABLE academia3000_daniel.acreditacion.aud_norma_criterio (
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

--CREATE TABLE academia3000_daniel.acreditacion.aud_norma_nivel_academico (
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

--CREATE TABLE academia3000_daniel.acreditacion.aud_grupos_acreditables (
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