-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar los clientes que vivan en una ciudad determinada 
-- (por ejemplo, “Buenos Aires”).

SELECT * 
FROM Cliente AS C
WHERE C.Ciudad = 'Buenos Aires'