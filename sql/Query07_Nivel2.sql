-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Calcular el promedio del precio de venta de los productos por cada categoría.


SELECT 
	P.CategoriaProducto,
	AVG(P.PrecioVenta) AS PromedioPrecio
FROM Producto AS P
GROUP BY P.CategoriaProducto;
 

-- ¿podría utilizar el WHERE para generar una condición de que 
-- si el promedio de la venta es mayor a 1800?
/*
SELECT 
    CategoriaProducto,
    AVG(PrecioVenta) AS PromedioPrecio
FROM Producto
WHERE AVG(PrecioVenta) > 1800   -- X Error: no se puede usar AVG aquí
GROUP BY CategoriaProducto;

*/

SELECT 
    CategoriaProducto,
    AVG(PrecioVenta) AS PromedioPrecio
FROM Producto
GROUP BY CategoriaProducto
HAVING AVG(PrecioVenta) >= 1800
ORDER BY PromedioPrecio DESC;
