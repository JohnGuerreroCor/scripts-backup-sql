------ SCRIPTS PARA PRODUCCIÓN ------------

----- TABLA ROLES COMITE AUTOEVALUACION ----

--CREATE TABLE academia3000.acreditacion.rol_comite_autoevaluacion (
	rca_codigo int IDENTITY(1,1) NOT NULL,
	rca_nombre varchar(200) NOT NULL,
	rca_estamento varchar(200) NOT NULL,
	rca_descripcion varchar(2500) NOT NULL,
	rca_estado int DEFAULT 1 NULL,
	CONSTRAINT rol_comite_autoevaluacion_PK PRIMARY KEY (rca_codigo));


------ TABLA COMITE AUTOEVALUACION --------

--CREATE TABLE academia3000.acreditacion.comite_autoevaluacion (
	coa_codigo int IDENTITY(1,1) NOT NULL,
	uaa_codigo int NULL,
	coa_fecha_creacion date NOT NULL,
	coa_ruta varchar(200) NOT NULL,
	coa_objetivo varchar(2500) NULL,
	CONSTRAINT comite_autoevaluacion_PK PRIMARY KEY (coa_codigo),
	CONSTRAINT comite_autoevaluacion_FK FOREIGN KEY (uaa_codigo) REFERENCES academia3000.dbo.uaa(uaa_codigo)
);

select * from usuario_administrativo ua where sys like '%contrato_nancycatherine%'

SELECT * from dbo.usuario u where usu_usuario like '%nancy%'

------ TABLA INTEGRANTES COMITE AUTOEVALUACION --------

--CREATE TABLE academia3000.acreditacion.integrante_comite_autoevaluacion (
	ica_codigo int IDENTITY(1,1) NOT NULL,
	coa_codigo int NOT NULL,
	per_codigo int NOT NULL,
	ica_ruta varchar(200) NOT NULL,
	ica_estamento varchar(200) NULL,
	ica_fecha_vinculacion date NOT NULL,
	ica_fecha_retiro date NULL,
	ica_estado int DEFAULT 1 NULL,
	ica_roll varchar(200) NULL,
	ica_justificacion varchar(2500) NOT NULL,
	CONSTRAINT integrante_comite_autoevaluacion_PK PRIMARY KEY (ica_codigo),
	CONSTRAINT integrante_comite_autoevaluacion_FK FOREIGN KEY (per_codigo) REFERENCES academia3000.dbo.persona(per_codigo),
	CONSTRAINT integrante_comite_autoevaluacion_FK_1 FOREIGN KEY (coa_codigo) REFERENCES academia3000.acreditacion.comite_autoevaluacion(coa_codigo)
);

------ TABLA INSTITUCION --------

--CREATE TABLE academia3000.acreditacion.institucion (
	ins_codigo int IDENTITY(1,1) NOT NULL,
	ins_nit varchar(20) NOT NULL,
	ins_ies int NOT NULL,
	ins_ies_padre int NOT NULL,
	ins_sector int NOT NULL,
	ins_nombre varchar(200) NOT NULL,
	ins_caracter_academico int NOT NULL,
	mun_codigo int NOT NULL,
	ins_direccion varchar(200) NOT NULL,
	ins_telefonos varchar(200) NOT NULL,
	ins_web varchar(200) NULL,
	ins_norma varchar(200) NOT NULL,
	ins_fecha_creacion date NOT NULL,
	ins_existencia int NOT NULL,
	ins_ruta varchar(200) NOT NULL,
	ins_estado int DEFAULT 1 NULL,
	CONSTRAINT institucion_PK PRIMARY KEY (ins_codigo),
	CONSTRAINT institucion_FK FOREIGN KEY (mun_codigo) REFERENCES academia3000.dbo.municipio(mun_codigo));

------ TABLA INSTITUCION ACREDITADA --------
	
