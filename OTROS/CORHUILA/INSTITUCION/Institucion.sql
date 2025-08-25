-----------------------------------
-----TABLA NATURALEZA JURIDICA-----
-----------------------------------
CREATE TABLE general.naturaleza_juridica (
    naj_codigo SERIAL PRIMARY KEY,
    naj_nombre varchar(50) NOT NULL,
    naj_estado int DEFAULT 1 NOT NULL
);

--INSERT INTO general.naturaleza_juridica
(naj_nombre)
VALUES('CORPORACIÓN');
--INSERT INTO general.naturaleza_juridica
(naj_nombre)
VALUES('DEPARTAMENTAL');
--INSERT INTO general.naturaleza_juridica
(naj_nombre)
VALUES('FUNDACIÓN');
--INSERT INTO general.naturaleza_juridica
(naj_nombre)
VALUES('MUNICIPAL');
--INSERT INTO general.naturaleza_juridica
(naj_nombre)
VALUES('NACIONAL');


select * from general.naturaleza_juridica nj 

-----------------------------------
-----------TABLA SECTOR------------
-----------------------------------
CREATE TABLE general.sector (
    sec_codigo SERIAL PRIMARY KEY,
    sec_nombre varchar(50) NOT NULL,
    sec_estado int DEFAULT 1 NOT NULL
);

--INSERT INTO general.sector
(sec_nombre)
VALUES('OFICIAL');
--INSERT INTO general.sector
(sec_nombre)
VALUES('PRIVADO');


select * from general.sector


-----------------------------------
-----TABLA CARACTER ACADEMICO------
-----------------------------------
CREATE TABLE general.caracter_academico (
    caa_codigo SERIAL PRIMARY KEY,
    caa_nombre varchar(50) NOT NULL,
    caa_estado int DEFAULT 1 NOT NULL
);

--INSERT INTO general.caracter_academico
(caa_nombre)
VALUES('INSTITUCIÓN TÉCNICA PROFESIONAL');
--INSERT INTO general.caracter_academico
(caa_nombre)
VALUES('INSTITUCIÓN TECNOLÓGICA');
--INSERT INTO general.caracter_academico
(caa_nombre)
VALUES('INSTITUCIÓN UNIVERSITARIA O ESCUELA TECNOLÓGICAS');
--INSERT INTO general.caracter_academico
(caa_nombre)
VALUES('UNIVERSIDAD');


select * from general.caracter_academico 



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

select * from general.institucion i 

----------------------------
------TABLA SEDE TIPO-------
----------------------------

CREATE TABLE general.sede_tipo (
    set_codigo SERIAL PRIMARY KEY,
    set_nombre varchar(50) NOT NULL,
    set_estado int DEFAULT 1 NOT NULL
);

--INSERT INTO general.sede_tipo
(set_nombre)
VALUES('TIPO UNO');

select * from general.sede_tipo st where st.set_estado = 1

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

select * from general.sede s 
inner join general.cabeceras_centros_poblados ccp on s.ccp_divipola = ccp.ccp_divipola  
inner join general.municipio m on ccp.mun_divipola = m.mun_divipola 
inner join general.departamento d on m.dep_divipola = d.dep_divipola 
inner join general.pais p on d.pai_codigo = p.pai_codigo
inner join general.sede_tipo st on s.set_tipo = st.set_codigo 
where s.sed_estado = 1

INSERT INTO general.sede
(ins_nit, sed_nombre, ccp_divipola, sed_direccion, sed_telefono, set_tipo, sed_fecha_creacion, sed_estado)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE general.sede
SET ins_nit='777-555', sed_nombre='SEDE LAS BRISAS', ccp_divipola='41001000', sed_direccion='CALE 7 # 45-5', sed_telefono='789 5555', set_tipo=1, sed_fecha_creacion='2023-08-18 08:13:40.041', sed_estado=1
WHERE sed_codigo=1;


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

select * from general.facultad f 
inner join general.sede s on f.sed_codigo = s.sed_codigo
inner join general.cabeceras_centros_poblados ccp on s.ccp_divipola = ccp.ccp_divipola  
inner join general.municipio m on ccp.mun_divipola = m.mun_divipola 
inner join general.departamento d on m.dep_divipola = d.dep_divipola 
inner join general.pais p on d.pai_codigo = p.pai_codigo
inner join general.sede_tipo st on s.set_tipo = st.set_codigo 
where f.fac_estado = 1
order by f.fac_codigo desc

INSERT INTO general.facultad
(sed_codigo, fac_nombre, fac_decano, fac_correo, fac_telefono, fac_fecha_creacion, fac_estado)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL);


UPDATE general.facultad
SET sed_codigo=NULL, fac_nombre=NULL, fac_decano=NULL, fac_correo=NULL, fac_telefono=NULL, fac_fecha_creacion=NULL, fac_estado=NULL
WHERE fac_codigo IS NULL;

select * from general.facultad