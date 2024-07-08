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
    icc_fecha_fin date NULL,
    icc_observacicon varchar(250) NULL,
    icc_estado int DEFAULT 1 NOT null,
    CONSTRAINT integrante_cuerpo_colegiado_FK_cuerpos_colegiados FOREIGN KEY (cuc_codigo) REFERENCES general.cuerpos_colegiados(cuc_codigo),
    CONSTRAINT integrante_cuerpo_colegiado_FK_persona FOREIGN KEY (per_codigo) REFERENCES general.persona(per_codigo)    
);

select * from general.integrante_cuerpo_colegiado icc


select * from general.norma n 

select * from general.integrante_cuerpo_colegiado icc 
inner join general.cuerpos_colegiados cc on icc.cuc_codigo = cc.cuc_codigo 
inner join general.persona p on icc.per_codigo = p.per_codigo 
left join general.usuario_tipo ut ON icc.ust_codigo = ut.ust_codigo 
left join general.miembro_tipo mt on icc.mit_codigo = mt.mit_codigo 
order by icc.icc_fecha_inicio

CONSTRAINT integrante_cuerpo_colegiado_FK_miembro_tipo FOREIGN KEY (mit_codigo) REFERENCES general.miembro_tipo(mit_codigo)

select * from general.integrante_cuerpo_colegiado icc 


select ap.puv_codigo, pv.puv_nombre, pv.puv_estado, s.sed_nombre, s.sed_codigo, ss.sus_nombre, ss.sus_codigo, b.blo_nombre, b.blo_codigo, pvt.pvt_nombre, pvt.pvt_codigo, pv.puv_cupo_vigilante, count(ap.vig_codigo) as asignados from carnetizacion.asignacion_puesto ap 
inner join carnetizacion.puesto_vigilancia pv on ap.puv_codigo = pv.puv_codigo 
inner join carnetizacion.puesto_vigilancia_tipo pvt on pv.pvt_codigo = pvt.pvt_codigo 
inner join sede s on pv.sed_codigo = s.sed_codigo 
inner join sub_sede ss on pv.sus_codigo = ss.sus_codigo 
inner join bloque b on pv.blo_codigo = b.blo_codigo 
inner join carnetizacion.vigilante v on ap.vig_codigo = v.vig_codigo 
inner join tipo_id ti on v.tii_codigo = ti.tii_codigo 
where ap.asp_estado = 1
group by ap.puv_codigo, pv.puv_nombre, pv.puv_estado, s.sed_nombre, s.sed_codigo, ss.sus_nombre, ss.sus_codigo, b.blo_nombre, b.blo_codigo, pvt.pvt_nombre, pvt.pvt_codigo, pv.puv_cupo_vigilante


select cc.cuc_codigo, cc.cuc_nombre, cc.cuc_cantidad_miembros, count(icc.icc_estado) as asignados from general.cuerpos_colegiados cc
left join general.integrante_cuerpo_colegiado icc on cc.cuc_codigo = icc.cuc_codigo and icc.icc_estado = 1
where cc.cuc_estado = 1
group by cc.cuc_nombre, cc.cuc_cantidad_miembros,cc.cuc_codigo
having COUNT(icc.icc_estado) < 6

select * from general.cuerpos_colegiados cc 


UPDATE general.cuerpos_colegiados
SET cuc_nombre=NULL, cuc_nombre_corto=NULL, cuc_numero_norma=NULL, cuc_nombre_norma=NULL, cuc_fecha_norma=NULL, cuc_cantidad_miembros=NULL, cuc_estado=NULL
WHERE cuc_codigo = ;

INSERT INTO general.cuerpos_colegiados
(cuc_nombre, cuc_nombre_corto, cuc_numero_norma, cuc_nombre_norma, cuc_fecha_norma, cuc_cantidad_miembros )
VALUES(NULL, NULL, NULL, NULL, NULL, NULL);