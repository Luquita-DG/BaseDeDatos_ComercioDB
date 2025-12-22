# Base de Datos Comercio

## Proyecto — Diseño de Base de Datos Comercio

**Autor:** Luca Di Gresia
**Asignatura:** Ingeniería de Base de Datos 1
**Tipo de documento:** Informe universitario — Modelo Conceptual, Lógico y SQL

---

## Índice

1. Introducción
2. Descripción General del Sistema
3. Modelo Conceptual de la Base de Dato
   3.1 Entidades y Atributos
   3.2 Descripción Detallada de Entidades

   * Proveedor
   * Compra
   * DetalleDeCompra
   * Producto
   * Cliente
   * Venta
   * DetalleDeVenta

4. Relaciones y Cardinalidades
5. Modelo Lógico de la Base de Datos Comercial
   5.1 Entidades Principales
   5.2 Entidades Asociativas

   * ProveedorProducto

---

## 1. Introducción

El diseño de bases de datos constituye un pilar fundamental en el desarrollo de sistemas de información. Un modelo bien estructurado permite garantizar la integridad de los datos, la trazabilidad de las operaciones y la correcta representación de los procesos del negocio. En este informe se presenta el diseño de una base de datos para un sistema de gestión comercial, contemplando tanto el modelo conceptual como el modelo lógico.

---

## 2. Descripción General del Sistema

El sistema de base de datos comercial propuesto permite administrar las compras realizadas a proveedores y las ventas efectuadas a clientes. A su vez, mantiene control sobre los productos, su stock, los movimientos de compra y venta, y el detalle de cada operación. El modelo contempla información histórica y soporta análisis posteriores mediante consultas avanzadas.

---

## 3. Modelo Conceptual de la Base de Dato

### 3.1 Entidades y Atributos

El modelo conceptual identifica las entidades principales del sistema y define los atributos necesarios para representar la información relevante de cada una.

### 3.2 Descripción Detallada de Entidades

#### Proveedor

**Descripción:** Representa a las empresas o personas que suministran productos a la organización. Cada proveedor puede realizar múltiples compras, mientras que cada compra pertenece a un único proveedor.

**Atributos:**

* CodProveedor: Identificador único del proveedor.
* NombreProveedor: Nombre o razón social.
* Cuit: Identificación fiscal del proveedor.
* TelefonoProveedor: Medio de contacto telefónico.
* EmailProveedor: Correo electrónico.
* DireccionProveedor: Dirección física, compuesta por calle, número y ciudad.

**Justificación:** Los atributos permiten identificar, contactar y ubicar al proveedor. La inclusión del CUIT responde a requisitos legales y fiscales, mientras que la descomposición de la dirección mejora la normalización.

---

#### Compra

**Descripción:** Representa una operación de adquisición de productos realizada a un proveedor. Cada compra puede contener uno o varios detalles asociados.

**Atributos:**

* CodCompra: Identificador único de la compra.
* FechaPedido: Fecha de solicitud del pedido.
* FechaRecepcion: Fecha en que los productos son recibidos.
* TotalCompra: Monto total de la compra.
* EstadoCompra: Estado actual de la compra (pendiente, recibida, cancelada).
* Observaciones: Comentarios adicionales.

**Justificación:** Permite registrar fechas clave, controlar el estado del pedido y mantener la trazabilidad de las transacciones.

---

#### DetalleDeCompra

**Descripción:** Entidad asociativa que vincula una compra con los productos adquiridos, incluyendo información específica de cada ítem.

**Atributos:**

* CodDetalleCompra: Identificador único del detalle.
* CantidadPedida: Cantidad solicitada.
* CantidadRecibida: Cantidad efectivamente recibida.
* PrecioUnitarioCompra: Precio por unidad.
* DescuentoCompra: Descuento aplicado.
* ImpuestosUnitariosCompra: Impuestos correspondientes.
* EstadoDetalleCompra: Estado del ítem.
* FechaRecepcionDetalle: Fecha de recepción del producto.
* FechaVencimiento: Fecha de vencimiento (si aplica).
* NroLote: Número de lote.
* SubtotalCompra: Total derivado del ítem.

**Justificación:** Permite controlar diferencias entre lo pedido y lo recibido, gestionar vencimientos, lotes e impuestos.

---

#### Producto

