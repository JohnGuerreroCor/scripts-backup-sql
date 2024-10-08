select * from usuario_sibusco_restaurante_login usrl where usrl.usg_uaa = 645;

select * from sibusco.restaurante_contrato rc;
select * from sibusco.restaurante_tipo_contrato rtc;

select * from sibusco.restaurante_horario_servicio rhs where rhs.rhs_uaa_codigo = 645

select * from sibusco.restaurante_parametro_cantidad rpc 

select * from estudiante e where e.est_codigo = '20242229284'

select * from sibusco.restaurante_grupo_gabu rgg 
select * from sibusco.restaurante_tipo_gabu rtg 
select * from sibusco.restaurante_contrato rc 
select * from sibusco.restaurante_venta rv 
inner join dbo.persona p on rv.per_codigo = p.per_codigo
left join sibusco.restaurante_grupo_gabu rgg on rv.per_codigo = rgg.per_codigo 
left join sibusco.restaurante_tipo_gabu rtg on rgg.rtg_codigo = rtg.rtg_codigo 
inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
inner join sibusco.restaurante_contrato rc on rv.rco_codigo = rc.rco_codigo 
inner join sibusco.restaurante_tipo_contrato rtc on rc.rtc_codigo = rtc.rtc_codigo 
inner join sibusco.restaurante_sede rs on rv.uaa_codigo = rs.uaa_codigo 
where rv.rve_eliminado != 0 and rv.uaa_codigo =  ? and CONVERT(TIME, rv.rve_fecha) BETWEEN ? AND ?
ORDER BY rv.rve_fecha desc, rv.rts_codigo asc

select * from uaa u where u.uaa_codigo = 645

--ASIGNAR PERFIL RESTAURANTE ADMON JOHN
--INSERT INTO usuario_grupo (usg_usuario, usg_grupo, usg_uaa, usg_estado)
VALUES (146624, 88, 645, 1);


-- Paso 1: Agregar la columna
ALTER TABLE sibusco.restaurante_venta 
ADD rve_eliminado INT DEFAULT 1;

-- Paso 2: Asegurarse de que todas las filas existentes tengan el valor 1
UPDATE sibusco.restaurante_venta
SET rve_eliminado = 1
WHERE rve_eliminado IS NULL;

-- Agregar una restricción de valor por defecto a la columna existente
ALTER TABLE sibusco.restaurante_venta
ADD CONSTRAINT DF_rve_eliminado DEFAULT 1 FOR rve_eliminado;


select * from sibusco.restaurante_contrato rc 
select * from sibusco.restaurante_consumo rc

select * from sibusco.restaurante_horario_servicio rhs where rhs.rhs_uaa_codigo = 645

select * from sibusco.restaurante_consumo rc 

select * from sibusco.restaurante_contrato rc 

select * from sibusco.restaurante_venta rv 

WITH ConsumoPorRestaurante AS
(SELECT rc.uaa_codigo, rc.rcn_fecha, rc.rts_codigo, COUNT(*) AS consumo FROM sibusco.restaurante_consumo rc
left join sibusco.restaurante_grupo_gabu rgg on rc.per_codigo = rgg.per_codigo 
WHERE rc.uaa_codigo = 647 and rc.rcn_fecha = CONVERT(DATE, '2024-10-02') and rgg.per_codigo IS NULL
GROUP BY rc.uaa_codigo, rc.rcn_fecha, rc.rts_codigo)
SELECT rhs.rts_codigo, rts.rts_nombre, rhs.rhs_uaa_codigo, rs.uaa_nombre, rhs.rhs_cantidad_comidas,
consumo, rhs.rhs_cantidad_comidas - c.consumo AS raciones_disponibles, rhs.rhs_hora_inicio_atencion,
rhs.rhs_hora_fin_atencion FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN ConsumoPorRestaurante c ON rhs.rhs_uaa_codigo = c.uaa_codigo AND rhs.rts_codigo = c.rts_codigo
INNER JOIN sibusco.restaurante_tipo_servicio rts on rhs.rts_codigo = rts.rts_codigo
INNER JOIN sibusco.restaurante_sede rs on rhs.rhs_uaa_codigo = rs.uaa_codigo
WHERE CONVERT(TIME, '08:00:00') BETWEEN rhs.rhs_hora_inicio_atencion AND rhs.rhs_hora_fin_atencion


select * from sibusco.restaurante_venta rv 

