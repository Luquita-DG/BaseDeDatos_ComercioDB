-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Listar los productos junto con su cantidad total vendida 
-- (desde DetalleDeVenta).

USE ComercioDb;
GO

SELECT
	P.NombreProducto,
	D.CantidadVendida,
	P.StockActual AS StockAnterior,
	(P.StockActual - D.CantidadVendida) AS StockActualizado,
	D.FechaEntregaVenta,
	D.EstadoDetalleVenta
FROM Producto AS P
INNER JOIN DetalleDeVenta AS D
	ON D.CodProducto = P.CodProducto
ORDER BY P.NombreProducto;

