/*
    Crear un SP que registre un detalle de venta y actualice el stock automáticamente
        sp_InsertarDetalleDeVenta 
            @CodVenta, @CodProducto, @Cantidad, @PrecioUnitario,@ImpuestosUnitariosVenta,
            @DescuentoVenta,@FechaEntregaVenta,@FechaGarantiaVencimiento,@EstadoDetalleVenta
            
            Si no hay stock suficiente -> devolver mensaje "Stock insuficiente"
            Si hay stock -> insertar y descontar stock
*/

CREATE PROCEDURE sp_InsertarDetalleDeVenta
    @CodVenta INT,
    @CodProducto INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(10,2),
    @ImpuestosUnitariosVenta DECIMAL(10,2),
    @DescuentoVenta DECIMAL(10,2),
    @FechaEntregaVenta DATE,
    @FechaGarantiaVencimiento DATE,
    @EstadoDetalleVenta VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN; -- Comenzar la transacción
        -- Un conjunto de instrucciones que deben ejecutarse como una sola unidad atómica

        -- Validar que exista la venta
        IF NOT EXISTS (SELECT 1 FROM Venta WHERE CodVenta = @CodVenta)
        BEGIN
            PRINT 'Error: La venta no existe.';
            ROLLBACK;
            RETURN -3;
        END

        -- Validar que exista el producto
        IF NOT EXISTS (SELECT 1 FROM Producto WHERE CodProducto = @CodProducto)
        BEGIN
            PRINT 'Error: El producto no existe.';
            ROLLBACK;
            RETURN -1;
        END

        -- Verificar stock
        DECLARE @StockActual INT;
        SELECT @StockActual = StockActual FROM Producto WHERE CodProducto = @CodProducto;

        IF @StockActual < @Cantidad
        BEGIN
            PRINT 'Stock insuficiente. Stock actual: ' + CAST(@StockActual AS NVARCHAR);
            ROLLBACK; -- Deshacer todos los cambios
            RETURN -2;
        END

        -- Insertar detalle
        INSERT INTO DetalleDeVenta (CodVenta, CodProducto, CantidadVendida, PrecioUnitarioVenta,ImpuestosUnitariosVenta,DescuentoVenta,FechaEntregaVenta,FechaGarantiaVencimiento,EstadoDetalleVenta)
        VALUES (@CodVenta, @CodProducto, @Cantidad, @PrecioUnitario,@ImpuestosUnitariosVenta,@DescuentoVenta,@FechaEntregaVenta,@FechaGarantiaVencimiento,@EstadoDetalleVenta);

        DECLARE @NuevoID INT = SCOPE_IDENTITY();

        -- Actualizar stock
        UPDATE Producto
        SET StockActual = StockActual - @Cantidad
        WHERE CodProducto = @CodProducto;

        COMMIT; -- Confirmar todos los cambios

        PRINT 'Detalle insertado correctamente. Cod generado: ' + CAST(@NuevoID AS NVARCHAR);
        RETURN @NuevoID;
    END TRY

    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error inesperado: ' + ERROR_MESSAGE();
        RETURN -99;
    END CATCH
END;
GO


-- Ejecucion
DECLARE @Resultado INT;

EXEC @Resultado = sp_InsertarDetalleDeVenta
    @CodVenta = 3,
    @CodProducto = 5,
    @Cantidad = 2,
    @PrecioUnitario = 1500.00,
    @ImpuestosUnitariosVenta = 0,
    @DescuentoVenta = 0,
    @FechaEntregaVenta = NULL,
    @FechaGarantiaVencimiento = NULL,
    @EstadoDetalleVenta = 'Pendiente';


SELECT Resultado = @Resultado;
