/* 
	Crear un SP para actualizar el stock de un producto sumándole una cantidad 
		sp_ActualizarStock @CodProducto, 
		@Cantidad (que el stock actual = stock + cantidad) 
*/

CREATE PROCEDURE sp_ActualizarStock
    @CodProducto INT,
    @Cantidad INT
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

        -- Actualiza el stock sumando la cantidad indicada
        UPDATE Producto
        SET StockActual = StockActual + @Cantidad
        WHERE CodProducto = @CodProducto;

        PRINT 'Stock actualizado correctamente.';

        -- Mostrar el stock final actualizado
        SELECT 
            CodProducto = @CodProducto,
            StockActual = (SELECT StockActual FROM Producto WHERE CodProducto = @CodProducto);

        RETURN 0; -- Éxito
    END TRY

    BEGIN CATCH
        PRINT 'Error inesperado: ' + ERROR_MESSAGE();
        RETURN -99; -- Código de error genérico
    END CATCH
END;


-- Ejecución
DECLARE @Resultado INT;

EXEC @Resultado = sp_ActualizarStock
    @CodProducto = 4, 
    @Cantidad = 12;

SELECT Resultado = @Resultado;
