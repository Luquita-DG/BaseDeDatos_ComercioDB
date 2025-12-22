/*
    Crear un SP que liste todos los productos
    sp_ListarProductos
     Que devuelva CodProducto, NombreProducto, PrecioVenta, StockActual
*/


CREATE PROCEDURE sp_ListarProductos
AS
BEGIN
    SELECT CodProducto, NombreProducto, PrecioVenta, StockActual
    FROM Producto;
END;
GO

EXEC sp_ListarProductos;
