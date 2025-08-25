-- Crear la tabla evaluacion_cuestionario_cap en el esquema CAP
CREATE TABLE cap.evaluacion_cuestionario_cap (
    evcc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    tiec_codigo INT NOT NULL,
    evcc_instrucciones VARCHAR(3000) NOT NULL,
	evcc_estado INT DEFAULT 1,
    FOREIGN KEY (tiec_codigo) REFERENCES cap.tipo_evaluacion_cap(tiec_codigo)
);

-- Crear la tabla evaluacion_tipo_pregunta_cap en el esquema CAP
CREATE TABLE cap.evaluacion_tipo_pregunta_cap (
    etpc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    etpc_nombre VARCHAR(100) UNIQUE NOT NULL,
    etpc_estado INT DEFAULT 1
);

INSERT INTO cap.evaluacion_tipo_pregunta_cap (etpc_nombre) VALUES
('Selección única (Radio-Butom)'), ('Selección única (Select)'), ('Texto');

select * from cap.evaluacion_tipo_pregunta_cap

-- Crear la tabla evaluacion_pregunta_cap en el esquema CAP
CREATE TABLE cap.evaluacion_pregunta_cap (
    evpc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evcc_codigo INT NOT NULL,
    evpc_pregunta VARCHAR(500) NOT NULL,
    etpc_codigo INT NOT NULL,
	evpc_obligatoria INT NOT NULL,
    evpc_estado INT DEFAULT 1,
    FOREIGN KEY (evcc_codigo) REFERENCES cap.evaluacion_cuestionario_cap(evcc_codigo),
	FOREIGN KEY (etpc_codigo) REFERENCES cap.evaluacion_tipo_pregunta_cap(etpc_codigo)
);

-- Crear la tabla evaluacion_opciones_cap en el esquema CAP
CREATE TABLE cap.evaluacion_opciones_cap (
    evop_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evop_opcion VARCHAR(300) NOT NULL,
    evop_estado INT DEFAULT 1
);

select * from cap.evaluacion_opciones_cap

-- Crear la tabla evaluacion_pregunta_respuesta_cap en el esquema CAP **
CREATE TABLE cap.evaluacion_pregunta_respuesta_cap (
    eprc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evpc_codigo INT NOT NULL,
    evop_codigo INT NOT NULL,
    eprc_estado INT DEFAULT 1,
    FOREIGN KEY (evpc_codigo) REFERENCES cap.evaluacion_pregunta_cap(evpc_codigo),
    FOREIGN KEY (evop_codigo) REFERENCES cap.evaluacion_opciones_cap(evop_codigo)
);

select * from cap.evaluacion_pregunta_respuesta_cap


-- Crear la tabla evaluacion_respuesta_cuestionario_cap en el esquema CAP **
CREATE TABLE cap.evaluacion_respuesta_cuestionario_cap (
    ercc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    asep_codigo INT NOT NULL,
    evcc_codigo INT NOT NULL,
	ercc_puntaje INT NOT NULL,
	ercc_ip VARCHAR(100) NOT NULL,
	ercc_fecha_registro DATETIME DEFAULT GETDATE(),
    ercc_estado INT DEFAULT 1,
    FOREIGN KEY (asep_codigo) REFERENCES cap.asignacion_evaluacion_par(asep_codigo),
    FOREIGN KEY (evcc_codigo) REFERENCES cap.evaluacion_cuestionario_cap(evcc_codigo)
);

select * from cap.evaluacion_respuesta_cuestionario_cap

-- Crear la tabla evaluacion_respuesta_cap en el esquema CAP
CREATE TABLE cap.evaluacion_respuesta_cap (
    erc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    evpc_codigo INT NOT NULL,
    eprc_codigo INT,
    ercc_codigo INT NOT NULL,
	erc_texto VARCHAR(2000),
    erc_estado INT DEFAULT 1, 
    FOREIGN KEY (ercc_codigo) REFERENCES cap.evaluacion_respuesta_cuestionario_cap(ercc_codigo)
);

select * from cap.evaluacion_respuesta_cap

--Crear tabla notificacion_cap en el esquema CAP
CREATE TABLE cap.notificacion (
	nod_codigo INT IDENTITY(1,1) PRIMARY KEY,
	sop_codigo INT NOT NULL,
	nod_fecha_creacion DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (sop_codigo) REFERENCES cap.solicitud_puntaje(sop_codigo)
);

select * from cap.notificacion


---*************** PARAMETRIZACIÓN EVALUACION PAR *******************
-- cap.evaluacion_opciones_cap
INSERT INTO cap.evaluacion_opciones_cap (evop_opcion) VALUES
('SI'), ('NO'), 
('Regional'), ('Nacional'), ('Internacional'),
('Académico'), ('De las TICs'), ('De beneficio social'),('Económico'), ('Corporativo'),
('Cumple'), ('No Cumple'),
('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'), ('10'), 
('Otro');

select * from cap.evaluacion_opciones_cap
select * from cap.tipo_evaluacion_cap
select * from cap.evaluacion_cuestionario_cap

