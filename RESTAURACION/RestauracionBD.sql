--CAMBIO APELLIDO MAYÚSCULA
--update persona set per_apellido = 'APELLIDO APELLIDO';

--CAMBIO DE CLAVE MASIVO
--update dbo.usuario_administrativos set uwd2 = HASHBYTES('MD5',HASHBYTES('SHA1','12345'));
--update dbo.usuario_docentes set uwd2 = hashbytes('md5',hashbytes('sha1','12345'));
--update dbo.usuario_estudiantes set uwd2 = hashbytes('md5',hashbytes('sha1','12345'));
--update dbo.usuario_estudiantes_virtual set uwd2 = hashbytes('md5',hashbytes('sha1','12345'));
--update dbo.usuario_estudiantes_intercambio set uwd2 = hashbytes('md5',hashbytes('sha1','12345'));
--update dbo.usuario_graduados set uwd2 = hashbytes('md5',hashbytes('sha1','123456'));

select * from persona p 

select * from web_parametro wp where wp.wep_nombre like '%SINCRONIZADOR%'
select * from web_parametro wp where wp.wep_nombre like '%EDUCACION%'

select * from web_parametro wp where wp.wep_nombre like '%SINCRONIZADOR%'

select * from curso_virtual

--CAMBIO DE CORREO MASIVO
--update uaa set uaa_email = 'guerrerocordobajohn@gmail.com'
--update persona set per_email = 'guerrerocordobajohn@gmail.com', per_email_interno = 'john.guerrero@usco.edu.co';
--update tercero set ter_email = 'guerrerocordobajohn@gmail.com';
--update ileusco.registro set reg_email = 'guerrerocordobajohn@gmail.com';
select * from ileusco.registro

select * from web_parametro wp where wp.wep_nombre like '%token%'

select * from usuario_administrativos ua where ua.us = 'a1075303330'

--CAMBIO SERVICIO TOKEN LOCAL
--UPDATE academia3000_john.dbo.web_parametro
SET wep_valor='http://sergio.usco.edu.co/iniciosesion/'
WHERE wep_codigo=377;


--ASIGNAR PERFIL EN BD
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 328, 463, 1);

--ASIGNAR PERFIL SUPER ENCUESTAS ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 328, 463, 1);

--ASIGNAR PERFIL SUPER ENCUESTAS ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 328, 463, 1);

--ASIGNAR PERFIL CARNETIZACION ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 316, 463, 1);

--ASIGNAR PERFIL GRADUADOS ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 47, 463, 1);

--ASIGNAR PERFIL CONTROL ACCESO ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 317, 463, 1);

--ASIGNAR PERFIL RESTAURANTE ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 88, 645, 1);

select * from usuario_grupo ug
inner join grupo g on ug.usg_grupo = g.gru_codigo 
where ug.usg_usuario = 146624 and ug.usg_estado = 1;

--CREACIÓN DE GRUPO
--INSERT INTO grupo (gru_nombre, gru_id, gru_estado)
VALUES ('Nota_Usuario_Registro', 'NOTA_USUARIO_REGISTRO', 1); 

--CONSULTAR PERFILES DE UNA PERSONA
select * from usuario_grupo ug
inner join grupo g on ug.usg_grupo = g.gru_codigo
where ug.usg_usuario = 146624 and ug.usg_estado = 1;

select * from usuario_grupo ug where ug.usg_usuario = 146624 and ug.usg_estado = 1

--VER GRUPOS
select * from grupo g where g.gru_codigo = 317 --88

select * from grupo g where g.gru_nombre like '%RESTAURANTE%'

--CONSULTAR USG POR PERCODIGO
select * from usuario_administrativo_login ual where ual.up = 108797

select * from usuario_graduado_admin_login


select * from usuario_encuestas_admin_login ueal 

select * from web_parametro wp where wp.wep_codigo in (247,248)


select * from sgd.documento d where d.doc_contenido = 'Fotos Carnetizacion' and d.per_codigo = 137556

select * from sgd.documento d where d.doc_contenido = 'Fotos Carnetizacion' and d.doc_nombre_archivo = '137556'

select * from estudiante e 
