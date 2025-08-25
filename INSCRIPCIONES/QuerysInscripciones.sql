--Query Pines Generados  236
select * from liquidacion
where lit_codigo = 14 and cal_codigo in (231)

select count(*) from liquidacion
where lit_codigo = 14 and cal_codigo in (231) and liq_total = 130000.0000

--Query Pines Pagados  68
select * from liquidacion 
inner join factura on factura.liq_codigo = liquidacion.liq_codigo 
inner join recaudo on recaudo.fac_codigo = factura.fac_codigo 
where lit_codigo = 14 and cal_codigo in (231) and liq_total = 130000.0000

--INSCRIPCIONES VALIDADAS 57
SELECT *
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20241' and i.pro_codigo = 588

select * from programa p 

select * from recaudo r 
----------------------------------------------------------------------
----------------------------------------------------------------------
---------------------QUERYS INSCRIPCIONES-----------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------

SELECT * FROM calendario

SELECT * from liquidacion

select * from liquidacion_tipo lt 

SELECT * FROM calendario c 

--Query Pines Generados  5689
select count(*) from liquidacion
where lit_codigo = 14 and cal_codigo = 236

select * from liquidacion
inner join factura on factura.liq_codigo = liquidacion.liq_codigo 
inner join recaudo on recaudo.fac_codigo = factura.fac_codigo
where lit_codigo = 14 and cal_codigo = 236 and ter_codigo = 201281 

select * from tercero where ter_identificacion = '1104547198'
201281	2	1104547198	SARA  LUCIA GOMEZ  ROJAS
select * from calendario 

select count(*) from liquidacion
where lit_codigo = 14 and cal_codigo in (229) and convert(Date, liq_fecha) BETWEEN '2023-11-08' AND '2023-11-08'

--Query Pines Pagados  107
select count(*) from liquidacion 
inner join factura on factura.liq_codigo = liquidacion.liq_codigo 
inner join recaudo on recaudo.fac_codigo = factura.fac_codigo 
where lit_codigo = 14 and cal_codigo in (229)

select count(*) from liquidacion 
inner join factura on factura.liq_codigo = liquidacion.liq_codigo 
inner join recaudo on recaudo.fac_codigo = factura.fac_codigo 
where lit_codigo = 14 and cal_codigo in (229) and convert(Date, liq_fecha) BETWEEN '2023-11-08' AND '2023-11-08'


SELECT * FROM calendario c -- 219   216  213   208




--INSCRIPCIONES VALIDADAS PREGRADO
SELECT *
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20251' and c.cal_nombre like '%20241A%'


--REFERENCIAS REPETIDAS
SELECT COUNT(*) as Veces, i.ins_referencia 
FROM I_inscritos i 
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20241' and c.cal_nombre like '%20241A%'
GROUP BY i.ins_referencia


--INSCRIPCIONES VALIDADAS PREGRADO N#  36
SELECT count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20241' and c.cal_nombre like '%20241A%'


--TOTAL INSCRITOS 
SELECT count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20241' and c.cal_nombre like '%20241A%'

--INSCRIPCIONES VALIDADAS PREGRADO ETAPA 1  3054
SELECT *
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20251' and c.cal_nombre like '%20241A%' and i.ins_modulo1 is not null


--INSCRIPCIONES VALIDADAS PREGRADO ETAPA 2 3046
SELECT count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20241' and c.cal_nombre like '%20241A%' and i.ins_modulo2 is not null


--INSCRIPCIONES VALIDADAS PREGRADO ETAPA 3 3045
SELECT count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20241' and c.cal_nombre like '%20241A%' and i.ins_modulo3 is not null


--INSCRIPCIONES ANULADAS PREGRADO 50
SELECT count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE i.ies_codigo not in (5,12) AND p.per_nombre = '20231'


--INSCRIPCIONES INCOMPLETAS PREGRADO
SELECT * FROM inscripcion i2 
SELECT count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE i.ies_codigo in (12) AND p.per_nombre = '20222'


--INSCRIPCIONES VALIDAD POR MODALIDAD DE INGRESO PREGRADO
SELECT m.moi_nombre, count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
INNER JOIN modalidad_ingreso m ON i.moi_codigo = m.moi_codigo
WHERE i.ies_codigo = 5 AND p.per_nombre = '20221' and c.cal_nombre like '%20221A%'
GROUP by m.moi_nombre


--ADMITIDOS POR MODALIDAD DE INGRESO
SELECT m.moi_nombre, count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
INNER JOIN modalidad_ingreso m ON i.moi_codigo = m.moi_codigo
WHERE i.ies_codigo = 5 AND p.per_nombre = '20221' AND i.adt_admitido = 'Si'
GROUP by m.moi_nombre


--INSCRITOS POR PROGRAMA
SELECT u.uaa_nombre_corto, count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
INNER JOIN programa pr ON i.pro_codigo = pr.pro_codigo
INNER JOIN uaa u ON pr.uaa_codigo = u.uaa_codigo
WHERE p.per_nombre = '20221'
GROUP by u.uaa_nombre_corto


--ADMITIDOS POR PROGRAMA
EXECUTE vinculacion_actual '1075278686', 0
SELECT u.uaa_nombre_corto, count(*)
FROM I_inscritos i
INNER JOIN calendario c ON i.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
INNER JOIN programa pr ON i.pro_codigo = pr.pro_codigo
INNER JOIN uaa u ON pr.uaa_codigo = u.uaa_codigo
WHERE p.per_nombre = '20221' AND i.adt_admitido = 'Si'
GROUP by u.uaa_nombre_corto


--PROGRMAS OFERTADOS POR PERIDO
SELECT count(*) FROM oferta o
INNER JOIN calendario c ON o.cal_codigo = c.cal_codigo
INNER JOIN periodo p ON c.per_codigo = p.per_codigo
WHERE p.per_nombre = '20221'


--CONSULTORIO JURIDICO CANTIDAD DE SOLICITUDES REGISTRADAS POR A�O
SELECT count(*) 
FROM conjuridico.solicitud_consultorio
WHERE year(sol_fecha) = '2021'


select  p.ter_nombre as nombreT,p.ter_telefono_movil,p.ter_email 
 from liquidacion l   with (NOLOCK)
  join tercero p  with (NOLOCK) on l.ter_codigo =p.ter_codigo 
 join factura f  with (NOLOCK) on l.liq_codigo =f.liq_codigo 
 where (lit_codigo =14 and cal_codigo =219) and f.fac_total_abonos =166667.0000 and f.fac_codigo  not in (select ins_referencia 
 from inscripcion where ins_referencia is not null
 );
 
  select  p.per_nombre,p.per_telefono_movil,p.per_email 
 from liquidacion l   with (NOLOCK)
  join persona p  with (NOLOCK) on l.per_codigo =p.per_codigo 
 join factura f  with (NOLOCK) on l.liq_codigo =f.liq_codigo 
 where (lit_codigo =14 and cal_codigo =219) and f.fac_total_abonos =166667.0000 and f.fac_codigo  not in (select ins_referencia 
 from inscripcion where ins_referencia is not null
 );


select * from vinculacion_historico vh 

select * from uaa_personal up 