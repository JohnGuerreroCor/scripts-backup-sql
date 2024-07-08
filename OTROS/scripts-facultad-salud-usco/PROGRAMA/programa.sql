--- TABLA CICLOS PROPEDEUTICOS
CREATE TABLE ciclo_propedeutico (
    cip_codigo INT IDENTITY(1,1) PRIMARY KEY,
    cip_nombre NVARCHAR(10) NOT NULL,
    cip_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO ciclo_propedeutico
(cip_nombre)
VALUES('SI');
INSERT INTO ciclo_propedeutico
(cip_nombre)
VALUES('NO');

--TABLA NIVEL ACADÉMICO
CREATE TABLE nivel_academico (
    nia_codigo INT IDENTITY(1,1) PRIMARY KEY,
    nia_nombre NVARCHAR(100) NOT NULL,
    nia_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO nivel_academico
(nia_nombre)
VALUES('PREGRADO');

INSERT INTO nivel_academico
(nia_nombre)
VALUES('POSGRADO');

select * from nivel_academico na 

--TABLA NIVEL FORMACIÓN
CREATE TABLE nivel_formacion (
    nif_codigo INT IDENTITY(1,1) PRIMARY KEY,
    nia_codigo INT NOT NULL,
    nif_nombre NVARCHAR(150) NOT NULL,
    nif_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT nivel_formacion_FK_nivel_academico FOREIGN KEY (nia_codigo) REFERENCES nivel_academico(nia_codigo)
);


select * from nivel_formacion nf

select * from nivel_formacion nf 
inner join nivel_academico na on nf.nia_codigo = na.nia_codigo 
where nf.nia_codigo = 1

--TABLA MODALIDAD
CREATE TABLE modalidad (
    mod_codigo INT IDENTITY(1,1) PRIMARY KEY,
    mod_nombre NVARCHAR(100) NOT NULL,
    mod_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO modalidad
(mod_nombre)
VALUES('PRESENCIAL');

INSERT INTO modalidad
(mod_nombre)
VALUES('VIRTUAL');

INSERT INTO modalidad
(mod_nombre)
VALUES('A DISTANCIA');

INSERT INTO modalidad
(mod_nombre)
VALUES('DUAL');

select * from modalidad m 

--TIEMPO DURACION
CREATE TABLE tiempo_duracion (
    tid_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tid_nombre NVARCHAR(100) NOT NULL,
    tid_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO tiempo_duracion
(tid_nombre)
VALUES('AÑO(S)');

INSERT INTO tiempo_duracion
(tid_nombre)
VALUES('SEMESTRE(S)');


--TIEMPO ADMISION
CREATE TABLE tiempo_admision (
    tia_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tia_nombre NVARCHAR(100) NOT NULL,
    tia_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO tiempo_admision
(tia_nombre)
VALUES('ANUAL');

INSERT INTO tiempo_admision
(tia_nombre)
VALUES('SEMESTRAL');

INSERT INTO tiempo_admision
(tia_nombre)
VALUES('BIEMESTRAL');

INSERT INTO tiempo_admision
(tia_nombre)
VALUES('TRIMESTRAL');

select * from tiempo_admision ta 

--TABLA AREA DEL CONOCIMIENTO
CREATE TABLE area_conocimiento (
    arc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    arc_nombre NVARCHAR(150) NOT NULL,
    arc_estado INT DEFAULT 1 NOT NULL
);


select * from area_conocimiento ac where ac.arc_estado = 1

--TABLA NBC : nucleo basi cono
CREATE TABLE nbc (
    nbc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    arc_codigo INT NOT NULL,
    nbc_cod INT NOT NULL,
    nbc_nombre NVARCHAR(150) NOT NULL,
    nbc_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT nbc_FK_area_conocimiento FOREIGN KEY (arc_codigo) REFERENCES area_conocimiento(arc_codigo)
);


select * from nbc n 
inner join area_conocimiento ac on n.arc_codigo = ac.arc_codigo 
where n.arc_codigo = 

select * from nbc n 


--TABLA ESTADO SNIES
CREATE TABLE estado_snies (
    ess_codigo INT IDENTITY(1,1) PRIMARY KEY,
    ess_nombre NVARCHAR(100) NOT NULL,
    ess_estado INT DEFAULT 1 NOT NULL
);


INSERT INTO estado_snies
(ess_nombre)
VALUES('ACTIVO');
INSERT INTO estado_snies
(ess_nombre)
VALUES('INACTIVO');

--TABLA PROGRAMA
CREATE TABLE programa (
    pro_codigo INT IDENTITY(1,1) PRIMARY KEY,
    pro_codigo_snies INT NOT NULL,
    ess_codigo INT NOT NULL,
    cip_codigo INT NOT NULL,
    nif_codigo INT NOT NULL,
    mod_codigo INT NOT NULL,
    nbc_codigo INT NOT NULL,
    fac_codigo INT NOT NULL,
    pro_nombre NVARCHAR(150) NOT NULL,
    pro_titulo_otorgado NVARCHAR(150) NOT NULL,
    pro_numero_creditos INT NOT NULL,
    tid_codigo INT NOT NULL,
    pro_duracion INT NOT NULL,
    tia_codigo INT NOT NULL,
    pro_numero_cupos INT NOT NULL,
    pro_sitio_web NVARCHAR(150) NOT NULL,
    nor_codigo INT NOT NULL,
    pro_convenio INT NOT NULL,
    cdc_codigo INT NOT NULL,
    pro_fecha_creacion DATE NOT NULL,
    pro_fecha_registro_snies DATE NOT NULL,
    pro_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT programa_FK_estado_snies FOREIGN KEY (ess_codigo) REFERENCES estado_snies(ess_codigo),
    CONSTRAINT programa_FK_ciclo_propedeutico FOREIGN KEY (cip_codigo) REFERENCES ciclo_propedeutico(cip_codigo),
    CONSTRAINT programa_FK_nivel_formacion FOREIGN KEY (nif_codigo) REFERENCES nivel_formacion(nif_codigo),
    CONSTRAINT programa_FK_modalidad FOREIGN KEY (mod_codigo) REFERENCES modalidad(mod_codigo),
    CONSTRAINT programa_FK_nbc FOREIGN KEY (nbc_codigo) REFERENCES nbc(nbc_codigo),
    CONSTRAINT programa_FK_facultad FOREIGN KEY (fac_codigo) REFERENCES facultad(fac_codigo),
    CONSTRAINT programa_FK_tiempo_duracion FOREIGN KEY (tid_codigo) REFERENCES tiempo_duracion(tid_codigo),
    CONSTRAINT programa_FK_tiempo_admision FOREIGN KEY (tia_codigo) REFERENCES tiempo_admision(tia_codigo),
    CONSTRAINT programa_FK_norma FOREIGN KEY (nor_codigo) REFERENCES norma(nor_codigo),
    CONSTRAINT programa_FK_campo_detallado_cine FOREIGN KEY (cdc_codigo) REFERENCES campo_detallado_cine(cdc_codigo)
);



select * from programa p 
inner join estado_snies es on p.ess_codigo = es.ess_codigo 
inner join ciclo_propedeutico cp on p.cip_codigo = cp.cip_codigo 
inner join nivel_formacion nf on p.nif_codigo = nf.nif_codigo 
inner join nivel_academico na on nf.nia_codigo = na.nia_codigo 
inner join modalidad m on p.mod_codigo = m.mod_codigo 
inner join nbc n on p.nbc_codigo = n.nbc_codigo 
inner join area_conocimiento ac on n.arc_codigo = ac.arc_codigo 
inner join facultad f on p.fac_codigo = f.fac_codigo 
inner join sede s on f.sed_codigo = s.sed_codigo 
inner join sede_tipo st on s.set_tipo = st.set_codigo 
inner join cabeceras_centros_poblados ccp on s.ccp_divipola = ccp.ccp_divipola 
inner join municipio m2 on ccp.mun_divipola = m2.mun_divipola 
inner join departamento d on m2.dep_divipola = d.dep_divipola 
inner join pais p2 on d.pai_codigo = p2.pai_codigo 
inner join tiempo_duracion td on p.tid_codigo = td.tid_codigo 
inner join tiempo_admision ta on p.tia_codigo = ta.tia_codigo 
inner join norma nr on p.nor_codigo = nr.nor_codigo 
inner join campo_detallado_cine cdc on p.cdc_codigo = cdc.cdc_codigo 
where p.pro_estado = 1


select * from programa p 