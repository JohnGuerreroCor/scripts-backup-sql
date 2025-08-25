select * from persona p 
INSERT INTO "general".persona (per_identificacion, tii_codigo, per_libreta_militar, per_apellido, per_nombre, seb_codigo, per_lugar_expedicion, per_fecha_expedicion, per_fecha_nacimiento, per_direccion_residencia, per_telefono_movil, per_telefono_fijo, esc_codigo, per_lugar_nacimiento, est_codigo, per_pais_residencia, per_departamento_residencia, per_municipio_residencia, per_lugar_residencia, per_barrio, per_numero_afiliacion_eps, per_ips_sisben, gre_codigo, pui_codigo, con_codigo, ped_codigo, dit_codigo, tae_codigo, per_familiar_direccion, per_familiar_nombre, per_familiar_telefono, per_familiar_lugar_residencia, per_email, per_email_interno, grs_codigo, per_estado, per_fecha_registro) VALUES('1075303330', 1, NULL, 'GUERRERO CORDOBA', 'JOHN DAVID', 1, '41001', '2023-08-19', '1997-03-14', 'asdasd', '6088635210', '3165380816', 1, NULL, 1, 43, '41', '41001', '41001000', 'asdasd', NULL, NULL, 0, 0, 0, 2, 0, 0, '3165380816', 'Sandra Milena', '6088635210', '41001', 'guerrerocordobajohn@gmail.com', 'guerrerocordobajohn@gmail.com', 1, 1, '2023-08-19 06:33:32.560');

INSERT INTO "general".persona (per_identificacion, tii_codigo, per_libreta_militar, per_apellido, per_nombre, seb_codigo, per_lugar_expedicion, per_fecha_expedicion, per_fecha_nacimiento, per_direccion_residencia, per_telefono_movil, per_telefono_fijo, esc_codigo, per_lugar_nacimiento, est_codigo, per_pais_residencia, per_departamento_residencia, per_municipio_residencia, per_lugar_residencia, per_barrio, per_numero_afiliacion_eps, per_ips_sisben, gre_codigo, pui_codigo, con_codigo, ped_codigo, dit_codigo, tae_codigo, per_familiar_direccion, per_familiar_nombre, per_familiar_telefono, per_familiar_lugar_residencia, per_email, per_email_interno, grs_codigo, per_estado, per_fecha_registro) VALUES('1075232353', 1, NULL, 'SOLORZANO LOZANO', 'JHON HENRY', 1, '41001', '2023-08-19', '1997-03-14', 'asdasd', '6088635210', '3165380816', 1, NULL, 1, 43, '41', '41001', '41001000', 'asdasd', NULL, NULL, 0, 0, 0, 2, 0, 0, '3165380816', 'Sandra Milena', '6088635210', '41001', 'joheso88@hotmail.com', 'joheso88@hotmail.com', 1, 1, '2023-08-19 06:33:32.560');

INSERT INTO "general".usuario_dos (per_codigo, usu_nombre, uwd2, ust_codigo, usu_estado) 
VALUES(1, '1075232353', '5AE2BACFFEBDF3E8E37DECDD343AC728', 1, 1);



DELETE FROM general.persona;
ALTER SEQUENCE general.persona_per_codigo_seq RESTART WITH 1;
DELETE FROM general.facultad;
ALTER SEQUENCE general.facultad_fac_codigo_seq RESTART WITH 1;
DELETE FROM general.sede;
ALTER SEQUENCE general.sede_sed_codigo_seq RESTART WITH 1;
DELETE FROM general.institucion ;
ALTER SEQUENCE general.institucion_ins_codigo_seq RESTART WITH 1;
DELETE FROM general.norma_clasificada ;
ALTER SEQUENCE general.norma_clasificada_noc_codigo_seq RESTART WITH 1;
DELETE FROM general.norma_grupo;
ALTER SEQUENCE general.norma_grupo_nog_codigo_seq RESTART WITH 1;
DELETE FROM general.norma_deroga;
ALTER SEQUENCE general.norma_deroga_nod_codigo_seq RESTART WITH 1;
DELETE FROM general.norma;
ALTER SEQUENCE general.norma_nor_codigo_seq RESTART WITH 1;
DELETE FROM general.campo_detallado_cine;
ALTER SEQUENCE general.campo_detallado_cine_cdc_codigo_seq RESTART WITH 1;
DELETE FROM general.campo_especifico_cine;
ALTER SEQUENCE general.campo_especifico_cine_cec_codigo_seq RESTART WITH 1;
DELETE FROM general.campo_amplio_cine;
ALTER SEQUENCE general.campo_amplio_cine_cac_codigo_seq RESTART WITH 1;
DELETE FROM general.representante_legal;
ALTER SEQUENCE general.representante_legal_rel_codigo_seq RESTART WITH 1;
DELETE FROM general.funciones_curpos_colegiados;
ALTER SEQUENCE general.funciones_curpos_colegiados_fcc_codigo_seq RESTART WITH 1;
DELETE FROM general.integrante_cuerpo_colegiado;
ALTER SEQUENCE general.integrante_cuerpo_colegiado_icc_codigo_seq RESTART WITH 1;
DELETE FROM general.cuerpos_colegiados;
ALTER SEQUENCE general.cuerpos_colegiados_cuc_codigo_seq RESTART WITH 1;


