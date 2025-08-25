select * from programa p where p.pro_codigo = 418

DECLARE @matriculados TABLE (per_nombre nvarchar(100),est_codigo nvarchar(100)) insert into @matriculados (per_nombre, est_codigo) 
SELECT pe.per_nombre, est.est_codigo FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo   
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo   
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
WHERE pro.pro_codigo IN(SELECT * FROM dbo.Split(418,','))  AND (mat.mat_estado != 'I')  
AND pro.pro_codigo IN(SELECT * FROM dbo.Split(418,','))  AND (mat.mat_estado != 'I')  
AND (mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%' 
OR SUBSTRING(est.est_codigo, 1, 5) in (SELECT pe.per_nombre FROM periodo WHERE pe.per_nombre BETWEEN '19701' AND '20241')) 
GROUP by pe.per_nombre, est.est_codigo
ORDER BY pe.per_nombre asc;


SELECT per_nombre, COUNT(est_codigo) AS cantidad_estudiantes
FROM @matriculados
GROUP BY per_nombre;

DECLARE @graduados TABLE (per_nombre nvarchar(100),gra_codigo nvarchar(100)) insert into @graduados (per_nombre, gra_codigo) 
select pe.per_nombre, g.est_codigo from graduado g 
inner join estudiante e on g.est_codigo = e.est_codigo 
inner join programa p on e.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
join periodo pe on g.gra_fecha >= pe.per_fecha_inicio and g.gra_fecha <= pe.per_fecha_fin
where p.pro_codigo = 418 
ORDER BY pe.per_nombre desc;

SELECT per_nombre, COUNT(gra_codigo) AS cantidad_graduados
FROM @graduados
GROUP BY per_nombre;



DECLARE @matriculados TABLE (per_nombre nvarchar(100),est_codigo nvarchar(100)) insert into @matriculados (per_nombre, est_codigo) 
SELECT pe.per_nombre, est.est_codigo FROM matricula mat WITH (NOLOCK) 
INNER JOIN estudiante est WITH (NOLOCK) ON mat.est_codigo = est.est_codigo   
INNER JOIN calendario cal WITH (NOLOCK) ON mat.cal_codigo = cal.cal_codigo   
INNER JOIN periodo pe WITH (NOLOCK) ON cal.per_codigo = pe.per_codigo   
INNER JOIN programa pro WITH (NOLOCK) ON est.pro_codigo = pro.pro_codigo   
INNER JOIN persona per WITH (NOLOCK) ON est.per_codigo = per.per_codigo  
WHERE pro.pro_codigo IN(SELECT * FROM dbo.Split(418,','))  AND (mat.mat_estado != 'I')  
AND pro.pro_codigo IN(SELECT * FROM dbo.Split(418,','))  AND (mat.mat_estado != 'I')  
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
where p.pro_codigo = 418 
ORDER BY pe.per_nombre desc;

SELECT g.per_nombre AS periodo_graduacion, COUNT(g.gra_codigo) AS cantidad_graduados
FROM @graduados g
JOIN @matriculados p ON g.gra_codigo = p.est_codigo
WHERE p.per_nombre = 20161
GROUP BY g.per_nombre
ORDER BY g.per_nombre;



select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo

select top 1 u.uaa_nombre_corto, nat.nat_nombre, na.nia_nombre, p.pro_fecha_creacion, paa.paa_semestre, paa.pla_codigo from plan_academico_asignatura paa 
inner join plan_academico pa on paa.pla_codigo = pa.pla_codigo 
inner join programa p on pa.pro_codigo = p.pro_codigo 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
inner join nivel_academico na on p.nia_codigo = na.nia_codigo 
inner join nivel_academico_tipo nat on na.nat_codigo = nat.nat_codigo 
where p.pro_codigo = 418
group by u.uaa_nombre_corto, nat.nat_nombre, p.pro_fecha_creacion, paa.paa_semestre, paa.pla_codigo 
order by paa.paa_semestre desc 

select * from periodo p 

--SELECT per_nombre, COUNT(est_codigo) AS cantidad_estudiantes
--FROM @matriculados
--GROUP BY per_nombre;
