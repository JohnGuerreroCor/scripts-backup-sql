-----------------------------------
-----TABLA NATURALEZA JURIDICA-----
-----------------------------------
CREATE TABLE naturaleza_juridica (
    naj_codigo INT IDENTITY(1,1) PRIMARY KEY,
    naj_nombre NVARCHAR(50) NOT NULL,
    naj_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO naturaleza_juridica
(naj_nombre)
VALUES('CORPORACIÓN');
INSERT INTO naturaleza_juridica
(naj_nombre)
VALUES('DEPARTAMENTAL');
INSERT INTO naturaleza_juridica
(naj_nombre)
VALUES('FUNDACIÓN');
INSERT INTO naturaleza_juridica
(naj_nombre)
VALUES('MUNICIPAL');
INSERT INTO naturaleza_juridica
(naj_nombre)
VALUES('NACIONAL');


select * from naturaleza_juridica nj 

-----------------------------------
-----------TABLA SECTOR------------
-----------------------------------
CREATE TABLE sector (
    sec_codigo INT IDENTITY(1,1) PRIMARY KEY,
    sec_nombre NVARCHAR(50) NOT NULL,
    sec_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO sector
(sec_nombre)
VALUES('OFICIAL');
INSERT INTO sector
(sec_nombre)
VALUES('PRIVADO');


select * from general.sector


-----------------------------------
-----TABLA CARACTER ACADEMICO------
-----------------------------------
CREATE TABLE caracter_academico (
    caa_codigo INT IDENTITY(1,1) PRIMARY KEY,
    caa_nombre NVARCHAR(50) NOT NULL,
    caa_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO caracter_academico
(caa_nombre)
VALUES('INSTITUCIÓN TÉCNICA PROFESIONAL');
INSERT INTO caracter_academico
(caa_nombre)
VALUES('INSTITUCIÓN TECNOLÓGICA');
INSERT INTO caracter_academico
(caa_nombre)
VALUES('INSTITUCIÓN UNIVERSITARIA O ESCUELA TECNOLÓGICAS');
INSERT INTO caracter_academico
(caa_nombre)
VALUES('UNIVERSIDAD');


select * from caracter_academico 



----------------------------
-----TABLA INSTITUCION------
----------------------------

CREATE TABLE institucion (
    ins_codigo INT IDENTITY(1,1) NOT NULL,
    ins_nit NVARCHAR(50) NOT NULL,
    ins_snies INT NOT NULL,
    ins_snies_padre INT NOT NULL,
    naj_codigo INT NOT NULL,
    sec_codigo INT NOT NULL,
    caa_codigo INT NOT NULL,
    ins_nombre NVARCHAR(100) NOT NULL,
    ccp_divipola CHAR(8) NOT NULL,
    ins_direccion NVARCHAR(100) NOT NULL,
    ins_telefono NVARCHAR(100) NOT NULL,
    ins_pagina_web NVARCHAR(100) NOT NULL,
    nor_codigo INT NOT NULL,
    ins_fecha_norma DATE NOT NULL,
    ins_estado INT NOT NULL DEFAULT 1,
    CONSTRAINT institucion_pkey PRIMARY KEY (ins_codigo),
    CONSTRAINT institucion_fk_cabeceras_centros_poblados FOREIGN KEY (ccp_divipola) REFERENCES cabeceras_centros_poblados(ccp_divipola),
    CONSTRAINT institucion_fk_caracter_academico FOREIGN KEY (caa_codigo) REFERENCES caracter_academico(caa_codigo),
    CONSTRAINT institucion_fk_naturaleza_juridica FOREIGN KEY (naj_codigo) REFERENCES naturaleza_juridica(naj_codigo),
    CONSTRAINT institucion_fk_sector FOREIGN KEY (sec_codigo) REFERENCES sector(sec_codigo)
);

--CONSTRAINT institucion_fk_norma FOREIGN KEY (nor_codigo) REFERENCES general.norma(nor_codigo),


select * from institucion i 

SELECT top 1 * FROM institucion i 
INNER JOIN naturaleza_juridica nj ON i.naj_codigo = nj.naj_codigo 
INNER JOIN sector s ON i.sec_codigo = s.sec_codigo 
INNER JOIN caracter_academico ca ON i.caa_codigo = ca.caa_codigo 
INNER JOIN cabeceras_centros_poblados ccp ON i.ccp_divipola = ccp.ccp_divipola 
INNER JOIN municipio m ON ccp.mun_divipola = m.mun_divipola 
INNER JOIN departamento d ON m.dep_divipola = d.dep_divipola 
INNER JOIN pais p ON d.pai_codigo = p.pai_codigo 
order by i.ins_codigo desc




SELECT DISTINCT ON (i.ins_nit) i.ins_nit, i.*, nj.*, s.*, ca.*, ccp.*, m.*, d.*, p.*, n.* 
FROM institucion i 
INNER JOIN naturaleza_juridica nj ON i.naj_codigo = nj.naj_codigo 
INNER JOIN sector s ON i.sec_codigo = s.sec_codigo 
INNER JOIN caracter_academico ca ON i.caa_codigo = ca.caa_codigo 
INNER JOIN cabeceras_centros_poblados ccp ON i.ccp_divipola = ccp.ccp_divipola 
INNER JOIN municipio m ON ccp.mun_divipola = m.mun_divipola 
INNER JOIN departamento d ON m.dep_divipola = d.dep_divipola 
INNER JOIN pais p ON d.pai_codigo = p.pai_codigo 		
ORDER BY i.ins_nit, i.ins_codigo DESC;

--//+ "INNER JOIN norma n on i.nor_codigo = n.nor_codigo "
--//+ "inner join norma_tipo nt on n.not_codigo = nt.not_codigo "



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