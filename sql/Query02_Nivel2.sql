-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Obtener todas las compras, 
--  mostrando el nombre del proveedor y el total de la compra.

USE ComercioDb;
GO

SELECT
	C.CodCompra,
	P.NombreProveedor,
	C.FechaPedido,
	C.TotalCompra
FROM Compra AS C
INNER JOIN Proveedor AS P
	ON P.CodProveedor = C.CodProveedor
ORDER BY P.NombreProveedor;

/*
Proveedor y Compra están relacionados por el campo CodProveedor.

El INNER JOIN devuelve solo las compras que tienen un proveedor asociado 

ORDER BY P.NombreProveedor te permite ver las compras ordenadas por proveedor 

*/







