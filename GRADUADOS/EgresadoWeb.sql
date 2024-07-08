select * from academia3000_john.graduado.habilidad_informatica hi; 

select * from persona p where p.per_identificacion = '1003805915'

select * from estudiante e where e.per_codigo = 146240

select top 1 * from dbo.usuario_estudiante_login uel 
inner join uaa u on uel.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on uel.up = p.per_codigo 
where  uel.us = 'u20191176712' order by uel.istipo asc



INSERT INTO academia3000_john.graduado.historial_laboral
(hil_codigo, per_codigo, hil_cargo, hil_funcion, hil_empresa, hil_fecha_inicio, hil_fecha_fin, hil_estado)
VALUES(0, 0, '', '', '', '', '', 1);

UPDATE academia3000_john.graduado.historial_laboral
SET per_codigo=0, hil_cargo='', hil_funcion='', hil_empresa='', hil_fecha_inicio='', hil_fecha_fin='', hil_estado=1
WHERE hil_codigo=0;

select * from academia3000_john.graduado.historial_laboral hl 

INSERT INTO academia3000_john.graduado.habilidad_informatica
(hai_codigo, per_codigo, hai_nombre_programa, hid_codigo, hai_estado)
VALUES(0, 0, '', 0, 1);

UPDATE graduado.habilidad_informatica
SET per_codigo=0, hai_nombre_programa='', hid_codigo=0, hai_estado=1
WHERE hai_codigo=0;


INSERT INTO academia3000_john.graduado.idioma
(idi_codigo, per_codigo, idi_idioma, idi_conversacion, idi_escritura, idi_lectura, idi_estado)
VALUES(0, 0, '', 0, 0, 0, 1);

UPDATE academia3000_john.graduado.idioma
SET per_codigo=0, idi_idioma='', idi_conversacion=0, idi_escritura=0, idi_lectura=0, idi_estado=1
WHERE idi_codigo=0;



INSERT INTO graduado.registro_educativo
(per_codigo, ree_titulo, nia_codigo, ree_institucion, mun_codigo, ree_fecha_fin, ree_finalizado)
VALUES(0, '', 0, '', 0, '', 0);

UPDATE graduado.registro_educativo
SET per_codigo=0, ree_titulo='', nia_codigo=0, ree_institucion='', mun_codigo=0, ree_fecha_fin='', ree_finalizado=0, ree_estado=1
WHERE ree_codigo=0;


INSERT INTO academia3000_john.graduado.datos_complementarios
(est_codigo, dac_modalidad_grado, dac_perfil_profesional)
VALUES( '', '', '');

UPDATE graduado.datos_complementarios
SET est_codigo='', dac_modalidad_grado='', dac_perfil_profesional=''
WHERE dac_codigo=0;

select * from academia3000_john.graduado.registro_educativo re 

select * from academia3000_john.graduado.historial_academico ha 

select * from academia3000_john.graduado.idioma_dominio id 

select * from academia3000_john.graduado.idioma i 

select * from academia3000_john.graduado.habilidad_informatica_dominio hid 

select * from academia3000_john.graduado.datos_complementarios dc 

select * from graduado.datos_complementarios dc 
inner join estudiante e on dc.est_codigo = e.est_codigo 
inner join persona p on e.per_codigo = p.per_codigo
inner join programa pr on e.pro_codigo = pr.pro_codigo 
inner join uaa u on pr.uaa_codigo = u.uaa_codigo 
left join graduado g on dc.est_codigo = g.est_codigo 
where dc.est_codigo = '20171155993'

select * from estudiante e where e.est_codigo = '20232218348'




UPDATE dbo.estudiante
SET est_registro_egresado=?
WHERE est_codigo=?;


select * from graduado g 
