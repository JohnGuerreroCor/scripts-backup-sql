
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