select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.uaa_codigo_unificado = 807 and p.pro_estado = 1
--533
select * from programa_estado pe 
select * from uaa

--*****************************************************************************--
----------------------TASA DE GRADUACIÓN POR PROGRAMA----------------------------
--*****************************************************************************--

DECLARE @matriculados TABLE (per_nombre nvarchar(100),est_codigo nvarchar(100)) insert into @matriculados (per_nombre, est_codigo) 
SELECT pe.per_nombre, est.est_codigo FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo   
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo   
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
WHERE pro.pro_codigo IN(SELECT * FROM dbo.Split(533,','))  AND (mat.mat_estado != 'I')  
AND pro.pro_codigo IN(SELECT * FROM dbo.Split(533,','))  AND (mat.mat_estado != 'I')  
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%' 
OR SUBSTRING(est.est_codigo, 1, 5) in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN '19701' AND '20241')) 
GROUP by pe.per_nombre, est.est_codigo
ORDER BY pe.per_nombre asc;


DECLARE @graduados TABLE (per_nombre nvarchar(100),gra_codigo nvarchar(100)) insert into @graduados (per_nombre, gra_codigo) 
select pe.per_nombre, g.est_codigo from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
join periodo pe on g.gra_fecha >= pe.per_fecha_inicio and g.gra_fecha <= pe.per_fecha_fin
where p.pro_codigo = 533 
ORDER BY pe.per_nombre desc;

SELECT g.per_nombre AS periodo_graduacion, COUNT(g.gra_codigo) AS cantidad_graduados
FROM @graduados g
JOIN @matriculados p ON g.gra_codigo = p.est_codigo
WHERE p.per_nombre = 20212
GROUP BY g.per_nombre
ORDER BY g.per_nombre;

--*****************************************************************************--
----------------------TASA DE GRADUACIÓN POR FACULTAD----------------------------
--*****************************************************************************--

select p.pro_codigo, nat.nat_nombre, s.sed_nombre, u.uaa_nombre from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join sede s on p.sed_codigo = s.sed_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
where p.con_codigo = 2 and p.pro_estado = 1 and nat.nat_codigo = 1 and u.uaa_dependencia = 21

select * from programa p where p.pro_codigo = 418
select * from nivel_academico_tipo nat 
select * from uaa u 


--FACULTAD ECONOMIA Y ADMINISTRACION:19   --> 17,18,27,379,383,384,385,386,389,390,391,393,406,409,410,418,428,442,452
--FACULTAD DE EDUCACION:20
--FACULTAD DE INGENIERIA:21
--FACULTAD CIENCIAS EXACTAS Y NATURALES:22
--FACULTAD DE SALUD:23
--FACULTAD CIENCIAS SOCIALES Y HUMANAS:24
--FACULTAD DE CIENCIAS JURIDICAS Y POLITICAS:25

DECLARE @matriculados TABLE (per_nombre nvarchar(100),est_codigo nvarchar(100)) insert into @matriculados (per_nombre, est_codigo) 
SELECT pe.per_nombre, est.est_codigo FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo   
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo   
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
WHERE pro.pro_codigo IN(229,427,533) AND (mat.mat_estado != 'I')  
AND pro.pro_codigo IN(229,427,533) AND (mat.mat_estado != 'I')  
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%' AND est.est_alterno = 0
OR SUBSTRING(est.est_codigo, 1, 5) in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN '19701' AND '20241')) 
GROUP by pe.per_nombre, est.est_codigo
ORDER BY pe.per_nombre asc;

DECLARE @graduados TABLE (per_nombre nvarchar(100),gra_codigo nvarchar(100)) insert into @graduados (per_nombre, gra_codigo) 
select pe.per_nombre, g.est_codigo from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
join periodo pe on g.gra_fecha >= pe.per_fecha_inicio and g.gra_fecha <= pe.per_fecha_fin
where p.pro_codigo IN(229,427,533)
ORDER BY pe.per_nombre desc;

SELECT g.per_nombre AS periodo_graduacion, COUNT(g.gra_codigo) AS cantidad_graduados
FROM @graduados g
JOIN @matriculados p ON g.gra_codigo = p.est_codigo
WHERE p.per_nombre = '20092'
GROUP BY g.per_nombre
ORDER BY g.per_nombre;


LICENCIATURA EN LENGUAS MODERNAS
LICENCIATURA  EN EDUCACION BASICA CON ENFASIS EN HUMANIDADES, LENGUA EXTRANJERA-INGLES
LICENCIATURA EN LENGUA EXTRANJERA
LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN HUMANIDADES, LENGUA EXTRANJERA-INGLES
LICENCIATURA EN INGLES
LICENCIATURA EN LENGUAS EXTRANJERAS CON ÉNFASIS EN INGLÉS