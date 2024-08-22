--***********************************************--
----**************ENCUESTAS WEB******************--
--***********************************************--

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000_john.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Encuestas', 'Módulo que permite responder las encuestas parametrizadas para cada uno de los estamentos que comprende la institución', getdate(), 1);

--CREACIÓN DEL MÓDULO
INSERT INTO academia3000.dbo.modulo
(mod_nombre, mod_descripcion, mod_fecha, mod_orden)
VALUES('Encuestas Administrador', 'Módulo administrador de las encuestas que se aplican a los usuarios de la institución', getdate(), 1);

EXECUTE vinculacion_actual '20171157616', 0

Exec vinculacion_actual(:@per_identificacion, :@uaa_codigo) 

select * from dbo.modulo m 

select * from usuario_tipo ut 


select * from web_parametro wp 

--INSERT INTO academia3000_john.dbo.web_parametro
(wep_nombre, wep_valor, wep_descripcion, wep_estado)
VALUES('ENCUESTAS_IMPLEMENTACION_TOKEN', '1', 'PARAMETRIZA LA IMPLEMENTACION DEL TOKEN EN EL INICIO DE SESIÓN DEL MÓDULO ENCUESTAS', 1);

--INSERT INTO academia3000_john.dbo.web_parametro
(wep_nombre, wep_valor, wep_descripcion, wep_estado)
VALUES('POLITICA_TRATAMIENTO_DATOS', '1', 'PARAMETRIZA EL TEXTO QUE EXPLICA LA POLÍTICA DE TRATAMIENTO DE DATOS PERSONALES', 1);


select * from web_parametro wp where wp.wep_codigo = 494

UPDATE academia3000_john.dbo.web_parametro
SET wep_valor='En aplicación de la Ley 1581 de 2012, sus decretos reglamentarios y demás normas
que lo modifiquen complementen o aclaren, el titular del dato, por medio del
presente documento, imparte de manera previa, expresa e informada, la siguiente
autorización a <b>LA UNIVERSIDAD SURCOLOMBIANA</b> (en adelante <b>“USCO”</b>),
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
Universidad, (<a href="https://gaitana.usco.edu.co/pqr/">www.usco.edu.co/pqr/</a
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
voluntaria y es verídica.' 
WHERE wep_codigo=535;


select * from encuestas.cuestionarios c 

select * from encuestas.cuestionario_configuracion cc 

select * from encuestas.pregunta_tipo pt 

select * from encuestas.tipo_respuestas tr 

select * from encuestas.preguntas p 

select * from encuestas.respuestas r 

select * from encuestas.preguntas_respuestas pr ;

select * from encuestas.respuestas r;

select * from encuestas.respuestas_cuestionarios

select * from encuestas.preguntas_respuestas_subopciones prs 



select * from encuestas.respuestas_cuestionarios rc 

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




select count(*) from sibusco.restaurante_calendario rc 




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

  