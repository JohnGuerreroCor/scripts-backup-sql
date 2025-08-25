---------------------------
----TABLA USUARIO TIPO-----
---------------------------
CREATE TABLE general.usuario_tipo (
    ust_codigo SERIAL PRIMARY KEY,
    ust_nombre varchar(50) NOT NULL,
    ust_estado int DEFAULT 1 NOT NULL
);

--INSERT INTO "general".usuario_tipo
(ust_nombre)
VALUES('ADMINISTRATIVO');
--INSERT INTO "general".usuario_tipo
(ust_nombre)
VALUES('ESTUDIANTE');
--INSERT INTO "general".usuario_tipo
(ust_nombre)
VALUES('PROFESOR');
--INSERT INTO "general".usuario_tipo
(ust_nombre)
VALUES('GRADUADO');


select * from "general".usuario_tipo ut 

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

select * from usuario u 

select * from usuario_dos u 

--INSERT INTO "general".usuario_dos
(per_codigo, usu_nombre, uwd2, ust_codigo)
VALUES(1, '1075303330', NULL, 1);


-----------------------------------
-------VISTA USUARIO GENERAL-------
-----------------------------------
select * from vista_usuario_general vug 
where vug.usu_nombre = '1075303330' and vug.usu_estado = 1

UPDATE academia3000_john.dbo.usuario_administrativos
SET up=15260, us=N'registro2   ', uwd_seguridadold=N'kR9uzpoyU6Q4jF5TmrIWzg==', uwd=NULL, uwd2=0x5AE2BACFFEBDF3E8E37DECDD343AC728, uwd_anterior=N'kR9uzpoyU6Q4jF5TmrIWzg==', istipo=1, ischange=1, state=0, sys=NULL, us_correo=NULL, us_pregunta=NULL, us_respuesta=NULL, us_encriptado=0xB774DE2085B7804C36CF80EBCD521187D3186D16
WHERE uid=3;

UPDATE usuario
SET uwd2 = E'\\x5AE2BACFFEBDF3E8E37DECDD343AC728' 
WHERE usu_codigo = 1;

UPDATE usuario_dos
SET uwd2 = E'\\x5AE2BACFFEBDF3E8E37DECDD343AC728' 
WHERE usu_codigo = 1;

select * from usuario_dos ud 
--5AE2BACFFEBDF3E8E37DECDD343AC728


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

select * from persona p 

CREATE VIEW vista_usuario_alterno AS
select u.usu_codigo, u.per_codigo, u.usu_nombre, u.uwd2, u.ust_codigo, u.usu_estado, p.per_nombre, p.per_apellido, p.per_identificacion from usuario_dos u 
inner join persona p on u.per_codigo = p.per_codigo 
inner join tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
inner join estado_civil ec on p.esc_codigo = ec.esc_codigo 
inner join sexo_biologico sb on p.seb_codigo = sb.seb_codigo 


select COUNT(vug.usu_nombre) from vista_usuario_general vug 
where vug.usu_nombre = '1075303330'


SELECT * FROM general.vista_usuario_alterno vug
WHERE vug.usu_nombre = '1075303330' AND vug.usu_estado = 1
LIMIT 1;