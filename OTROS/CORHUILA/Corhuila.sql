--*****************************--
--*******ESQUEMA GENERAL*******--
--*****************************--
CREATE SCHEMA general;


--********************************--
--******COMPONENTE PERSONA********--
--********************************--

---------------------------
---TABLA SEXO BIOLOGICO----
---------------------------
CREATE TABLE general.sexo_biologico (
    seb_codigo SERIAL PRIMARY KEY,
    seb_nombre varchar(10) NOT NULL,
    seb_estado int DEFAULT 1 NOT NULL
);

---------------------------
-------ESTADO CIVIL--------
---------------------------
CREATE TABLE general.estado_civil (
    esc_codigo SERIAL PRIMARY KEY,
    esc_nombre varchar(50) NOT NULL,
    esc_estado int DEFAULT 1 NOT NULL
);

---------------------------
-------TABLA ESTRATO-------
---------------------------
CREATE TABLE estrato (
    est_codigo int PRIMARY KEY,
    est_nombre varchar(50) NOT NULL,
    est_estado int DEFAULT 1 NOT NULL
);

---------------------------
--TABLA TIPO DE DOCUMENTO--
---------------------------
CREATE TABLE tipo_identificacion (
    tii_codigo SERIAL PRIMARY KEY,
    tii_nombre varchar(50),
    tii_nombre_corto varchar(4) NOT NULL,
    tii_estado int DEFAULT 1 NOT NULL
);

-------------------------------
-------TABLA GRUPO ÉTNICO------
-------------------------------
CREATE TABLE grupo_etnico (
    gre_codigo int PRIMARY KEY,
    gre_nombre varchar(50) NOT NULL,
    gre_estado int DEFAULT 1 NOT NULL
);

--------------------------------
-----TABLA PUEBLO INDIGENA------
--------------------------------
CREATE TABLE pueblo_indigena (
    pui_codigo int PRIMARY KEY,
    pui_nombre varchar(50) NOT NULL,
    pui_estado int DEFAULT 1 NOT NULL
);

--------------------------------
-----TABLA COMUNIDAD NEGRA------
--------------------------------
CREATE TABLE comunidad_negra (
    con_codigo int PRIMARY KEY,
    con_nombre varchar(50) NOT NULL,
    con_estado int DEFAULT 1 NOT NULL
);

-----------------------------------------
-----TABLA PERSONA CON DISCAPACIDAD------
-----------------------------------------
CREATE TABLE persona_discapacidad (
    ped_codigo SERIAL PRIMARY KEY,
    ped_condicion char(2) NOT NULL,
    ped_estado int DEFAULT 1 NOT NULL
);

-----------------------------------------
-----TABLA PERSONA CON DISCAPACIDAD------
-----------------------------------------
CREATE TABLE discapacidad_tipo (
    dit_codigo int PRIMARY KEY,
    dit_nombre varchar(100) NOT NULL,
    dit_estado int DEFAULT 1 NOT NULL
);

-----------------------------------------
-----TABLA TALENTO EXCEPCIONAL------
-----------------------------------------
CREATE TABLE talento_excepcional (
    tae_codigo int PRIMARY KEY,
    tae_nombre varchar(100) NOT NULL,
    tae_estado int DEFAULT 1 NOT NULL
);


---------------------------
--TABLA GRUPO SANGUINEO----
---------------------------
CREATE TABLE general.grupo_sanguineo (
    grs_codigo SERIAL PRIMARY KEY,
    grs_nombre varchar(50) NOT NULL,
    grs_estado int DEFAULT 1 NOT NULL
);

---------------------------
-------TABLA PERSONA-------
---------------------------
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
 

--********************************--
--******COMPONENTE USUARIO********--
--********************************--


---------------------------
----TABLA USUARIO TIPO-----
---------------------------
CREATE TABLE general.usuario_tipo (
    ust_codigo SERIAL PRIMARY KEY,
    ust_nombre varchar(50) NOT NULL,
    ust_estado int DEFAULT 1 NOT NULL
);
select * from general.usuario_tipo ut 
---------------------------
-------TABLA USUARIO-------
---------------------------

CREATE TABLE general.usuario (
    usu_codigo SERIAL PRIMARY KEY,
    per_codigo int NOT NULL,
    usu_nombre varchar(20),
    uwd2 bytea,
    ust_codigo int NOT NULL,
    usu_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT usuario_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    CONSTRAINT usuario_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES usuario_tipo(ust_codigo)
);

------------------------------------
-------TABLA USUARIO SHA1 MD5-------
------------------------------------

