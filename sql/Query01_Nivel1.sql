-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Listar todos los proveedores mostrando su nombre, email y ciudad.


SELECT P.NombreProveedor,P.EmailProveedor,P.Ciudad
FROM Proveedor AS P;


-- Para realizarlo con un orden (ORDER BY)
/*
SELECT P.NombreProveedor, P.EmailProveedor, P.Ciudad
FROM Proveedor AS P
ORDER BY NombreProveedor;
*/