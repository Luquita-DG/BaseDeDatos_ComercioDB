-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar los proveedores cuyo nombre comience con la letra “D”.

SELECT *
FROM Proveedor
WHERE NombreProveedor LIKE 'D%';


/*
LIKE permite usar patrones de búsqueda con comodines.

'A%' significa:

A -> la primera letra debe ser “A”.

% -> puede haber cualquier combinación de caracteres después (o ninguno).

*/