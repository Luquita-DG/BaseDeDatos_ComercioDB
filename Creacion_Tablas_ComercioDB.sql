-- ===========================================================
-- Creación De La Base De Datos
-- ===========================================================
CREATE DATABASE ComercioDb;
GO
USE ComercioDb;
GO
-- ===========================================================
--         PARTE DEL DDL(Data Definition Language)
-- ===========================================================
-- ###########################################################
-- ===========================================================
--               CREATE TABLA - PROVEEDOR
-- ===========================================================
CREATE TABLE Proveedor(
    CodProveedor INT PRIMARY KEY IDENTITY(1,1),
    NombreProveedor VARCHAR(50) NOT NULL,
    EmailProveedor VARCHAR(50) NOT NULL,
    Cuit VARCHAR(15) UNIQUE NOT NULL,
    TelefonoProveedor VARCHAR(20) NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    Numero VARCHAR(10),
    Ciudad VARCHAR(50) NOT NULL
);

-- ===========================================================
--               CREATE TABLA - CLIENTE
-- ===========================================================
CREATE TABLE Cliente (
    CodCliente INT PRIMARY KEY IDENTITY(1,1),
    NombreCliente VARCHAR(50) NOT NULL,
    TipoCliente VARCHAR(20) NOT NULL,
    DniCuit VARCHAR(15) UNIQUE NOT NULL,
    EmailCliente VARCHAR(50) NOT NULL,
    TelefonoCliente VARCHAR(20) NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    Numero VARCHAR(10),
    Ciudad VARCHAR(50) NOT NULL
);

-- ===========================================================
--               CREATE TABLA - COMPRA
-- ===========================================================
CREATE TABLE Compra (
    CodCompra INT PRIMARY KEY IDENTITY(1,1),
    CodProveedor INT NOT NULL,
    FechaRecepcion DATE NOT NULL,
    FechaPedido DATE NOT NULL,
    EstadoCompra VARCHAR(20) NOT NULL,
    TotalCompra DECIMAL(10,2) NOT NULL DEFAULT 0,
    Observaciones VARCHAR(100),
    FOREIGN KEY (CodProveedor) REFERENCES Proveedor(CodProveedor)
);

-- ===========================================================
--               CREATE TABLA - PRODUCTO
-- ===========================================================
CREATE TABLE Producto (
    CodProducto INT PRIMARY KEY IDENTITY(1,1),
    NombreProducto VARCHAR(50) NOT NULL,
    PrecioVenta DECIMAL(10,2) NOT NULL,
    UnidadMedida VARCHAR(15) NOT NULL,
    CategoriaProducto VARCHAR(50),
    StockActual INT NOT NULL DEFAULT 0,
    MarcaProducto VARCHAR(50)
);

-- ===========================================================
--               CREATE TABLA - VENTA
-- ===========================================================
CREATE TABLE Venta (
    CodVenta INT PRIMARY KEY IDENTITY(1,1),
    CodCliente INT NOT NULL,
    FechaVenta DATE NOT NULL,
    TipoComprobante VARCHAR(50) NOT NULL,
    FormaPago VARCHAR(20) NOT NULL,
    EstadoVenta VARCHAR(20) NOT NULL,
    TotalVenta DECIMAL(10,2) NOT NULL DEFAULT 0,
    Observaciones VARCHAR(100),
    FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente)
);

-- ===========================================================
--               CREATE TABLA - DETALLE DE COMPRA
-- ===========================================================
CREATE TABLE DetalleDeCompra (
    CodDetalleCompra INT PRIMARY KEY IDENTITY(1,1),
    CodCompra INT NOT NULL,
    CodProducto INT NOT NULL,
    CantidadPedida INT NOT NULL,
    CantidadRecibida INT,
    PrecioUnitarioCompra DECIMAL(10,2) NOT NULL,
    ImpuestosUnitariosCompra DECIMAL(10,2) DEFAULT 0,
    FechaRecepcionDetalle DATE,
    FechaVencimiento DATE,
    NroLote VARCHAR(30),
    DescuentoCompra DECIMAL(10,2) DEFAULT 0,
    EstadoDetalleCompra VARCHAR(30),
    FOREIGN KEY (CodCompra) REFERENCES Compra(CodCompra),
    FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);
-- ===========================================================
--               CREATE TABLA - DETALLE DE VENTA
-- ===========================================================
CREATE TABLE DetalleDeVenta (
    CodDetalleVenta INT PRIMARY KEY IDENTITY(1,1),
    CodVenta INT NOT NULL,
    CodProducto INT NOT NULL,
    CantidadVendida INT NOT NULL,
    PrecioUnitarioVenta DECIMAL(10,2) NOT NULL,
    ImpuestosUnitariosVenta DECIMAL(10,2) DEFAULT 0,
    DescuentoVenta DECIMAL(10,2) DEFAULT 0,
    FechaEntregaVenta DATE,
    FechaGarantiaVencimiento DATE,
    EstadoDetalleVenta VARCHAR(30),
    FOREIGN KEY (CodVenta) REFERENCES Venta(CodVenta),
    FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);
-- ===========================================================
--               CREATE TABLE - ProveedorProducto
-- ===========================================================
CREATE TABLE ProveedorProducto (
    CodProveedor INT NOT NULL,
    CodProducto INT NOT NULL,
    PRIMARY KEY (CodProveedor, CodProducto),
    FOREIGN KEY (CodProveedor) REFERENCES Proveedor(CodProveedor),
    FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto)
);








