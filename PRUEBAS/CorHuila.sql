select * from tipo_id ti 
select * from grupo_sanguineo gs 
select * from usuario_tipo ut 

select * from usuario_administrativos 

select * from snies_genero sg

select * from estado_civil ec 

select * from usuario u 
select * from usuario_grupo ug
select * from usuario_estudiantes ue 
select * 

select * from municipio m 
select * from departamento d 

select * from pais p 

CREATE TABLE estado_civil (
	esc_codigo int IDENTITY(1,1) NOT NULL,
	esc_nombre char(50) NULL,
	snies_codigo int NULL,
	CONSTRAINT PK_estado_civil PRIMARY KEY (esc_codigo)
);

---------------------------
--------TABLA PAIS---------
---------------------------
select * from pais p 

--SQL SERVER
CREATE TABLE pais (
	pai_codigo int IDENTITY(1,1) NOT NULL,
	pai_acronimo char(2) NOT NULL,
	pai_nombre varchar(100) NOT NULL,
	CONSTRAINT PK_pais PRIMARY KEY (pai_codigo)
);

--POSTGRE SQL
CREATE TABLE pais (
    pai_codigo SERIAL PRIMARY KEY,
    pai_acronimo char(2) NOT NULL,
    pai_nombre varchar(100) NOT NULL
);


---------------------------
----TABLA DEPARTAMENTO-----
---------------------------
select * from departamento d 

--SQL SERVER
CREATE TABLE departamento (
	dep_codigo int IDENTITY(1,1) NOT NULL,
	dep_acronimo char(2) NULL,
	dep_nombre varchar(100) NOT NULL,
	pai_codigo int NOT NULL,
	CONSTRAINT PK_departamento PRIMARY KEY (dep_codigo),
	CONSTRAINT FK_departamento_pais FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo)
);

--POSTGRE SQL
CREATE TABLE departamento (
    dep_codigo SERIAL PRIMARY KEY,
    dep_acronimo char(2),
    dep_nombre varchar(100) NOT NULL,
    pai_codigo int NOT NULL,
    CONSTRAINT FK_departamento_pais FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo)
);

------------------------
----TABLA MUNICIPIO-----
------------------------
select * from municipio m  

--SQL SERVER
CREATE TABLE academia3000_john.dbo.municipio (
	mun_codigo int IDENTITY(1,1) NOT NULL,
	mun_id char(5) NULL,
	mun_nombre varchar(100) NOT NULL,
	dep_codigo int NOT NULL,
	sippa_mun_codigo int NULL,
	SNIES_codigo char(5) NULL,
	dane_codigo char(10) NULL,
	CONSTRAINT PK_municipio PRIMARY KEY (mun_codigo)
);

--POSTGRE SQL
CREATE TABLE departamento (
    dep_codigo SERIAL PRIMARY KEY,
    dep_acronimo char(2),
    dep_nombre varchar(100) NOT NULL,
    pai_codigo int NOT NULL,
    CONSTRAINT FK_departamento_pais FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo)
);


---------------------------
--TABLA TIPO DE DOCUMENTO--
---------------------------
select * from tipo_id ti 

--SQL SERVER
CREATE TABLE academia3000_john.dbo.tipo_identificacion (
	tii_codigo int IDENTITY(1,1) NOT NULL,
	tii_nombre varchar(50) NULL,
	tii_nombre_corto varchar(4) NULL,
	snies_codigo varchar(3) NULL,
	CONSTRAINT PK_tipo_identificacion PRIMARY KEY (tii_codigo)
);

--POSTGRE SQL
CREATE TABLE tipo_identificacion (
    tii_codigo SERIAL PRIMARY KEY,
    tii_nombre varchar(50),
    tii_nombre_corto varchar(4),
    snies_codigo varchar(3)
);

---------------------------
--TABLA GRUPO SANGUINEO----
---------------------------
select * from grupo_sanguineo gs 

--SQL SERVER
CREATE TABLE general.grupo_sanguineo (
	grs_codigo int IDENTITY(1,1) NOT NULL,
	grs_nombre varchar(50) NOT NULL,
	grs_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT PK_grupo_sanguineo PRIMARY KEY (grs_codigo)
);