CREATE TABLE "general".persona (
	per_codigo serial4 NOT NULL,
	per_identificacion varchar(15) NOT NULL,
	tii_codigo int4 NOT NULL,
	per_libreta_militar varchar(15) NULL,
	per_apellido varchar(50) NULL,
	per_nombre varchar(50) NULL,
	seb_codigo int4 NOT NULL,
	per_lugar_expedicion varchar NULL,
	per_fecha_expedicion date NULL,
	per_fecha_nacimiento date NULL,
	per_direccion_residencia varchar(255) NULL,
	per_telefono_movil varchar(50) NULL,
	per_telefono_fijo varchar(30) NULL,
	esc_codigo int4 NOT NULL,
	per_lugar_nacimiento bpchar(8) NULL,
	est_codigo int4 NOT NULL,
	per_pais_residencia int4 NULL,
	per_departamento_residencia bpchar(2) NULL,
	per_municipio_residencia bpchar(5) NULL,
	per_lugar_residencia bpchar(8) NULL,
	per_barrio varchar(50) NULL,
	per_numero_afiliacion_eps varchar(20) NULL,
	per_ips_sisben varchar(200) NULL,
	gre_codigo int4 NOT NULL,
	pui_codigo int4 NULL,
	con_codigo int4 NULL,
	ped_codigo int4 NULL,
	dit_codigo int4 NULL,
	tae_codigo int4 NULL,
	per_familiar_direccion varchar(255) NULL,
	per_familiar_nombre varchar(60) NULL,
	per_familiar_telefono varchar(30) NULL,
	per_familiar_lugar_residencia varchar NULL,
	per_email varchar(100) NULL,
	per_email_interno varchar(100) NULL,
	grs_codigo int4 NOT NULL,
	per_estado int4 DEFAULT 1 NOT NULL,
	per_fecha_registro timestamp DEFAULT now() NULL,
	CONSTRAINT persona_pkey PRIMARY KEY (per_codigo),
	CONSTRAINT persona_fk_comunidad_negra FOREIGN KEY (con_codigo) REFERENCES "general".comunidad_negra(con_codigo),
	CONSTRAINT persona_fk_discapacidad_tipo FOREIGN KEY (dit_codigo) REFERENCES "general".discapacidad_tipo(dit_codigo),
	CONSTRAINT persona_fk_estado_civil FOREIGN KEY (esc_codigo) REFERENCES "general".estado_civil(esc_codigo),
	CONSTRAINT persona_fk_estrato FOREIGN KEY (est_codigo) REFERENCES "general".estrato(est_codigo),
	CONSTRAINT persona_fk_grupo_etnico FOREIGN KEY (gre_codigo) REFERENCES "general".grupo_etnico(gre_codigo),
	CONSTRAINT persona_fk_grupo_sanguineo FOREIGN KEY (grs_codigo) REFERENCES "general".grupo_sanguineo(grs_codigo),
	CONSTRAINT persona_fk_persona_discapacidad FOREIGN KEY (ped_codigo) REFERENCES "general".persona_discapacidad(ped_codigo),
	CONSTRAINT persona_fk_pueblo_indigena FOREIGN KEY (pui_codigo) REFERENCES "general".pueblo_indigena(pui_codigo),
	CONSTRAINT persona_fk_sexo_biologico FOREIGN KEY (seb_codigo) REFERENCES "general".sexo_biologico(seb_codigo),
	CONSTRAINT persona_fk_talento_excepcional FOREIGN KEY (tae_codigo) REFERENCES "general".talento_excepcional(tae_codigo),
	CONSTRAINT persona_fk_tipo_identificacion FOREIGN KEY (tii_codigo) REFERENCES "general".tipo_identificacion(tii_codigo)
);


CREATE TABLE general.usuario (
    usu_codigo SERIAL PRIMARY KEY,
    per_codigo int NOT NULL,
    usu_nombre varchar(20),
    uwd2 varchar(100),
    ust_codigo int NOT NULL,
    usu_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT usuario_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    CONSTRAINT usuario_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES usuario_tipo(ust_codigo)
);


--INSERT INTO "general".usuario
(per_codigo, usu_nombre, uwd2, ust_codigo)
VALUES(1, '1075232353', NULL, 1);

UPDATE usuario
SET uwd2 = '5AE2BACFFEBDF3E8E37DECDD343AC728' 
WHERE usu_codigo = 1;

CREATE VIEW vista_usuario_general AS
select u.usu_codigo, u.per_codigo, u.usu_nombre, u.uwd2, u.ust_codigo, u.usu_estado, p.per_nombre, p.per_apellido, p.per_identificacion from usuario u 
inner join persona p on u.per_codigo = p.per_codigo 
inner join tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
inner join estado_civil ec on p.esc_codigo = ec.esc_codigo 
inner join sexo_biologico sb on p.seb_codigo = sb.seb_codigo


CREATE VIEW vista_usuario_alterno AS
select u.usu_codigo, u.per_codigo, u.usu_nombre, u.uwd2, u.ust_codigo, u.usu_estado, p.per_nombre, p.per_apellido, p.per_identificacion from usuario_dos u 
inner join persona p on u.per_codigo = p.per_codigo 
inner join tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
inner join estado_civil ec on p.esc_codigo = ec.esc_codigo 
inner join sexo_biologico sb on p.seb_codigo = sb.seb_codigo 


SELECT * FROM general.vista_usuario_general vug 
WHERE vug.usu_nombre = '1075232353' AND vug.usu_estado = 1 
LIMIT 1;