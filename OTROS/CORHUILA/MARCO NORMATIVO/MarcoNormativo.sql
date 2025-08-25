---------------------------
-----TABLA NORMA TIPO------
---------------------------
CREATE TABLE general.norma_tipo (
    not_codigo SERIAL PRIMARY KEY,
    not_nombre varchar(50) NOT NULL,
    not_estado int DEFAULT 1 NOT NULL
);
--LEY, DECRETO, RESOLUCION, DIRECTRIZ


---------------------------
--------TABLA MEDIO--------
---------------------------
CREATE TABLE general.norma_medio (
    nom_codigo SERIAL PRIMARY KEY,
    nom_nombre varchar(50) NOT NULL,
    nom_estado int DEFAULT 1 NOT NULL
);
-- FÍSICO, DIGITAL...


---------------------------
--------TABLA GRUPO--------
---------------------------
CREATE TABLE general.grupo (
    gru_codigo SERIAL PRIMARY KEY,
    gru_nombre varchar(50) NOT NULL,
    gru_estado int DEFAULT 1 NOT NULL
);
--Grupos clasificación


-------------------------------------
--------TABLA ENTIDAD EXTERNA--------
-------------------------------------
CREATE TABLE general.entidad_externa (
    ene_codigo SERIAL PRIMARY KEY,
    ene_nombre varchar(50) NOT NULL,
    ene_estado int DEFAULT 1 NOT NULL
);
-- Entidades externas que crean la norma

-----------------------------------
--------TABLA NORMA ENTIDAD--------
-----------------------------------
CREATE TABLE general.norma_entidad (
    gru_codigo SERIAL PRIMARY KEY,
    gru_nombre varchar(50) NOT NULL,
    gru_estado int DEFAULT 1 NOT NULL
);
-- Interno, externo

--------------------------------
----------TABLA NORMA-----------
--------------------------------
CREATE TABLE general.norma (
    nor_codigo SERIAL PRIMARY KEY,
    noe_codigo int NOT NULL,
    cuc_codigo int NULL,
    ene_codigo int NULL,
    nor_numero int NOT NULL,
    nor_nombre int NOT NULL,
    nor_url int NOT NULL,
    not_codigo int NOT NULL,
    nom_codigo int NOT NULL,
    nor_fecha_expedicion date NOT NULL,
    nor_fecha_vigencia date NOT NULL,
    nor_observacion varchar(250) NULL,
    nor_estado int DEFAULT 1 NOT null,
    CONSTRAINT norma_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES general.cuerpos_colegiados(cuc_codigo),
    CONSTRAINT norma_FK_persona FOREIGN KEY (per_codigo) REFERENCES general.persona(per_codigo),
    CONSTRAINT norma_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES general.usuario_tipo(ust_codigo)    
);
--NORMA

--------------------------------
--------TABLA NORMA GRUPO-------
--------------------------------
CREATE TABLE general.norma_grupo (
    nog_codigo SERIAL PRIMARY KEY,
    nor_numero int NOT NULL,
    gru_codigo int NOT NULL,
    nog_estado int DEFAULT 1 NOT null,
    CONSTRAINT integrante_cuerpo_colegiado_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES general.cuerpos_colegiados(cuc_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_persona FOREIGN KEY (per_codigo) REFERENCES general.persona(per_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES general.usuario_tipo(ust_codigo)    
);
--RELACION NORMA GRUPO CLASIFICACIÓN


-------------------------------------
--------TABLA NORMA DEROGADA---------
-------------------------------------
CREATE TABLE general.norma_grupo (
    nod_codigo SERIAL PRIMARY KEY,
    nor_codigo_padre int NOT NULL,
    nor_codigo_hijo int NOT NULL,
    nod_observacion int NOT NULL,
    nod_estado int DEFAULT 1 NOT null,
    CONSTRAINT integrante_cuerpo_colegiado_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES general.cuerpos_colegiados(cuc_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_persona FOREIGN KEY (per_codigo) REFERENCES general.persona(per_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES general.usuario_tipo(ust_codigo)    
);
--RELACION NORMA GRUPO CLASIFICACIÓN