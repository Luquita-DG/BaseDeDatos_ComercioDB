-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Listar las ventas que tengan un 
-- total mayor al promedio general de las ventas

SELECT 
    V.CodVenta,
    V.FechaVenta,
    V.CodCliente,
    V.TotalVenta
FROM Venta AS V
WHERE TotalVenta > (SELECT AVG(TotalVenta) FROM Venta)
ORDER BY TotalVenta DESC;


/*

La subconsulta (SELECT AVG(TotalVenta) FROM Venta) 
    devuelve un solo valor: el promedio de todos los totales.

El WHERE compara cada TotalVenta individual contra ese valor promedio.

ORDER BY te permite ver los más altos primero.

*/