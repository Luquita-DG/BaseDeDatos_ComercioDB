/* 
Listar todos los proveedores mostrando su nombre, email y ciudad.
*/
SELECT 
	P.NombreProveedor,
	P.EmailProveedor,
	P.Ciudad
FROM Proveedor AS P
/*
Mostrar los clientes que vivan en una ciudad determinada 
(por ejemplo, “Rosario”).
*/
SELECT
	C.NombreCliente,
	C.Ciudad
FROM Cliente AS C
WHERE C.Ciudad = 'Rosario';
/*
Obtener todos los productos cuyo stock actual sea menor a 10.
*/
SELECT
	P.NombreProducto,
	P.StockActual
FROM Producto AS P
WHERE P.StockActual < 150;

/*
Listar las ventas registradas en una fecha específica.
*/
SELECT
	V.CodVenta,
	V.FechaVenta,
	V.EstadoVenta
FROM Venta AS V
WHERE V.FechaVenta = '2025-10-06';
/*
Mostrar las compras cuyo estado sea “Pendiente” o “En proceso”
*/
SELECT
	C.CodCompra,
	C.EstadoCompra,
	C.TotalCompra
FROM Compra AS C
WHERE C.EstadoCompra = 'Pendiente';
/*
Listar los productos cuyo precio de venta sea mayor o igual 
	a $1000, ordenados de mayor a menor precio.
*/
SELECT *
FROM Producto AS P
WHERE P.PrecioVenta >= 1000
ORDER BY P.PrecioVenta ASC;
/*
Obtener los clientes cuyo tipo sea “Mayorista”.
*/
SELECT 
	C.NombreCliente,
	C.TipoCliente
FROM Cliente AS C
WHERE C.TipoCliente = 'Mayorista';
/*
Mostrar los proveedores cuyo nombre comience con la letra “D”
*/
SELECT
	P.NombreProveedor,
	P.TelefonoProveedor
FROM Proveedor AS P
WHERE P.NombreProveedor LIKE 'D%';
/*
Listar todas las compras indicando su fecha de pedido y fecha de recepción.
*/
SELECT
	C.CodCompra,
	C.FechaPedido,
	C.FechaRecepcion
FROM Compra AS C;
/*
Mostrar los productos sin categoría 
	(donde CategoriaProducto sea NULL o vacío).
*/
SELECT
	P.NombreProducto,
	P.CategoriaProducto
FROM Producto AS P
WHERE P.CategoriaProducto IS NULL;
--###################################  2 #####################################
/*
Mostrar el nombre del proveedor y los productos que ofrece 
	(relación ProveedorProducto).
*/
SELECT
	P.NombreProveedor,
	PR.NombreProducto
FROM Proveedor AS P
INNER JOIN ProveedorProducto AS PP
	ON PP.CodProveedor = P.CodProveedor
INNER JOIN Producto AS PR
	ON PR.CodProducto = PP.CodProducto;
/*
Obtener todas las compras, 
	mostrando el nombre del proveedor y el total de la compra.
*/
SELECT
	P.NombreProveedor,
	C.TotalCompra
FROM Compra AS C
INNER JOIN Proveedor AS P
	ON C.CodProveedor = P.CodProveedor
/*
Mostrar todas las ventas, 
	incluyendo el nombre del cliente, la fecha y el total de venta.
*/
SELECT
	C.NombreCliente,
	V.FechaVenta,
	V.TotalVenta
FROM Venta AS V
INNER JOIN Cliente AS C
	ON V.CodCliente = C.CodCliente;
/*
Listar los productos junto con su cantidad total comprada 
	(sumando las cantidades de DetalleDeCompra).
*/
SELECT
	P.CodProducto,
	P.NombreProducto,
	SUM(DC.CantidadPedida) AS CantidadTotalComprada
FROM Producto AS P
INNER JOIN DetalleDeCompra AS DC
	ON DC.CodProducto = P.CodProducto
GROUP BY 
    P.CodProducto, 
    P.NombreProducto 
ORDER BY 
    P.NombreProducto;
/*
Listar los productos junto con su cantidad total vendida 
	(desde DetalleDeVenta).
*/
SELECT
	P.CodProducto,
	P.NombreProducto,
	SUM(DV.CantidadVendida) AS CantidadTotalVendida
FROM Producto AS P
INNER JOIN DetalleDeVenta AS DV
	ON DV.CodProducto = P.CodProducto
GROUP BY
	P.CodProducto,
	P.NombreProducto
ORDER BY 
    P.NombreProducto;
/*
Mostrar, por cada cliente, 
	la suma total de dinero gastado en todas sus ventas.
*/
SELECT
	C.CodCliente,
	C.NombreCliente,
	SUM(V.TotalVenta) AS TotalGastado
FROM Cliente AS C
INNER JOIN Venta AS V
	ON V.CodCliente = C.CodCliente
GROUP BY
	C.CodCliente,
	C.NombreCliente
ORDER BY
	C.NombreCliente;
/*
Calcular el promedio del precio de venta 
		de los productos por cada categoría.
*/
SELECT 
	P.CategoriaProducto,
	AVG(P.PrecioVenta) AS PromedioPrecio
FROM Producto AS P
GROUP BY P.CategoriaProducto;
/*
Listar las ventas que tengan un total mayor 
		al promedio general de las ventas.
*/
SELECT 
    V.CodVenta,
    V.FechaVenta,
    V.CodCliente,
    V.TotalVenta
