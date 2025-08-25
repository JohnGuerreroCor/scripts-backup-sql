select u.per_codigo, p.per_nombre, p.per_apellido, p.per_email_interno, p.per_email, p.per_telefono_movil, p.per_fecha_nacimiento, u.uap_fecha_fin from uaa_personal u 
inner join persona p on u.per_codigo = p.per_codigo where u.uaa_codigo = 463 and u.uap_fecha_fin is null GROUP BY u.per_codigo, p.per_nombre, p.per_apellido, p.per_email_interno, p.per_email, p.per_telefono_movil, p.per_fecha_nacimiento, u.uap_fecha_fin; 

select * from uaa_personal u;
select * from persona p;

WITH UltimosRegistros AS (
  SELECT 
    u.*,
    ROW_NUMBER() OVER (
      PARTITION BY u.per_codigo 
      ORDER BY 
        CASE 
          WHEN u.uap_fecha_fin IS NULL THEN 1 
          ELSE 0 
        END,
        u.uap_fecha_fin DESC
    ) AS rn
  FROM uaa_personal u
  WHERE u.uaa_codigo = 463
)
SELECT 
  u.per_codigo,
  p.per_nombre,
  p.per_apellido,
  p.per_email_interno,
  p.per_email,
  p.per_telefono_movil,
  p.per_fecha_nacimiento,
  u.uap_fecha_fin
FROM UltimosRegistros u
INNER JOIN persona p ON u.per_codigo = p.per_codigo
WHERE u.rn = 1;


select * from aud_persona ap where ap.per_codigo = 121026