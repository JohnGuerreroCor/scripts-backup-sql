-- =============================================
-- Author:		 John Guerrero
-- Create date:  25 jun 2024
-- Description:	
-- Proceso almacenado para validar que el graduado no esté
-- como estudiante activo y no generar interferencia con registro y control
-- con respecto a los datos contacto (correo personal y telefonos)
-- =============================================
CREATE PROCEDURE [graduado].[ActualizarPersonaDatosContactoGraduado] -- Añadir los parámetros para el procedimiento almacenado aquí
@CodPersona INT,
@Per_Telefono_Movil varchar(50),
@Per_Telefono_Fijo varchar(30),
@Per_Email varchar(100),
@Per_Pagina_Personal varchar(100) AS BEGIN -- Establecer NOCOUNT ON para evitar que los conjuntos de resultados adicionales interfieran con las sentencias SELECT.
SET
	NOCOUNT ON;

-- Variable para almacenar el recuento de estudiantes activos
DECLARE @CountActiveStudent INT;

-- Comprueba si hay algún estudiante activo con el CodPersona dado a través de la matrícula
SELECT
	@CountActiveStudent = COUNT(*)
FROM
	dbo.matricula m
	INNER JOIN dbo.estudiante e on m.est_codigo = e.est_codigo
	INNER JOIN dbo.persona pe on e.per_codigo = pe.per_codigo
	INNER JOIN dbo.calendario c ON c.cal_codigo = m.cal_codigo
	INNER JOIN dbo.periodo p ON p.per_codigo = c.per_codigo
WHERE
	pe.per_codigo = @CodPersona
	AND convert(Date, GETDATE()) BETWEEN p.per_fecha_inicio
	AND p.per_fecha_fin;

-- Si no se encuentran graduados activos, realizar la actualización
IF @CountActiveStudent = 0 BEGIN TRY
UPDATE
	persona
SET
	per_telefono_movil = @Per_Telefono_Movil,
	per_telefono_fijo = @Per_Telefono_Fijo,
	per_email = @Per_Email,
	per_pagina_personal = @Per_Pagina_Personal
WHERE
	per_codigo = @CodPersona RETURN 1;

END TRY BEGIN CATCH -- Registrar el error
DECLARE @ErrorMessage NVARCHAR(4000),
@ErrorSeverity INT,
@ErrorState INT;

SELECT
	@ErrorMessage = ERROR_MESSAGE(),
	@ErrorSeverity = ERROR_SEVERITY(),
	@ErrorState = ERROR_STATE();

RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

-- Retornar un código de error
RETURN -1;

END CATCH
END