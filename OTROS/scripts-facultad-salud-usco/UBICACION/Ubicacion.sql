---------------------------
--------TABLA PAIS---------
---------------------------
select * from pais p 

CREATE TABLE dbo.pais (
    pai_codigo INT IDENTITY(1,1) PRIMARY KEY,
    pai_acronimo CHAR(2) NOT NULL,
    pai_nombre NVARCHAR(100) NOT NULL
);


select * from pais p where p.pai_nombre like '%COLOMBIA%'

---------------------------
----TABLA DEPARTAMENTO-----
---------------------------
select * from dbo.departamento d 

CREATE TABLE dbo.departamento (
    dep_codigo INT IDENTITY(1,1) NOT NULL,
    dep_divipola CHAR(2) NOT NULL PRIMARY KEY,
    dep_nombre NVARCHAR(100) NOT NULL,
    pai_codigo INT NOT NULL,
    CONSTRAINT FK_departamento_pais FOREIGN KEY (pai_codigo) REFERENCES pais(pai_codigo)
);


------------------------
----TABLA MUNICIPIO-----
------------------------
select * from municipio m  

CREATE TABLE dbo.municipio (
    mun_codigo INT IDENTITY(1,1) NOT NULL,
    mun_divipola CHAR(5) NOT NULL PRIMARY KEY,
    mun_nombre NVARCHAR(100) NOT NULL,
    mun_tipo NVARCHAR(100),
    mun_area_metropolitana NVARCHAR(200),
    dep_divipola CHAR(2) NOT NULL,
    CONSTRAINT municipio_FK_departamento FOREIGN KEY (dep_divipola) REFERENCES departamento(dep_divipola)
);


select * from municipio m 


-------------------------------------------
----TABLA CABECERAS Y CENTROS POBLADOS-----
-------------------------------------------
CREATE TABLE dbo.cabeceras_centros_poblados (
    ccp_codigo INT IDENTITY(1,1) NOT NULL,
    ccp_divipola CHAR(8) NOT NULL PRIMARY KEY,
    ccp_nombre NVARCHAR(200) NOT NULL,
    ccp_tipo CHAR(2) NOT NULL,
    mun_divipola CHAR(5) NOT NULL,
    CONSTRAINT cabeceras_centros_poblados_FK_municipio FOREIGN KEY (mun_divipola) REFERENCES municipio(mun_divipola)
);


select * from "general".cabeceras_centros_poblados ccp2 
select * from pais p 
inner join departamento d on p.pai_codigo = d.pai_codigo 
inner join municipio m on d.dep_divipola = m.dep_divipola 
inner join cabeceras_centros_poblados ccp on m.mun_divipola = ccp.mun_divipola