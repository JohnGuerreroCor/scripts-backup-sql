SELECT * FROM cap.acta_solicitud_puntaje csp 
INNER JOIN cap.estado_acta ec ON csp.esa_codigo = ec.esa_codigo where csp.acsp_estado = 1 order by csp.acsp_fecha_fin desc