Exec dbo.getTokenDocumento(:@atributos)  -- Proceso Almacenado

select * from usuario_tipo

Select dbo.getTokenDocumento('108797')--121026

Select dbo.getTokenDocumento('65'+'554'+'108797')

select * from sgd.documento d where d.doc_nombre_archivo = '108797' and (SELECT * from sgd.documento d2) order by d.doc_codigo desc
select * from sgd.tipo_documento td 

tdoc_codigo = 78 | tdoc_nombre = FOTO | tdoc_descripcion = Fotografia


select * from web_parametro wp 

select * from modulo m where m.mod_codigo = 65

select * from uaa u where u.uaa_codigo = 554

select * from uaa_personal up where up.per_codigo = 108797

select * from persona p where p.per_identificacion = '1075320464'

select * from modulo m where m.mod_nombre like '%CARNET%'


INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_orden)
VALUES(N'Carnetizacion Administrador', N'Módulo administrador del carnet intitucional', 1);


SELECT * FROM acreditacion.norma_acreditacion na


select * from sgd.documento d where d.doc_codigo = 98711


select * from sgd.documento d 

select * from persona p where p.per_nombre LIKE '%NATALIA%' and p.per_apellido like '%CARRERA%'

select * from estudiante e where e.per_codigo = 101825
20181170326
20161144636
20132122391

select count(*) from dbo.espacio e where e.esp_estado = 1

select * from dbo.tipo_id ti where ti.tii_estado = 1 order by ti.tii_num_caracteres desc

-- espacio - > bloque - > sub sede - > sede
select * from dbo.espacio e where e.esp_estado = 1 


select * from dbo.sede s where s.sed_estado = 1 and s.sippa_sed_codigo is not null
select * from dbo.sub_sede ss where ss.sed_codigo = ?
select * from dbo.bloque b where b.blo_estado = 1 and b.blo_estado is not null and b.sus_codigo = 2
select * from dbo.espacio_tipo et 
select * from espacio e where e.esp_nombre like '%AUDITORIO%'


select * from dbo.tercero t where t.ter_identificacion = '38960471' and t.ter_borrado = 0


select * from dbo.bloque b where b.blo_estado = 1 and b.blo_estado is not null and b.sus_codigo = 19

select count(*) from uaa u where uaa_dependencia is not null and uat_codigo in (1,2,6,9,11,22) and u.sed_codigo in (1,2,3,4)  and u.uaa_estado = 1
select * from uaa u where u.sed_codigo = 1 and u.uaa_dependencia is not null and u.uat_codigo in (1,2,6,9,11,22) and u.sed_codigo in (1,2,3,4) and u.uaa_estado = 1

select * from uaa_tipo ut where ut.uat_codigo in (1,2,6,9,11,22)

select * from evento e 



-- dbo.usuario_carnet_digital source

CREATE VIEW [dbo].[usuario_carnet_digital]
AS
	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_estudiantes.up,
						  dbo.usuario_estudiantes.us,dbo.usuario_estudiantes.istipo, dbo.usuario_estudiantes.ischange, 
						  dbo.usuario_estudiantes.state,dbo.usuario_estudiantes.uid
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_estudiantes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_estudiantes.uid 
	WHERE     (dbo.usuario_grupo.usg_estado = 1) AND (dbo.usuario_estudiantes.state = 1) 
UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_estudiantes_virtual.up,
						  dbo.usuario_estudiantes_virtual.us,dbo.usuario_estudiantes_virtual.istipo, dbo.usuario_estudiantes_virtual.ischange, 
						  dbo.usuario_estudiantes_virtual.state, dbo.usuario_estudiantes_virtual.uid
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_estudiantes_virtual ON dbo.usuario_grupo.usg_usuario = dbo.usuario_estudiantes_virtual.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1) AND (dbo.usuario_estudiantes_virtual.state = 1) 

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_docentes.up, dbo.usuario_docentes.us, 
						  dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.state,dbo.usuario_docentes.uid
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1) AND (dbo.usuario_docentes.state = 1) 

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_administrativos.up, dbo.usuario_administrativos.us, 
						  dbo.usuario_administrativos.istipo, dbo.usuario_administrativos.ischange,dbo.usuario_administrativos.state, dbo.usuario_administrativos.uid
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_administrativos ON dbo.usuario_grupo.usg_usuario = dbo.usuario_administrativos.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1)  AND (dbo.usuario_administrativos.state = 1) 

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_graduados.up, dbo.usuario_graduados.us, 
						  dbo.usuario_graduados.istipo, dbo.usuario_graduados.ischange, dbo.usuario_graduados.state, dbo.usuario_graduados.uid
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_graduados ON dbo.usuario_grupo.usg_usuario = dbo.usuario_graduados.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1)  AND (dbo.usuario_graduados.state = 1)

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_estudiantes_intercambio.up, 
						  dbo.usuario_estudiantes_intercambio.us, dbo.usuario_estudiantes_intercambio.istipo, dbo.usuario_estudiantes_intercambio.ischange,
						  dbo.usuario_estudiantes_intercambio.state, dbo.usuario_estudiantes_intercambio.uid
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_estudiantes_intercambio ON dbo.usuario_grupo.usg_usuario = dbo.usuario_estudiantes_intercambio.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1)  AND (dbo.usuario_estudiantes_intercambio.state = 1);
	


