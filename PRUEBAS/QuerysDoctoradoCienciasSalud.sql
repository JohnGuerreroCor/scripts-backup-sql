-- QUERYS DOCTORADO EN CIENCIAS DE LA SALUD --

--pro_codigo = 456
--uaa_codigo = 676
--uaa_codigo_unificaco = 956
--uat_codigo = 3
--uaa_dependencia = 23
--snies = 105543
--uaa_codigo = 701 uat_codigo =	2	DPTO O PROGRAMA DE DOCTORADO EN CIENCIAS DE LA SALUD

select * from programa p 
inner join uaa u on p.uaa_codigo = u.uaa_codigo 
where p.pro_codigo = 456


select * from estudiante e 
inner join persona p on e.per_codigo = p.per_codigo 
where e.pro_codigo = 456

select * from proyectos.ps_grupo pg where pg.uaa_codigo = 956

select * from uaa u where u.uaa_nombre like '%DOCTORADO%'

select * from uaa_personal up 
inner join persona p ON up.per_codigo = p.per_codigo 
where up.uaa_codigo = 701


select * from persona p where p.per_email_interno = 'karen.penagos@usco.edu.co'