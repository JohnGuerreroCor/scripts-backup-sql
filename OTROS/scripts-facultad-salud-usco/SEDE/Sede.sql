----------------------------
------TABLA SEDE TIPO-------
----------------------------

CREATE TABLE sede_tipo (
    set_codigo INT IDENTITY(1,1) PRIMARY KEY,
    set_nombre NVARCHAR(50) NOT NULL,
    set_estado INT DEFAULT 1 NOT NULL
);


--INSERT INTO sede_tipo
(set_nombre)
VALUES('TIPO UNO');

select * from general.sede_tipo st where st.set_estado = 1

----------------------------
--------TABLA SEDE----------
----------------------------

CREATE TABLE sede (
    sed_codigo INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ins_nit NVARCHAR(50) NOT NULL,
    sed_nombre NVARCHAR(100) NOT NULL,
    ccp_divipola CHAR(8) NOT NULL,
    sed_direccion NVARCHAR(100) NOT NULL,
    sed_telefono NVARCHAR(100) NOT NULL,
    set_tipo INT NOT NULL,
    sed_fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    sed_estado INT DEFAULT 1 NOT NULL,
    CONSTRAINT sede_FK_cabeceras_centros_poblados FOREIGN KEY (ccp_divipola) REFERENCES cabeceras_centros_poblados(ccp_divipola),
    CONSTRAINT sede_FK_sede_tipo FOREIGN KEY (set_tipo) REFERENCES sede_tipo(set_codigo)
);


select * from general.sede s 
inner join general.cabeceras_centros_poblados ccp on s.ccp_divipola = ccp.ccp_divipola  
inner join general.municipio m on ccp.mun_divipola = m.mun_divipola 
inner join general.departamento d on m.dep_divipola = d.dep_divipola 
inner join general.pais p on d.pai_codigo = p.pai_codigo
inner join general.sede_tipo st on s.set_tipo = st.set_codigo 
where s.sed_estado = 1

INSERT INTO general.sede
(ins_nit, sed_nombre, ccp_divipola, sed_direccion, sed_telefono, set_tipo, sed_fecha_creacion, sed_estado)
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE general.sede
SET ins_nit='777-555', sed_nombre='SEDE LAS BRISAS', ccp_divipola='41001000', sed_direccion='CALE 7 # 45-5', sed_telefono='789 5555', set_tipo=1, sed_fecha_creacion='2023-08-18 08:13:40.041', sed_estado=1
WHERE sed_codigo=1;


