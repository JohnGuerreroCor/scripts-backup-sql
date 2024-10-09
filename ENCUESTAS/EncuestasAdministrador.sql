
--Agregar columna uaa a la tabla de respuestas de encuestas
ALTER TABLE encuestas.respuestas_opciones ADD uaa_codigo int NULL;

--Actulizar registros anteriores con la UAA de la Universidad Surcolombiana
--select * from uaa u where u.uaa_codigo = 315
UPDATE encuestas.respuestas_opciones SET uaa_codigo = 315;

--Agregar la llave foránea a la columna agregada para asegurar la integridad de los datos
ALTER TABLE encuestas.respuestas_opciones
ADD CONSTRAINT respuestas_opciones_FK_uaa
FOREIGN KEY (uaa_codigo) REFERENCES dbo.uaa(uaa_codigo);

--Consultar el cambio realizado
select * from encuestas.respuestas_opciones ro 

select * from dbo.uaa u where u.uaa_nombre like '%UNIVERSIDAD%'



select * from encuestas.preguntas p 

select * from academia3000_john.graduado.soporte_fecha_expedicion sfe 



SELECT distinct m.* FROM matricula_virtual m 
LEFT JOIN curso_virtual c ON m.cur_codigo = c.cur_codigo 
WHERE m.cal_codigo in (select cal_codigo from calendario where cal_nombre like '20241%')


select * from web_parametro wp where wp.wep_nombre like '%EDUCACION_VIRTUAL%'


select * from encuestas.respuestas_opciones ro 

select * from dbo.persona p where p.per_apellido like '%ari%'

select * from encuestas.cuestionarios c 

select * from encuestas.preguntas p where p.cue_codigo = 51

select * from encuestas.respuestas_opciones ro 

select * from sgd.tipo_documento td 

select * from web_parametro wp where wp.wep_codigo in (419,433)

select * from web_parametro wp where wp.wep_codigo in (435,436)

select * from web_parametro wp where wp.wep_codigo in (457,458)

select * from web_parametro wp where wp.wep_codigo in (520,521)

select * from web_parametro wp where wp.wep_codigo in (419,433,435,4366,457,458,529,521)

select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 45


SELECT * from encuestas.cuestionarios c where c.cue_estado = 1


SELECT distinct m.* FROM matricula_virtual m 
LEFT JOIN curso_virtual c ON m.cur_codigo = c.cur_codigo
 


select * from encuestas.respuestas_cuestionarios rc where rc.cue_codigo = 32 and rc.

select * from carnetizacion.usuario_carnet_digital_login ucdl 



select * from encuestas.cuestionario_configuracion cc where cc.cue_codigo = 44

select * from encuestas.cuestionarios c ;

select * from grupo g where g.gru_codigo in (276,327);


--INSERT INTO dbo.grupo (gru_nombre, gru_id, gru_estado) 
VALUES('Encuestas_Super_Administrador', 'ENCUESTAS_SUPER_ADMINISTRADOR', 1);



select * from usuario_encuestas_admin_login us 
inner join uaa u on u.uaa_codigo = us.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on p.per_codigo = us.per_codigo where  us = 'a1075303330' ;



--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 328, 463, 1);




select * from uaa_personal up where up.per_codigo = 108797;

SELECT * from encuestas.respuestas_cuestionarios rc where rc.per_codigo = 108797;

select * from encuestas.cuestionarios c;

UPDATE encuestas.cuestionarios SET cue_estado = 1 WHERE cue_codigo= 33

select * from encuestas.respuestas_opciones ro 

select * from encuestas.tipo_respuestas tr 

SELECT *  from encuestas.preguntas p where (cue_codigo = 32  And pre_tipo = 0) AND pre_estado= 1 and p.tre_codigo != 2 and p.pre_tipo != 0

select * from encuestas.cuestionarios c 

select ut.tus_nombre as estamento, count(rc.rcu_codigo) as encuestados from encuestas.respuestas_cuestionarios rc 
inner join usuario_tipo ut on rc.rcu_estamento = ut.tus_codigo 
where rc.cue_codigo = :cuestionario
group by ut.tus_nombre 

SELECT * from encuestas.preguntas p 
join encuestas.tipo_respuestas tr on p.tre_codigo =tr.tre_codigo
join encuestas.cuestionarios c on p.cue_codigo=c.cue_codigo 
left join encuestas.grupo_escala g on p.gre_codigo= g.gre_codigo
where c.cue_codigo=:codigo AND (p.pre_tipo=0 OR p.pre_tipo=2) AND p.pre_estado=1

select * from encuestas.preguntas p 

where 

--MIRAR LAS PREGUNTAS SEGÚN EL CUESTIONARIO
select * from encuestas.preguntas p where p.cue_codigo = 13 and p.pre_estado = 1 and p.tre_codigo != 2 --OPCIONES
select * from encuestas.preguntas p where p.cue_codigo = 13 and p.pre_estado = 1 and p.tre_codigo = 2 --TEXTO

select * from encuestas.respuestas_cuestionarios rc 

