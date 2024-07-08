-- =============================================
-- Author:		 John Guerrero
-- Create date:  21 jun 2024
-- Description:	
-- Proceso almacenado para validar que el graduado no esté
-- activo y no generar interferencia con registro y control
-- o la oficina de liquidaciones
-- =============================================
CREATE PROCEDURE [graduado].[ActualizarPersonaDatosResidenciaGraduado] -- Añadir los parámetros para el procedimiento almacenado aquí
@CodPersona INT,
@Per_Pais_Residencia INT,
@Per_Departamento_Residencia INT,
@Per_Lugar_Residencia INT,
@Per_Direccion_Residencia varchar(255),
@Per_Barrio varchar(50) AS BEGIN -- Establecer NOCOUNT ON para evitar que los conjuntos de resultados adicionales interfieran con las sentencias SELECT.
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
	per_pais_residencia = @Per_Pais_Residencia,
	per_departamento_residencia = @Per_Departamento_Residencia,
	per_lugar_residencia = @Per_Lugar_Residencia,
	per_direccion_residencia = @Per_Direccion_Residencia,
	per_barrio = @Per_Barrio
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
