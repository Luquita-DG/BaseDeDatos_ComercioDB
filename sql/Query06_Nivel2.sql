-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar, por cada cliente, 
-- la suma total de dinero gastado en todas sus ventas.


SELECT 
	C.NombreCliente,
	C.TipoCliente,
	SUM(V.TotalVenta) AS TotalGastado
FROM Cliente AS C
INNER JOIN Venta as V
	ON V.CodCliente = C.CodCliente
ORDER BY C.NombreCliente



