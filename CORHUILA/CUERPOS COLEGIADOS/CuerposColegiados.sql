--*******************************************--
--******COMPONENTE CUERPOS COLEGIADOS********--
--*******************************************--

---------------------------
-----TABLA NORMA TIPO------
---------------------------
CREATE TABLE general.norma_tipo (
    not_codigo SERIAL PRIMARY KEY,
    not_nombre varchar(50) NOT NULL,
    not_estado int DEFAULT 1 NOT NULL
);

--LEY, DECRETO, RESOLUCION, DIRECTRIZ


--ASAMBLEA => TIPO DE MIEMBRO

------------------------------------------
-------------TABLA FUNCIONES--------------
------------------------------------------
CREATE TABLE general.funciones_curpos_colegiados (
    fcc_codigo SERIAL PRIMARY KEY,
    cuc_codigo int not null,
    fcc_nombre varchar(250) NOT NULL,
    fcc_estado int DEFAULT 1 NOT null
);

CONSTRAINT funciones_curpos_colegiados_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES cuerpos_colegiados(cuc_codigo)

select * from general.funciones_curpos_colegiados f
left join general.cuerpos_colegiados cc on f.cuc_codigo = cc.cuc_codigo 
where f.cuc_codigo = 1 and f.fcc_estado = 1 

INSERT INTO general.funciones_curpos_colegiados
(cuc_codigo, fcc_nombre)
VALUES(NULL, NULL);

UPDATE general.funciones_curpos_colegiados
SET cuc_codigo=NULL, fcc_nombre=NULL, fcc_estado=NULL
WHERE fcc_codigo IS NULL;

select * from general.cuerpos_colegiados cc


------------------------------------------
--------TABLA CUERPOS COLEGIADOS----------
------------------------------------------
CREATE TABLE general.cuerpos_colegiados (
    cuc_codigo SERIAL PRIMARY KEY,
    cuc_nombre varchar(20) NOT NULL,
    cuc_nombre_corto varchar(50) NOT NULL,
    cuc_numero_norma int NOT null,
    cuc_nombre_norma varchar(100) NOT NULL,
    cuc_fecha_norma timestamp NOT NULL,
    cuc_fecha_creacion timestamp DEFAULT current_timestamp NOT NULL,
    cuc_cantidad_miembros int not null,
    cuc_estado int DEFAULT 1 NOT null
);

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

----------------------------
--------TABLA CARGO----------
----------------------------
CREATE TABLE general.cargo (
    car_codigo SERIAL PRIMARY KEY,
    car_nombre varchar(50) NOT NULL,
    car_estado int DEFAULT 1 NOT NULL
);

-------------------------------------------
--------TABLA REPRESENTANTE LEGAL----------
-------------------------------------------
CREATE TABLE general.representante_legal (
    rel_codigo SERIAL PRIMARY KEY,
    per_codigo int not null,
    rel_norma int NOT null,
    rel_fecha_inicio_nombramiento date NOT NULL,
    rel_fecha_fin_nombramiento date NOT NULL,
    rel_observacion varchar(250) NOT NULL,
    rel_estado int DEFAULT 1 NOT null,
    CONSTRAINT representante_legal_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo)
);

select * from general.representante_legal rl 

INSERT INTO general.representante_legal
(per_codigo, rel_norma, rel_fecha_inicio_nombramiento, rel_fecha_fin_nombramiento, rel_observacion, rel_estado)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE general.representante_legal
SET per_codigo=NULL, rel_norma=NULL, rel_fecha_inicio_nombramiento=NULL, rel_fecha_fin_nombramiento=NULL, rel_observacion=NULL, rel_estado=NULL
WHERE rel_codigo IS NULL;

select * from general.representante_legal rl 
inner join general.persona p ON rl.per_codigo = p.per_codigo 
INNER JOIN general.tipo_identificacion ti on p.tii_codigo = ti.tii_codigo 
INNER JOIN general.sexo_biologico sb on p.seb_codigo = sb.seb_codigo 
INNER JOIN general.estado_civil ec on p.esc_codigo = ec.esc_codigo 
INNER JOIN general.estrato e on p.est_codigo = e.est_codigo 
INNER JOIN general.grupo_etnico ge on p.gre_codigo = ge.gre_codigo 
INNER JOIN general.pueblo_indigena pui on p.pui_codigo = pui.pui_codigo 
INNER JOIN general.comunidad_negra cn on p.con_codigo = cn.con_codigo 
INNER JOIN general.persona_discapacidad pd on p.ped_codigo = pd.ped_codigo 
INNER JOIN general.discapacidad_tipo dt on p.dit_codigo = dt.dit_codigo 
INNER JOIN general.talento_excepcional te on p.tae_codigo = te.tae_codigo 
INNER JOIN general.grupo_sanguineo gs on p.grs_codigo = gs.grs_codigo 

-----------------------------------------------------
--------TABLA AREA ACADÉMICA ADMINISTRATIVA----------
-----------------------------------------------------
CREATE TABLE general.area_academica_administrativa (
    aaa_codigo SERIAL PRIMARY KEY,
    aaa_nombre varchar(50) NOT NULL,
    aaa_estado int DEFAULT 1 NOT NULL
);

--------------------------------------------------------------
--------TABLA AREA ACADÉMICA ADMINISTRATIVA PERSONAL----------
--------------------------------------------------------------
CREATE TABLE general.aaa_personal (
    not_codigo SERIAL PRIMARY KEY,
    not_nombre varchar(50) NOT NULL,
    not_estado int DEFAULT 1 NOT NULL
);



select * from general.integrante_cuerpo_colegiado icc 
inner join general.cuerpos_colegiados cc on icc.cuc_codigo = cc.cuc_codigo 
inner join general.persona p on icc.per_codigo = p.per_codigo 
inner join general.usuario_tipo ut ON icc.ust_codigo = ut.ust_codigo 
inner join general.miembro_tipo mt on icc.mit_codigo = mt.mit_codigo 
where icc.cuc_codigo = 1
order by icc.icc_fecha_inicio 


INSERT INTO general.integrante_cuerpo_colegiado
(cuc_codigo, per_codigo, icc_norma, ust_codigo, mit_codigo, icc_fecha_inicio, icc_fecha_fin, icc_observacicon)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


UPDATE general.integrante_cuerpo_colegiado
SET cuc_codigo=NULL, per_codigo=NULL, icc_norma=NULL, ust_codigo=NULL, mit_codigo=NULL, icc_fecha_inicio=NULL, icc_fecha_fin=NULL, icc_observacicon=NULL, icc_estado=NULL
WHERE icc_codigo IS NULL;