-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Obtener la cantidad total de productos vendidos 
-- y el monto total por cada producto.

SELECT 
    P.CodProducto,
    P.NombreProducto,
    SUM(DV.CantidadVendida) AS CantidadTotalVendida,
    SUM(DV.CantidadVendida * DV.PrecioUnitarioVenta) AS MontoTotalGenerado
FROM Producto AS P
INNER JOIN DetalleDeVenta AS DV
    ON P.CodProducto = DV.CodProducto
GROUP BY P.CodProducto, P.NombreProducto
ORDER BY MontoTotalGenerado DESC;













