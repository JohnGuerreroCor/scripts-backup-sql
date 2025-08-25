---------------------------
--------TABLA PAIS---------
---------------------------
select * from pais p 

--POSTGRE SQL
CREATE TABLE general.pais (
    pai_codigo SERIAL PRIMARY KEY,
    pai_acronimo char(2) NOT NULL,
    pai_nombre varchar(100) NOT NULL
);

select * from pais p where p.pai_nombre like '%COLOMBIA%'

---------------------------
----TABLA DEPARTAMENTO-----
---------------------------
select * from departamento d 

--POSTGRE SQL
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
select * from municipio m  

--POSTGRE SQL

CREATE TABLE general.municipio (
    mun_codigo SERIAL NOT NULL,
    mun_divipola char(5) NOT null PRIMARY KEY,
    mun_nombre varchar(100) NOT NULL,
    mun_tipo varchar(100),
    mun_area_metropolitana varchar(200),
    dep_divipola char(2) NOT null,
    CONSTRAINT municipio_FK_departamento FOREIGN KEY (dep_divipola) REFERENCES departamento(dep_divipola)
);

select * from municipio m 


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

select * from "general".cabeceras_centros_poblados ccp2 
select * from pais p 
inner join departamento d on p.pai_codigo = d.pai_codigo 
inner join municipio m on d.dep_divipola = m.dep_divipola 
inner join cabeceras_centros_poblados ccp on m.mun_divipola = ccp.mun_divipola