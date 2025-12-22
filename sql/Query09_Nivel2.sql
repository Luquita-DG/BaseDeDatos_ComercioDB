-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar el nombre del cliente y el número de ventas que realizó.

SELECT
	C.NombreCliente,
	COUNT(V.CodCliente) AS NumeroVentas
FROM Cliente AS C
LEFT JOIN Venta AS V
	ON V.CodCliente = C.CodCliente
GROUP BY C.CodCliente,C.NombreCliente
ORDER BY C.NombreCliente;


/*

INNER JOIN, mostrarán los clientes que tienen al menos una venta.

LEFT JOIN, los clientes que no realizaron ninguna venta

*/


