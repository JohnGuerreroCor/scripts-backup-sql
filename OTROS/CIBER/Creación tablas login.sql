--********************************--
--******COMPONENTE PERSONA********--
--********************************--

--*****************************--
--*******ESQUEMA GENERAL*******--
--*****************************--
CREATE SCHEMA principal;

---------------------------
--------TABLA PAIS---------
---------------------------

CREATE TABLE principal.pais (
    pai_codigo SERIAL PRIMARY KEY,
    pai_acronimo char(2) NOT NULL,
    pai_nombre varchar(100) NOT NULL,
    pai_estado int DEFAULT 1 NOT NULL
);

select * from principal.pais p where p.pai_nombre like '%COLOMBIA%'


---------------------------
-------TABLA PERSONA-------
---------------------------

CREATE TABLE principal.persona (
    per_codigo SERIAL PRIMARY KEY,
    per_apellido varchar(50),
    per_nombre varchar(50),
    per_pais_residencia int,
    per_email varchar(100),
    per_fecha_registro timestamp DEFAULT now(),
    per_estado int DEFAULT 1 NOT null,
    CONSTRAINT persona_FK_pais FOREIGN KEY (per_pais_residencia) REFERENCES principal.pais(pai_codigo)
);

--INSERT INTO principal.persona 
(per_apellido, per_nombre, per_pais_residencia, per_email) 
VALUES('ESPINOSA ESPINOSA', 'DANIEL', 43, 'danielasepulveda818@gmail.com');

select * from principal.persona p 


---------------------------
----TABLA USUARIO TIPO-----
---------------------------
CREATE TABLE principal.usuario_tipo (
    ust_codigo SERIAL PRIMARY KEY,
    ust_nombre varchar(50) NOT NULL,
    ust_estado int DEFAULT 1 NOT NULL
);

--INSERT INTO principal.usuario_tipo
(ust_nombre)
VALUES('ADMIN');
--INSERT INTO principal.usuario_tipo
(ust_nombre)
VALUES('DOCENTE');
--INSERT INTO principal.usuario_tipo
(ust_nombre)
VALUES('ESTUDIANTE');

select * from principal.usuario_tipo ut 

---------------------------
-------TABLA USUARIO-------
---------------------------

CREATE TABLE principal.usuario (
    usu_codigo SERIAL PRIMARY KEY,
    per_codigo int NOT NULL,
    usu_nombre varchar(100),
    uwd2 varchar(100),
    ust_codigo int NOT NULL,
    usu_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT usuario_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    CONSTRAINT usuario_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES usuario_tipo(ust_codigo)
);

SELECT * FROM principal.usuario u  

--INSERT INTO principal.usuario
(per_codigo, usu_nombre, uwd2, ust_codigo)
VALUES(1, 'danielaalarconsepulveda30@gmail.com', NULL, 1);


select * from principal.usuario u 

UPDATE usuario
SET uwd2 = E'\\x5AE2BACFFEBDF3E8E37DECDD343AC728' 
WHERE usu_codigo = 1;

CREATE VIEW vista_usuario AS
select u.usu_codigo, u.per_codigo, u.usu_nombre, u.uwd2, u.ust_codigo, u.usu_estado, p.per_nombre, p.per_apellido from principal.usuario  u 
inner join persona p on u.per_codigo = p.per_codigo  

SELECT * FROM principal.vista_usuario vu
WHERE vu.usu_nombre = 'danielaalarconsepulveda30@gmail.com' AND vu.usu_estado = 1;


select COUNT(vu.usu_nombre) from vista_usuario vu 
where vu.usu_nombre = 'danielaalarconsepulveda30@gmail.com' AND vu.usu_estado = 1;