select * from encuestas.cuestionarios c 

--LISTAR LAS RESPUESTAS POR USUARIO Y PREGUNTA REALIZADA SOLO PARA OPCIONES DE RESPUESTA
with resultado(rcu_codigo, rcu_fecha, tus_nombre, pre_codigo, rop_descripcion) as(
select rc.rcu_codigo, rc.rcu_fecha, tu.tus_nombre, pr.pre_codigo, convert(varchar(40), ro.rop_descripcion , 112) from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 11
) SELECT * from resultado pivot( max(rop_descripcion) FOR pre_codigo in ([190],[191],[192],[193],[194],[195],[196],[197],[198],[199],[200],[201],[202],[203],[204],[205],[206],[207],[208],[209],[210],[211],[212],[213],[214],[215])) as pvt


--LISTAR LAS RESPUESTAS POR USUARIO Y PREGUNTA REALIZADA SOLO PARA TIPO TEXTO
with resultado(rcu_codigo, per_codigo, tus_nombre, pre_codigo, res_texto) as(
select rc.rcu_codigo, rc.per_codigo, tu.tus_nombre, p.pre_codigo, r.res_texto from encuestas.respuestas_cuestionarios rc 
inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo  
inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo 
where rc.cue_codigo = 11
) SELECT * from resultado pivot( max(res_texto) FOR pre_codigo in ([215])) as pvt

--CONDICIONAL INTERVALO FECHA
convert(Date, rc.rcu_fecha) BETWEEN '2023-06-01' AND '2023-06-26'


with resultado(
  rcu_codigo,
  rcu_fecha,
  tus_nombre,
  pre_codigo,
  rop_descripcion
) as(
  select
    rc.rcu_codigo,
    rc.rcu_fecha,
    tu.tus_nombre,
    pr.pre_codigo,
    convert(varchar(40), ro.rop_descripcion, 112)
  from
    encuestas.respuestas_cuestionarios rc
    inner JOIN encuestas.respuestas r on r.rcu_codigo = rc.rcu_codigo
    inner JOIN encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo
    inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo
    inner JOIN encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo
    inner join dbo.usuario_tipo tu on rc.rcu_estamento = tu.tus_codigo
  where
    rc.cue_codigo = 2
)
SELECT
  *
from
  resultado pivot(max(rop_descripcion) FOR pre_codigo in ([19],[18],[17],[15],[14],[13],[12])) as pvt
  
  
  
select count(*) from encuestas.respuestas_cuestionarios rc
inner join encuestas.respuestas r on rc.rcu_codigo = r.rcu_codigo
inner join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
inner join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo 
inner join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
--inner join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
--inner join dbo.usuario_tipo tu  on cc.tus_codigo = tu.tus_codigo 
where p.pre_codigo=877 and ro.rop_codigo=377 

select count(*) from encuestas.respuestas_cuestionarios rc
inner join encuestas.respuestas r on rc.rcu_codigo = r.rcu_codigo
inner join encuestas.preguntas_respuestas pr on r.prr_codigo = pr.prr_codigo 
inner join encuestas.respuestas_opciones ro on pr.rop_codigo = ro.rop_codigo 
inner join encuestas.preguntas p on r.pre_codigo = p.pre_codigo 
inner join encuestas.cuestionarios c on rc.cue_codigo = c.cue_codigo 
--inner join encuestas.cuestionario_configuracion cc on cc.cue_codigo = c.cue_codigo 
--inner join dbo.usuario_tipo tu  on cc.tus_codigo = tu.tus_codigo 
where p.pre_codigo=877 and ro.rop_codigo=378

select * from encuestas.cuestionario_configuracion cc 

select * from encuestas.respuestas r 

select count(*) from encuestas.respuestas_opciones ro where ro.rop_estado = 1

select * from encuestas.cuestionarios c 

select DISTINCT ro.rop_codigo, CONVERT( VARCHAR(MAX),ro.rop_descripcion) as rop_descripcion, ro.rop_estado from encuestas.respuestas_opciones ro
inner join encuestas.preguntas_respuestas pr on ro.rop_codigo = pr.rop_codigo 
inner join encuestas.preguntas p on pr.pre_codigo = p.pre_codigo 
inner join encuestas.cuestionarios c on p.cue_codigo = c.cue_codigo 
where ro.rop_estado = 1 and c.uaa_codigo =463

select * from encuestas.cuestionarios c 

select * from encuestas.preguntas_respuestas pr 

select * from encuestas.cuestionarios c 

select * from encuestas.respuestas_opciones ro where ro.rop_descripcion like '%NO%'

select * from encuestas.preguntas p where p.cue_codigo = 32 and p.pre_estado = 1

select * from encuestas.preguntas p where p.cue_codigo = 

SELECT ro.rop_codigo,rop_descripcion from encuestas.preguntas_respuestas pr
join encuestas.respuestas_opciones ro on pr.rop_codigo =ro.rop_codigo 
inner join encuestas.cuestionarios c on c.
where pr.pre_codigo =:pregunta and pr.prr_estado = 1