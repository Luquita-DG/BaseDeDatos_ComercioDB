/*
Crear un SP para eliminar un proveedor solo si no tiene compras asociadas
	sp_EliminarProveedor @CodProveedor

	Si tiene compras, devolver mensaje: 
		"No se puede eliminar, tiene compras relacionadas"
*/

CREATE PROCEDURE sp_EliminarProveedor
	@CodProveedor INT
AS
	BEGIN
		BEGIN TRY
			IF NOT EXISTS (SELECT 1 FROM Proveedor WHERE CodProveedor = @CodProveedor)
				BEGIN
					PRINT 'Error: El Proveedor ingresado no existe.';
					RETURN -1; -- Proveedor inexistente
				END
			-- tiene compras asociadas?
			IF NOT EXISTS (SELECT 1 FROM Compra WHERE CodProveedor = @CodProveedor)
				BEGIN
					-- NO TIENE COMPRAS ASOCIADAS --> PROCEDO A ELIMINARLO
					DELETE FROM Proveedor WHERE CodProveedor = @CodProveedor
				END
			ELSE
				BEGIN
					PRINT 'No se puede eliminar, tiene compras relacionadas';
					RETURN -2; -- Proveedor con compras asociadas
				END
			-- Mostrar la lista de Proveedores
			SELECT 
				CodProveedor,
				NombreProveedor
			FROM Proveedor
			RETURN 0; -- Éxito

		END TRY
		-----------------------------------------------
		BEGIN CATCH
			PRINT 'Error inesperado: ' + ERROR_MESSAGE();
			RETURN -99; -- Código de error genérico
		END CATCH
	END;


-- Ejecución
DECLARE @Resultado INT;

EXEC @Resultado = sp_EliminarProveedor
    @CodProveedor = 4;
SELECT Resultado = @Resultado;