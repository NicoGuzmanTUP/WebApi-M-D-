use Facturacion

alter table Articulos
drop column es_activo

CREATE PROCEDURE OBTENER_ARTICULOS
AS
BEGIN
SELECT * FROM Articulos
END

CREATE PROCEDURE AGREGAR_ARTICULOS
@nombre varchar(50),
@precio money,
@descripcion varchar(50)
AS
BEGIN
INSERT INTO Articulos(nombre, precio_unitario, descripcion)
VALUES(@nombre, @precio, @descripcion)
END

CREATE PROCEDURE ELIMINAR_PRODUCTO
@id int
AS
BEGIN
DELETE FROM Articulos WHERE id_articulo = @id
END


CREATE PROCEDURE BUSCAR_ARTICULO
@id int
AS
BEGIN
SELECT * FROM Articulos WHERE id_articulo = @id
END

CREATE PROCEDURE CONSULTAR_FACTURAS
AS
BEGIN
SELECT * FROM facturas
END

CREATE PROCEDURE CONSULTAR_POR_FECHA_FP
@fecha datetime,
@forma_pago int
AS
BEGIN
SELECT * FROM facturas WHERE fecha = @fecha AND forma_pago = @forma_pago
END

--SELECT * FROM facturas WHERE fecha = '2024-08-12' AND forma_pago = 1

CREATE PROCEDURE INSERTAR_FACTURA
@nro int,
@fecha datetime,
@forma_pago int,
@cliente VARCHAR(50)
AS
BEGIN
INSERT INTO Facturas (nroFactura, fecha, cliente, forma_pago) VALUES (@nro, @fecha, @forma_pago, @cliente)
END

CREATE PROCEDURE ACTUALIZAR_FACTURA
@nro int,
@fecha datetime,
@forma_pago int,
@cliente VARCHAR(50)
AS
BEGIN
UPDATE Facturas SET nroFactura = @nro, fecha = @fecha, cliente = @cliente, forma_pago = @forma_pago WHERE nroFactura = @nro
END