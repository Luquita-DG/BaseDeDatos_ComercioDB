CREATE PROCEDURE sp_ListarComprasConProveedor
AS
BEGIN
	SELECT 
		C.CodCompra,
		P.NombreProveedor,
		C.FechaPedido,
		C.TotalCompra
	FROM Compra AS C
	INNER JOIN Proveedor AS P
		ON P.CodProveedor = C.CodProveedor
	ORDER BY P.NombreProveedor
END;
GO
-- EJECUCIÓN
EXEC sp_ListarComprasConProveedor;