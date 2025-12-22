/*
	Crear un SP que muestre las ventas de un cliente filtrando 
			por CodCliente (recibe 1 parámetro)

	sp_VentasPorCliente @CodCliente INT
*/


CREATE PROCEDURE sp_VentasPorCliente
@CodCliente INT
AS
BEGIN
	SELECT
		C.CodCliente,
        C.NombreCliente,
		V.FechaVenta,
		V.FormaPago,
		V.EstadoVenta,
		V.TotalVenta
	FROM Venta AS V
	INNER JOIN Cliente AS C
		ON C.CodCliente = V.CodCliente
	WHERE C.CodCliente = @CodCliente
	ORDER BY V.FechaVenta DESC;
END;
GO

-- EJECUCIÓN
EXEC sp_VentasPorCliente @CodCliente = 1;