FROM Venta AS V
WHERE TotalVenta > (SELECT AVG(TotalVenta) FROM Venta)
ORDER BY TotalVenta DESC;
--################################### PROCEDURE #################################
/*
Crear un SP que liste todos los productos
sp_ListarProductos
 Que devuelva CodProducto, NombreProducto, PrecioVenta, StockActual
*/
CREATE PROCEDURE sp_ListarProductos 
AS 
BEGIN
	SELECT
		P.CodProducto,
		P.NombreProducto,
		P.PrecioVenta,
		P.StockActual
	FROM Producto AS P
	ORDER BY P.NombreProducto
END
GO
EXECUTE sp_ListarProductos;
/*
Crear un SP que liste todas las compras junto con el nombre del proveedor
sp_ListarComprasConProveedor
*/
CREATE PROCEDURE sp_ListarComprasConProveedor
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        C.CodCompra,
        C.FechaPedido,
        C.TotalCompra,
        P.NombreProveedor
    FROM
        Compra AS C
    LEFT JOIN
        Proveedor AS P
        ON P.CodProveedor = C.CodProveedor
    ORDER BY
        C.FechaPedido DESC;
END
GO

EXECUTE sp_ListarComprasConProveedor;

--################################### PREDICADOS ###############################
/*
Listar los clientes cuyo nombre comience con la letra "L".
*/
SELECT
	*
FROM Cliente AS C
WHERE C.NombreCliente LIKE 'L%';
/*
Mostrar los productos cuya categoría sea 'Alimentos', 
		'Limpieza' o 'Bebidas'.
*/
SELECT
	*
FROM Producto AS P
WHERE P.CategoriaProducto IN('Alimentos', 'Limpieza', 'Bebidas');
/*
Listar las ventas cuyo total esté entre $5.000 y $20.000.
*/
SELECT
	*
FROM Venta AS V
WHERE V.TotalVenta BETWEEN 5000 AND 20000
/*
Mostrar los proveedores 
	que tengan al menos un producto asociado en ProveedorProducto.
*/
SELECT *
FROM Proveedor AS P
WHERE EXISTS (
	SELECT 1
	FROM ProveedorProducto pp
	WHERE pp.CodProveedor = p.CodProveedor
	);
/*
Listar los productos que nunca fueron vendidos,
	es decir, que no existan en DetalleDeVenta.
*/
SELECT *
FROM Producto AS P
WHERE NOT EXISTS (
	SELECT 1
	FROM DetalleDeVenta AS DV
	WHERE DV.CodProducto = P.CodProducto
	);
/*
Listar los productos cuyo precio de venta sea mayor que cualquier precio
	unitario registrado en DetalleDeCompra.
*/
SELECT *
FROM Producto AS P
WHERE P.PrecioVenta > ANY (
	SELECT 
		DC.PrecioUnitarioCompra
	FROM DetalleDeCompra AS DC
);
/*
Mostrar los productos cuyo precio de venta sea mayor que 
	todos los precios unitarios de compra registrados en DetalleDeCompra.
*/
SELECT *
FROM Producto AS P
WHERE P.PrecioVenta > ALL (
	SELECT 
		DC.PrecioUnitarioCompra
	FROM DetalleDeCompra AS DC\

-- Devuelve el stock actual de un producto
CREATE FUNCTION fn_StockProducto(@CodProducto INT)
RETURNS INT
AS
BEGIN
DECLARE @Stock INT;


SELECT @Stock = StockActual
FROM Producto
WHERE CodProducto = @CodProducto;


RETURN ISNULL(@Stock, 0);
END;


-- Evita eliminar un cliente que tenga ventas
CREATE TRIGGER trg_NoEliminarClienteConVentas
ON Cliente
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (
SELECT 1
FROM deleted d
JOIN Venta v ON v.CodCliente = d.CodCliente
)
BEGIN
RAISERROR('No se puede eliminar el cliente porque tiene ventas.',16,1);
RETURN;
END;


DELETE FROM Cliente
WHERE CodCliente IN (SELECT CodCliente FROM deleted);
END;

-- Suma stock cuando se inserta un detalle de compra
CREATE TRIGGER trg_SumarStock_AfterInsert
ON DetalleDeCompra
AFTER INSERT
AS
BEGIN
UPDATE p
SET p.StockActual = p.StockActual + i.CantidadRecibida
FROM Producto p
JOIN inserted i ON i.CodProducto = p.CodProducto;
END;

-- Vista con productos y su precio
CREATE VIEW vw_ProductosBasico
AS
SELECT CodProducto, NombreProducto, PrecioVenta
FROM Producto;

-- Inserta un proveedor
CREATE PROCEDURE sp_InsertarProveedorSimple
@NombreProveedor VARCHAR(100),
@EmailProveedor VARCHAR(100),
@TelefonoProveedor VARCHAR(50)
AS
BEGIN
BEGIN TRY
BEGIN TRAN;


INSERT INTO Proveedor (NombreProveedor, EmailProveedor, TelefonoProveedor)
VALUES (@NombreProveedor, @EmailProveedor, @TelefonoProveedor);


-- Devuelve el ID generado
SELECT SCOPE_IDENTITY() AS CodProveedorInsertado;


COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
PRINT 'Error al insertar proveedor';
END CATCH
END;

-- Inserta una venta y devuelve el CodVenta creado
CREATE PROCEDURE sp_InsertarVentaSimple
@CodCliente INT,
@FechaVenta DATE,
@TotalVenta DECIMAL(18,2),
@CodVentaGenerado INT OUTPUT
AS
BEGIN
BEGIN TRY
BEGIN TRAN;


INSERT INTO Venta (CodCliente, FechaVenta, TotalVenta)
VALUES (@CodCliente, @FechaVenta, @TotalVenta);


SET @CodVentaGenerado = SCOPE_IDENTITY();


COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
SET @CodVentaGenerado = -1;
PRINT 'Error al insertar la venta';
END CATCH
END;







