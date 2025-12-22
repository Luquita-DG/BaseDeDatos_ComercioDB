-- ===========================================================
--                   INSERTS  - COMERCIO_DB
-- ===========================================================

-- ===========================================================
--                     1️⃣ PROVEEDORES
-- ===========================================================
INSERT INTO Proveedor (NombreProveedor, EmailProveedor, Cuit, TelefonoProveedor, Calle, Numero, Ciudad)
VALUES
('Distribuidora Pampeana', 'info@pampeana.com', '30-10203040-5', '1120003344', 'Av. Perón', '500', 'Santa Rosa'),
('Proveedor Del Litoral', 'ventas@litoral.com', '30-55667788-9', '1133445566', 'San Martín', '345', 'Paraná'),
('Industrias Patagónicas', 'contacto@patagonicas.com', '30-99998888-7', '1123456789', 'Rivadavia', '700', 'Bariloche'),
('Comercial Tucumán', 'ventas@tucuman.com', '30-77778888-2', '3814455667', 'Mitre', '1450', 'San Miguel de Tucumán'),
('Distribuidora Oeste', 'info@oeste.com', '30-11112222-3', '1125567788', 'Av. Gaona', '1800', 'Morón'),
('Proveedor Atlántico', 'ventas@atlantico.com', '30-33334444-6', '2235566778', 'Colón', '350', 'Mar del Plata'),
('Distribuidora Cuenca', 'info@cuenca.com', '30-88889999-4', '1138776655', 'Belgrano', '640', 'Neuquén');

-- ===========================================================
--                        2️⃣ CLIENTES
-- ===========================================================
INSERT INTO Cliente (NombreCliente, TipoCliente, DniCuit, EmailCliente, TelefonoCliente, Calle, Numero, Ciudad)
VALUES
('Supermercado El Sol', 'Mayorista', '30777888991', 'elsol@super.com', '1123344556', 'Corrientes', '1340', 'Buenos Aires'),
('Lucía Fernández', 'Minorista', '25444333', 'luciaf@gmail.com', '1144556677', 'Sarmiento', '800', 'Mendoza'),
('Autoservicio Norte', 'Mayorista', '30999111223', 'autosnorte@ventas.com', '1133445566', 'Rivadavia', '999', 'Córdoba'),
('Carlos Gómez', 'Minorista', '23111222', 'cgomez@yahoo.com', '1122334455', 'Belgrano', '400', 'La Plata'),
('Ferretería Delta', 'Mayorista', '30888111777', 'delta@ferre.com', '1133665588', 'San Juan', '155', 'Rosario'),
('Heladería Italia', 'Minorista', '27333444', 'italia@helados.com', '1144556677', 'Mitre', '60', 'Buenos Aires'),
('Verdulería Los Frescos', 'Minorista', '28444555', 'contacto@frescos.com', '1133778899', 'Entre Ríos', '700', 'Mar del Plata');

-- ===========================================================
--                      3️⃣ PRODUCTOS 
-- ===========================================================
INSERT INTO Producto (NombreProducto, PrecioVenta, UnidadMedida, CategoriaProducto, StockActual, MarcaProducto)
VALUES
('Azúcar', 1100.00, 'Kilogramo', 'Alimentos', 200, 'Ledesma'),
('Arroz', 1300.00, 'Kilogramo', 'Alimentos', 180, 'Gallo'),
('Gaseosa Sprite', 2400.00, 'Litro', 'Bebidas', 100, 'Coca-Cola'),
('Jabón en Polvo', 2100.00, 'Gramo', 'Limpieza', 150, 'Skip'),
('Fideos Spaghetti', 950.00, 'Gramo', 'Alimentos', 220, 'Lucchetti'),
('Lavandina', 800.00, 'Litro', 'Limpieza', 140, 'Ayudín'),
('Shampoo', 1700.00, 'Mililitro', 'Higiene', 110, 'Sedal'),
('Desodorante', 1900.00, 'Mililitro', 'Higiene', 130, 'Rexona'),
('Cerveza Quilmes', 2100.00, 'Litro', 'Bebidas', 160, 'Quilmes'),
('Galletitas Chocolinas', 1500.00, 'Gramo', 'Alimentos', 190, 'Bagley');

