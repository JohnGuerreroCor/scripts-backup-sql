--********************************--
--******COMPONENTE PERSONA********--
--********************************--

---------------------------
---TABLA SEXO BIOLOGICO----
---------------------------
select * from "general".sexo_biologico sb  
--CREACIÓN
CREATE TABLE general.sexo_biologico (
    seb_codigo SERIAL PRIMARY KEY,
    seb_nombre varchar(10) NOT NULL,
    seb_estado int DEFAULT 1 NOT NULL
);
INSERT INTO "general".sexo_biologico
(seb_nombre)
VALUES('MASCULINO');
INSERT INTO "general".sexo_biologico
(seb_nombre)
VALUES('FEMENINO');
INSERT INTO "general".sexo_biologico
(seb_nombre)
VALUES('NO BINARIO');
INSERT INTO "general".sexo_biologico
(seb_nombre)
VALUES('TRANS');

---------------------------
-------ESTADO CIVIL--------
---------------------------
select * from estado_civil ec 
--CREACIÓN
CREATE TABLE general.estado_civil (
    esc_codigo SERIAL PRIMARY KEY,
    esc_nombre varchar(50) NOT NULL,
    esc_estado int DEFAULT 1 NOT NULL
);

INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('SOLTERO(A)');
INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('CASADO(A)');
INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('DIVORCIADO(A)');
INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('VIUDO(A)');
INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('UNIÓN LIBRE');
INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('RELIGIOSO(A)');
INSERT INTO "general".estado_civil
(esc_nombre)
VALUES('SEPARADO(A)'); 

---------------------------
-------TABLA ESTRATO-------
---------------------------
select * from estrato

--POSTGRE SQL
CREATE TABLE estrato (
    est_codigo int PRIMARY KEY,
    est_nombre varchar(50) NOT NULL,
    est_estado int DEFAULT 1 NOT NULL
);

INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(0, 'NO INFORMA');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(1, 'BAJO-BAJO');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(2, 'BAJO');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(3, 'MEDIO-BAJO');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(4, 'MEDIO');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(5, 'MEDIO-ALTO');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(6, 'ALTO');
INSERT INTO "general".estrato
(est_codigo, est_nombre)
VALUES(7, 'SIN ESTRATO');


---------------------------
--TABLA TIPO DE DOCUMENTO--
---------------------------
select * from "general".tipo_identificacion ti  

--POSTGRE SQL
CREATE TABLE tipo_identificacion (
    tii_codigo SERIAL PRIMARY KEY,
    tii_nombre varchar(50),
    tii_nombre_corto varchar(4) NOT NULL,
    tii_estado int DEFAULT 1 NOT NULL
);


INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('CÉDULA DE CIUDADANÍA', 'CC');
INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('DOCUMENTO DE IDENTIDAD EXTRANJERA', 'DE');
INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('CÉDULA DE EXTRANJERÍA', 'CE');
INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('TARJETA DE IDENTIDAD', 'TI');
INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('PASAPORTE', 'PS');
INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('CERTIFICADO CABILDO', 'CA');
INSERT INTO "general".tipo_identificacion
(tii_nombre, tii_nombre_corto)
VALUES('PPT-PERMISO POR PROTECCIÓN TEMPORAL', 'PT');

-------------------------------
-------TABLA GRUPO ÉTNICO------
-------------------------------
select * from "general".grupo_etnico

--POSTGRE SQL
CREATE TABLE grupo_etnico (
    gre_codigo int PRIMARY KEY,
    gre_nombre varchar(50) NOT NULL,
    gre_estado int DEFAULT 1 NOT NULL
);
INSERT INTO "general".grupo_etnico
(gre_codigo, gre_nombre)
VALUES(0, 'NO INFORMA');
INSERT INTO "general".grupo_etnico
(gre_codigo, gre_nombre)
VALUES(1, 'PUEBLO INDÍGENA');
INSERT INTO "general".grupo_etnico
(gre_codigo, gre_nombre)
VALUES(2, 'COMUNIDAD NEGRA');
INSERT INTO "general".grupo_etnico
(gre_codigo, gre_nombre)
VALUES(3, 'PUEBLO RROM');
INSERT INTO "general".grupo_etnico
(gre_codigo, gre_nombre)
VALUES(4, 'NO PERTENECE');

--------------------------------
-----TABLA PUEBLO INDIGENA------
--------------------------------
select * from "general".pueblo_indigena  

--POSTGRE SQL
CREATE TABLE pueblo_indigena (
    pui_codigo int PRIMARY KEY,
    pui_nombre varchar(50) NOT NULL,
    pui_estado int DEFAULT 1 NOT NULL
);
--------------------------------
-----TABLA COMUNIDAD NEGRA------
--------------------------------
select * from "general".comunidad_negra  

--POSTGRE SQL
CREATE TABLE comunidad_negra (
    con_codigo int PRIMARY KEY,
    con_nombre varchar(50) NOT NULL,
    con_estado int DEFAULT 1 NOT NULL
);
INSERT INTO "general".comunidad_negra
(con_codigo, con_nombre)
VALUES(0, 'NO APLICA');
INSERT INTO "general".comunidad_negra
(con_codigo, con_nombre)
VALUES(1, 'AFROCOLOMBIANOS');
INSERT INTO "general".comunidad_negra
(con_codigo, con_nombre)
VALUES(2, 'RAIZALES');
INSERT INTO "general".comunidad_negra
(con_codigo, con_nombre)
VALUES(3, 'PALENQUEROS');
INSERT INTO "general".comunidad_negra
(con_codigo, con_nombre)
VALUES(4, 'OTRAS COMUNIDADES NEGRAS');

