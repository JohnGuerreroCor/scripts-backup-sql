-----------------------------------
--------TABLA NORMA ENTIDAD--------
-----------------------------------
CREATE TABLE norma_entidad (
    noe_codigo INT IDENTITY(1,1) PRIMARY KEY,
    noe_nombre VARCHAR(50) NOT NULL,
    noe_estado INT DEFAULT 1 NOT NULL
);

-- Interno, externo
INSERT INTO norma_entidad
(noe_nombre)
VALUES('INTERNA');
INSERT INTO norma_entidad
(noe_nombre)
VALUES('EXTERNA');

select * from norma_entidad ne 

---------------------------
--------TABLA MEDIO--------
---------------------------
CREATE TABLE norma_medio (
    nom_codigo INT IDENTITY(1,1) PRIMARY KEY,
    nom_nombre VARCHAR(50) NOT NULL,
    nom_estado INT DEFAULT 1 NOT NULL
);

-- FÍSICO, DIGITAL...

INSERT INTO norma_medio
(nom_nombre)
VALUES('DIGITAL');
INSERT INTO norma_medio
(nom_nombre)
VALUES('FÍSICO');

select * from norma_medio nm 


-------------------------------------
--------TABLA ENTIDAD EXTERNA--------
-------------------------------------
CREATE TABLE entidad_externa (
    ene_codigo INT IDENTITY(1,1) PRIMARY KEY,
    ene_nombre NVARCHAR(100) NOT NULL,
    ene_estado INT DEFAULT 1 NOT NULL
);

-- Entidades externas que crean la norma

select * from general.entidad_externa ee where ee.ene_estado = 1 order by ee.ene_nombre asc
---------------------------
-----TABLA NORMA TIPO------
---------------------------
CREATE TABLE norma_tipo (
    not_codigo INT IDENTITY(1,1) PRIMARY KEY,
    not_nombre NVARCHAR(50) NOT NULL,
    noe_codigo INT NOT NULL,
    not_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT norma_tipo_FK_norma_entidad FOREIGN KEY (noe_codigo) REFERENCES norma_entidad(noe_codigo)
);

--LEY, DECRETO, RESOLUCION, DIRECTRIZ

select * from norma_tipo nt 
inner join norma_entidad ne on nt.noe_codigo = ne.noe_codigo 
where nt.noe_codigo = 1 and nt.not_estado = 1 


--------------------------------
----------TABLA NORMA-----------
--------------------------------
CREATE TABLE norma (
    nor_codigo INT IDENTITY(1,1) PRIMARY KEY,
    noe_codigo INT NOT NULL,
    ene_codigo INT NULL,
    nor_rectoria INT NOT NULL,
    cuc_codigo INT NULL,
    not_codigo INT NOT NULL,
    nor_numero NVARCHAR(10) NOT NULL,
    nor_nombre NVARCHAR(500) NOT NULL,
    nor_url NVARCHAR(500) NOT NULL,
    nom_codigo INT NOT NULL,
    nor_fecha_expedicion DATE NOT NULL,
    nor_fecha_vigencia DATE NULL,
    nor_deroga INT NOT NULL,
    nor_observacion NVARCHAR(250) NULL,
    nor_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT norma_FK_norma_entidad FOREIGN KEY (noe_codigo) REFERENCES norma_entidad(noe_codigo),
    CONSTRAINT norma_FK_norma_tipo FOREIGN KEY (not_codigo) REFERENCES norma_tipo(not_codigo),
    CONSTRAINT norma_FK_norma_medio FOREIGN KEY (nom_codigo) REFERENCES norma_medio(nom_codigo)
);

--NORMA

select * from w

select * from norma n 

INSERT INTO norma
(noe_codigo, ene_codigo, nor_rectoria, cuc_codigo, not_codigo, nor_numero, nor_nombre, nor_url, nom_codigo, nor_fecha_expedicion, nor_fecha_vigencia, nor_deroga, nor_observacion)
VALUES(0, 0, 0, 0, 0, 0, '', '', 0, '', '', 0, '');

UPDATE norma
SET noe_codigo=0, ene_codigo=0, nor_rectoria=0, cuc_codigo=0, not_codigo=0, nor_numero=0, nor_nombre='', nor_url='', nom_codigo=0, nor_fecha_expedicion='', nor_fecha_vigencia='', nor_deroga=0, nor_observacion='', nor_estado=1
WHERE nor_codigo=nextval('general.norma_nor_codigo_seq'::regclass);