-- ===========================================================
--                        4️⃣ COMPRAS
-- ===========================================================
INSERT INTO Compra (CodProveedor, FechaRecepcion, FechaPedido, EstadoCompra, TotalCompra, Observaciones)
VALUES
(4, '2025-09-25', '2025-09-22', 'Completada', 22000.00, 'Pedido regional'),
(5, '2025-10-06', '2025-10-04', 'Pendiente', 35000.00, 'Esperando confirmación'),
(6, '2025-10-07', '2025-10-06', 'Completada', 48000.00, 'Pedido especial bebidas'),
(7, '2025-10-08', '2025-10-07', 'Completada', 39000.00, NULL),
(3, '2025-10-09', '2025-10-08', 'Pendiente', 26000.00, 'Demora por transporte');

-- ===========================================================
--                    5️⃣ DETALLE DE COMPRA
-- ===========================================================
INSERT INTO DetalleDeCompra (CodCompra, CodProducto, CantidadPedida, CantidadRecibida, PrecioUnitarioCompra, ImpuestosUnitariosCompra, FechaRecepcionDetalle, NroLote, DescuentoCompra, EstadoDetalleCompra)
VALUES
(1, 6, 30, 30, 700.00, 20.00, '2025-09-25', 'L010', 0, 'Completado'),
(1, 7, 25, 25, 1400.00, 40.00, '2025-09-25', 'L011', 0, 'Completado'),
(2, 8, 40, 30, 1600.00, 50.00, '2025-10-06', 'L012', 0, 'Parcial'),
(3, 9, 50, 50, 1800.00, 60.00, '2025-10-07', 'L013', 0, 'Completado'),
(3, 3, 40, 40, 1000.00, 30.00, '2025-10-07', 'L014', 0, 'Completado'),
(4, 10, 35, 35, 1200.00, 30.00, '2025-10-08', 'L015', 0, 'Completado'),
(5, 5, 20, 0, 800.00, 25.00, NULL, 'L016', 0, 'Pendiente');

-- ===========================================================
--                       6️⃣ VENTAS
-- ===========================================================
INSERT INTO Venta (CodCliente, FechaVenta, TipoComprobante, FormaPago, EstadoVenta, TotalVenta, Observaciones)
VALUES
(4, '2025-10-06', 'Factura A', 'Efectivo', 'Completada', 6700.00, NULL),
(5, '2025-10-07', 'Factura B', 'Transferencia', 'Pendiente', 15200.00, 'Pago en 10 días'),
(6, '2025-10-08', 'Factura A', 'Tarjeta', 'Completada', 4200.00, NULL),
(7, '2025-10-09', 'Factura A', 'Efectivo', 'Completada', 5800.00, 'Entrega inmediata'),
(3, '2025-10-09', 'Factura B', 'Efectivo', 'Pendiente', 3200.00, NULL);

-- ===========================================================
--              7️⃣ DETALLE DE VENTA
-- ===========================================================
INSERT INTO DetalleDeVenta (CodVenta, CodProducto, CantidadVendida, PrecioUnitarioVenta, ImpuestosUnitariosVenta, DescuentoVenta, FechaEntregaVenta, EstadoDetalleVenta)
VALUES
(1, 2, 2, 2200.00, 80.00, 0, '2025-10-06', 'Entregado'),
(2, 9, 5, 2100.00, 90.00, 0, '2025-10-07', 'Pendiente'),
(3, 4, 3, 950.00, 30.00, 0, '2025-10-08', 'Entregado'),
(4, 5, 6, 950.00, 30.00, 0, '2025-10-09', 'Entregado'),
(5, 7, 2, 1700.00, 50.00, 0, NULL, 'Pendiente');

-- ===========================================================
--                8️⃣ PROVEEDOR - PRODUCTO
-- ===========================================================
INSERT INTO ProveedorProducto (CodProveedor, CodProducto)
VALUES
(4, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(3, 5),
(2, 6),
(3, 7),
(5, 9),
(6, 10);