--CREATE TABLE academia3000.acreditacion.institucion_acreditada (
	ina_codigo int IDENTITY(1,1) NOT NULL,
	ins_codigo int NOT NULL,
	ina_norma varchar(200) NULL,
	ina_fecha_inicio date NOT NULL,
	ina_fecha_fin date NULL,
	ina_vigencia int NOT NULL,
	ina_ruta varchar(200) NOT NULL,
	ina_estado int DEFAULT 1 NULL,
	CONSTRAINT institucion_acreditada_PK PRIMARY KEY (ina_codigo),
	CONSTRAINT institucion_acreditada_FK FOREIGN KEY (ins_codigo) REFERENCES academia3000.acreditacion.institucion(ins_codigo));




------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--------------------- QUERYS PRODUCCIÓN | CONDICIONES INICIALES Y NOTIFICACION ACREDITABLES ----------------------
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

--||| Las siguientes tablas se crean dentro del esquema Acreditación, para el grupo_acreditacion_ejecucion por favor
--||| dar permisos de INSERT, SELECT Y UPDATE a las siguientes tablas a crear.


-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_programa (
	asp_codigo int IDENTITY(1,1) NOT NULL,
	asp_item char (1) NULL,
	asp_aspecto varchar(1000) NOT NULL,
	asp_aprobado int NULL,
	asp_archivo varchar(250) NULL,
	asp_ruta varchar(250) NULL,
	asp_observacion varchar(1000) NULL,
	asp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_programa_PK PRIMARY KEY (asp_codigo)
);

-- TABLA ASPECTOS PROGRAMAS
--CREATE TABLE academia3000_john.acreditacion.aspecto_institucion (
	asi_codigo int IDENTITY(1,1) NOT NULL,
	asi_item char (1) NULL,
	asi_aspecto varchar(1000) NOT NULL,
	asi_aprobado int NULL,
	asi_archivo varchar(250) NULL,
	asi_ruta varchar(250) NULL,
	asi_observacion varchar(1000) NULL,
	asi_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT aspectos_institucion_PK PRIMARY KEY (asi_codigo)
);

-- TABLA VARIABLES FORMULARIO
--CREATE TABLE academia3000_john.acreditacion.criterios_condiciones_iniciales (
	cci_codigo int IDENTITY(1,1) NOT NULL,
	cci_orden int NOT NULL,
	cci_nombre varchar(250) NOT NULL,
	cci_valor varchar(500) NULL,
	cci_etiqueta varchar(250) NOT NULL,
	cci_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT criterios_condiciones_iniciales_PK PRIMARY KEY (cci_codigo)
);

-- TABLA INFORME PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_programa (
	inp_codigo int IDENTITY(1,1) NOT NULL,
	inp_fecha  date NOT NULL,
	pro_codigo int NOT NULL,
	inp_estado int DEFAULT 1 NOT NULL,
	gru_codigo int NOT NULL,
	CONSTRAINT informe_programa_PK PRIMARY KEY (inp_codigo),
	CONSTRAINT informe_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_programa_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo)
);

-- TABLA INFORME CHEQUEO PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_programa (
	icp_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	icp_item char (1) NULL,
	icp_aspecto varchar(1000) NOT NULL,
	icp_aprobado int NULL,
	icp_archivo varchar(250) NULL,
	icp_ruta varchar(250) NULL,
	icp_observacion varchar(1000) NULL,
	icp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_programa_PK PRIMARY KEY (icp_codigo),
	CONSTRAINT informe_chequeo_programa_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

-- TABLA INFORME CHEQUEO INSTITUCION
--CREATE TABLE academia3000_john.acreditacion.informe_chequeo_institucion (
	ici_codigo int IDENTITY(1,1) NOT NULL,
	inp_codigo int NOT NULL,
	ici_item char (1) NULL,
	ici_aspecto varchar(1000) NOT NULL,
	ici_aprobado int NULL,
	ici_archivo varchar(250) NULL,
	ici_ruta varchar(250) NULL,
	ici_observacion varchar(1000) NULL,
	ici_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_chequeo_institucion_PK PRIMARY KEY (ici_codigo),
	CONSTRAINT informe_chequeo_institucion_FK FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo),
);