-- cap.evaluacion_cuestionario_cap
INSERT INTO cap.evaluacion_cuestionario_cap (tiec_codigo, evcc_instrucciones) VALUES
(6, '<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>EVALUACIÓN DEL LIBRO ENSAYO O CAPÍTULO DE LIBRO</strong></h6>
<p>
  De conformidad con lo dispuesto en el literal e, numeral I, artículo 10, del
  Decreto 1279 de 2002, para libro texto y para capítulo de libro, literal d,
  numeral III, artículo 10, de la norma en mención, puede asignar hasta 15
  puntos.
</p>
<p>A continuación, responda cada una de las siguientes preguntas:</p>'),
(5, '<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6>
  <strong
    >EVALUACIÓN DEL LIBRO DERIVADO DE INVESTIGACIÓN O CAPÍTULO DE LIBRO</strong
  >
</h6>
<p>
  De conformidad con lo dispuesto en el literal c, numeral I, artículo 10, del
  Decreto 1279 de 2002, para libro texto y para capítulo de libro, literal d,
  numeral III, artículo 10, de la norma en mención, puede asignar hasta 20
  puntos.
</p>
<p>A continuación, responda cada una de las siguientes preguntas:</p>'),
  (4,'<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>EVALUACIÓN DEL LIBRO TEXTO O CAPÍTULO DE LIBRO</strong></h6>
<p>
  De conformidad con lo dispuesto en el literal d, numeral I, artículo 10, del
  Decreto 1279 de 2002, para libro texto y para capítulo de libro, literal d,
  numeral III, artículo 10, de la norma en mención, puede asignar hasta 15
  puntos.
</p>
<p>A continuación, responda cada una de las siguientes preguntas:</p>'),
  (3,'<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>EVALUACIÓN DE SOFTWARE</strong></h6>
<p>
  De conformidad con lo dispuesto en el literal K, artículo 10, del Decreto 1279
  de 2002, por software puede asignar hasta quince (15) puntos.
</p>
<p>
  A continuación, responda cada una de las preguntas y fundamente su respuesta
  sobre los siguientes aspectos:
</p>'),
  (2,'<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>EVALUACIÓN DE LA OBRA ARTÍSTICA</strong></h6>
<p>
  De conformidad con lo dispuesto en el literal e, numeral I, artículo 10, del
  Decreto 1279 de 2002, por libro ensayo puede asignar hasta 15 puntos.
</p>
<p>A continuación, responda cada una de las siguientes preguntas:</p>'),
 (1,'<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>EVALUACIÓN DE LA PRODUCCIÓN</strong></h6>
<p>
  De conformidad con lo dispuesto en el literal b, numeral I, artículo 10, del
  Decreto 1279 de 2002, por producción de videos, cinematográficas o
  fonográficas, se pueden asignar hasta:
</p>
<ul>
  <li>
    <strong>Impacto:</strong><br />
    Internacional: Hasta 12 puntos salariales.<br />
    Nacional: Hasta 7 puntos salariales.<br />
    Regional o local: Hasta 48 puntos por bonificación.
  </li>
</ul>
<p>A continuación, responda cada una de las siguientes preguntas:</p>'),
 (7,'<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>5. CRITERIOS DE EVALUACION</strong></h6>
<p>
  De conformidad con lo dispuesto en el Articulo 10, numeral I, literal j del
  Decreto 1279 de 2002, por Producción Técnica, y Los siguientes criterios de
  evaluación son ajustados a los lineamientos de la Resolución 00693 del 13 de
  julio del 2004 emitido por COLCIENCIAS hoy Ministerio de Ciencia, Tecnología e
  Innovación MINCIENCIAS, se tendrá en cuenta:
</p>
<ol>
  <li>Aportes en investigación, innovación o adaptación</li>
  <li>
    Impactos del proyecto
    <ol>
      <li>
        Impactos científicos y tecnológicos del proyecto en la empresa, centro o
        grupo de investigación
      </li>
      <li>
        Impactos sobre la productividad y competitividad de la empresa o sector
        productivo
      </li>
      <li>Impactos sobre el medio ambiente y la sociedad</li>
      <li>Impactos sobre la economía y la sociedad</li>
    </ol>
  </li>
  <li>Aspectos económicos y financieros</li>
</ol>
<p>
  A continuación, se tendrá cada uno de los criterios a evaluar con un tope
  máximo de puntos, a saber:
</p>');

select * from cap.evaluacion_cuestionario_cap a
inner join cap.tipo_evaluacion_cap b on a.tiec_codigo = b.tiec_codigo --   evcc_codigo
select * from cap.evaluacion_tipo_pregunta_cap --  etpc_codigo
select * from cap.evaluacion_pregunta_cap

-- cap.evaluacion_pregunta_cap
INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(1,'¿Considera que hay un desarrollo completo del tema?',1,1), 
(1,'Justifique item 1',3,1),
(1,'¿Considera que hay una adecuada fundamentación teórica con respecto al tema tratado?',1,1),
(1,'Justifique item 2',3,1),
(1,'¿La metodología aplicada corresponde con su carácter?',1,1), 
(1,'Justifique item 3',3,1),
(1,'¿Considera que la obra es inédita?',1,1), 
(1,'Justifique item 4',3,1),
(1,'¿Fue publicado en formato multimedia?',1,1), 
(1,'Justifique item 5',3,1),
(1,'Describa los aportes y reflexión personal de los(as) autores(as):',3,1),
(1,'Dé su concepto acerca de la actualidad, calidad y pertinencia de las fuentes bibliográficas empleadas:',3,1),
(1,'¿Estime su concepto acerca del prestigio (regional, nacional o internacional) de la editorial y del proceso de edición y publicación de la misma?',3,1),
(1,'¿Tiene usted elementos para calificar el grado de divulgación que tiene o puede tener la obra?',3,1),
(1,'¿Cuál estima usted que es el ámbito de su impacto?',1,1),
(1,'Cite el ISBN del libro',3,1),
(1,'Por favor elabore una sinopsis de su evaluación académico o científica que recoja lo fundamental de sus comentarios sobre el trabajo analizado. Destaque los aportes, vacíos o limitaciones contenidos en dicho material:',3,1);

INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(2,'¿Desarrolló completamente la temática propuesta y hay unidad en la obra?',1,1),
(2,'Justifique item 1',3,1),
(2,'¿Existe una adecuada fundamentación teórica del tema tratado?',1,1),
(2,'Justifique item 2',3,1),
(2,'¿El tratamiento metodológico del tema es el apropiado para una producción académica y científica?',1,1),
(2,'Justifique item 3',3,1),
(2,'¿La obra es inédita?',1,1),
(2,'Justifique item 4',3,1),
(2,'¿El proceso de edición y publicación se realizó por una editorial de reconocido prestigio y con un tiraje apropiado?',1,1),
(2,'Justifique item 5',3,1),
(2,'¿Se evidencian  los aportes y la reflexión personal de los investigadores?',1,1),
(2,'Justifique item 6',3,1),
(2,'¿Las fuentes y la bibliografía empleada son  pertinentes, y de alta calidad?',1,1),
(2,'Justifique item 7',3,1),
(2,'¿Cuál estima usted que es el grado de divulgación?',1,1),
(2,'Justifique item 8',3,1),
(2,'Por favor elabore una sinopsis de su evaluación académica o científica que recoja lo fundamental de sus comentarios sobre el trabajo analizado.  Destaque los aportes, observaciones a dicho material.',3,1);

INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(3,'¿Considera que la obra está orientada hacia el proceso enseñanza-aprendizaje?',1,1),
(3,'Justifique item 1',3,1),
(3,'¿Hay un desarrollo completo del tema en el nivel correspondiente?',1,1),
(3,'Justifique item 2',3,1),
(3,'¿Considera que la obra tiene un carácter didáctico?',1,1),
(3,'Justifique item 3',3,1),
(3,'¿Considera que la obra es inédita?',1,1),
(3,'Justifique item 4',3,1),
(3,'¿Considera que la obra cuenta con un contenido actualizado?',1,1),
(3,'Justifique item 5',3,1),
(3,'¿Tiene usted elementos para calificar el grado de divulgación que tiene o puede tener la obra?',1,1),
(3,'Justifique item 6',3,1),
(3,'¿Fue publicado en formato multimedia?',1,1),
(3,'Justifique item 7',3,1),
(3,'Describa los aportes y la reflexión personal de los(as) autores(as):',3,1),
(3,'Emita su concepto acerca del prestigio (regional, nacional o internacional) de la editorial y del proceso de edición y publicación de la obra:',3,1),
(3,'Cite el ISBN del libro:',3,1),
(3,'Por favor elabore una sinopsis de su evaluación académica o científica que recoja lo fundamental de sus comentarios sobre el trabajo analizado. Destaque los aportes, vacíos o limitaciones contenidos en dicho material:',3,1);

INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(4,'¿El producto (software) es de fácil instalación y/o acceso?',1,1),
(4,'Fundamente el item 1',3,1),
(4,'¿Considera que el producto ante usted presentado cumple con los requisitos para ser catalogado como software?',1,1),
(4,'Fundamente el item 2',3,1),
(4,'¿El producto (software) utiliza adecuadamente los recursos de hardware (RAM, Almacenamiento, Procesamiento)?',1,1),
(4,'Fundamente el item 3',3,1),
(4,'¿El funcionamiento del software obedece a las especificaciones y/o objeto de desarrollo?',1,1),
(4,'Fundamente el item 4',3,1),
(4,'¿El producto (software) es de fácil navegabilidad y/o utilización desde el punto de vista del usuario final?',1,1),
(4,'Fundamente el item 5',3,1),
(4,'¿El producto (software) corresponde a una herramienta nueva para la solución del tipo de problemas que resuelve o bien el producto mejora de manera considerable la funcionalidad de herramientas similares?',1,1),
(4,'Fundamente el item 6',3,1),
(4,'¿Cual seria el ámbito de impacto del producto (software)?',1,1),
(4,'Fundamente el item 7',3,1),
(4,'¿El producto (software), según las leyes de Derechos de Autor, cumple con los requisitos de originalidad y de producto no plagiado?',1,1),
(4,'Fundamente el item 8',3,1),
(4,'¿A cuál sector considera usted, que sea aplicable el producto (software) puesto de presente?',2,1),
(4,'¿Cuál?',3,0),
(4,'Código Fuente',1,1),
(4,'Manual Técnico',1,1),
(4,'Manual de Usuario',1,1),
(4,'Programa Ejecutable',1,1),
(4,'Algoritmo',1,1);

INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(5,'¿Considera que hay un desarrollo completo del tema?',1,1),
(5,'Justifique item 1',3,1),
(5,'¿Considera que hay una adecuada fundamentación teórica con respecto al tema tratado?',1,1),
(5,'Justifique item 2',3,1),
(5,'¿La metodología aplicada corresponde con su carácter?',1,1),
(5,'Justifique item 3',3,1),
(5,'¿Considera que la obra es inédita?',1,1),
(5,'Justifique item 4',3,1),
(5,'¿Fue publicado en formato multimedia?',1,1),
(5,'Justifique item 5',3,1),
(5,'Describa los aportes y reflexión personal de los(as) autores(as):',3,1),
(5,'Dé su concepto acerca de la actualidad, calidad y pertinencia de las fuentes bibliográficas empleadas:',3,1),
(5,'¿Estime su concepto acerca del prestigio (regional, nacional o internacional) de la editorial y del proceso de edición y publicación de la misma?',3,1),
(5,'¿Tiene usted elementos para calificar el grado de divulgación que tiene o puede tener la obra?',3,1),
(5,'¿Cuál estima usted que es el ámbito de su impacto?',1,1),
(5,'Cite el ISBN del libro:',3,1),
(5,'Por favor elabore una sinopsis de su evaluación académico o científica que recoja lo fundamental de sus comentarios sobre el trabajo analizado. Destaque los aportes, vacíos o limitaciones contenidos en dicho material:',3,1);

INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(6,'¿Considera que el impacto generado por el material es significativo? ¿Qué tipo de contribución tiene el material?',1,1),
(6,'Justifique item 1',3,1),
(6,'¿El contenido que propone el material está acorde con las tendencias didácticas o documentales actuales, motivan y despiertan el interés de los receptores?',1,1),
(6,'Justifique item 2',3,1),
(6,'¿Considera que la imagen, el sonido y demás características estéticas propias del lenguaje audiovisual o sonoro, amplían, o soportan información narrativa importante con la finalidad que los receptores tengan una mejor comprensión de los temas y del mensaje planteado?',1,1),
(6,'Justifique item 3',3,1),
(6,'¿El mensaje es fácilmente comprensible, se presentan en forma objetiva, tiene entidad propia como elemento expresivo?',1,1),
(6,'Justifique item 4',3,1),
(6,'¿Considera que el material es original?',1,1),
(6,'Justifique item 5',3,1),
(6,'¿La producción amplía algunos contenidos tratados o proporciona información para que los receptores puedan obtener datos complementarios al respecto?',1,1),
(6,'Justifique item 6',3,1),
(6,'¿Se utilizó un medio de difusión para dar conocer esta producción y cuál es su tipo de cubrimiento (Local, regional, nacional o internacional)?
¿Considera que el medio seleccionado fue apropiado para dar a conocer el contenido del material?',1,1),
(6,'Justifique item 7',3,1),
(6,'Emita su concepto acerca del impacto (Internacional, nacional, regional o local) de la producción:',3,1),
(6,'Por favor elabore una sinopsis de su evaluación que recoja lo fundamental de sus comentarios sobre el trabajo analizado. Destaque los aportes, vacíos o limitaciones contenidos en dicho material:',3,1);

INSERT INTO cap.evaluacion_pregunta_cap (evcc_codigo, evpc_pregunta, etpc_codigo, evpc_obligatoria) VALUES
(7,'Carácter original o innovativo de la propuesta, en relación con el aporte al desarrollo de innovaciones de sistemas, productos, procesos y servicios, así como al mejoramiento significativo de los mismos).',2,1),
(7,'Adaptación de productos o procesos, considerando la mejora sustancial de los existentes',2,1),
(7,'Aporte al fortalecimiento de la capacidad nacional de investigación, innovación y desarrollo tecnológico.',2,1),
(7,'Aporte al fortalecimiento de los servicios científicos y tecnológicos del Centro de Desarrollo Tecnológico, Grupo o Centro de Investigación (información, diseño, normalización, certificación, gestión de calidad, metrología industrial, análisis, ensayos, pruebas y otros).',2,1),
(7,'Grado de competitividad a nivel nacional e internacional de los productos, procesos o servicios obtenidos como resultados directos o indirectos del proyecto.',2,1),
(7,'Aporte a la consolidación de un área estratégica, una cadena productiva o un nuevo conocimiento científico y tecnológico.',2,1),
(7,'Incorporación de procesos o tecnologías de producción limpia.',2,1),
(7,'Estrategia de divulgación de los desarrollos previstos en el proyecto, con el fin de que los usuarios se apropien de los mismos y que la sociedad reconozca el aporte como organizaciones innovadoras; para promover la competitividad del país.',2,1),
(7,'Formación de recursos humanos en nuevas tecnologías y en gestión tecnológica.',2,1),
(7,'Registro y homologación de patentes.',2,1),
(7,'Registro y documentación técnica del “Know-How” (saber previo).',2,1),
(7,'Desarrollo de capacidades de diseño en la entidad o grupo.',2,1),
(7,'Consolidación de capacidades para realizar actividades de innovación y desarrollo en la entidad: Creación o fortalecimiento de Grupos de Innovación y Desarrollo Dotación de laboratorios de Innovación y Desarrollo o de calidad y planta piloto Redes de información y colaboración científico tecnológica.',2,1),
(7,'Mejoramiento en la oferta de servicios tecnológicos.',2,1),
(7,'Otros impactos científicos y tecnológicos del proyecto en la empresa, centro o grupo de investigación.',2,1),
(7,'Acceso a nuevos mercados nacionales o internacionales.',2,1),
(7,'Empleo generado.',2,1),
(7,'Establecimiento de alianzas estratégicas (“Joint-Ventures”, franquicias, otros).',2,1),
(7,'Mejoramiento de la productividad y la calidad.',2,1),
(7,'Mejoramiento del clima organizacional.',2,1),
(7,'Regiones y comunidades beneficiadas por el proyecto.',2,1),
(7,'Desarrollo tecnológico de proveedores.',2,1),
(7,'Otros impactos sobre la productividad y competitividad de la empresa o sector productivo.',2,1),
(7,'Reducción en el consumo de energía y agua.',2,1),
(7,'Reducción en el consumo de recursos naturales.',2,1),
(7,'Reducción en la generación de emisiones, vertimientos y residuos sólidos.',2,1),
(7,'Mejoramiento de la calidad del medio ambiente.',2,1),
(7,'Eliminación o reducción de riesgos para la salud humana.',2,1),
(7,'Aprovechamiento sostenible de nuevos recursos naturales.',2,1),
(7,'Efectos sobre preservación de la biodiversidad.',2,1),
(7,'Mejoramiento de la calidad de vida.',2,1),
(7,'Beneficios de   los   grupos   de   interés   relacionados   con   el   proyecto (Proveedores, clientes, accionistas, comunidad, estado, empleados, etc.)',2,1),
(7,'Otros impactos sobre el medio ambiente y la sociedad.',2,1),
(7,'En el crecimiento acelerado de ciertos sectores económico.',2,1),
(7,'Creación de nuevos sectores económicos en la estructura nacional y/o
Regional.',2,1),
(7,'Sustitución de importaciones.',2,1),
(7,'Generación de exportaciones.',2,1),
(7,'Otros impactos sobre la economía y la sociedad.',2,1),
(7,'Evaluación del mercado para la innovación propuesta. Demanda o mercado del producto o servicio, canales de comercialización, competidores.',2,1),
(7,'Perspectivas económicas y financieras de la empresa por el desarrollo del proyecto.',2,1),
(7,'Autenticidad, la idea es original.',2,1),
(7,'Efectos económicos en relación con: incremento en ventas, ahorros por aumento de productividad, utilidades que puede generar, exportaciones,  sustitución de materiales y materias primas.',2,1),
(7,'Capacidad financiera de la entidad beneficiaria para desarrollar el proyecto.',2,1),
(7,'Aportes en investigación, innovación o adaptación.',2,1),
(7,'Impactos del proyecto.',2,1),
(7,'Aspectos económicos y financieros.',2,1),
(7,'Por favor elabore una sinopsis de su evaluación que recoja lo fundamental de sus comentarios sobre el trabajo analizado. Destaque los aportes, vacíos o limitaciones contenidos en dicho material.',3,1);

-- cap.evaluacion_pregunta_respuesta_cap
INSERT INTO cap.evaluacion_pregunta_respuesta_cap (evpc_codigo, evop_codigo) VALUES
(1,1), (1,2), (3,1), (3,2), (5,1), (5,2), (7,1), (7,2), (9,1), (9,2), (15,3), (15,4), (15,5), (18,1), 
(18,2), (20,1), (20,2), (22,1), (22,2), (24,1), (24,2), (26,1), (26,2), (28,1), (28,2), (30,1), (30,2),
(32,3), (32,4), (32,5), (35,1), (35,2), (37,1), (37,2), (39,1), (39,2), (41,1), (41,2), (43,1), (43,2), 
(45,1), (45,2), (47,1), (47,2), (53,1), (53,2), (55,1), (55,2), (57,1), (57,2), (59,1), (59,2), (61,1), 
(61,2), (63,1), (63,2), (65,3), (65,4), (65,5), (67,1), (67,2), (69,6), (69,7), (69,8), (69,9), (69,10), 
(69,23), (71,11), (71,12),(72,11), (72,12), (73,11), (73,12), (74,11), (74,12), (75,11), (75,12),(76,1), 
(76,2), (78,1), (78,2), (80,1), (80,2), (82,1), (82,2),(84,1), (84,2), (90,3), (90,4), (90,5),
(93,1), (93,2), 
(95,1), (95,2), 
(97,1), (97,2), 
(99,1), (99,2), 
(101,1), (101,2), 
(103,1), (103,2), 
(105,1), (105,2), 
(109,13), (109,14), (109,15), (109,16), (109,17), (109,18), (109,19), (109,20), (109,21), (109,22),
(110,13), (110,14), (110,15), (110,16), (110,17), (110,18), (110,19), (110,20), (110,21), (110,22),
(111,13), (111,14), (111,15), (111,16), (111,17), (111,18), (111,19), (111,20), (111,21), (111,22),
(112,13), (112,14), (112,15), (112,16), (112,17), (112,18), (112,19), (112,20), (112,21), (112,22),
(113,13), (113,14), (113,15), (113,16), (113,17), (113,18), (113,19), (113,20), (113,21), (113,22),
(114,13), (114,14), (114,15), (114,16), (114,17), (114,18), (114,19), (114,20), (114,21), (114,22),
(115,13), (115,14), (115,15), (115,16), (115,17), (115,18), (115,19), (115,20), (115,21), (115,22),
(116,13), (116,14), (116,15), (116,16), (116,17), (116,18), (116,19), (116,20), (116,21), (116,22),
(117,13), (117,14), (117,15), (117,16), (117,17), (117,18), (117,19), (117,20), (117,21), (117,22),
(118,13), (118,14), (118,15), (118,16), (118,17), (118,18), (118,19), (118,20), (118,21), (118,22),
(119,13), (119,14), (119,15), (119,16), (119,17), (119,18), (119,19), (119,20), (119,21), (119,22),
(120,13), (120,14), (120,15), (120,16), (120,17), (120,18), (120,19), (120,20), (120,21), (120,22),
(121,13), (121,14), (121,15), (121,16), (121,17), (121,18), (121,19), (121,20), (121,21), (121,22),
(122,13), (122,14), (122,15), (122,16), (122,17), (122,18), (122,19), (122,20), (122,21), (122,22),
(123,13), (123,14), (123,15), (123,16), (123,17), (123,18), (123,19), (123,20), (123,21), (123,22),
(124,13), (124,14), (124,15), (124,16), (124,17), (124,18), (124,19), (124,20), (124,21), (124,22),
(125,13), (125,14), (125,15), (125,16), (125,17), (125,18), (125,19), (125,20), (125,21), (125,22),
(126,13), (126,14), (126,15), (126,16), (126,17), (126,18), (126,19), (126,20), (126,21), (126,22),
(127,13), (127,14), (127,15), (127,16), (127,17), (127,18), (127,19), (127,20), (127,21), (127,22),
(128,13), (128,14), (128,15), (128,16), (128,17), (128,18), (128,19), (128,20), (128,21), (128,22),
(129,13), (129,14), (129,15), (129,16), (129,17), (129,18), (129,19), (129,20), (129,21), (129,22),
(130,13), (130,14), (130,15), (130,16), (130,17), (130,18), (130,19), (130,20), (130,21), (130,22),
(131,13), (131,14), (131,15), (131,16), (131,17), (131,18), (131,19), (131,20), (131,21), (131,22),
(132,13), (132,14), (132,15), (132,16), (132,17), (132,18), (132,19), (132,20), (132,21), (132,22),
(133,13), (133,14), (133,15), (133,16), (133,17), (133,18), (133,19), (133,20), (133,21), (133,22),
(134,13), (134,14), (134,15), (134,16), (134,17), (134,18), (134,19), (134,20), (134,21), (134,22),
(135,13), (135,14), (135,15), (135,16), (135,17), (135,18), (135,19), (135,20), (135,21), (135,22),
(136,13), (136,14), (136,15), (136,16), (136,17), (136,18), (136,19), (136,20), (136,21), (136,22),
(137,13), (137,14), (137,15), (137,16), (137,17), (137,18), (137,19), (137,20), (137,21), (137,22), 
(138,13), (138,14), (138,15), (138,16), (138,17), (138,18), (138,19), (138,20), (138,21), (138,22),
(139,13), (139,14), (139,15), (139,16), (139,17), (139,18), (139,19), (139,20), (139,21), (139,22),
(140,13), (140,14), (140,15), (140,16), (140,17), (140,18), (140,19), (140,20), (140,21), (140,22),
(141,13), (141,14), (141,15), (141,16), (141,17), (141,18), (141,19), (141,20), (141,21), (141,22),
(142,13), (142,14), (142,15), (142,16), (142,17), (142,18), (142,19), (142,20), (142,21), (142,22),
(143,13), (143,14), (143,15), (143,16), (143,17), (143,18), (143,19), (143,20), (143,21), (143,22),
(144,13), (144,14), (144,15), (144,16), (144,17), (144,18), (144,19), (144,20), (144,21), (144,22),
(145,13), (145,14), (145,15), (145,16), (145,17), (145,18), (145,19), (145,20), (145,21), (145,22),
(146,13), (146,14), (146,15), (146,16), (146,17), (146,18), (146,19), (146,20), (146,21), (146,22),
(147,13), (147,14), (147,15), (147,16), (147,17), (147,18), (147,19), (147,20), (147,21), (147,22),
(148,13), (148,14), (148,15), (148,16), (148,17), (148,18), (148,19), (148,20), (148,21), (148,22),
(149,13), (149,14), (149,15), (149,16), (149,17), (149,18), (149,19), (149,20), (149,21), (149,22),
(150,13), (150,14), (150,15), (150,16), (150,17), (150,18), (150,19), (150,20), (150,21), (150,22),
(151,13), (151,14), (151,15), (151,16), (151,17), (151,18), (151,19), (151,20), (151,21), (151,22),
(152,13), (152,14), (152,15), (152,16), (152,17), (152,18), (152,19), (152,20), (152,21), (152,22),
(153,13), (153,14), (153,15), (153,16), (153,17), (153,18), (153,19), (153,20), (153,21), (153,22),
(154,13), (154,14), (154,15), (154,16), (154,17), (154,18), (154,19), (154,20), (154,21), (154,22);



UPDATE academia3000_john.cap.evaluacion_cuestionario_cap SET evcc_instrucciones='<h6><strong>3. CONFIDENCIALIDAD</strong></h6>
<p>
  En aras de garantizar la transparencia en el proceso de evaluación, La
  Universidad Surcolombiana se reserva los nombres de los evaluadores, en ningún
  caso se darán a conocer a los autores o personas ajenas a la Universidad.
</p>
<h6><strong>4. INSTRUCCIONES</strong></h6>
<ul>
  <li>
    El formulario debe ser diligenciado a computador,
    <strong>No a mano</strong>.
  </li>
  <li>Sea claro(a) y preciso(a) en su apreciación.</li>
  <li>
    Diligenciado el formato, favor remitirlo a la Vicerrectoría de Investigación
    y Proyección Social, al correo electrónico
    <a href="mailto:comiteasignacionpuntaje@usco.edu.co"
      >comiteasignacionpuntaje@usco.edu.co</a
    >.
  </li>
  <li>
    El plazo máximo para la entrega de evaluación, será de quince (15) días
    hábiles, contados a partir de la recepción del material a evaluar. De no
    poder cumplir con el plazo estipulado, se solicita informar al correo
    citado.
  </li>
</ul>
<h6><strong>5. CRITERIOS DE EVALUACION</strong></h6>
<p>
  De conformidad con lo dispuesto en el Articulo 10, numeral I, literal j del
  Decreto 1279 de 2002, por Producción Técnica, y Los siguientes criterios de
  evaluación son ajustados a los lineamientos de la Resolución 00693 del 13 de
  julio del 2004 emitido por COLCIENCIAS hoy Ministerio de Ciencia, Tecnología e
  Innovación MINCIENCIAS, se tendrá en cuenta:
</p>
<ol>
  <li>Aportes en investigación, innovación o adaptación</li>
  <li>
    Impactos del proyecto
    <ol>
      <li>
        Impactos científicos y tecnológicos del proyecto en la empresa, centro o
        grupo de investigación
      </li>
      <li>
        Impactos sobre la productividad y competitividad de la empresa o sector
        productivo
      </li>
      <li>Impactos sobre el medio ambiente y la sociedad</li>
      <li>Impactos sobre la economía y la sociedad</li>
    </ol>
  </li>
  <li>Aspectos económicos y financieros</li>
</ol>
<p>
  A continuación, se tendrá cada uno de los criterios a evaluar con un tope
  máximo de puntos, a saber:
</p>
' WHERE evcc_codigo=7;

select * from cap.evaluacion_cuestionario_cap ecc 
inner join cap.tipo_evaluacion_cap tec on ecc.tiec_codigo = tec.tiec_codigo
where ecc.evcc_codigo = ? and ecc.evcc_estado = 1

select * from cap.evaluacion_pregunta_cap epc 
inner join cap.evaluacion_tipo_pregunta_cap etpc on epc.etpc_codigo = etpc.etpc_codigo
inner join cap.evaluacion_cuestionario_cap ecc on epc.evcc_codigo = ecc.evcc_codigo 
where epc.evcc_codigo = 7 and epc.evpc_estado = 1

select * from cap.evaluacion_pregunta_respuesta_cap eprc 
inner join cap.evaluacion_pregunta_cap epc on eprc.evpc_codigo = epc.evpc_codigo
inner join cap.evaluacion_opciones_cap eoc on eprc.evop_codigo = eoc.evop_codigo
inner join cap.evaluacion_cuestionario_cap ecc on epc.evcc_codigo = ecc.evcc_codigo
inner join cap.tipo_evaluacion_cap tec on ecc.tiec_codigo = tec.tiec_codigo
where eprc.evpc_codigo = 109 and eprc.eprc_estado = 1



--------------------------------------
----------EVALUACIÓN CAP  ------------                                                                                                                  
--------------------------------------

--EVALUACIÓN
select * from cap.evaluacion_cuestionario_cap ecc where ecc.evcc_estado = 1 and ecc.evcc_codigo = 1;
select * from cap.evaluacion_respuesta_cuestionario_cap ercc where ercc.evcc_codigo = 1;
select count(*) from cap.evaluacion_respuesta_cuestionario_cap ercc where ercc.evcc_codigo = 1;


--PREGUNTAS
select * from cap.evaluacion_pregunta_cap epc where epc.evcc_codigo = 1 and epc.evpc_estado = 1;
select count(*) from cap.evaluacion_pregunta_cap epc where epc.evcc_codigo = 1 and epc.evpc_estado = 1;

select * from cap.evaluacion_respuesta_cap;
select * from encuestas.respuestas r 

--EVALUACIÓN RESPUESTAS SELECCIÓN MULTIPLE
with resultado(ercc_codigo, asep_codigo, evpc_codigo, evop_opcion) as(
select ercc.ercc_codigo, ercc.asep_codigo, epc.evpc_codigo, convert(varchar(40), eoc.evop_opcion , 112) from cap.evaluacion_respuesta_cuestionario_cap ercc  
inner JOIN cap.evaluacion_respuesta_cap erc on ercc.ercc_codigo = erc.ercc_codigo
inner JOIN cap.evaluacion_pregunta_respuesta_cap eprc on erc.eprc_codigo = eprc.eprc_codigo
inner join cap.evaluacion_pregunta_cap epc on eprc.evpc_codigo = epc.evpc_codigo 
inner JOIN cap.evaluacion_opciones_cap eoc on eprc.evop_codigo = eoc.evop_codigo  
where ercc.evcc_codigo = 1
) SELECT * from resultado pivot( max(evop_opcion) FOR evpc_codigo in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17])) as pvt

--EVALUACIÓN RESPUESTAS TEXTO
with resultado(ercc_codigo, asep_codigo, evpc_codigo, erc_texto) as(
select ercc.ercc_codigo, ercc.asep_codigo, epc.evpc_codigo, erc.erc_texto from cap.evaluacion_respuesta_cuestionario_cap ercc  
inner JOIN cap.evaluacion_respuesta_cap erc on ercc.ercc_codigo = erc.ercc_codigo
inner join cap.evaluacion_pregunta_cap epc on erc.evpc_codigo = epc.evpc_codigo 
where ercc.evcc_codigo = 1
) SELECT * from resultado pivot( max(erc_texto) FOR evpc_codigo in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17])) as pvt

select * from cap.material_configuracion mc ;
select * from cap.material_evaluar ma  


with respuestas_opcion as (
  select 
    ercc.ercc_codigo, 
    ercc.asep_codigo, 
    pec.paec_nombre, 
    pec.paec_apellido, 
    tec.tiec_nombre,
    p.per_nombre, 
    p.per_apellido,
    ma.maac_titulo,
    tm.tim_nombre, 
    epc.evpc_codigo, 
    eoc.evop_opcion,
    ercc.ercc_puntaje
  from cap.evaluacion_respuesta_cuestionario_cap ercc
  inner join cap.evaluacion_respuesta_cap erc on ercc.ercc_codigo = erc.ercc_codigo
  inner join cap.evaluacion_pregunta_respuesta_cap eprc on erc.eprc_codigo = eprc.eprc_codigo
  inner join cap.evaluacion_pregunta_cap epc on eprc.evpc_codigo = epc.evpc_codigo
  inner join cap.evaluacion_opciones_cap eoc on eprc.evop_codigo = eoc.evop_codigo
  inner join cap.asignacion_evaluacion_par aep on ercc.asep_codigo = aep.asep_codigo 
  inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo 
  inner join dbo.persona p on sp.per_codigo = p.per_codigo 
  inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo 
  inner join cap.material_academico ma on sp.sop_codigo = ma.sop_codigo 
  inner join cap.material_configuracion mc on ma.maco_codigo = mc.maco_codigo 
  inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo 
  inner join cap.material_evaluar me on mc.maco_codigo = me.maco_codigo 
  inner join cap.tipo_evaluacion_cap tec on me.tiec_codigo = tec.tiec_codigo 
  where ercc.evcc_codigo = 1
),
pivot_opcion as (
  select * from respuestas_opcion
  pivot (max(evop_opcion) for evpc_codigo in ([1],[3],[5],[7],[9],[15])) as pvt
),
respuestas_texto as (
  select 
    ercc.ercc_codigo, 
    ercc.asep_codigo, 
    pec.paec_nombre, 
    pec.paec_apellido,
    tec.tiec_nombre,
    p.per_nombre, 
    p.per_apellido,
    ma.maac_titulo,
    tm.tim_nombre,
    epc.evpc_codigo, 
    erc.erc_texto,
    ercc.ercc_puntaje
  from cap.evaluacion_respuesta_cuestionario_cap ercc
  inner join cap.evaluacion_respuesta_cap erc on ercc.ercc_codigo = erc.ercc_codigo
  inner join cap.evaluacion_pregunta_cap epc on erc.evpc_codigo = epc.evpc_codigo
  inner join cap.asignacion_evaluacion_par aep on ercc.asep_codigo = aep.asep_codigo 
  inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo 
  inner join dbo.persona p on sp.per_codigo = p.per_codigo 
  inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
  inner join cap.material_academico ma on sp.sop_codigo = ma.sop_codigo
  inner join cap.material_configuracion mc on ma.maco_codigo = mc.maco_codigo
  inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo 
  inner join cap.material_evaluar me on mc.maco_codigo = me.maco_codigo
  inner join cap.tipo_evaluacion_cap tec on me.tiec_codigo = tec.tiec_codigo
  where ercc.evcc_codigo = 1
),
pivot_texto as (
  select * from respuestas_texto
  pivot (max(erc_texto) for evpc_codigo in ([2],[4],[6],[8],[10],[11],[12],[13],[14],[16],[17])) as pvt
)
select 
  coalesce(po.ercc_codigo, pt.ercc_codigo) as ercc_codigo,
  coalesce(po.asep_codigo, pt.asep_codigo) as asep_codigo,
  coalesce(po.paec_nombre, pt.paec_nombre) as paec_nombre,
  coalesce(po.paec_apellido, pt.paec_apellido) as paec_apellido,
  coalesce(po.tiec_nombre, pt.tiec_nombre) as tiec_nombre,
  coalesce(po.per_nombre, pt.per_nombre) as per_nombre,
  coalesce(po.per_apellido, pt.per_apellido) as per_apellido,
  coalesce(po.tim_nombre, pt.tim_nombre) as tim_nombre,
  coalesce(po.maac_titulo, pt.maac_titulo) as maac_titulo,
  po.[1] as p1, pt.[2] as p1_just,
  po.[3] as p2, pt.[4] as p2_just,
  po.[5] as p3, pt.[6] as p3_just,
  po.[7] as p4, pt.[8] as p4_just,
  po.[9] as p5, pt.[10] as p5_just,
  pt.[11] as adicional_1,
  pt.[12] as adicional_2,
  pt.[13] as adicional_3,
  pt.[14] as adicional_4,
  po.[15] as adicional_5,
  pt.[16] as adicional_6,
  pt.[17] as adicional_7,
  coalesce(po.ercc_puntaje, pt.ercc_puntaje) as ercc_puntaje
from pivot_opcion po
full outer join pivot_texto pt 
  on po.ercc_codigo = pt.ercc_codigo and po.asep_codigo = pt.asep_codigo
  
  
select * from cap.evaluacion_respuesta_cap
  
select * from cap.evaluacion_respuesta_cuestionario_cap ercc 
inner join cap.asignacion_evaluacion_par aep on ercc.asep_codigo = aep.asep_codigo
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.evaluacion_respuesta_cap erc on ercc.ercc_codigo = erc.ercc_codigo 
left join cap.evaluacion_pregunta_respuesta_cap eprc on erc.eprc_codigo = eprc.eprc_codigo 
inner join cap.evaluacion_pregunta_cap epc on erc.evpc_codigo = epc.evpc_codigo 
left join cap.evaluacion_opciones_cap eoc on eprc.evop_codigo = eoc.evop_codigo
where sp.sop_codigo = 


select aep.asep_codigo, sp.sop_codigo, p.per_codigo, p.per_nombre, mc.tim_codigo, tm.tim_nombre, ma.maac_titulo, pec.paec_codigo, pec.paec_nombre, pec.paec_apellido, tec.tiec_codigo, tec.tiec_nombre, ercc.ercc_puntaje from cap.asignacion_evaluacion_par aep 
inner join cap.solicitud_puntaje sp on aep.sop_codigo = sp.sop_codigo
inner join cap.material_academico ma on sp.sop_codigo = ma.sop_codigo
inner join cap.material_configuracion mc on ma.maco_codigo = mc.maco_codigo
inner join cap.tipo_material tm on mc.tim_codigo = tm.tim_codigo
inner join dbo.persona p on sp.per_codigo = p.per_codigo
inner join cap.par_evaluador_cap pec on aep.paec_codigo = pec.paec_codigo
inner join cap.evaluacion_respuesta_cuestionario_cap ercc on aep.asep_codigo = ercc.asep_codigo
inner join cap.material_evaluar me on mc.maco_codigo = me.maco_codigo
inner join cap.tipo_evaluacion_cap tec on me.tiec_codigo = tec.tiec_codigo
where sp.sop_codigo = 