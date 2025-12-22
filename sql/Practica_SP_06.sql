/* 
    Crear un SP para actualizar el precio de un producto 
        sp_ActualizarPrecioProducto @CodProducto, @NuevoPrecio *
*/

CREATE PROCEDURE sp_ActualizarPrecioProducto
    @CodProducto INT,
    @NuevoPrecio DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validar que el producto exista
        IF NOT EXISTS (SELECT 1 FROM Producto WHERE CodProducto = @CodProducto)
        BEGIN
            PRINT 'Error: El producto ingresado no existe.';
            RETURN -1; -- Producto inexistente
        END

        -- Actualizar el precio
        UPDATE Producto
        SET PrecioVenta = @NuevoPrecio
        WHERE CodProducto = @CodProducto;

        PRINT 'Nuevo precio actualizado correctamente.';
        SELECT CodProducto = @CodProducto, NuevoPrecio = @NuevoPrecio; -- Devuelve datos útiles
        RETURN 0; -- Éxito
    END TRY

    BEGIN CATCH
        PRINT 'Error inesperado: ' + ERROR_MESSAGE();
        RETURN -99; -- Código genérico de error
    END CATCH
END;
GO

-- Ejecución
DECLARE @Resultado INT;

EXEC @Resultado = sp_ActualizarPrecioProducto
    @CodProducto = 4,
    @NuevoPrecio = 2500.00;

SELECT Resultado = @Resultado;
