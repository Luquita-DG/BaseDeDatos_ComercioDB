-- ================================================================
--                DML (Data Manipulation Language)
-- ================================================================
-- Mostrar los productos sin categoría 
-- (donde CategoriaProducto sea NULL o vacío).

SELECT *
FROM Producto
WHERE CategoriaProducto IS NULL OR CategoriaProducto = '';


/*

SELECT 
    CodProducto,
    NombreProducto,
    CategoriaProducto
FROM Producto
WHERE CategoriaProducto IS NULL OR CategoriaProducto = '';

*/