-----------------------------------------
-----TABLA PERSONA CON DISCAPACIDAD------
-----------------------------------------
select * from "general".persona_discapacidad  

--POSTGRE SQL
CREATE TABLE persona_discapacidad (
    ped_codigo SERIAL PRIMARY KEY,
    ped_condicion char(2) NOT NULL,
    ped_estado int DEFAULT 1 NOT NULL
);
INSERT INTO "general".persona_discapacidad
(ped_condicion)
VALUES('SI');
INSERT INTO "general".persona_discapacidad
(ped_condicion)
VALUES('NO');


-----------------------------------------
-----TABLA PERSONA CON DISCAPACIDAD------
-----------------------------------------
select * from "general".discapacidad_tipo  

--POSTGRE SQL
CREATE TABLE discapacidad_tipo (
    dit_codigo int PRIMARY KEY,
    dit_nombre varchar(100) NOT NULL,
    dit_estado int DEFAULT 1 NOT NULL
);

-----------------------------------------
-----TABLA TALENTO EXCEPCIONAL------
-----------------------------------------
select * from "general".talento_excepcional  

--POSTGRE SQL
CREATE TABLE talento_excepcional (
    tae_codigo int PRIMARY KEY,
    tae_nombre varchar(100) NOT NULL,
    tae_estado int DEFAULT 1 NOT NULL
);

INSERT INTO "general".talento_excepcional
(tae_codigo, tae_nombre)
VALUES(0, 'NO APLICA');
INSERT INTO "general".talento_excepcional
(tae_codigo, tae_nombre)
VALUES(1, 'TALENTO EXCEPCIONAL GENERAL');
INSERT INTO "general".talento_excepcional
(tae_codigo, tae_nombre)
VALUES(2, 'TALENTO EXCEPCIONAL ESPECÍFICO');


---------------------------
--TABLA GRUPO SANGUINEO----
---------------------------
select * from grupo_sanguineo gs 

--POSTGRE SQL
CREATE TABLE general.grupo_sanguineo (
    grs_codigo SERIAL PRIMARY KEY,
    grs_nombre varchar(50) NOT NULL,
    grs_estado int DEFAULT 1 NOT NULL
);

---------------------------
-------TABLA PERSONA-------
---------------------------
select * from persona p 


select * from persona_discapacidad pd 

--POSTGRE SQL
CREATE TABLE general.persona (
    per_codigo SERIAL PRIMARY KEY,
    per_identificacion varchar(15) NOT NULL,
    tii_codigo int NOT NULL,
    per_libreta_militar varchar(15),
    per_apellido varchar(50),
    per_nombre varchar(50),
    seb_codigo int NOT NULL,
    per_lugar_expedicion char(8),
    per_fecha_expedicion date,
    per_fecha_nacimiento date,
    per_direccion_residencia varchar(255),
    per_telefono_movil varchar(50),
    per_telefono_fijo varchar(30),
    esc_codigo int NOT NULL,
    per_lugar_nacimiento char(8),
    est_codigo int NOT NULL,
    per_pais_residencia int,
    per_departamento_residencia char(2),
    per_municipio_residencia char(5),
    per_lugar_residencia char(8),
    per_barrio varchar(50),
    per_numero_afiliacion_eps varchar(20),
    per_ips_sisben varchar(200),
    gre_codigo int NOT NULL,
    pui_codigo int,
    con_codigo int,
    ped_codigo int,
    dit_codigo int,
    tae_codigo int,
    per_familiar_direccion varchar(255),
    per_familiar_nombre varchar(60),
    per_familiar_telefono varchar(30),
    per_familiar_lugar_residencia char(8),
    per_email varchar(100),
    per_email_interno varchar(100),
    grs_codigo int NOT NULL,
    per_estado int DEFAULT 1 NOT NULL,
    per_fecha_registro timestamp DEFAULT now(),
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


--INSERT INTO persona
(per_identificacion, tii_codigo, per_libreta_militar, per_apellido, per_nombre, seb_codigo, per_lugar_expedicion, per_fecha_expedicion, per_fecha_nacimiento, per_direccion_residencia, per_telefono_movil, per_telefono_fijo, esc_codigo, per_lugar_nacimiento, per_lugar_residencia, per_departamento_residencia, per_pais_residencia, per_barrio, per_estrato, eps_codigo, per_numero_afiliacion_eps, per_ips_sisben, per_id_cotizante, per_familiar_direccion, per_familiar_nombre, per_familiar_telefono, per_familiar_lugar_residencia, per_email, per_email_interno, grs_codigo)
VALUES('1075303330', 5, '1075303330', 'GUERRERO CÓRDOBA', 'JOHN DAVID', 1, 605, '09-04-2015', '14-03-1997', 'CALLE 78 #1F-04', '3165380816', '6088635210', 1, 605, 605, 13, 43, 'LUIS EDUARDO VANEGAS', 2, 1075303330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guerrerocordobajohn@gmail.com', 'guerrerocordobajohn@gmail.com', 1);