select *, nt2.not_nombre || ' ' || n2.nor_numero || ' ' || n2.nor_nombre as norma_padre from general.norma n 
inner join general.norma_entidad ne on n.noe_codigo = ne.noe_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
left join general.norma_deroga nd on n.nor_codigo = nd.nor_codigo_hijo and nd.nod_estado = 1
left join general.norma n2 on nd.nor_codigo_padre = n2.nor_codigo 
left join general.norma_tipo nt2 on nt2.not_codigo = n2.not_codigo 
where n.nor_estado = 1

select * from general.norma n 
inner join general.norma_entidad ne on n.noe_codigo = ne.noe_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
where n.nor_estado = 1 or n.nor_fecha_vigencia is null or n.nor_fecha_vigencia > now()

SELECT * FROM general.norma n  
inner join general.norma_entidad ne on n.noe_codigo = ne.noe_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
where n.nor_estado = 1 and NOT EXISTS ( SELECT * FROM general.norma_deroga nd WHERE n.nor_codigo = nd.nor_codigo_hijo and nd.nod_estado != 0 ); 

---------------------------
-----TABLA DEROGA TIPO------
---------------------------
CREATE TABLE deroga_tipo (
    det_codigo INT IDENTITY(1,1) PRIMARY KEY,
    det_nombre NVARCHAR(50) NOT NULL,
    det_estado INT DEFAULT 1 NOT NULL
);

INSERT INTO deroga_tipo
(det_nombre)
VALUES('TOTAL');
INSERT INTO deroga_tipo
(det_nombre)
VALUES('PARCIAL');
INSERT INTO deroga_tipo
(det_nombre)
VALUES('MODIFICA');

select * from deroga_tipo dt 
----------------------------------
--------TABLA NORMA DEROGA--------
----------------------------------
CREATE TABLE norma_deroga (
    nod_codigo INT IDENTITY(1,1) PRIMARY KEY,
    det_codigo INT NOT NULL,
    nor_codigo_padre INT NOT NULL,
    nor_codigo_hijo INT NOT NULL,
    nod_observacion NVARCHAR(250) NULL,
    nod_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT norma_deroga_FK_deroga_tipo FOREIGN KEY (det_codigo) REFERENCES deroga_tipo(det_codigo),
    CONSTRAINT norma_deroga_FK_norma_hijo FOREIGN KEY (nor_codigo_hijo) REFERENCES norma(nor_codigo)
);

select * from norma_deroga nd 


INSERT INTO general.norma_deroga
(det_codigo, nor_codigo_padre, nor_codigo_hijo, nod_observacion)
VALUES(0, 0, 0, '');

UPDATE general.norma_deroga
SET det_codigo=0, nor_codigo_padre=0, nor_codigo_hijo=0, nod_observacion='', nod_estado=1
WHERE nod_codigo=;


select nd.nod_codigo, nd.nod_observacion, nd.nod_estado, dt.det_codigo, dt.det_nombre, nd.nor_codigo_padre, n.nor_nombre as nor_nombre_padre, nd.nor_codigo_hijo, nt2.not_nombre || ' ' || n2.nor_numero || ' ' || n2.nor_nombre as nor_nombre_hijo from general.norma_deroga nd 
inner join general.deroga_tipo dt on nd.det_codigo = dt.det_codigo 
left join general.norma n on nd.nor_codigo_padre  = n.nor_codigo 
inner join general.norma n2 on nd.nor_codigo_hijo = n2.nor_codigo 
left join general.norma_tipo nt2 on nt2.not_codigo = n2.not_codigo 
where nd.nod_estado = 1 and nd.nor_codigo_padre = 2


---------------------------
--------TABLA NORMA GRUPO--------
---------------------------
CREATE TABLE norma_grupo (
    nog_codigo INT IDENTITY(1,1) PRIMARY KEY,
    nog_nombre NVARCHAR(100) NOT NULL,
    nog_estado INT DEFAULT 1 NOT NULL
);

--Grupos clasificación

INSERT INTO norma_grupo
(nog_nombre)
VALUES('GRUPO UNO');

INSERT INTO norma_grupo
(nog_nombre)
VALUES('GRUPO DOS');

INSERT INTO norma_grupo
(nog_nombre)
VALUES('GRUPO TRES');

