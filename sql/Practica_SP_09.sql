/*
Crear un SP que permita buscar productos por categoría 
	o traer todos si la categoría es NULL

	sp_BuscarProductos 
	@CategoriaProducto VARCHAR(50) = NULL
*/

CREATE PROCEDURE sp_BuscarProductos
    @CategoriaProducto VARCHAR(50) = NULL
AS
BEGIN
    BEGIN TRY
        IF @CategoriaProducto IS NULL
        BEGIN
            -- Traer todos los productos
            SELECT 
                CodProducto,
                NombreProducto,
                PrecioVenta,
                StockActual,
                CategoriaProducto
            FROM Producto
            ORDER BY NombreProducto;
        END
        ELSE
        BEGIN
            -- Filtrar por categoría específica
            IF NOT EXISTS (SELECT 1 FROM Producto WHERE CategoriaProducto = @CategoriaProducto)
            BEGIN
                PRINT 'No existen productos en la categoría especificada.';
                RETURN -1;
            END

            SELECT 
                CodProducto,
                NombreProducto,
                PrecioVenta,
                StockActual,
                CategoriaProducto
            FROM Producto
            WHERE CategoriaProducto = @CategoriaProducto
            ORDER BY NombreProducto;
        END

        RETURN 0; -- Éxito
    END TRY
    BEGIN CATCH
        PRINT 'Error inesperado: ' + ERROR_MESSAGE();
        RETURN -99; -- Código de error genérico
    END CATCH
END;
GO


-- Ejecución
DECLARE @Resultado INT;

-- Buscar por categoría
EXEC @Resultado = sp_BuscarProductos @CategoriaProducto = 'Bebidas';
SELECT Resultado = @Resultado;

-- Traer todos los productos
EXEC @Resultado = sp_BuscarProductos;
SELECT Resultado = @Resultado;