WITH VentaPorRestaurante AS
(SELECT rhs.rhs_uaa_codigo, rv.rts_codigo, COUNT(rv.rve_codigo) AS ventas FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN sibusco.restaurante_venta rv ON rhs.rhs_uaa_codigo = rv.uaa_codigo and rv.rve_fecha = CONVERT(DATE, '2024-09-04')
left join sibusco.restaurante_grupo_gabu rgg on rv.per_codigo = rgg.per_codigo 
WHERE rhs.rhs_uaa_codigo = 645 AND (CONVERT(TIME, '09:00:00') BETWEEN rhs.rhs_hora_inicio_venta AND rhs.rhs_hora_fin_atencion and rv.rve_eliminado != 0 AND rgg.per_codigo IS NULL)
GROUP BY rhs.rhs_uaa_codigo, rv.rts_codigo)
SELECT rhs.rts_codigo, rts.rts_nombre, rhs.rhs_uaa_codigo, rs.uaa_nombre, rhs.rhs_cantidad_ventas_permitidas,
ventas, rhs.rhs_cantidad_ventas_permitidas - v.ventas AS tiquetes_disponibles, rhs.rhs_hora_inicio_venta,
rhs.rhs_hora_fin_venta FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN VentaPorRestaurante v ON rhs.rhs_uaa_codigo = v.rhs_uaa_codigo AND rhs.rts_codigo = v.rts_codigo
INNER JOIN sibusco.restaurante_tipo_servicio rts on rhs.rts_codigo = rts.rts_codigo
INNER JOIN sibusco.restaurante_sede rs on rhs.rhs_uaa_codigo = rs.uaa_codigo
WHERE CONVERT(TIME, '09:00:00') BETWEEN rhs.rhs_hora_inicio_atencion AND rhs.rhs_hora_fin_atencion;


select count(*) from sibusco.restaurante_venta rv 
left join sibusco.restaurante_grupo_gabu rgg on rv.per_codigo = rgg.per_codigo 
where rv.rve_fecha = '2024-09-04' and rv.rts_codigo = 1 and rv.rve_eliminado != 0 AND rgg.per_codigo IS NULL

---------------------------------
SELECT * 
FROM sibusco.restaurante_venta rv 
LEFT JOIN sibusco.restaurante_grupo_gabu rgg 
    ON rv.per_codigo = rgg.per_codigo 
WHERE rv.rve_fecha = '2024-09-03' 
    AND rv.rts_codigo = 2
    AND rgg.per_codigo IS NULL;
---------------------------------


select puntaje_calificado from puntaje_calificado_estudiante_activo pcea where pcea.est_codigo = '20171155993' ;

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
where s.sed_codigo = 2 
order by e.est_codigo desc

select * from sede s
sed_codigo|sed_nombre      
----------+----------------
         1|NEIVA           
         2|LA PLATA        
         3|GARZON          
         4|PITALITO        

select * from modulo m


select * from 

select * from sibusco.restaurante_venta rv where rv.per_codigo = 128884

select * from sibusco.restaurante_contrato;
select * from sibusco.restaurante_pibote_adicion rpa;
select * from sibusco.restaurante_venta rv 

select * from sibusco.restaurante_contrato rc
inner join sibusco.restaurante_pibote_adicion rpa on rc.rco_codigo = rpa.rco_codigo_general 




select u.uaa_nombre, rts.rts_codigo, rts.rts_nombre, count(*) as cantidad, rc.rco_fecha_final 
from sibusco.restaurante_venta rv 
inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
inner join sibusco.restaurante_pibote_adicion rpa on rv.rco_codigo = rpa.rco_codigo_general 
inner join sibusco.restaurante_contrato rc on rpa.rco_codigo_adicion =  rc.rco_codigo 
inner join dbo.uaa u on rv.uaa_codigo = u.uaa_codigo 
where rv.per_codigo = 128884 and rv.rve_estado = 1 and rc.rco_estado = 1 and convert(Date, GETDATE()) between rc.rco_fecha_inicial  and rc.rco_fecha_final 
group by u.uaa_nombre,rts.rts_codigo, rts.rts_nombre, rc.rco_fecha_final


select * from sibusco.restaurante_sede rs 

select * from programa p 
select * from uaa u 

DECLARE @CodigoContrato INT;
DECLARE @CodigoSede INT;
SET @CodigoSede = (SELECT rv.uaa_codigo FROM sibusco.restaurante_venta rv 
	WHERE rv.per_codigo = 128884 AND rv.rve_estado = 1
	group by rv.uaa_codigo);
               
