-------------------------------------------
-----TABLA MIEMBRO TIPO-----
-------------------------------------------
CREATE TABLE general.miembro_tipo (
    mit_codigo SERIAL PRIMARY KEY,
    mit_nombre varchar(100) NOT NULL,
    mit_estado int DEFAULT 1 NOT NULL
);
INSERT INTO general.miembro_tipo
(mit_nombre)
VALUES('FUNDADOR');
INSERT INTO general.miembro_tipo
(mit_nombre)
VALUES('ADHERENTE');

select * from general.miembro_tipo

-------------------------------------------
-----TABLA INTEGRANTE CUERPO COLEGIADO-----
-------------------------------------------
CREATE TABLE general.integrante_cuerpo_colegiado (
    icc_codigo SERIAL PRIMARY KEY,
    cuc_codigo int NOT NULL,
    per_codigo int NOT NULL,
    icc_norma int NOT NULL,
    ust_codigo int NOT NULL,
    mit_codigo int NULL,
    icc_fecha_inicio date NOT NULL,
    icc_fecha_fin date NOT NULL,
    icc_observacicon varchar(250) NULL,
    icc_estado int DEFAULT 1 NOT null,
    CONSTRAINT integrante_cuerpo_colegiado_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES general.cuerpos_colegiados(cuc_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_persona FOREIGN KEY (per_codigo) REFERENCES general.persona(per_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES general.usuario_tipo(ust_codigo)    
);

CONSTRAINT integrante_cuerpo_colegiado_FK_miembro_tipo FOREIGN KEY (mit_codigo) REFERENCES general.miembro_tipo(mit_codigo)

select * from general.integrante_cuerpo_colegiado icc 

select * from general.cuerpos_colegiados cc where cc.cuc_estado = 1

UPDATE general.cuerpos_colegiados
SET cuc_nombre=NULL, cuc_nombre_corto=NULL, cuc_numero_norma=NULL, cuc_nombre_norma=NULL, cuc_fecha_norma=NULL, cuc_cantidad_miembros=NULL, cuc_estado=NULL
WHERE cuc_codigo = ;

INSERT INTO general.cuerpos_colegiados
(cuc_nombre, cuc_nombre_corto, cuc_numero_norma, cuc_nombre_norma, cuc_fecha_norma, cuc_cantidad_miembros )
VALUES(NULL, NULL, NULL, NULL, NULL, NULL);