CREATE TABLE general.usuario_dos (
    usu_codigo SERIAL PRIMARY KEY,
    per_codigo int NOT NULL,
    usu_nombre varchar(20),
    uwd2 varchar(100),
    ust_codigo int NOT NULL,
    usu_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT usuario_dos_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    CONSTRAINT usuario_dos_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES usuario_tipo(ust_codigo)
);

-----------------------------------
-------VISTA USUARIO GENERAL-------
-----------------------------------

CREATE VIEW vista_usuario_general AS
select u.usu_codigo, u.per_codigo, u.usu_nombre, u.uwd2, u.ust_codigo, u.usu_estado, p.per_nombre, p.per_apellido, p.per_identificacion from usuario u 
inner join persona p on u.per_codigo = p.per_codigo 
inner join tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
inner join estado_civil ec on p.esc_codigo = ec.esc_codigo 
inner join genero g on p.gen_codigo = g.gen_codigo 

CREATE VIEW vista_usuario_alterno AS
select u.usu_codigo, u.per_codigo, u.usu_nombre, u.uwd2, u.ust_codigo, u.usu_estado, p.per_nombre, p.per_apellido, p.per_identificacion from usuario_dos u 
inner join persona p on u.per_codigo = p.per_codigo 
inner join tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
inner join estado_civil ec on p.esc_codigo = ec.esc_codigo 
inner join sexo_biologico sb on p.seb_codigo = sb.seb_codigo


--********************************--
--****COMPONENTE INSTITUCION******--
--********************************--


-----------------------------------
-----TABLA NATURALEZA JURIDICA-----
-----------------------------------
CREATE TABLE general.naturaleza_juridica (
    naj_codigo SERIAL PRIMARY KEY,
    naj_nombre varchar(50) NOT NULL,
    naj_estado int DEFAULT 1 NOT NULL
);

-----------------------------------
-----------TABLA SECTOR------------
-----------------------------------
CREATE TABLE general.sector (
    sec_codigo SERIAL PRIMARY KEY,
    sec_nombre varchar(50) NOT NULL,
    sec_estado int DEFAULT 1 NOT NULL
);

-----------------------------------
-----TABLA CARACTER ACADEMICO------
-----------------------------------
CREATE TABLE general.caracter_academico (
    caa_codigo SERIAL PRIMARY KEY,
    caa_nombre varchar(50) NOT NULL,
    caa_estado int DEFAULT 1 NOT NULL
);

----------------------------
-----TABLA INSTITUCION------
----------------------------

CREATE TABLE general.institucion (
    ins_codigo SERIAL NOT NULL PRIMARY KEY,
    ins_nit varchar(50) NOT NULL,
    ins_snies int NOT NULL,
    ins_snies_padre int NOT NULL, 
    naj_codigo int not null,
    sec_codigo int not null,
    caa_codigo int not null,
    ins_nombre varchar(100) NOT NULL,
    ccp_divipola char(8) not null,
    ins_direccion varchar(100) NOT NULL,
    ins_telefono varchar(100) NOT NULL,
    ins_pagina_web varchar(100) NOT NULL,
    ins_norma_creacion varchar(100) NOT NULL,
    ins_fecha_norma date NOT NULL,
    ins_estado int DEFAULT 1 NOT null,
    CONSTRAINT institucion_FK_naturaleza_juridica FOREIGN KEY (naj_codigo) REFERENCES naturaleza_juridica(naj_codigo),
    CONSTRAINT institucion_FK_sector FOREIGN KEY (sec_codigo) REFERENCES sector(sec_codigo),
    CONSTRAINT institucion_FK_caracter_academico FOREIGN KEY (caa_codigo) REFERENCES caracter_academico(caa_codigo),
    CONSTRAINT institucion_FK_cabeceras_centros_poblados FOREIGN KEY (ccp_divipola) REFERENCES cabeceras_centros_poblados(ccp_divipola)
);

----------------------------
------TABLA SEDE TIPO-------
----------------------------
CREATE TABLE general.sede_tipo (
    set_codigo SERIAL PRIMARY KEY,
    set_nombre varchar(50) NOT NULL,
    set_estado int DEFAULT 1 NOT NULL
);

----------------------------
--------TABLA SEDE----------
----------------------------
CREATE TABLE general.sede (
    sed_codigo SERIAL NOT NULL PRIMARY KEY,
    ins_nit varchar(50) NOT NULL,
    sed_nombre varchar(100) NOT NULL,
    ccp_divipola char(8) not null,
    sed_direccion varchar(100) NOT NULL,
    sed_telefono varchar(100) NOT NULL,
    set_tipo int not null,
    sed_fecha_creacion timestamp DEFAULT current_timestamp NOT NULL,
    sed_estado int DEFAULT 1 NOT null,
    CONSTRAINT sede_FK_cabeceras_centros_poblados FOREIGN KEY (ccp_divipola) REFERENCES cabeceras_centros_poblados(ccp_divipola),
    CONSTRAINT sede_FK_sede_tipo FOREIGN KEY (set_tipo) REFERENCES sede_tipo(set_codigo)
);