SET @CodigoContrato = (SELECT rco_codigo FROM sibusco.restaurante_contrato rc 
	INNER JOIN sibusco.restaurante_tipo_contrato rtc ON rtc.rtc_codigo  = rc.rtc_codigo 
	INNER JOIN dbo.uaa u ON u.uaa_codigo = rc.rco_uaa_codigo 
	WHERE rc.rco_uaa_codigo = @CodigoSede AND rc.rtc_codigo = 2 AND rc.rco_estado = 1 AND CONVERT(DATE, GETDATE()) BETWEEN rc.rco_fecha_inicial AND rc.rco_fecha_final);
 
IF @CodigoContrato > 1
BEGIN
    select u.uaa_nombre, rts.rts_codigo, rts.rts_nombre, count(*) as cantidad, rc.rco_fecha_final from sibusco.restaurante_venta rv 
	inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
	inner join sibusco.restaurante_pibote_adicion rpa on rv.rco_codigo = rpa.rco_codigo_general 
	inner join sibusco.restaurante_contrato rc on rpa.rco_codigo_adicion =  rc.rco_codigo 
	inner join dbo.uaa u on rv.uaa_codigo = u.uaa_codigo 
	where rv.per_codigo = 128884 and rv.rve_estado = 1 and rc.rco_estado = 1 and convert(Date, GETDATE()) between rc.rco_fecha_inicial  and rc.rco_fecha_final 
	group by u.uaa_nombre,rts.rts_codigo, rts.rts_nombre, rc.rco_fecha_final
END
ELSE
BEGIN
    select u.uaa_nombre, rts.rts_codigo, rts.rts_nombre, COUNT(*) as cantidad, rc.rco_fecha_final 
	from sibusco.restaurante_venta rv
	inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
	inner join sibusco.restaurante_contrato rc on rv.rco_codigo =  rc.rco_codigo 
	inner join dbo.uaa u on rv.uaa_codigo = u.uaa_codigo 
	where rv.per_codigo = 128884 and rv.rve_estado = 1 and rc.rco_estado = 1 and convert(Date, GETDATE()) between rc.rco_fecha_inicial  and rc.rco_fecha_final
	group by u.uaa_nombre,rts.rts_codigo, rts.rts_nombre, rc.rco_fecha_final 
END

select * from sibusco.restaurante_contrato rc where convert(Date, GETDATE()) BETWEEN rc.rco_fecha_inicial  AND rc.rco_fecha_final  

select u.uaa_nombre, rts.rts_codigo, rts.rts_nombre, COUNT(*) as cantidad, rc.rco_fecha_final 
from sibusco.restaurante_venta rv
inner join sibusco.restaurante_tipo_servicio rts on rv.rts_codigo = rts.rts_codigo 
inner join sibusco.restaurante_contrato rc on rv.rco_codigo =  rc.rco_codigo 
inner join dbo.uaa u on rv.uaa_codigo = u.uaa_codigo 
where rv.per_codigo = 128884 and rv.rve_estado = 1 and rc.rco_estado = 1 and convert(Date, GETDATE()) between rc.rco_fecha_inicial  and rc.rco_fecha_final
group by u.uaa_nombre,rts.rts_codigo, rts.rts_nombre, rc.rco_fecha_final 

select * from estudiante e where e.est_codigo = '20191176712'

SELECT * FROM sibusco.restaurante_contrato rc 

select * from usuario_res 

FORMAT(GETDATE(), 'HH:mm:ss')


select * from sibusco.restaurante_horario_servicio rhs 
where CONVERT(TIME, GETDATE()) between rhs.rhs_hora_inicio_atencion and rhs.rhs_hora_fin_atencion and convert(Date, GETDATE()) = rhs.rhs_fecha_estado 


select rc.rts_codigo, count(rc.rcn_codigo) as consumo from sibusco.restaurante_consumo rc 
group by rc.rts_codigo




select rc.rts_codigo, rhs.rhs_uaa_codigo, count(rc.rcn_codigo) as consumo, rhs.rhs_cantidad_comidas - consumo AS raciones_disponibles from sibusco.restaurante_horario_servicio rhs 
inner join sibusco.restaurante_consumo rc on rhs.rhs_uaa_codigo = rc.uaa_codigo 
where CONVERT(TIME, GETDATE()) between rhs.rhs_hora_inicio_atencion and rhs.rhs_hora_fin_atencion 
group by rc.rts_codigo, rhs.rhs_uaa_codigo 
--and convert(Date, GETDATE()) = rhs.rhs_fecha_estado 