--POSTGRE SQL
CREATE TABLE grupo_sanguineo (
    grs_codigo SERIAL PRIMARY KEY,
    grs_nombre varchar(50) NOT NULL,
    grs_estado int NULL
);

---------------------------
-------TABLA PERSONA-------
---------------------------
select * from persona p 

--SQL SEERVER
CREATE TABLE academia3000_john.dbo.persona (
	per_codigo int IDENTITY(1,1) NOT NULL,
	per_identificacion varchar(15) NOT NULL,
	tii_codigo int NOT NULL,
	per_libreta_militar varchar(15) NULL,
	per_apellido varchar(40) NULL,
	per_nombre varchar(40) NULL,
	per_genero char(1) NULL,
	per_lugar_expedicion int DEFAULT 1124 NULL,
	per_fecha_expedicion date NULL,
	per_fecha_nacimiento date NULL,
	per_direccion_residencia varchar(255) NULL,
	per_telefono_movil varchar(50) NULL,
	per_telefono_fijo varchar(30) NULL,
	per_estado_civil char(1) NULL,
	per_lugar_nacimiento int DEFAULT 1124 NULL,
	per_lugar_residencia int DEFAULT 1124 NULL,
	per_departamento_residencia int NULL,
	per_pais_residencia int DEFAULT 21 NULL,
	per_barrio varchar(50) NULL,
	per_estrato tinyint NULL,
	eps_codigo int NULL,
	per_numero_afiliacion_eps varchar(20) NULL,
	per_ips_sisben varchar(200) NULL,
	per_id_cotizante varchar(15) NULL,
	per_familiar_direccion varchar(255) NULL,
	per_familiar_nombre varchar(60) NULL,
	per_familiar_telefono varchar(30) NULL,
	per_familiar_lugar_residencia int NULL,
	per_email varchar(100) NULL,
	per_email_interno varchar(100) NULL,
	grs_codigo int NULL,
	per_estado tinyint DEFAULT 1 NULL,
	per_fecha_registro datetime DEFAULT getdate() NULL,
	per_fecha_actualizacion datetime DEFAULT getdate() NULL,
	CONSTRAINT PK_persona PRIMARY KEY (per_codigo),
	CONSTRAINT persona_FK_tipo_identificacion FOREIGN KEY (tii_codigo) REFERENCES tipo_identificacion(tii_codigo),
	CONSTRAINT persona_FK_grupo_sanguineo FOREIGN KEY (grs_codigo) REFERENCES grupo_sanguineo(grs_codigo)
);

--POSTGRE SQL
CREATE TABLE academia3000_john.persona (
    per_codigo SERIAL PRIMARY KEY,
    per_identificacion varchar(15) NOT NULL,
    tii_codigo int NOT NULL,
    per_libreta_militar varchar(15),
    per_apellido varchar(40),
    per_nombre varchar(40),
    per_genero char(1),
    per_lugar_expedicion int DEFAULT 1124,
    per_fecha_expedicion date,
    per_fecha_nacimiento date,
    per_direccion_residencia varchar(255),
    per_telefono_movil varchar(50),
    per_telefono_fijo varchar(30),
    per_estado_civil char(1),
    per_lugar_nacimiento int DEFAULT 1124,
    per_lugar_residencia int DEFAULT 1124,
    per_departamento_residencia int,
    per_pais_residencia int DEFAULT 21,
    per_barrio varchar(50),
    per_estrato smallint,
    eps_codigo int,
    per_numero_afiliacion_eps varchar(20),
    per_ips_sisben varchar(200),
    per_id_cotizante varchar(15),
    per_familiar_direccion varchar(255),
    per_familiar_nombre varchar(60),
    per_familiar_telefono varchar(30),
    per_familiar_lugar_residencia int,
    per_email varchar(100),
    per_email_interno varchar(100),
    grs_codigo int,
    per_estado smallint DEFAULT 1,
    per_fecha_registro timestamp DEFAULT now(),
    per_fecha_actualizacion timestamp DEFAULT now(),
    CONSTRAINT persona_FK_tipo_identificacion FOREIGN KEY (tii_codigo) REFERENCES tipo_identificacion(tii_codigo),
    CONSTRAINT persona_FK_grupo_sanguineo FOREIGN KEY (grs_codigo) REFERENCES grupo_sanguineo(grs_codigo)
);