----------------------------
-------TABLA FACULTAD-------
----------------------------
CREATE TABLE general.facultad (
    fac_codigo SERIAL NOT NULL PRIMARY KEY,
    sed_codigo int NOT NULL,
    fac_nombre varchar(100) NOT NULL,
    fac_decano varchar(100) NOT NULL, 
    fac_correo varchar(50) NOT NULL,
    fac_telefono varchar(50) NOT NULL,
    fac_fecha_creacion timestamp DEFAULT current_timestamp NOT NULL,
    fac_estado int DEFAULT 1 NOT null,
    CONSTRAINT facultad_FK_sede FOREIGN KEY (sed_codigo) REFERENCES sede(sed_codigo)
);


--********************************--
--****COMPONENTE INSTITUCION******--
--********************************--

---------------------------
--------TABLA PAIS---------
---------------------------
CREATE TABLE general.pais (
    pai_codigo SERIAL PRIMARY KEY,
    pai_acronimo char(2) NOT NULL,
    pai_nombre varchar(100) NOT NULL
);

---------------------------
----TABLA DEPARTAMENTO-----
---------------------------
CREATE TABLE departamento (
    dep_codigo SERIAL NOT null,
    dep_divipola char(2) NOT null PRIMARY KEY,
    dep_nombre varchar(100) NOT NULL,
    pai_codigo int NOT NULL,
    CONSTRAINT FK_departamento_pais FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo)
);

------------------------
----TABLA MUNICIPIO-----
------------------------
CREATE TABLE general.municipio (
    mun_codigo SERIAL NOT NULL,
    mun_divipola char(5) NOT null PRIMARY KEY,
    mun_nombre varchar(100) NOT NULL,
    mun_tipo varchar(100),
    mun_area_metropolitana varchar(200),
    dep_divipola char(2) NOT null,
    CONSTRAINT municipio_FK_departamento FOREIGN KEY (dep_divipola) REFERENCES departamento(dep_divipola)
);

-------------------------------------------
----TABLA CABECERAS Y CENTROS POBLADOS-----
-------------------------------------------
CREATE TABLE general.cabeceras_centros_poblados (
    ccp_codigo SERIAL NOT NULL,
    ccp_divipola char(8) NOT null PRIMARY KEY,
    ccp_nombre varchar(200) NOT NULL,
    ccp_tipo char(2) NOT null,
    mun_divipola char(5) NOT null,
    CONSTRAINT cabeceras_centros_poblados_FK_municipio FOREIGN KEY (mun_divipola) REFERENCES municipio(mun_divipola)
);

--***************
--***CONSULTAS***
--***************


select * from cabeceras_centros_poblados ccp 

select * from "general".usuario_tipo ut 



select * from general.pais p where p.pai_codigo = 43

select * from general.departamento d
inner join general.pais p on d.pai_codigo = p.pai_codigo 
where d.pai_codigo = 43

select * from general.municipio m 
inner join departamento d on m.dep_divipola = d.dep_divipola 
inner join pais p on d.pai_codigo = p.pai_codigo 
where m.dep_divipola = ''

select * from general.cabeceras_centros_poblados ccp 
inner join general.municipio m on ccp.mun_divipola = m.mun_divipola 
inner join general.departamento d on m.dep_divipola = d.dep_divipola 
inner join general.pais p on d.pai_codigo = p.pai_codigo
where ccp.mun_divipola =  


select * from persona p 

select * from general.tipo_identificacion ti where ti.tii_estado = 1

select * from general.sexo_biologico sb where sb.seb_estado = 1

select * from general.grupo_sanguineo gs where gs.grs_estado = 1

select * from general.estado_civil ec where ec.esc_estado = 1

select * from general.estrato e where e.est_estado = 1

select * from general.comunidad_negra cn where cn.con_estado = 1

select * from general.grupo_etnico ge where ge.gre_estado = 1

select * from general.persona_discapacidad pd where pd.ped_estado = 1

select * from general.pueblo_indigena pui where pui.pui_estado = 1 

select * from general.talento_excepcional te where te.tae_estado = 1

select * from general.discapacidad_tipo dt where dt.dit_estado = 1