select rc.rts_codigo, count(rc.rcn_codigo) as consumo from sibusco.restaurante_consumo rc 
group by rc.rts_codigo


select * from sibusco.restaurante_tipo_servicio rts 

select * from sibusco.restaurante_sede rs 

select * from sibusco.restaurante_consumo rc 

select * from estudiante e 
inner join programa p on e.pro_codigo = p.pro_codigo 
where p.sed_codigo = 3

select

select * from sibusco.restaurante_venta rv 

select * from sibusco.restaurante_horario_servicio rhs 

WITH ConsumoPorRestaurante AS (
    SELECT rhs.rhs_uaa_codigo, rc.rts_codigo, COUNT(rc.rcn_codigo) AS consumo FROM sibusco.restaurante_horario_servicio rhs
    INNER JOIN sibusco.restaurante_consumo rc ON rhs.rhs_uaa_codigo = rc.uaa_codigo and rc.rcn_fecha = CONVERT(DATE, GETDATE())
    WHERE rhs.rhs_uaa_codigo = 645 AND (CONVERT(TIME, GETDATE()) BETWEEN rhs.rhs_hora_inicio_atencion AND rhs.rhs_hora_fin_atencion)
    GROUP BY rhs.rhs_uaa_codigo, rc.rts_codigo)
SELECT rhs.rts_codigo, rts.rts_nombre, rhs.rhs_uaa_codigo, rs.uaa_nombre, rhs.rhs_cantidad_comidas,
    consumo, rhs.rhs_cantidad_comidas - c.consumo AS raciones_disponibles, rhs.rhs_hora_inicio_atencion,
    rhs.rhs_hora_fin_atencion FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN ConsumoPorRestaurante c ON rhs.rhs_uaa_codigo = c.rhs_uaa_codigo AND rhs.rts_codigo = c.rts_codigo
INNER JOIN sibusco.restaurante_tipo_servicio rts on rhs.rts_codigo = rts.rts_codigo 
INNER JOIN sibusco.restaurante_sede rs on rhs.rhs_uaa_codigo = rs.uaa_codigo
WHERE CONVERT(TIME, GETDATE()) BETWEEN rhs.rhs_hora_inicio_atencion AND rhs.rhs_hora_fin_atencion;

WITH VentaPorRestaurante AS (
    SELECT rhs.rhs_uaa_codigo, rv.rts_codigo, COUNT(rv.rve_codigo) AS ventas FROM sibusco.restaurante_horario_servicio rhs
    INNER JOIN sibusco.restaurante_venta rv ON rhs.rhs_uaa_codigo = rv.uaa_codigo and rv.rve_fecha = CONVERT(DATE, GETDATE())
    WHERE rhs.rhs_uaa_codigo = 646 AND (CONVERT(TIME, GETDATE()) BETWEEN rhs.rhs_hora_inicio_venta AND rhs.rhs_hora_fin_atencion)
    GROUP BY rhs.rhs_uaa_codigo, rv.rts_codigo)
SELECT rhs.rts_codigo, rts.rts_nombre, rhs.rhs_uaa_codigo, rs.uaa_nombre, rhs.rhs_cantidad_ventas_permitidas,
    ventas, rhs.rhs_cantidad_ventas_permitidas - v.ventas AS tiquetes_disponibles, rhs.rhs_hora_inicio_atencion,
    rhs.rhs_hora_fin_atencion FROM sibusco.restaurante_horario_servicio rhs
INNER JOIN VentaPorRestaurante v ON rhs.rhs_uaa_codigo = v.rhs_uaa_codigo AND rhs.rts_codigo = v.rts_codigo
INNER JOIN sibusco.restaurante_tipo_servicio rts on rhs.rts_codigo = rts.rts_codigo 
INNER JOIN sibusco.restaurante_sede rs on rhs.rhs_uaa_codigo = rs.uaa_codigo
WHERE CONVERT(TIME, GETDATE()) BETWEEN rhs.rhs_hora_inicio_atencion AND rhs.rhs_hora_fin_atencion;


select * from sibusco.aud_restaurante_horario_servicio arhs 

select * from sibusco.restaurante_sede rs