select * from norma_grupo
--------------------------------
--------TABLA NORMA CLASIFICADA-------
--------------------------------
CREATE TABLE norma_clasificada (
    noc_codigo INT IDENTITY(1,1) PRIMARY KEY,
    nor_codigo INT NOT NULL,
    nog_codigo INT NOT NULL,
    noc_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT norma_clasificada_FK_norma FOREIGN KEY (nor_codigo) REFERENCES norma(nor_codigo),
    CONSTRAINT norma_clasificada_FK_norma_grupo FOREIGN KEY (nog_codigo) REFERENCES norma_grupo(nog_codigo)
);

--RELACION NORMA GRUPO CLASIFICACIÓN


select * from general.norma_clasificada

INSERT INTO general.norma_clasificada
(nor_codigo, nog_codigo)
VALUES(0, 0);


UPDATE general.norma_clasificada
SET noc_estado=
WHERE noc_codigo=;

SELECT * FROM general.norma n  
inner join general.norma_entidad ne on n.noe_codigo = ne.noe_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
WHERE NOT EXISTS ( SELECT * FROM general.norma_clasificada nc WHERE n.nor_codigo = nc.nor_codigo and nc.noc_estado = 1 and nc.nog_codigo = 4);

select * from norma_grupo ng 
select * from norma_clasificada nc 

select * from general.norma_clasificada nc 
inner join general.norma n on nc.nor_codigo = n.nor_codigo 
inner join general.norma_grupo ng on nc.nog_codigo = ng.nog_codigo 
inner join general.norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join general.norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join general.cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join general.entidad_externa ee on n.ene_codigo = ee.ene_codigo
where nc.nog_codigo = 1 and nc.noc_estado = 1


select * from norma_clasificada nc 

select cc.cuc_codigo, cc.cuc_nombre, cc.cuc_cantidad_miembros, count(icc.icc_estado) as asignados from general.cuerpos_colegiados cc
left join general.integrante_cuerpo_colegiado icc on cc.cuc_codigo = icc.cuc_codigo and icc.icc_estado = 1
where cc.cuc_estado = 1
group by cc.cuc_nombre, cc.cuc_cantidad_miembros,cc.cuc_codigo
having COUNT(icc.icc_estado) < 6

select ng.nog_codigo, ng.nog_nombre, count(nc.nor_codigo) as nog_cantidad from general.norma_grupo ng 
left join general.norma_clasificada nc on ng.nog_codigo = nc.nog_codigo and nc.noc_estado = 1
where ng.nog_estado = 1
group by ng.nog_codigo ,ng.nog_nombre 


select * from general.norma_grupo ng where ng.nog_estado = 1 order by ng.nog_codigo 



INSERT INTO general.norma_grupo
(nog_nombre)
VALUES('');

UPDATE general.norma_grupo
SET nog_nombre=, nog_estado=
WHERE nog_codigo=;


-------------------------------------
--------TABLA NORMA DEROGADA---------
-------------------------------------
CREATE TABLE norma_grupo (
    nod_codigo SERIAL PRIMARY KEY,
    nor_codigo_padre int NOT NULL,
    nor_codigo_hijo int NOT NULL,
    nod_observacion int NOT NULL,
    nod_estado int DEFAULT 1 NOT null,
    CONSTRAINT integrante_cuerpo_colegiado_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES cuerpos_colegiados(cuc_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES usuario_tipo(ust_codigo)    
);
--RELACION NORMA GRUPO CLASIFICACIÓN








select *, nt2.not_nombre || ' ' || n2.nor_numero || ' ' || n2.nor_nombre as deroga_padre from norma n 
inner join norma_entidad ne on n.noe_codigo = ne.noe_codigo 
inner join norma_tipo nt on n.not_codigo = nt.not_codigo 
inner join norma_medio nm on n.nom_codigo = nm.nom_codigo 
left join cuerpos_colegiados cc on n.cuc_codigo = cc.cuc_codigo 
left join entidad_externa ee on n.ene_codigo = ee.ene_codigo 
left join norma_deroga nd on n.nor_codigo = nd.nor_codigo_hijo and nd.nod_estado = 1 
left join norma n2 on nd.nor_codigo_padre = n2.nor_codigo 
left join norma_tipo nt2 on nt2.not_codigo = n2.not_codigo 
where n.nor_estado = 1