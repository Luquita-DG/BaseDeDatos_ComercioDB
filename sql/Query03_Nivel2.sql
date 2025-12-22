-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar todas las ventas, incluyendo el nombre del cliente, 
-- la fecha y el total de venta.


USE ComercioDb;
GO

SELECT
	C.NombreCliente,
	V.FechaVenta,
	V.TotalVenta
FROM Venta AS V
INNER JOIN Cliente AS C
	ON C.CodCliente = V.CodCliente
ORDER BY C.NombreCliente;

/*
Cliente y Venta están relacionados por el campo C.CodCliente.

El INNER JOIN devuelve solo las Ventas que tienen un Cliente asociado 

ORDER BY C.NombreClient te permite ver las Ventas ordenadas por Cliente 

*/
