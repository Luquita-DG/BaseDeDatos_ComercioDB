/*
	 Crear un SP para insertar un nuevo proveedor
		sp_InsertarProveedor
		 Recibe: nombre, email, ciudad, teléfono, etc.
		 (No debe insertar CUIT duplicado)
*/

CREATE PROCEDURE sp_InsertarProveedor
-- Parametros de ENTRADA
@Nombre NVARCHAR(50),
@Email  NVARCHAR(50),
@Telefono INT,
@CUIT BIGINT,
@Calle NVARCHAR(50),
@Numero INT,
@Ciudad NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        
        -- Validar CUIT duplicado
        IF EXISTS (SELECT 1 FROM Proveedor WHERE Cuit = @CUIT)
        BEGIN
            PRINT 'Error: El CUIT ingresado ya existe en la base de datos.';
            RETURN -1; -- Código de error por CUIT duplicado
        END

        -- Insertar proveedor
        INSERT INTO Proveedor (NombreProveedor, EmailProveedor, Cuit, TelefonoProveedor, Calle, Numero, Ciudad)
        VALUES (@Nombre, @Email, @CUIT, @Telefono, @Calle, @Numero, @Ciudad);

        -- Obtener el ID generado (IDENTITY)
        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        PRINT 'Proveedor insertado correctamente. ID generado: ' + CAST(@NuevoID AS NVARCHAR);
        RETURN @NuevoID; -- Devolver el ID del nuevo proveedor

    END TRY
    BEGIN CATCH
        PRINT 'Error inesperado: ' + ERROR_MESSAGE();
        RETURN -99; -- Código de error genérico
    END CATCH
END;
GO



DECLARE @Resultado INT;

EXEC @Resultado = sp_InsertarProveedor
    @Nombre = 'Proveedor Marolio',
    @Email = 'info@marolio.com',
    @Telefono = 11223344,
    @CUIT = 20333444559,
    @Calle = 'Mitre',
    @Numero = 1234,
    @Ciudad = 'Buenos Aires';

SELECT Resultado = @Resultado;