select * from general.institucion i 
inner join general.naturaleza_juridica nj on i.naj_codigo = nj.naj_codigo 
inner join general.sector s on i.sec_codigo = s.sec_codigo 
inner join general.caracter_academico ca on i.caa_codigo = ca.caa_codigo 
inner join general.cabeceras_centros_poblados ccp on i.ccp_divipola = ccp.ccp_divipola  
inner join general.municipio m on ccp.mun_divipola = m.mun_divipola 
inner join general.departamento d on m.dep_divipola = d.dep_divipola 
inner join general.pais p on d.pai_codigo = p.pai_codigo 
order by i.ins_codigo desc


INSERT INTO general.institucion
(ins_nit, ins_ies, ins_ies_padre, naj_codigo, sec_codigo, caa_codigo, ins_nombre, pai_codigo, dep_divipola, mun_divipola, ins_direccion, ins_telefono, ins_pagina_web, ins_norma_creacion, ins_fecha_norma, ins_estado)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);








SELECT DISTINCT ON (i.ins_nit) i.ins_nit, i.*, nj.*, s.*, ca.*, ccp.*, m.*, d.*, p.*
FROM general.institucion i
INNER JOIN general.naturaleza_juridica nj ON i.naj_codigo = nj.naj_codigo
INNER JOIN general.sector s ON i.sec_codigo = s.sec_codigo
INNER JOIN general.caracter_academico ca ON i.caa_codigo = ca.caa_codigo
INNER JOIN general.cabeceras_centros_poblados ccp ON i.ccp_divipola = ccp.ccp_divipola
INNER JOIN general.municipio m ON ccp.mun_divipola = m.mun_divipola
INNER JOIN general.departamento d ON m.dep_divipola = d.dep_divipola
INNER JOIN general.pais p ON d.pai_codigo = p.pai_codigo
ORDER BY i.ins_nit, i.ins_codigo DESC;

select * from persona p 
select * from pais p2 

select * from cabeceras_centros_poblados ccp where ccp.ccp_divipola = '41001000'

select * from general.persona p 
INNER JOIN general.tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
INNER JOIN general.sexo_biologico sb on p.seb_codigo = sb.seb_codigo 
INNER JOIN general.estado_civil ec on p.esc_codigo = ec.esc_codigo 
INNER JOIN general.estrato e on p.est_codigo = e.est_codigo 
INNER JOIN general.grupo_etnico ge on p.gre_codigo = ge.gre_codigo 
INNER JOIN general.pueblo_indigena pui on p.pui_codigo = pui.pui_codigo 
INNER JOIN general.comunidad_negra cn on p.con_codigo = cn.con_codigo 
INNER JOIN general.persona_discapacidad pd on p.ped_codigo = pd.ped_codigo 
INNER JOIN general.discapacidad_tipo dt on p.dit_codigo = dt.dit_codigo 
INNER JOIN general.talento_excepcional te on p.tae_codigo = te.tae_codigo 
INNER JOIN general.grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 
where p.per_estado = 1
order by p.per_codigo desc


select * from grupo_etnico ge 

UPDATE "general".persona
SET per_identificacion='1075303330', tii_codigo=1, per_libreta_militar='1075303330', per_apellido='GUERRERO CORDOBA', per_nombre='JOHN DAVID', seb_codigo=1, per_lugar_expedicion=NULL, per_fecha_expedicion=NULL, per_fecha_nacimiento=NULL, per_direccion_residencia=NULL, per_telefono_movil=NULL, per_telefono_fijo=NULL, esc_codigo=1, per_lugar_nacimiento=NULL, est_codigo=1, per_pais_residencia=43, per_departamento_residencia=NULL, per_municipio_residencia=NULL, per_lugar_residencia=NULL, per_barrio=NULL, per_numero_afiliacion_eps=NULL, per_ips_sisben=NULL, gre_codigo=0, pui_codigo=0, con_codigo=0, ped_codigo=1, dit_codigo=0, tae_codigo=0, per_familiar_direccion=NULL, per_familiar_nombre=NULL, per_familiar_telefono=NULL, per_familiar_lugar_residencia=NULL, per_email='guerrerocordobajohn@gmail.com', per_email_interno='guerrerocordobajohn@gmail.com', grs_codigo=1, per_estado=1, per_fecha_registro='2023-08-19 06:33:32.560'
WHERE per_codigo=1;



select * from cabeceras_centros_poblados ccp 
inner join municipio m on ccp.mun_divipola = m.mun_divipola 
where m.mun_tipo = 'Área no municipalizada'


select * from sede s order by s.sed_codigo  



select * from facultad f order by f.fac_codigo asc