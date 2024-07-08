--********************************--
--******COMPONENTE PERSONA********--
--********************************--

---------------------------
---TABLA SEXO BIOLOGICO----
---------------------------
select * from dbo.sexo_biologico sb  
--CREACIÓN
CREATE TABLE dbo.sexo_biologico (
    seb_codigo INT IDENTITY(1,1) PRIMARY KEY,
    seb_nombre NVARCHAR(10) NOT NULL,
    seb_estado INT DEFAULT 1 NOT NULL
);
INSERT INTO dbo.sexo_biologico
(seb_nombre)
VALUES('MASCULINO');
INSERT INTO dbo.sexo_biologico
(seb_nombre)
VALUES('FEMENINO');
INSERT INTO dbo.sexo_biologico
(seb_nombre)
VALUES('NO BINARIO');
INSERT INTO dbo.sexo_biologico
(seb_nombre)
VALUES('TRANS');

---------------------------
-------ESTADO CIVIL--------
---------------------------
select * from estado_civil ec 
--CREACIÓN
CREATE TABLE dbo.estado_civil (
    esc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    esc_nombre NVARCHAR(50) NOT NULL,
    esc_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('SOLTERO(A)');
INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('CASADO(A)');
INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('DIVORCIADO(A)');
INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('VIUDO(A)');
INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('UNIÓN LIBRE');
INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('RELIGIOSO(A)');
INSERT INTO dbo.estado_civil
(esc_nombre)
VALUES('SEPARADO(A)'); 

---------------------------
-------TABLA ESTRATO-------
---------------------------
select * from estrato

--POSTGRE SQL
CREATE TABLE dbo.estrato (
    est_codigo INT PRIMARY KEY,
    est_nombre NVARCHAR(50) NOT NULL,
    est_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(0, 'NO INFORMA');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(1, 'BAJO-BAJO');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(2, 'BAJO');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(3, 'MEDIO-BAJO');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(4, 'MEDIO');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(5, 'MEDIO-ALTO');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(6, 'ALTO');
INSERT INTO dbo.estrato
(est_codigo, est_nombre)
VALUES(7, 'SIN ESTRATO');


---------------------------
--TABLA TIPO DE DOCUMENTO--
---------------------------
select * from dbo.tipo_identificacion ti  

--POSTGRE SQL
CREATE TABLE dbo.tipo_identificacion (
    tii_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tii_nombre NVARCHAR(50),
    tii_nombre_corto NVARCHAR(4) NOT NULL,
    tii_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('CÉDULA DE CIUDADANÍA', 'CC');
INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('DOCUMENTO DE IDENTIDAD EXTRANJERA', 'DE');
INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('CÉDULA DE EXTRANJERÍA', 'CE');
INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('TARJETA DE IDENTIDAD', 'TI');
INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('PASAPORTE', 'PS');
INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('CERTIFICADO CABILDO', 'CA');
INSERT INTO dbo.tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('PPT-PERMISO POR PROTECCIÓN TEMPORAL', 'PT');

-------------------------------
-------TABLA GRUPO ÉTNICO------
-------------------------------
select * from dbo.grupo_etnico

--POSTGRE SQL
CREATE TABLE dbo.grupo_etnico (
    gre_codigo INT PRIMARY KEY,
    gre_nombre NVARCHAR(50) NOT NULL,
    gre_estado INT DEFAULT 1 NOT NULL
);
INSERT INTO dbo.grupo_etnico
(gre_codigo, gre_nombre)
VALUES(0, 'NO INFORMA');
INSERT INTO dbo.grupo_etnico
(gre_codigo, gre_nombre)
VALUES(1, 'PUEBLO INDÍGENA');
INSERT INTO dbo.grupo_etnico
(gre_codigo, gre_nombre)
VALUES(2, 'COMUNIDAD NEGRA');
INSERT INTO dbo.grupo_etnico
(gre_codigo, gre_nombre)
VALUES(3, 'PUEBLO RROM');
INSERT INTO dbo.grupo_etnico
(gre_codigo, gre_nombre)
VALUES(4, 'NO PERTENECE');

--------------------------------
-----TABLA PUEBLO INDIGENA------
--------------------------------
select * from general.pueblo_indigena  

CREATE TABLE dbo.pueblo_indigena (
    pui_codigo INT PRIMARY KEY,
    pui_nombre NVARCHAR(50) NOT NULL,
    pui_estado INT DEFAULT 1 NOT NULL
);
--------------------------------
-----TABLA COMUNIDAD NEGRA------
--------------------------------
select * from dbo.comunidad_negra  

CREATE TABLE comunidad_negra (
    con_codigo INT PRIMARY KEY,
    con_nombre NVARCHAR(50) NOT NULL,
    con_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO dbo.comunidad_negra
(con_codigo, con_nombre)
VALUES(0, 'NO APLICA');
INSERT INTO dbo.comunidad_negra
(con_codigo, con_nombre)
VALUES(1, 'AFROCOLOMBIANOS');
INSERT INTO dbo.comunidad_negra
(con_codigo, con_nombre)
VALUES(2, 'RAIZALES');
INSERT INTO dbo.comunidad_negra
(con_codigo, con_nombre)
VALUES(3, 'PALENQUEROS');
INSERT INTO dbo.comunidad_negra
(con_codigo, con_nombre)
VALUES(4, 'OTRAS COMUNIDADES NEGRAS');

-----------------------------------------
-----TABLA PERSONA CON DISCAPACIDAD------
-----------------------------------------
select * from general.persona_discapacidad  

--POSTGRE SQL
CREATE TABLE dbo.persona_discapacidad (
    ped_codigo INT IDENTITY(1,1) PRIMARY KEY,
    ped_condicion CHAR(2) NOT NULL,
    ped_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO dbo.persona_discapacidad
(ped_condicion)
VALUES('SI');
INSERT INTO dbo.persona_discapacidad
(ped_condicion)
VALUES('NO');


-----------------------------------------
-----TABLA PERSONA CON DISCAPACIDAD------
-----------------------------------------
select * from dbo.discapacidad_tipo  

CREATE TABLE dbo.discapacidad_tipo (
    dit_codigo INT PRIMARY KEY,
    dit_nombre NVARCHAR(100) NOT NULL,
    dit_estado INT DEFAULT 1 NOT NULL
);

-----------------------------------------
-----TABLA TALENTO EXCEPCIONAL------
-----------------------------------------
select * from dbo.talento_excepcional  

--POSTGRE SQL
CREATE TABLE talento_excepcional (
    tae_codigo INT PRIMARY KEY,
    tae_nombre NVARCHAR(100) NOT NULL,
    tae_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO dbo.talento_excepcional
(tae_codigo, tae_nombre)
VALUES(0, 'NO APLICA');
INSERT INTO dbo.talento_excepcional
(tae_codigo, tae_nombre)
VALUES(1, 'TALENTO EXCEPCIONAL GENERAL');
INSERT INTO dbo.talento_excepcional
(tae_codigo, tae_nombre)
VALUES(2, 'TALENTO EXCEPCIONAL ESPECÍFICO');


---------------------------
--TABLA GRUPO SANGUINEO----
---------------------------
select * from grupo_sanguineo gs 

--POSTGRE SQL
CREATE TABLE dbo.grupo_sanguineo (
    grs_codigo INT IDENTITY(1,1) PRIMARY KEY,
    grs_nombre NVARCHAR(50) NOT NULL,
    grs_estado INT DEFAULT 1 NOT NULL
);


---------------------------
-------TABLA PERSONA-------
---------------------------
select * from persona p 


select * from persona_discapacidad pd 

--POSTGRE SQL
CREATE TABLE dbo.persona (
    per_codigo INT IDENTITY(1,1) PRIMARY KEY,
    per_identificacion NVARCHAR(15) NOT NULL,
    tii_codigo INT NOT NULL,
    per_libreta_militar NVARCHAR(15),
    per_apellido NVARCHAR(50),
    per_nombre NVARCHAR(50),
    seb_codigo INT NOT NULL,
    per_lugar_expedicion NVARCHAR(8),
    per_fecha_expedicion DATE,
    per_fecha_nacimiento DATE,
    per_direccion_residencia NVARCHAR(255),
    per_telefono_movil NVARCHAR(50),
    per_telefono_fijo NVARCHAR(30),
    esc_codigo INT NOT NULL,
    per_lugar_nacimiento NVARCHAR(8),
    est_codigo INT NOT NULL,
    per_pais_residencia INT,
    per_departamento_residencia NVARCHAR(2),
    per_municipio_residencia NVARCHAR(5),
    per_lugar_residencia NVARCHAR(8),
    per_barrio NVARCHAR(50),
    per_numero_afiliacion_eps NVARCHAR(20),
    per_ips_sisben NVARCHAR(200),
    gre_codigo INT NOT NULL,
    pui_codigo INT,
    con_codigo INT,
    ped_codigo INT,
    dit_codigo INT,
    tae_codigo INT,
    per_familiar_direccion NVARCHAR(255),
    per_familiar_nombre NVARCHAR(60),
    per_familiar_email NVARCHAR(100),
    per_familiar_telefono NVARCHAR(30),
    per_familiar_lugar_residencia NVARCHAR(8),
    per_email NVARCHAR(100),
    per_email_interno NVARCHAR(100),
    grs_codigo INT NOT NULL,
    per_estado INT DEFAULT 1 NOT NULL,
    per_fecha_registro DATETIME DEFAULT GETDATE(),
    CONSTRAINT persona_FK_tipo_identificacion FOREIGN KEY (tii_codigo) REFERENCES tipo_identificacion(tii_codigo),
    CONSTRAINT persona_FK_grupo_sanguineo FOREIGN KEY (grs_codigo) REFERENCES grupo_sanguineo(grs_codigo),
    CONSTRAINT persona_FK_sexo_biologico FOREIGN KEY (seb_codigo) REFERENCES sexo_biologico(seb_codigo),
    CONSTRAINT persona_FK_estrato FOREIGN KEY (est_codigo) REFERENCES estrato(est_codigo),
    CONSTRAINT persona_FK_grupo_etnico FOREIGN KEY (gre_codigo) REFERENCES grupo_etnico(gre_codigo),
    CONSTRAINT persona_FK_pueblo_indigena FOREIGN KEY (pui_codigo) REFERENCES pueblo_indigena(pui_codigo),
    CONSTRAINT persona_FK_comunidad_negra FOREIGN KEY (con_codigo) REFERENCES comunidad_negra(con_codigo),
    CONSTRAINT persona_FK_persona_discapacidad FOREIGN KEY (ped_codigo) REFERENCES persona_discapacidad(ped_codigo),
    CONSTRAINT persona_FK_discapacidad_tipo FOREIGN KEY (dit_codigo) REFERENCES discapacidad_tipo(dit_codigo),
    CONSTRAINT persona_FK_talento_excepcional FOREIGN KEY (tae_codigo) REFERENCES talento_excepcional(tae_codigo),
    CONSTRAINT persona_FK_estado_civil FOREIGN KEY (esc_codigo) REFERENCES estado_civil(esc_codigo)
);


--INSERT INTO dbo.persona
(per_identificacion, tii_codigo, per_libreta_militar, per_apellido, per_nombre, seb_codigo, per_lugar_expedicion, per_fecha_expedicion, per_fecha_nacimiento, per_direccion_residencia, per_telefono_movil, per_telefono_fijo, esc_codigo, per_lugar_nacimiento, est_codigo, per_pais_residencia, per_departamento_residencia, per_municipio_residencia, per_lugar_residencia, per_barrio, per_numero_afiliacion_eps, per_ips_sisben, gre_codigo, pui_codigo, con_codigo, ped_codigo, dit_codigo, tae_codigo, per_familiar_direccion, per_familiar_nombre, per_familiar_telefono, per_familiar_lugar_residencia, per_email, per_email_interno, grs_codigo, per_estado, per_fecha_registro)
VALUES('1075303330', 1, NULL, 'GUERRERO CORDOBA', 'JOHN DAVID', 1, '41001', '2023-08-19', '1997-03-14', 'asdasd', '6088635210', '3165380816', 1, NULL, 1, 43, '41', '41001', '41001000', 'asdasd', NULL, NULL, 0, 0, 0, 2, 0, 0, '3165380816', 'Sandra Milena', '6088635210', '41001', 'guerrerocordobajohn@gmail.com', 'guerrerocordobajohn@gmail.com', 1, 1, '2023-08-19 06:33:32.560');

select * from persona p 