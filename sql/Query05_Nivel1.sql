-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar las compras cuyo estado sea “Pendiente” o “Completada”.

SELECT *
FROM Compra
WHERE EstadoCompra = 'Pendiente' OR EstadoCompra = 'Completada';