-- TABLA INVITACION PROGRAMA ACREDITABLE
--CREATE TABLE academia3000_john.acreditacion.invitacion_programa_acreditable (
	ipa_codigo int IDENTITY(1,1) NOT NULL,
	gru_codigo int NOT NULL,
	pro_codigo int NOT NULL,
	ipa_fecha_envio date NOT NULL,
	ipa_fecha_respuesta date NULL,
	ipa_hash varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ipa_estado int NULL,
	CONSTRAINT invitacion_programa_acreditable_PK PRIMARY KEY (ipa_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK FOREIGN KEY (ipa_estado) REFERENCES academia3000_john.acreditacion.estado_invitacion(esi_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_1 FOREIGN KEY (gru_codigo) REFERENCES academia3000_john.acreditacion.grupos_acreditables(gru_codigo),
	CONSTRAINT invitacion_programa_acreditable_FK_2 FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo)
);

-- TABLA INFORME GENERAL PROGRAMA
--CREATE TABLE academia3000_john.acreditacion.informe_general_programa (
	igp_codigo int IDENTITY(1,1) NOT NULL,
	pro_codigo int NOT NULL,
	inp_codigo int NOT NULL,
	igp_facultad varchar(500) NULL,
	igp_departamento varchar(250) NULL,
	igp_denominacion varchar(500) NULL,
	igp_snies varchar(250) NULL,
	igp_jefe varchar(500) NULL,
	igp_coordinador varchar(500) NULL,
	igp_modalidad varchar(250) NULL,
	igp_jornada varchar(250) NULL,
	igp_nivel_formacion varchar(500) NULL,
	igp_duracion varchar(250) NULL,
	igp_titulo varchar(500) NULL,
	igp_creditos varchar(250) NULL,
	igp_amplio varchar(500) NULL,
	igp_especifico varchar(500) NULL,
	igp_detallado varchar(500) NULL,
	igp_nbc varchar(500) NULL,
	igp_area_nbc varchar(500) NULL,
	igp_estado int DEFAULT 1 NOT NULL,
	CONSTRAINT informe_general_programa_PK PRIMARY KEY (igp_codigo),
	CONSTRAINT informe_general_programa_FK FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo),
	CONSTRAINT informe_general_programa_FK_1 FOREIGN KEY (inp_codigo) REFERENCES academia3000_john.acreditacion.informe_programa(inp_codigo)
);

-- TABLA ESTADO INVITACION
--CREATE TABLE academia3000_john.acreditacion.estado_invitacion (
	esi_codigo int IDENTITY(1,1) NOT NULL,
	esi_nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT estado_invitacion_PK PRIMARY KEY (esi_codigo)
);

--|| Para la tabla anterior por favor inserta los siguientes valores

INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Enviado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Aceptado');
INSERT INTO academia3000_john.acreditacion.estado_invitacion (esi_nombre) VALUES(N'Rechazado');



-- TABLA APROBACION INFORME PROGRAMA ACREDITABLE
--CREATE TABLE academia3000_john.acreditacion.aprobacion_informe_programa (
	aip_codigo int IDENTITY(1,1) NOT NULL,
	igp_codigo int NOT NULL,
	pro_codigo int NOT NULL,
	aip_fecha_envio date NOT NULL,
	aip_fecha_respuesta date NULL,
	aip_hash varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	aip_observacion varchar(1000) NULL,
	aip_estado int NULL,
	CONSTRAINT aprobacion_informe_programa_PK PRIMARY KEY (aip_codigo),
	CONSTRAINT aprobacion_informe_programa_FK_1 FOREIGN KEY (igp_codigo) REFERENCES academia3000_john.acreditacion.informe_general_programa(igp_codigo),
	CONSTRAINT aprobacion_informe_programa_FK_2 FOREIGN KEY (pro_codigo) REFERENCES academia3000_john.dbo.programa(pro_codigo)
);

