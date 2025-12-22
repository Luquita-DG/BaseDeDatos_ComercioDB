-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Listar los productos junto con su cantidad total comprada 
-- (sumando las cantidades de DetalleDeCompra).


USE ComercioDb;
GO

SELECT
    P.NombreProducto,
    D.CantidadPedida,
    D.CantidadRecibida,
    P.StockActual AS StockAnterior,
    (P.StockActual + D.CantidadRecibida) AS StockActualizado,
    D.EstadoDetalleCompra
FROM Producto AS P
INNER JOIN DetalleDeCompra AS D
    ON D.CodProducto = P.CodProducto
ORDER BY P.NombreProducto;





