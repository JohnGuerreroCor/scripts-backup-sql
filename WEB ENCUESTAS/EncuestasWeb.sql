--***********************************************--
----**************ENCUESTAS WEB******************--
--***********************************************--







---------------------------------------------------------
-- encuestas.usuario_encuesta_web_login source

CREATE VIEW [encuestas].[usuario_encuesta_web_login]
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
---------------------------------------------------------
---------------------------------------------------------

-- encuestas.usuario_encuesta_web source

CREATE VIEW [encuestas].[usuario_encuesta_web]
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

---------------------------------------------------------







CREATE TABLE [dbo].[terminos_condiciones] (
    [terc_codigo]         INT           IDENTITY (1, 1) NOT NULL,
    [terc_termino]        VARCHAR (MAX) NOT NULL,
    [terc_descripcion]    VARCHAR (MAX) NOT NULL,
    [terc_estado]         INT           DEFAULT 1 NOT NULL,
    [terc_fecha_creacion] DATETIME      DEFAULT GETDATE() NOT NULL,
    CONSTRAINT [PK_terminos_condiciones] PRIMARY KEY CLUSTERED ([terc_codigo] ASC)
);

select * from dbo.terminos_condiciones tc where tc.terc_estado = 1 and tc.terc_codigo = 2


INSERT INTO dbo.terminos_condiciones (terc_termino, terc_descripcion) VALUES('En atención a la aplicación de la Ley 1581 de 2012, sus decretos reglamentarios y demás normas
que lo modifiquen complementen o aclaren, el titular del dato, por medio del
presente documento, imparte de manera previa, expresa e informada, la siguiente
autorización a <b>LA UNIVERSIDAD SURCOLOMBIANA</b> (en adelante "USCO"),
para el manejo de mi información de la siguiente forma: <br />
<b>1. Principios:</b> La USCO garantiza la confidencialidad, libertad,
seguridad, veracidad, transparencia, acceso y circulación restringida de sus
datos y se reservan el derecho de modificar su Política de Privacidad de
Tratamiento de Datos Personales en cualquier momento. Para cualquier otra
información sobre los mismos, puede remitirse al aviso de privacidad de la
Universidad Surcolombiana (<a href="https://www.usco.edu.co/es/"
  >www.usco.edu.co</a
>). <br /><b>2. Finalidades:</b> El titular del dato autoriza a la USCO, la
recolección y tratamiento de sus datos personales por parte de USCO para las
siguientes finalidades: (i) Encuestas sociológicas y de opinión, (ii) fines
históricos, científicos o estadísticos, (iii)encuestas de caracterización para
fortalecer programas, (iv) encuestas procesos de autoevaluación institucional,
(v)encuestas de percepción con fines de acreditación y/o reacreditación
institucional, (vi)encuestas de seguimiento; y (vii) Las demás finalidades que
con ocasión del cumplimiento de su objeto requieran obtención de datos
personales para su tratamiento, y en todo caso de acuerdo con la ley. <br /><b
  >3. Medios:</b
>
Las comunicaciones derivadas de las anteriores finalidades, se podrán realizar a
través de medios análogos, físicos y electrónicos y cualquier otro conocido o
por conocer, por parte de la USCO y por parte de la entidad con quien la
Universidad tenga convenio para ejecutar las actividades descritas en las
finalidades. <br /><b>4. Uso:</b> Con el consentimiento de este documento,
autoriza al tratamiento de los datos registrados para su procesamiento,
recolección, almacenamiento, uso, custodia, circulación, supresión,
actualización, transmisión y/o transferencia nacional e internacional de los
datos suministrados. <br /><b>5. Transmisión:</b> En caso que la custodia y
almacenamiento sea realizado por una entidad con la que USCO tenga relación
contractual o convencional, autoriza para la transmisión de sus datos
personales, incluyendo los datos personales sensibles a un tercer país, que
cuenta con los estándares de seguridad en la protección de datos personales
fijados por la Superintendencia de Industria y Comercio. <br /><b
  >6. Responsable:</b
>
La Universidad actuará como responsable del Tratamiento de Datos Personales de
los cuales es usted titular; conforme la política de Tratamiento de Datos
Personales de la USCO disponible en la página web
<a href="https://www.usco.edu.co/es/" target="_blank"> www.usco.edu.co</a>
y para sus fines misionales. <br /><b>7. Datos sensibles:</b> Es de carácter
facultativo del titular del dato, responder preguntas que versen sobre Datos
Sensibles o sobre menores de edad <br /><b>8. Derechos del Titular: </b>Usted
tiene derecho a conocer, actualizar y corregir sus datos personales. Podrá
materializar estos derechos mediante el procedimiento de “Reclamos”. <br /><b
  >9. Reclamos: </b
>En caso de un reclamo o consulta relativa a sus datos personales, puede
realizarla ingresando la petición en la opción “PQRSDC” de la página web de la
Universidad, (<a href="https://www.usco.edu.co/pqr/">www.usco.edu.co/pqr/</a
>) o dejando su petición en el buzón físico ubicado en las dependencias de la
Universidad Surcolombiana en los horarios de atención de lunes a viernes de 8:00
a.m. a 12 m y de 2:00 p.m. a 5:30 p.m. 10. Política de privacidad: Si desea
mayor información sobre el tratamiento de sus datos personales, consulte nuestra
Política de Tratamiento de Datos personales en la página web de la Universidad
Surcolombiana (<a href="https://www.usco.edu.co/es/">www.usco.edu.co</a>).
<br />Teniendo en cuenta lo anterior, autoriza de manera voluntaria, previa,
explicita, informada e inequívoca a la Universidad Surcolombiana para tratar sus
datos personales mediante la información aquí contenida. Declara haber leído
cuidadosamente el contenido de este documento y haberlo comprendido a cabalidad,
razón por la cual entiende su alcance e implicaciones y acepta expresamente el
tratamiento de sus datos para los fines relacionados con la Misión
Institucional, fines legales, contractuales, comerciales. La información
obtenida para el Tratamiento de mis datos personales la he suministrado de forma
voluntaria y es verídica.', 'Autorización para el tratamiento de datos personales (AP-CTR-FO-26) vigencia 2024.');


UPDATE dbo.terminos_condiciones SET terc_termino='<h4 class="text-center">AUTORIZACIÓN PARA EL TRATAMIENTO DE DATOS PERSONALES</h4><br><br>
<p class="text-justify">  
En aplicación de la Ley 1581 de 2012, sus decretos reglamentarios y demás normas que lo modifiquen complementen o aclaren, el titular del dato, por medio del presente documento, imparte de manera previa, expresa e informada, la siguiente autorización a <strong>LA UNIVERSIDAD SURCOLOMBIANA</strong> (en adelante “USCO”), para el manejo de mi información de la siguiente forma:
</p> 
<ol>
<li class="text-justify">
<strong>Principios:</strong> La <strong>USCO</strong> garantiza la confidencialidad, libertad, seguridad, veracidad, transparencia, acceso y circulación restringida de mis datos, y se reserva el derecho de modificar su Política de Tratamiento de Datos Personales en cualquier momento.  Para cualquier otra información sobre los mismos, puede remitirse a la política de privacidad y condiciones de uso a la página web de la Universidad Surcolombiana (<a href="https://www.usco.edu.co" target="_blank">www.usco.edu.co</a>).
<br><br></li>
<li  class="text-justify">
<strong>Finalidades:</strong> El titular del dato autoriza a la <strong>USCO</strong>, el tratamiento de sus datos personales por parte de <strong>USCO</strong> para las siguientes finalidades:<br><br> 
 (i) Promoción y admisión; dar a conocer la oferta  de programas académicos de pregrado, posgrado y educación continuada, (ii) Registro y Matrícula: comunicación y procedimiento de matrícula financiera y académica, registro de cursos (iii) Educación y cultura; Enseñanza universitaria o superior, (iv) Becas, estímulos o incentivos y ayudas económicas (v) Gestión de actividades asociativas, culturales, recreativas, deportivas, sociales, apoyo a comunidades vulnerables, actividades académicas, administrativas y de bienestar universitario, (vi) Encuestas sociológicas y de opinión, (vii) Realizar difusión de convocatorias para participar en los diferentes estamentos de participación al interior de la Universidad, (viii) Crear bases de datos de acuerdo a las características y perfiles de los titulares de los datos personales, todo de acuerdo con lo dispuesto en la ley, (ix) Actividades tendientes a gestión contable, financiera, facturación, recaudo y cobro de cartera vencida, (x) Atención a los usuarios (PQRSD), (xi) Fines históricos, científicos o estadísticos, (xii) Publicidad propia y de terceros relacionados,(xiii) Seguridad - Video vigilancia y control acceso a las instalaciones de la Universidad, (xiv) Recolección de datos sensibles para brindar al estudiante servicios de bienestar universitario como lo son citas médicas, acompañamiento psicológico, estudio socioeconómico y servicios de bienestar social, (xv) Recolección de datos biométricos como la huella y/o imagen para la expedición de carnet estudiantil que serán usados para su identificación e ingreso a la Universidad, (xvi) Transferencia de datos personales a otros países, con el fin de posibilitar la realización de los objetivos trazados por la Universidad, (xvii) Comunicación relacionada con los servicios, y demás actividades asociadas con las funciones propias de la Universidad como institución de educación superior, alianzas, estudios, contenidos, así como con las demás instituciones que tengan una relación directa o indirecta; y proveer servicios, (xviii) Proceso de archivo, actualización de los sistemas, de protección y custodia de información y bases de datos,(xix) Publicaciones, investigaciones y consultoría: informar sobre las publicaciones, productos de investigación y servicios de consultoría y/o asesoría, a través de cualquier medio de comunicación, (xx) Envío de información a entidades gubernamentales o judiciales por solicitud expresa de las mismas, (xx1) Las demás finalidades que con ocasión del cumplimiento de su objeto requieran obtención de datos personales para su tratamiento, y en todo caso de acuerdo con la ley.
<br><br></li>
<li  class="text-justify">
<strong>Medios:</strong> Las comunicaciones derivadas de las anteriores finalidades, se podrán realizar a través de medios análogos, físicos y electrónicos y cualquier otro conocido o por conocer, por parte de la <strong>USCO</strong> y por parte de la entidad con quien la Universidad tenga convenio para ejecutar las actividades descritas en las finalidades.  
<br><br></li>
<li  class="text-justify">
<strong>Uso:</strong> Con el consentimiento de este documento, autoriza al tratamiento de los datos registrados para su procesamiento, recolección, almacenamiento, uso, custodia, circulación, supresión, actualización, transmisión y/o transferencia nacional e internacional de los datos suministrados.
<br><br></li>
<li  class="text-justify">
<strong>Transmisión:</strong>  En caso que la custodia y almacenamiento sea realizado por una entidad con la que USCO tenga relación contractual o convencional, autoriza para la transmisión de sus datos personales, incluyendo los datos personales sensibles a un tercer país, que cuenta con los estándares de seguridad en la protección de datos personales fijados por la Superintendencia de Industria y Comercio.    
<br><br></li>
<li  class="text-justify">
<strong>Responsable:</strong> La Universidad actuará como responsable del Tratamiento de Datos Personales de los cuales es usted titular; conforme la política de Tratamiento de Datos Personales de la <strong>USCO</strong> disponible en la página web <a href="https://www.usco.edu.co" target="_blank">www.usco.edu.co</a>  y para sus fines misionales. 
<br><br></li>
<li  class="text-justify">
<strong>Datos sensibles:</strong> Es de carácter facultativo del titular del dato, responder preguntas que versen sobre Datos Sensibles o sobre menores de edad
<br><br></li>
<li  class="text-justify">
<strong>Derechos del Titular:</strong> Usted tiene derecho a conocer, actualizar y corregir sus datos personales. Podrá materializar estos derechos mediante el procedimiento de “Reclamos”.
<br><br></li>
<li  class="text-justify">
<strong>Reclamos:</strong> En caso de un reclamo o consulta relativa a sus datos personales, puede realizarla ingresando la petición en la opción “PQRSDC” de la página web de la Universidad, (<a href="https://www.usco.edu.co/pqr" target="_blank">https://www.usco.edu.co/pqr/</a>) o dejando su petición en el buzón físico ubicado en las dependencias de la Universidad Surcolombiana en los horarios de atención de lunes a viernes de 8:00 a.m. a 12 m y de 2:00 p.m. a 5:30 p.m.
 <br><br></li>
 <li  class="text-justify">
<strong>Política de privacidad:</strong> Si desea mayor información sobre el tratamiento de sus datos personales, consulte nuestra Política de Tratamiento de Datos personales en la página web de la Universidad Surcolombiana (<a href="https://www.usco.edu.co" target="_blank">www.usco.edu.co</a>).   
<br><br></li>
</ol>
<p class="text-justify">
Teniendo en cuenta lo anterior, autoriza de manera voluntaria, previa, explicita, informada e inequívoca a la Universidad Surcolombiana para tratar sus datos personales mediante la información aquí contenida.<br> 
Declara haber leído cuidadosamente el contenido de este documento y haberlo comprendido a cabalidad, razón por la cual entiende su alcance e implicaciones y acepta expresamente el tratamiento de sus datos para los fines relacionados con la Misión Institucional, fines legales, contractuales, comerciales.<br> 
 La información obtenida para el Tratamiento de mis datos personales la he suministrado de forma voluntaria y es verídica.
</p>
    <br><br><br>', terc_descripcion='Tratamiento de datos personales inscripciones.' WHERE terc_codigo=2;
   
   
CREATE TABLE [dbo].[autorizacion_terminos] (
    [aute_codigo]         INT           IDENTITY (1, 1) NOT NULL,
    [aute_fecha_creacion] DATETIME      DEFAULT GETDATE() NOT NULL,
    [per_codigo]          INT           NULL,
    [ter_codigo]          INT           NULL,
    [mod_codigo]          INT           NOT NULL,
    [terc_codigo]         INT           NOT NULL,
    [uid]                 INT           NULL,
    [aute_ip]             VARCHAR (50)  DEFAULT CONVERT([varchar],connectionproperty('client_net_address'),(0)) NOT NULL,
    [aute_host]           VARCHAR (200) DEFAULT host_name() NOT NULL,
    [aute_session_id]     VARCHAR (100) NULL,
    CONSTRAINT [PK_autorizacion_terminos] PRIMARY KEY CLUSTERED ([aute_codigo] ASC),
    CONSTRAINT [FK_autorizacion_terminos_mod_codigo] FOREIGN KEY ([mod_codigo]) REFERENCES [dbo].[modulo] ([mod_codigo]),
    CONSTRAINT [FK_autorizacion_terminos_per_codigo] FOREIGN KEY ([per_codigo]) REFERENCES [dbo].[persona] ([per_codigo]),
    CONSTRAINT [FK_autorizacion_terminos_ter_codigo] FOREIGN KEY ([ter_codigo]) REFERENCES [dbo].[tercero] ([ter_codigo]),
    CONSTRAINT [FK_autorizacion_terminos_terc_codigo] FOREIGN KEY ([terc_codigo]) REFERENCES [dbo].[terminos_condiciones] ([terc_codigo])
);

select * FROM usuario u 

select * from dbo.autorizacion_terminos

INSERT INTO dbo.autorizacion_terminos (aute_fecha_creacion, per_codigo, ter_codigo, mod_codigo, terc_codigo, uid, aute_ip, aute_host, aute_session_id) VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Encuestas', 'Módulo que permite responder las encuestas parametrizadas para cada uno de los estamentos que comprende la institución', getdate(), 1);

select * from modulo m where m.mod_nombre like '%ENCUES%'


select  top 1 *, GETDATE() as horaInicioSesion from carnetizacion.usuario_carnet_digital_login ucdl inner join uaa u on ucdl.usg_uaa = u.uaa_codigo inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on ucdl.up = p.per_codigo where  ucdl.us = 'u20171155993' order by ucdl.usg_codigo desc

select * from carnetizacion.usuario_carnet_digital_login ucdl 
select * from carnetizacion.usuario_carnet_digital ucd 

EXECUTE vinculacion_actual '20171157616', 0

Exec vinculacion_actual(:@per_identificacion, :@uaa_codigo) 

select * from dbo.modulo m 

select * from usuario_tipo ut;


select * from web_parametro wp 

--INSERT INTO academia3000_john.dbo.web_parametro
(wep_nombre, wep_valor, wep_descripcion, wep_estado)
VALUES('ENCUESTAS_IMPLEMENTACION_TOKEN', '1', 'PARAMETRIZA LA IMPLEMENTACION DEL TOKEN EN EL INICIO DE SESIÓN DEL MÓDULO ENCUESTAS', 1);

--INSERT INTO academia3000_john.dbo.web_parametro
(wep_nombre, wep_valor, wep_descripcion, wep_estado)
VALUES('POLITICA_TRATAMIENTO_DATOS', '1', 'PARAMETRIZA EL TEXTO QUE EXPLICA LA POLÍTICA DE TRATAMIENTO DE DATOS PERSONALES', 1);


select * from web_parametro wp where wp.wep_codigo = 494

UPDATE academia3000_john.dbo.web_parametro
SET wep_valor= 
WHERE wep_codigo=541;




select * from estudiante e 

select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc 

select * from encuestas.pregunta_tipo pt 

select * from encuestas.tipo_respuestas tr 

select * from encuestas.preguntas p 

select * from encuestas.respuestas r 

select * from encuestas.preguntas_respuestas pr ;

select * from encuestas.respuestas r order by r.res_codigo desc;

INSERT INTO encuestas.respuestas ( prr_codigo, res_estado, res_texto, pre_codigo, res_fecha, esc_codigo) VALUES(NULL, 61259, 4407, 1, NULL, 1202, '2024-09-04 09:54:06.863', NULL);

select * from encuestas.respuestas_cuestionarios

select * from encuestas.preguntas_respuestas_subopciones prs 

select * from estudiante e 

select * from uaa_personal up order by up.uap_codigo desc

select * from persona p where p.per_codigo = 181366

select * from encuestas.respuestas_cuestionarios rc order by rc.rcu_codigo desc

select * from carnetizacion.usuario_carnet_digital ucd where ucd.us = 'a1075303330'

select * from encuestas.cuestionarios c 
inner join encuestas.cuestionario_configuracion cc on c.cue_codigo = cc

select * from encuestas.cuestionarios c 

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 83865

select * from curso c 

select * from web_parametro wp 

select c.cue_nombre, c.cue_fecha_inicio, c.cue_fecha_fin, c.cue_estado, ucd.us from encuestas.cuestionarios c 
inner join encuestas.cuestionario_configuracion cc on c.cue_codigo = cc.cue_codigo 
inner join carnetizacion.usuario_carnet_digital ucd on cc.tus_codigo  = ucd.istipo 
where ucd.us = 'a10753033330' and (getdate() between c.cue_fecha_inicio AND c.cue_fecha_fin)


select * from tercero t where t.ter_identificacion = '55172390'

select * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797

SELECT DISTINCT ucd.us, c.cue_codigo, c.cue_nombre, c.cue_instrucciones, u.uaa_nombre_corto as uaa_encargado,
cc.cuc_codigo, ut.tus_codigo, ut.tus_nombre, uc.uaa_codigo, uc.uaa_nombre, rc.rcu_codigo,
c.cue_fecha_inicio, c.cue_fecha_fin, rc.rcu_fecha
FROM encuestas.cuestionarios c
INNER JOIN uaa u ON c.uaa_codigo = u.uaa_codigo
INNER JOIN encuestas.cuestionario_configuracion cc ON (c.cue_codigo = cc.cue_codigo AND cc.cuc_estado = 1)
inner join carnetizacion.usuario_carnet_digital ucd on cc.tus_codigo  = ucd.istipo
INNER JOIN usuario_tipo ut ON ucd.istipo = ut.tus_codigo
LEFT JOIN uaa uc ON (cc.uaa_codigo = uc.uaa_codigo)
LEFT JOIN encuestas.respuestas_cuestionarios rc ON (rc.cue_codigo = c.cue_codigo AND rc.per_codigo = 108797)
WHERE c.cue_estado = 1 AND (GETDATE() BETWEEN c.cue_fecha_inicio AND c.cue_fecha_fin) and ucd.up = 108797 and ut.tus_codigo = 1

select * from carnetizacion.usuario_carnet_digital ucd where ucd.up = 108797--108796

select * from carnetizacion.usuario_carnet_digital_login ucdl where ucdl.istipo = 6


select  top 1 *, GETDATE() as horaInicioSesion from encuestas.usuario_encuesta_web_login ucdl inner join uaa u on ucdl.usg_uaa = u.uaa_codigo inner join sede s on s.sed_codigo = u.sed_codigo inner join persona p on ucdl.up = p.per_codigo where  ucdl.us = 'a1075303330' order by ucdl.usg_codigo desc


select count(*) from sibusco.restaurante_calendario rc 


select * from web_parametro wp 

select * from encuestas.usuario_encuesta_web

SELECT
	DISTINCT ucd.us,
	c.cue_codigo,
	c.cue_nombre,
	c.cue_instrucciones,
	u.uaa_nombre_corto as uaa_encargado,
	cc.cuc_codigo,
	ut.tus_codigo,
	ut.tus_nombre,
	uc.uaa_codigo,
	uc.uaa_nombre,
	rc.rcu_codigo,
	c.cue_fecha_inicio,
	c.cue_fecha_fin,
	rc.rcu_fecha
FROM
	encuestas.cuestionarios c
	INNER JOIN uaa u ON c.uaa_codigo = u.uaa_codigo
	INNER JOIN encuestas.cuestionario_configuracion cc ON (
		c.cue_codigo = cc.cue_codigo
		AND cc.cuc_estado = 1
	)
	inner join carnetizacion.usuario_carnet_digital ucd on cc.tus_codigo = ucd.istipo
	INNER JOIN usuario_tipo ut ON ucd.istipo = ut.tus_codigo
	LEFT JOIN uaa uc ON (cc.uaa_codigo = uc.uaa_codigo)
	LEFT JOIN encuestas.respuestas_cuestionarios rc ON (
		rc.cue_codigo = c.cue_codigo
		AND rc.per_codigo = 108797
	)
WHERE
	c.cue_estado = 1
	AND (
		GETDATE() BETWEEN c.cue_fecha_inicio
		AND c.cue_fecha_fin
	)
	and ucd.up = 108797
	
	
	
select * from encuestas.respuestas_cuestionarios rc 

select * from encuestas.respuestas r 

select * from encuestas.re





select
  cuc_codigo,
  cuc_estado,
  ca.uaa_codigo,
  ca.cue_codigo,
  us.tus_codigo,
  us.tus_nombre,
  fecha_registro,
  cue_nombre,
  uaa_nombre,
  v.vin_codigo,
  vin_nombre
from
  encuestas.cuestionario_configuracion ca
  join encuestas.cuestionarios c on ca.cue_codigo = c.cue_codigo full
  join dbo.uaa u on ca.uaa_codigo = u.uaa_codigo
  join dbo.usuario_tipo us on ca.tus_codigo = us.tus_codigo
  left join vinculacion v on v.vin_codigo = ca.vin_codigo
where
  cuc_estado = 1
  AND c.uaa_codigo = :uaa
  order by ca.cuc_codigo desc
  
  
  
  
  
  
select * from persona p where p.per_nombre like '%ANGELA MARÍA%'

  