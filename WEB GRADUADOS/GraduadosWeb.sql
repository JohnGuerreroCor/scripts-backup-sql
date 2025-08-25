select count(*) from academia3000.graduado.competencia_respuesta cr 
select * from persona p where p.per_codigo = 51065


CREATE TABLE academia3000_john.graduado.inicio_sesion_graduado (
	isg_codigo int IDENTITY(1,1) NOT NULL,
	mod_codigo int NOT NULL,
	id varchar(20) NOT NULL,
	isg_token varchar(100) NOT NULL,
	isg_intento int NULL,
	cise_codigo int NULL,
	isg_ip varchar(100) NULL,
	isg_fecha_generacion datetime DEFAULT getdate() NULL,
	isg_fecha_expira datetime NULL,
	isg_fecha_fin_sesion datetime NULL,
	CONSTRAINT inicio_sesion_graduado_PK PRIMARY KEY (isg_codigo),
	CONSTRAINT inicio_sesion_graduado_FK_estado_inicio_sesion FOREIGN KEY (cise_codigo) REFERENCES academia3000_john.token.codigo_inicio_sesion_estado(cise_codigo),
	CONSTRAINT inicio_sesion_graduado_FK_modulo FOREIGN KEY (mod_codigo) REFERENCES academia3000_john.dbo.modulo(mod_codigo)
);

select * from  academia3000_john.graduado.inicio_sesion_graduado ig order by ig.isg_codigo desc
select * from token.codigo_inicio_sesion_estado

select * from persona p where p.per_codigo = 108797

select * from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo 
where p.per_identificacion = '1075240473'

select ecr.ecr_codigo, ecr.per_codigo, ecr.ecp_codigo, ecp.ecp_nombre, ecr.ece_codigo, ece.ece_respuesta, ecr.ecr_fecha from graduado.expectativas_capacitacion_respuesta ecr  
left join persona p on ecr.per_codigo = p.per_codigo 
left join graduado.expectativas_capacitacion_pregunta ecp on ecr.ecp_codigo = ecp.ecp_codigo 
left join graduado.expectativas_capacitacion_escala ece on ecr.ece_codigo = ece.ece_codigo 
where p.per_identificacion = '1075303330'

select * from graduado.expectativas_capacitacion_pregunta ecp where ecp.ecp_estado = 1
inner join academia3000_john.graduado.expectativas_capacitacion_escala ece on ecp.ecp_codigo = ece.ecp_codigo

select * from estudiante e where e.est_codigo = '20161147560'

select * from municipio m where m.mun_nombre like '%descon%'

select * from departamento d where d.dep_codigo = 35

select * from pais p where p.pai_nombre != ''


select * from academia3000_john.graduado.expectativas_capacitacion_respuesta ecr 

select * from academia3000_john.graduado.mencion_reconocimiento mr 


INSERT INTO academia3000_john.graduado.situacion_laboral_respuesta
(slr_codigo, per_codigo, slp_codigo, sle_codigo, slr_fecha)
VALUES(0, 0, 0, 0, getdate());


UPDATE academia3000_john.graduado.situacion_laboral_respuesta
SET per_codigo=0, slp_codigo=0, sle_codigo=0, slr_fecha=getdate()
WHERE slr_codigo=0;



INSERT INTO academia3000_john.graduado.expectativas_capacitacion_respuesta
(per_codigo, ecp_codigo, ece_codigo, ecr_fecha)
VALUES(0, 0, 0, getdate());

UPDATE academia3000_john.graduado.expectativas_capacitacion_respuesta
SET per_codigo=0, ecp_codigo=0, ece_codigo=0, ecr_fecha=getdate()
WHERE ecr_codigo=0;


select * from academia3000_john.graduado.expectativas_capacitacion_respuesta ecr where ecr.per_codigo = 108797

select * from academia3000_john.graduado.situacion_laboral_pregunta slp where slp.slp_estado = 1 order by slp.slp_orden asc
select * from academia3000_john.graduado.situacion_laboral_escala sle where sle.slp_codigo = and sle.sle_estado = 1
select * from academia3000_john.graduado.situacion_laboral_respuesta slr 


INSERT INTO academia3000_john.graduado.historial_academico
(hia_codigo, per_codigo, hia_titulo, nia_codigo, hia_institucion, mun_codigo, hia_fecha_inicio, hia_fecha_fin, hia_finalizado, hia_estado)
VALUES(0, 0, '', 0, '', 0, '', '', 0, 1);

UPDATE academia3000_john.graduado.historial_academico
SET per_codigo=0, hia_titulo='', nia_codigo=0, hia_institucion='', mun_codigo=0, hia_fecha_inicio='', hia_fecha_fin='', hia_finalizado=0, hia_estado=1
WHERE hia_codigo=0;


select * from academia3000_john.graduado.competencia_tipo ct  
select * from academia3000_john.graduado.competencia_pregunta cp where cp.cop_estado = 1 order by cp.cop_orden asc
select * from academia3000_john.graduado.competencia_escala ce where ce.coe_codigo < 5

select * from academia3000_john.graduado.competencia_escala ce
inner join academia3000_john.graduado.competencia_tipo ct on 
where ce.coe_codigo > 4
select * from academia3000_john.graduado.competencia_respuesta cr  


INSERT INTO academia3000_john.graduado.competencia_respuesta
(cor_codigo, per_codigo, cop_codigo, coe_codigo, cor_fecha)
VALUES(0, 0, 0, 0, getdate());


UPDATE academia3000_john.graduado.competencia_respuesta
SET per_codigo=0, cop_codigo=0, coe_codigo=0, cor_fecha=getdate()
WHERE cor_codigo=0;

select * from academia3000_john.graduado.mencion_reconocimiento mr 

select * from academia3000_john.graduado.ambito a where a.amb_estado = 1

select * from graduado.competencia_respuesta cr where cr.per_codigo = 

select * from graduado.competencia_respuesta cr 
inner join persona p on cr.per_codigo = p.per_codigo 
inner join graduado.competencia_pregunta cp on cr.cop_codigo = cp.cop_codigo 
inner join graduado.competencia_escala ce on cr.coe_codigo = ce.coe_codigo 
where p.per_identificacion = '1003814391' order by cp.cop_orden asc

