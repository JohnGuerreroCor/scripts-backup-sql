----------------------------
-------TABLA FACULTAD-------
----------------------------

CREATE TABLE facultad (
    fac_codigo INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sed_codigo INT NOT NULL,
    fac_nombre NVARCHAR(100) NOT NULL,
    fac_decano NVARCHAR(100) NOT NULL, 
    fac_correo NVARCHAR(50) NOT NULL,
    fac_telefono NVARCHAR(50) NOT NULL,
    fac_fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    fac_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT facultad_FK_sede FOREIGN KEY (sed_codigo) REFERENCES sede(sed_codigo)
);


select * from general.facultad f 
inner join general.sede s on f.sed_codigo = s.sed_codigo
inner join general.cabeceras_centros_poblados ccp on s.ccp_divipola = ccp.ccp_divipola  
inner join general.municipio m on ccp.mun_divipola = m.mun_divipola 
inner join general.departamento d on m.dep_divipola = d.dep_divipola 
inner join general.pais p on d.pai_codigo = p.pai_codigo
inner join general.sede_tipo st on s.set_tipo = st.set_codigo 
where f.fac_estado = 1
order by f.fac_codigo desc

INSERT INTO general.facultad
(sed_codigo, fac_nombre, fac_decano, fac_correo, fac_telefono, fac_fecha_creacion, fac_estado)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL);


UPDATE general.facultad
SET sed_codigo=NULL, fac_nombre=NULL, fac_decano=NULL, fac_correo=NULL, fac_telefono=NULL, fac_fecha_creacion=NULL, fac_estado=NULL
WHERE fac_codigo IS NULL;

select * from general.facultad