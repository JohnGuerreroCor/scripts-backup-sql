select * from pais p 

select * from pais p where p.pai_codigo = 43

select * from persona p 


CREATE TABLE dbo.token_estado (
	toe_codigo int IDENTITY(1,1) NOT NULL,
	toe_nombre varchar(80) NOT NULL,
	toe_descripcion varchar(150) NULL,
	CONSTRAINT token_estado_PK PRIMARY KEY (toe_codigo)
);

INSERT INTO dbo.token_estado (toe_nombre, toe_descripcion) VALUES('ESTADO_PENDIENTE_LOGIN', 'Cuando se ha generado el codigo de verificación y está a la espera de ser usado para inicio sesión');
INSERT INTO dbo.token_estado (toe_nombre, toe_descripcion) VALUES('ESTADO_LOGIN_VERIFICADO', 'Cuando el usuario ya introdujo el código de verificación correctamente');
INSERT INTO dbo.token_estado (toe_nombre, toe_descripcion) VALUES('ESTADO_INACTIVO', 'Cuando el código de verificación ya fue usado o se superó el máximo de intentos');

CREATE TABLE dbo.token (
	tok_codigo int IDENTITY(1,1) NOT NULL,
	id varchar(20) NOT NULL,
	tok_token varchar(100) NOT NULL,
	tok_intento int NULL,
	toe_codigo int NULL,
	tok_ip varchar(100) NULL,
	tok_fecha_generacion datetime DEFAULT getdate() NOT NULL,
	tok_fecha_expiracion datetime NULL,
	tok_fecha_fin_sesion datetime NULL,
	CONSTRAINT token_PK PRIMARY KEY (tok_codigo),
	CONSTRAINT token_FK_token_estado FOREIGN KEY (toe_codigo) REFERENCES dbo.token_estado(toe_codigo)
);

select * from dbo.token