-- dbo.usuario_carnet_digital_login source

CREATE VIEW [dbo].[usuario_carnet_digital_login]
AS
	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_estudiantes.up,
						  dbo.usuario_estudiantes.us,dbo.usuario_estudiantes.istipo, dbo.usuario_estudiantes.ischange, 
						  dbo.usuario_estudiantes.uwd2, dbo.usuario_estudiantes.state,dbo.usuario_estudiantes.uid, dbo.usuario_estudiantes.us_encriptado
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_estudiantes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_estudiantes.uid 
	WHERE     (dbo.usuario_grupo.usg_estado = 1) AND (dbo.usuario_estudiantes.state = 1) 
UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_estudiantes_virtual.up,
						  dbo.usuario_estudiantes_virtual.us,dbo.usuario_estudiantes_virtual.istipo, dbo.usuario_estudiantes_virtual.ischange, 
						  dbo.usuario_estudiantes_virtual.uwd2, dbo.usuario_estudiantes_virtual.state, dbo.usuario_estudiantes_virtual.uid, dbo.usuario_estudiantes_virtual.us_encriptado
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_estudiantes_virtual ON dbo.usuario_grupo.usg_usuario = dbo.usuario_estudiantes_virtual.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1) AND (dbo.usuario_estudiantes_virtual.state = 1) 

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_docentes.up, dbo.usuario_docentes.us, 
						  dbo.usuario_docentes.istipo, dbo.usuario_docentes.ischange, dbo.usuario_docentes.uwd2, dbo.usuario_docentes.state, 
						  dbo.usuario_docentes.uid, dbo.usuario_docentes.us_encriptado
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_docentes ON dbo.usuario_grupo.usg_usuario = dbo.usuario_docentes.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1) AND (dbo.usuario_docentes.state = 1) 

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_administrativos.up, dbo.usuario_administrativos.us, 
						  dbo.usuario_administrativos.istipo, dbo.usuario_administrativos.ischange, dbo.usuario_administrativos.uwd2, 
						  dbo.usuario_administrativos.state, dbo.usuario_administrativos.uid, dbo.usuario_administrativos.us_encriptado
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_administrativos ON dbo.usuario_grupo.usg_usuario = dbo.usuario_administrativos.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1)  AND (dbo.usuario_administrativos.state = 1) 

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_graduados.up, dbo.usuario_graduados.us, 
						  dbo.usuario_graduados.istipo, dbo.usuario_graduados.ischange, dbo.usuario_graduados.uwd2, 
						  dbo.usuario_graduados.state, dbo.usuario_graduados.uid, dbo.usuario_graduados.us_encriptado
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_graduados ON dbo.usuario_grupo.usg_usuario = dbo.usuario_graduados.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1)  AND (dbo.usuario_graduados.state = 1)

UNION

	SELECT     dbo.usuario_grupo.usg_usuario, dbo.grupo.gru_nombre, dbo.usuario_grupo.usg_grupo, dbo.grupo.gru_id, dbo.usuario_grupo.usg_uaa, 
						  dbo.usuario_grupo.usg_estado, dbo.grupo.gru_codigo, dbo.usuario_grupo.usg_codigo, dbo.usuario_estudiantes_intercambio.up, 
						  dbo.usuario_estudiantes_intercambio.us, dbo.usuario_estudiantes_intercambio.istipo, dbo.usuario_estudiantes_intercambio.ischange,
						  dbo.usuario_estudiantes_intercambio.uwd2,dbo.usuario_estudiantes_intercambio.state, dbo.usuario_estudiantes_intercambio.uid,
						  dbo.usuario_estudiantes_intercambio.us_encriptado
	FROM         dbo.usuario_grupo INNER JOIN
						  dbo.grupo ON dbo.usuario_grupo.usg_grupo = dbo.grupo.gru_codigo INNER JOIN
						  dbo.usuario_estudiantes_intercambio ON dbo.usuario_grupo.usg_usuario = dbo.usuario_estudiantes_intercambio.uid
	WHERE     (dbo.usuario_grupo.usg_estado = 1)  AND (dbo.usuario_estudiantes_intercambio.state = 1);