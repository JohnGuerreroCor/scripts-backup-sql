select * from modulo m order by m.mod_codigo desc
select * from dbo.usuario_estudiante_login uel 

select top 1 * from dbo.usuario_estudiante_login uel 
inner join uaa u on uel.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on uel.up = p.per_codigo 
where  uel.us = 'u20171157616' order by uel.istipo asc

select COUNT(uel.us) from dbo.usuario_estudiante_login uel 
inner join uaa u on uel.usg_uaa = u.uaa_codigo 
inner join sede s on s.sed_codigo = u.sed_codigo 
inner join persona p on uel.up = p.per_codigo 
where uel.us = 'u20171157616'

select * from usuario_graduado_admin_login ugal 
INSERT INTO academia3000_john.dbo.modulo (mod_nombre, mod_descripcion, mod_fecha, mod_orden) VALUES(N'Control Acceso', N'Módulo que gestiona el registro de ingreso y salida de los diferentes peustos de acceso la institución', '2023-07-12 16:12:54.710', 1);

select * from convenio c 

select * from r_convenios rc 

select * from 