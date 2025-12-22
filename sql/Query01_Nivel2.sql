-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar el nombre del proveedor y los productos que ofrece 
-- (relación ProveedorProducto).

USE ComercioDb;
GO

SELECT 
	P.CodProveedor,
	P.NombreProveedor,
	PR.CodProducto,
	PR.NombreProducto
FROM Proveedor AS P

INNER JOIN ProveedorProducto AS PP 
	ON P.CodProveedor = PP.CodProveedor
INNER JOIN Producto AS PR 
	ON PR.CodProducto = PP.CodProducto

ORDER BY P.NombreProveedor, PR.NombreProducto;

/*
FROM Proveedor AS p 
	— empezás desde la tabla de proveedores y le das el alias p.

INNER JOIN devuelve solo las filas que tienen coincidencias en ambas tablas.

JOIN ProveedorProducto AS pp ON p.CodProveedor = pp.CodProveedor 
	— vinculás la tabla asociativa para obtener 
		sólo los productos que ese proveedor ofrece.

JOIN Producto AS pr ON pp.CodProducto = pr.CodProducto 
	— traés los datos del producto.

SELECT ... — elegís las columnas a mostrar: 
			código y nombre del proveedor y del producto.

ORDER BY — ordenás por proveedor y producto 
	para que la salida sea legible.
*/








