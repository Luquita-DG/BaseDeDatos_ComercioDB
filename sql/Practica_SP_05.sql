/*
	Crear un SP para insertar una nueva venta con su cliente asociado
		sp_InsertarVenta @CodCliente, @Fecha, @FormaPago, @Total
*/


CREATE PROCEDURE sp_InsertarVenta
	@CodCliente INT, 
	@FechaVenta DATE,
	@TipoComprobante NVARCHAR(50),
	@FormaPago NVARCHAR(50),
	@EstadoVenta NVARCHAR(50),
	@TotalVenta INT,
	@Observaciones NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		-- Validar el cliente exista antes de insertar
        IF NOT EXISTS (SELECT 1 FROM Cliente WHERE CodCliente = @CodCliente)
		BEGIN
			PRINT 'Error: El CodCliente ingresado no existe.';
			RETURN -1; -- Cliente inexistente
		END

		-- Insertar Venta
        INSERT INTO Venta(CodCliente, FechaVenta, TipoComprobante, FormaPago, EstadoVenta, TotalVenta, Observaciones)
        VALUES (@CodCliente, @FechaVenta, @TipoComprobante, @FormaPago, @EstadoVenta, @TotalVenta, @Observaciones);

		 -- Obtener el Cod generado (IDENTITY)
        DECLARE @NuevoID INT = SCOPE_IDENTITY();

		PRINT 'Venta insertada correctamente. Cod generado: ' + CAST(@NuevoID AS NVARCHAR);
        RETURN @NuevoID; -- Devolver el Cod del nuevo Cliente
	END TRY
    BEGIN CATCH
        PRINT 'Error inesperado: ' + ERROR_MESSAGE();
        RETURN -99; -- Código de error genérico
    END CATCH
END;
GO


DECLARE @Resultado INT;

EXEC @Resultado = sp_InsertarVenta
    @CodCliente = 4, 
	@FechaVenta = '2025-10-06',
	@TipoComprobante = 'Factura B',
	@FormaPago = 'Efectivo',
	@EstadoVenta = 'Completada',
	@TotalVenta = 15200.00,
	@Observaciones = 'Entrega inmediata';

SELECT Resultado = @Resultado;
