-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Listar los productos cuyo precio de venta 
-- sea mayor o igual a $1000, ordenados de mayor a menor precio.

SELECT *
FROM Producto
WHERE PrecioVenta >= 1000
ORDER BY PrecioVenta DESC;

-- Si lo queres de menor a mayor es ASC