**Descripción:** Representa los bienes que la empresa compra y comercializa. Es el eje central del modelo.

**Atributos:**

* CodProducto: Identificador único.
* NombreProducto: Denominación comercial.
* CategoriaProducto: Clasificación general.
* MarcaProducto: Marca o fabricante.
* UnidadMedida: Unidad de referencia.
* PrecioVenta: Precio de venta actual.
* StockActual: Cantidad disponible.

**Justificación:** Incluye atributos descriptivos y operativos necesarios para las operaciones comerciales y el control de inventarios.

---

#### Cliente

**Descripción:** Representa a las personas o empresas que adquieren productos.

**Atributos:**

* CodCliente: Identificador único.
* NombreCliente: Nombre o razón social.
* DniCuit: Identificación tributaria.
* TipoCliente: Clasificación del cliente.
* TelefonoCliente: Contacto telefónico.
* EmailCliente: Correo electrónico.
* DireccionCliente: Dirección física.

**Justificación:** Permite identificar, clasificar y contactar a los clientes.

---

#### Venta

**Descripción:** Representa la transacción de venta de productos a un cliente.

**Atributos:**

* CodVenta: Identificador único.
* FechaVenta: Fecha de la operación.
* TipoComprobante: Documento emitido.
* FormaPago: Medio de pago utilizado.
* EstadoVenta: Estado de la venta.
* TotalVenta: Monto total.
* Observaciones: Notas adicionales.

**Justificación:** Documenta la operación comercial y permite el control de pagos y estados.

---

#### DetalleDeVenta

**Descripción:** Entidad asociativa que vincula una venta con los productos vendidos.

**Atributos:**

* CodDetalleVenta: Identificador único.
* CantidadVendida: Cantidad de unidades vendidas.
* PrecioUnitarioVenta: Precio por unidad.
* DescuentoVenta: Descuento aplicado.
* ImpuestosUnitariosVenta: Impuestos asociados.
* EstadoDetalleVenta: Estado del ítem.
* FechaEntregaVenta: Fecha de entrega.
* FechaGarantiaVencimiento: Fecha de vencimiento de garantía.
* SubtotalVenta: Total derivado del ítem.

**Justificación:** Permite conservar información histórica, gestionar devoluciones y controlar garantías.

---

### 4. Relaciones y Cardinalidades

Se definen las siguientes relaciones:

* Proveedor — Compra: Uno a muchos (1..N ↔ 1..1).
* Compra — DetalleDeCompra: Uno a muchos (1..1 ↔ 1..N).
* DetalleDeCompra — Producto: Uno a muchos (1..1 ↔ 1..N).
* Proveedor — Producto: Muchos a muchos, resuelta mediante entidad asociativa ProveedorProducto.
* Cliente — Venta: Uno a muchos (1..N ↔ 1..1).
* Venta — DetalleDeVenta: Uno a muchos (1..1 ↔ 1..N).
* DetalleDeVenta — Producto: Uno a muchos (1..1 ↔ 1..N).
* Categoría — Producto: Uno a muchos (1..N ↔ 1..N).

---

## 5. Modelo Lógico de la Base de Datos Comercial

### 5.1 Entidades Principales

El modelo lógico define las entidades con sus claves primarias y foráneas, permitiendo su implementación en un sistema gestor de bases de datos relacional. Las entidades principales son: Proveedor, Compra, DetalleDeCompra, Producto, Cliente, Venta y DetalleDeVenta.

### 5.2 Entidades Asociativas

#### ProveedorProducto

Entidad que resuelve la relación muchos a muchos entre proveedores y productos.

**Atributos:**

* CodProveedor (PK, FK).
* CodProducto (PK, FK).
* CodigoProveedorParaProducto.
* PrecioReferenciaProveedor.
* PlazoEntregaDias.
* CondicionesComerciales.
* Activo.

---

## Información del Proyecto

Este proyecto fue realizado de manera **individual**

**Autor:** Luca Di Gresia
**Institución:** Universidad Argentina de la Empresa (UADE)
**Asignatura:** Ingeniería de Datos I

El objetivo principal del trabajo es la **práctica y aplicación de conceptos de diseño de bases de datos**, abordando el modelado conceptual y lógico de un sistema de gestión comercial, en el marco académico de la asignatura.
