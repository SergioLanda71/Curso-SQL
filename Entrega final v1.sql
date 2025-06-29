# PROYECTO FONDA CAFE

-- CREAR LA BASE DE DATOS

CREATE database FondaCafe;

USE FondaCafe;

-- CREAR TABLA CLIENTES

CREATE TABLE Clientes (
ID_Cliente int NOT NULL auto_increment primary key,
Apellido varchar(100) NOT NULL,
Nombre varchar(100) NOT NULL,
Email varchar(100) NOT NULL,
Telefono varchar(20) NOT NULL);

-- CREAR TABLA PROVEEDORES

CREATE TABLE Proveedores (
ID_Proveedor int NOT NULL auto_increment primary key,
RazonSocial varchar(100) NOT NULL,
Email varchar(100) NOT NULL,
Telefono varchar(20) NOT NULL);

-- CREAR TABLA CARGOS

CREATE TABLE Cargos (
ID_Cargo int NOT NULL auto_increment primary key,
Cargo varchar(50) NOT NULL);

-- CREAR TABLA EMPLEADOS

CREATE TABLE Empleados (
ID_Empleado int NOT NULL auto_increment primary key,
Apellido varchar(100) NOT NULL,
Nombre varchar(100) NOT NULL,
ID_Cargo int NOT NULL,
FOREIGN KEY (ID_Cargo) REFERENCES Cargos (ID_Cargo));

-- CREAR TABLA CATEGORIAS_PRODUCTOS

CREATE TABLE Categorias_Productos (
ID_Categoria int NOT NULL auto_increment primary key,
Nombre varchar(100) NOT NULL
);

-- CREAR TABLA PRODUCTOS

CREATE TABLE Productos (
ID_Producto int NOT NULL auto_increment primary key,
Nombre varchar(100) NOT NULL,
Precio decimal NOT NULL,
Stock int NOT NULL,
ID_Proveedor int NOT NULL,
ID_Categoria int NOT NULL,
FOREIGN KEY (ID_Categoria) REFERENCES Categorias_Productos (ID_Categoria),
FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor));

-- CREAR TABLA METODOS_PAGO

CREATE TABLE Metodos_pago (
ID_Metodo int NOT NULL auto_increment primary key,
Metodo varchar(50) NOT NULL
);

-- CREAR TABLA VENTAS

CREATE TABLE Ventas (
ID_Venta int NOT NULL auto_increment primary key,
Fecha datetime NOT NULL,
ID_Cliente int NOT NULL,
ID_Empleado int NOT NULL,
ID_Metodo int NOT NULL,
Total decimal NOT NULL,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
FOREIGN KEY (ID_Metodo) REFERENCES Metodos_pago (ID_Metodo),
FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado));

-- CREAR TABLA DETALLE_VENTAS

CREATE TABLE Detalle_Ventas (
ID_Detalle int NOT NULL auto_increment primary key,
ID_Venta int NOT NULL,
ID_Producto int NOT NULL,
Cantidad int NOT NULL,
Subtotal decimal NOT NULL,
FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto));

-- CREAR TABLA DE RESERVAS

CREATE TABLE Reservas (
ID_Reserva int NOT NULL auto_increment primary key,
ID_Cliente int NOT NULL,
Fecha datetime NOT NULL,
Cantidad_Personas int NOT NULL,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

-- CREAR TABLA LOG MOVIMIENTOS STOCK

CREATE TABLE Log_Movimientos_Stock (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Cantidad INT,
    Motivo VARCHAR(100),
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);

-- INSERTAR CLIENTES

INSERT INTO Clientes (Apellido, Nombre, Email, Telefono) VALUES
('Lopez', 'Carlos', 'carlos@gmail.com', '221000876543'),
('Rodriguez', 'Maria', 'maria@hotmail.com', '1123456543'),
('Gomez', 'Laura', 'laura.gomez@gmail.com', '22133445566'),
('Fernandez', 'Luciano', 'luciano.fdz@yahoo.com', '1132245588'),
('Martinez', 'Camila', 'camimartinez@outlook.com', '22144556677'),
('Diaz', 'Federico', 'fede.diaz@gmail.com', '1122233344'),
('Perez', 'Julieta', 'juliperez@gmail.com', '2211234567'),
('Ramirez', 'Nicolas', 'nico.ramirez@hotmail.com', '1145678990'),
('Sosa', 'Andrea', 'andrea.sosa@gmail.com', '22199887766'),
('Torres', 'Valentin', 'valentin.torres@yahoo.com', '1133004455'),
('Ruiz', 'Agostina', 'agostina.ruiz@gmail.com', '22155667788'),
('Moreno', 'Joaquín', 'joaquin.moreno@hotmail.com', '1154321987'),
('Mendez', 'Sofia', 'sofia.mendez@yahoo.com', '22177889900'),
('Castro', 'Bruno', 'bruno.castro@gmail.com', '1122233445'),
('Ortiz', 'Milagros', 'milagros.ortiz@outlook.com', '22188997766'),
('Silva', 'Lautaro', 'lautaro.silva@gmail.com', '1166112233'),
('Romero', 'Victoria', 'victoria.romero@yahoo.com', '22111223344'),
('Alvarez', 'Mateo', 'mateo.alvarez@hotmail.com', '1144556677'),
('Acosta', 'Luna', 'luna.acosta@gmail.com', '22166778899'),
('Benitez', 'Tomas', 'tomas.benitez@outlook.com', '1177889900'),
('Medina', 'Clara', 'clara.medina@gmail.com', '22133446655'),
('Ponce', 'Benjamin', 'benjamin.ponce@hotmail.com', '1122114455'),
('Navarro', 'Renata', 'renata.navarro@yahoo.com', '22155664433'),
('Rojas', 'Thiago', 'thiago.rojas@gmail.com', '1133667788'),
('Vega', 'Martina', 'martina.vega@hotmail.com', '22199887755'),
('Herrera', 'Dante', 'dante.herrera@outlook.com', '1122558899'),
('Molina', 'Josefina', 'josefina.molina@gmail.com', '2211231234'),
('Campos', 'Gael', 'gael.campos@hotmail.com', '1133112200'),
('Aguirre', 'Emma', 'emma.aguirre@yahoo.com', '22133445522'),
('Flores', 'Luca', 'luca.flores@gmail.com', '1166778899');

SELECT * FROM Clientes;

-- INSERTAR PROVEEDORES

INSERT INTO Proveedores (RazonSocial, Email, Telefono) VALUES
('Distribuidora La Plata', 'contacto@laplatadistribuidora.com', '2214455667'),
('Sabores del Valle', 'ventas@saboresvalle.com.ar', '1133344556'),
('Lácteos del Sur', 'info@lacteossur.com', '2212233445'),
('Café Andino', 'pedidos@cafeandino.com', '1145677788'),
('Delicias Artesanales', 'delicias@gmail.com', '2219876543'),
('Verde Limón', 'contacto@verdelimon.com.ar', '2217654321'),
('Empaquetados LP', 'emp.lp@gmail.com', '2213322110'),
('Granos del Este', 'granoseste@hotmail.com', '1167894321'),
('Panificados San Juan', 'ventas@sanjuanpan.com.ar', '2214567890'),
('Molienda Santa Rosa', 'contacto@moliendasantarosa.com', '1123456789'),
('EcoEnvases SRL', 'info@ecoenvases.com', '2213344557'),
('Aceites del Sol', 'aceitesol@proveedores.com', '1144455566'),
('El Rey del Hielo', 'hielo.rey@hotmail.com', '2219988776'),
('Sierra Café', 'pedidos@sierracafe.com', '1133221100'),
('Pastas Buen Gusto', 'contacto@buengusto.com.ar', '2216655443'),
('Verduras del Parque', 'ventas@verdelparque.com', '1155554433'),
('Carnes del Oeste', 'carnesdoeste@gmail.com', '2211122334'),
('Bazar y Descartables La Costa', 'ventas@bazarlacosta.com', '1144005566'),
('Distribuidora Noroeste', 'contacto@noroestedistribuidora.com', '2217788990'),
('Mundo Té', 'info@mundote.com', '1122113344'),
('La Especiera', 'especias@laespeciera.com.ar', '2215566778'),
('Frutos Secos El Nogal', 'elnogal.sec@gmail.com', '1133445566'),
('Quesos Don Ernesto', 'donernesto@quesos.com', '2216677889'),
('Papelería Express', 'papexpress@gmail.com', '1166001122'),
('Tostaduría del Centro', 'tostaduria.centro@hotmail.com', '2212233110'),
('Limpieza Total', 'ventas@limpiezatotal.com.ar', '1144223366'),
('Cerveza Artesanal LP', 'info@cervezalp.com', '2219988770'),
('Distribuidora Aurora', 'aurora.proveedores@gmail.com', '1122554466');

SELECT * FROM Proveedores;

-- 	INSERTAR CARGOS

INSERT INTO Cargos (Cargo) VALUES
('Barista'),
('Encargado'),
('Cajero');

SELECT * FROM Cargos;

-- INSERTAR EMPLEADOS

INSERT INTO Empleados (Apellido, Nombre, ID_Cargo) VALUES
('Lopez', 'Martina', 1),
('Fernandez', 'Nicolas', 2),
('Garcia', 'Valeria', 3),
('Sanchez', 'Julian', 1),
('Romero', 'Camila', 2),
('Torres', 'Agustin', 3),
('Rojas', 'Luciana', 1),
('Acosta', 'Bruno', 2);

SELECT * FROM Empleados;

-- INSERTAR CATEGORIA PRODUCTOS

INSERT INTO Categorias_Productos (Nombre) VALUES
('Café calientes'),
('Café frios'),
('Dulce'),
('Salado'),
('Combos'),
('Bebidas Frías');

SELECT * FROM Categorias_Productos;

-- INSERTAR PRODUCTOS

INSERT INTO Productos (Nombre, Precio, Stock, ID_Proveedor, ID_Categoria) VALUES
('Cappuccino', 2100.00, 25, 1, 1),
('Flat White', 2200.00, 20, 1, 1),
('Latte', 1900.00, 15, 2, 1),
('Brownie', 1700.00, 18, 3, 3),
('Medialuna', 800.00, 40, 4, 3),
('Matcha Latte', 2300.00, 10, 1, 2),
('Limonada con menta', 1600.00, 12, 5, 6),
('Muffin de arándanos', 1900.00, 16, 3, 3),
('Espresso', 1500.00, 30, 1, 1),
('Macchiato', 1800.00, 22, 1, 1),
('Té Chai Latte', 2100.00, 14, 6, 2),
('Jugo de naranja', 1500.00, 10, 5, 6),
('Tostado de jamón y queso', 2400.00, 8, 7, 4),
('Croissant de almendras', 2000.00, 12, 4, 3),
('Bagel con salmón', 3200.00, 6, 8, 4),
('Iced Latte', 2000.00, 10, 2, 2),
('Cookies de chocolate', 1200.00, 20, 3, 3),
('Tarta de manzana', 2200.00, 9, 3, 3),
('Infusión de frutos rojos', 1400.00, 11, 6, 2),
('Agua mineral', 900.00, 30, 5, 6),
('Licuado de banana', 1700.00, 10, 5, 6),
('Licuado de frutilla', 1800.00, 10, 5, 6),
('Budín de limón', 1600.00, 15, 3, 3),
('Alfajor de maicena', 1000.00, 25, 3, 3),
('Ensalada de frutas', 2100.00, 7, 5, 5),
('Focaccia con tomates secos', 2500.00, 6, 7, 4),
('Empanada de carne', 950.00, 30, 7, 4),
('Tarta de verdura', 1800.00, 9, 7, 4),
('Smoothie de mango', 2000.00, 8, 5, 6);

SELECT * FROM Productos;

-- INSERTAR METODO DE PAGO

INSERT INTO Metodos_Pago (Metodo) VALUES
('Efectivo'),
('Débito'),
('QR');

SELECT * FROM Metodos_Pago;

-- INSERTAR VENTAS

INSERT INTO Ventas (Fecha, ID_Cliente, ID_Empleado, ID_Metodo, Total) VALUES
('2025-06-01 10:30:00',  1,  1, 1, 3200.00),
('2025-06-02 11:15:00',  2,  4, 2, 4000.00),
('2025-06-03 09:45:00',  3,  5, 3, 2500.00),
('2025-06-03 15:20:00',  4,  8, 1, 3800.00),
('2025-06-04 10:00:00',  5,  3, 3, 4100.00),
('2025-06-04 12:30:00',  6,  1, 2, 3000.00),
('2025-06-04 17:15:00',  7,  5, 1, 2950.00),
('2025-06-05 08:50:00',  8,  6, 1, 4200.00),
('2025-06-05 14:00:00',  9,  1, 1, 3300.00),
('2025-06-06 18:10:00',  1,  3, 2, 3650.00),
('2025-06-07 09:05:00',  2,  8, 3, 2900.00),
('2025-06-07 13:15:00',  3,  4, 3, 4400.00),
('2025-06-08 11:30:00',  4,  3, 2, 2850.00),
('2025-06-08 16:00:00',  5,  1, 1, 3700.00),
('2025-06-09 10:20:00',  6,  2, 1, 3100.00),
('2025-06-09 17:35:00',  7,  3, 1, 3990.00),
('2025-06-10 08:00:00',  8,  1, 1, 3120.00),
('2025-06-10 14:45:00',  9,  8, 2, 3450.00);

SELECT * FROM Ventas;

-- INSERTAR DETALLE DE VENTAS

INSERT INTO Detalle_Ventas (ID_Venta, ID_Producto, Cantidad, Subtotal) VALUES
(1, 1, 2, 3000.00),
(18, 3, 1, 1800.00),
(16, 2, 1, 2000.00),
(15, 1, 1, 1500.00),
(14, 3, 1, 1800.00),
(14, 2, 2, 4000.00),
(4, 4, 1, 2100.00),
(3, 5, 1, 2200.00),
(5, 6, 1, 1900.00),
(6, 7, 2, 3400.00),
(8, 1, 1, 1500.00),
(9, 2, 1, 2000.00),
(10, 3, 1, 1800.00),
(11, 4, 1, 2100.00),
(12, 5, 2, 4400.00),
(13, 6, 1, 1900.00),
(14, 7, 2, 3400.00),
(15, 8, 1, 1600.00),
(16, 2, 1, 2000.00);

SELECT * FROM Detalle_Ventas;

-- INSERTAR RESERVAS

INSERT INTO Reservas (ID_Cliente, Fecha, Cantidad_Personas) VALUES
(1, '2025-06-06 17:00:00', 2),
(2, '2025-06-07 10:00:00', 1),
(3, '2025-06-08 09:30:00', 3),
(4, '2025-06-08 11:00:00', 2),
(5, '2025-06-08 15:00:00', 1),
(6, '2025-06-09 10:00:00', 4),
(7, '2025-06-09 12:30:00', 2),
(8, '2025-06-09 17:45:00', 1),
(9, '2025-06-10 08:15:00', 2),
(10, '2025-06-10 13:00:00', 3),
(1, '2025-06-11 09:00:00', 2),
(2, '2025-06-11 10:45:00', 1),
(3, '2025-06-11 16:30:00', 2),
(4, '2025-06-12 11:00:00', 1),
(5, '2025-06-12 14:15:00', 4),
(6, '2025-06-12 18:00:00', 2),
(7, '2025-06-13 09:30:00', 1),
(8, '2025-06-13 12:45:00', 2),
(9, '2025-06-13 16:10:00', 3),
(10, '2025-06-14 10:20:00', 2);

SELECT * FROM Reservas;

-- INSERTAR LOG MOVINIENTOS STOCK

INSERT INTO Log_Movimientos_Stock (ID_Producto, Cantidad, Motivo) VALUES
(1, 2, 'Venta'),
(1, 3, 'Ajuste por stock real'),
(2, 1, 'Venta'),
(2, 5, 'Reposición'),
(3, 2, 'Venta'),
(3, 1, 'Producto dañado'),
(4, 4, 'Venta'),
(4, 2, 'Reposición'),
(5, 3, 'Venta'),
(1, 1, 'Ajuste inventario'),
(2, 2, 'Venta especial'),
(3, 3, 'Reposición urgente'),
(4, 1, 'Promoción'),
(5, 2, 'Venta'),
(1, 2, 'Ajuste por error de carga');

SELECT * FROM Log_Movimientos_Stock;

-- VISTAS

-- CREAR VISTA VENTAS DIARIAS

CREATE VIEW vista_ventas_diarias AS
SELECT DATE(Fecha) AS fecha, COUNT(ID_Venta) AS cantidad_ventas, SUM(Total) AS total_diario
FROM Ventas
GROUP BY DATE(Fecha);

-- CREAR VISTA PRODUCTOS MAS VENDIDOS

CREATE VIEW vista_productos_mas_vendidos AS
SELECT p.Nombre AS producto, SUM(dv.Cantidad) AS cantidad_vendida
FROM Detalle_Ventas dv
JOIN Productos p ON dv.ID_Producto = p.ID_Producto
GROUP BY p.Nombre
ORDER BY cantidad_vendida DESC;

-- CREAR VISTA VENTAS POR CLIENTE

CREATE VIEW vista_ventas_por_cliente AS
SELECT c.Nombre AS cliente, COUNT(v.ID_Venta) AS cantidad_compras, SUM(v.Total) AS monto_total
FROM Ventas v
JOIN Clientes c ON v.ID_Cliente = c.ID_Cliente
GROUP BY c.Nombre
ORDER BY monto_total DESC;

-- CREAR VISTA RESUMEN DE RESERVAS

CREATE VIEW vista_resumen_reservas AS
SELECT 
  r.ID_Reserva,
  c.Nombre AS Cliente,
  r.Fecha,
  r.Cantidad_Personas
FROM Reservas r
JOIN Clientes c ON r.ID_Cliente = c.ID_Cliente
ORDER BY r.Fecha;

-- CREAR VISTA STOCK ACTUAL

CREATE VIEW vista_stock_actual AS
SELECT 
  p.ID_Producto,
  p.Nombre,
  p.Stock,
  c.Nombre AS Categoria,
  pr.RazonSocial AS Proveedor
FROM Productos p
JOIN Categorias_Productos c ON p.ID_Categoria = c.ID_Categoria
JOIN Proveedores pr ON p.ID_Proveedor = pr.ID_Proveedor;

-- CREAR VISTA VENTAS POR METODO DE PAGO

CREATE VIEW vista_ventas_con_metodo_pago AS
SELECT 
  v.ID_Venta,
  v.Fecha,
  c.Nombre AS Cliente,
  m.Metodo AS Metodo_Pago,
  v.Total
FROM Ventas v
JOIN Clientes c ON v.ID_Cliente = c.ID_Cliente
JOIN Metodos_Pago m ON v.ID_Metodo = m.ID_Metodo
ORDER BY v.Fecha DESC;

-- FUNCIONES

-- CREAR FUNCION CALCULAR SUBTOTAL

DELIMITER $$
CREATE FUNCTION calcular_subtotal(cantidad INT, precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN Cantidad * Precio;
END$$
DELIMITER ;

-- CREAR FUNCION TOTAL DE VENTA ESPECIFICA

DELIMITER $$
CREATE FUNCTION obtener_total_venta(venta_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(Subtotal) INTO total
  FROM Detalle_Ventas
  WHERE ID_Venta = venta_id;
  RETURN total;
END$$
DELIMITER ;

-- CREAR FUNCION STOCK ACTUAL PRODUCTO

DELIMITER $$
CREATE FUNCTION stock_actual_producto(prod_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_stock INT;
  SELECT Stock INTO v_stock FROM Productos WHERE ID_Producto = prod_id;
  RETURN v_stock;
END$$
DELIMITER ;

-- STORED PROCEDURE

-- CREAR STORE PROCEDURE REGISTAR VENTA

DELIMITER $$
CREATE PROCEDURE registrar_venta(
  IN p_fecha DATETIME,
  IN p_id_cliente INT,
  IN p_id_empleado INT,
  OUT p_id_venta INT
)
BEGIN
  INSERT INTO Ventas (Fecha, ID_Cliente, ID_Empleado, Total)
  VALUES (p_fecha, p_id_cliente, p_id_empleado, 0);
  
  SET p_id_venta = LAST_INSERT_ID();
END$$
DELIMITER ;

-- CREAR STORE PROCEDURE AGREGAR PRODUCTO A VENTA

DELIMITER $$
CREATE PROCEDURE agregar_producto_a_venta(
  IN p_id_venta INT,
  IN p_id_producto INT,
  IN p_cantidad INT
)
BEGIN
  DECLARE v_precio DECIMAL(10,2);
  DECLARE v_subtotal DECIMAL(10,2);

  SELECT Precio INTO v_precio FROM Productos WHERE ID_Producto = p_id_producto;
  SET v_subtotal = v_precio * p_cantidad;

  INSERT INTO Detalle_Ventas (ID_Venta, ID_Producto, Cantidad, Subtotal)
  VALUES (p_id_venta, p_id_producto, p_cantidad, v_subtotal);

  -- Actualiza el total de la venta
  UPDATE Ventas
  SET Total = (SELECT SUM(Subtotal) FROM Detalle_Ventas WHERE ID_Venta = p_id_venta)
  WHERE ID_Venta = p_id_venta;
  
  -- Descuenta del stock
  UPDATE Productos
  SET Stock = Stock - p_cantidad
  WHERE ID_Producto = p_id_producto;
END$$
DELIMITER ;

-- CREAR STORE PROCEDURE REPONER STOCK

DELIMITER $$
CREATE PROCEDURE reponer_stock(
  IN p_id_producto INT,
  IN p_cantidad INT
)
BEGIN
  UPDATE Productos
  SET Stock = Stock + p_cantidad
  WHERE ID_Producto = p_id_producto;
END$$
DELIMITER ;

-- TRIGGER

-- CREAR TRIGGER ACTUALIZAR STOCK ANTES DE VENTA

DELIMITER $$
CREATE TRIGGER actualizar_stock_antes_de_venta
BEFORE INSERT ON Detalle_Ventas
FOR EACH ROW
BEGIN
  DECLARE stock_actual INT;
  SELECT Stock INTO stock_actual FROM Productos WHERE ID_Producto = NEW.ID_Producto;

  IF stock_actual < NEW.Cantidad THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
  END IF;
END$$
DELIMITER ;

-- CREAR TRIGGER LOG BAJAS STOCK

DELIMITER $$
CREATE TRIGGER log_bajas_stock
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
  IF OLD.Stock > NEW.Stock THEN
    INSERT INTO Log_Movimientos_Stock (ID_Producto, Cantidad, Motivo)
    VALUES (NEW.ID_Producto, OLD.Stock - NEW.Stock, 'Venta o ajuste de stock');
  END IF;
END$$
DELIMITER ;

-- CONSULTAS DE PRUEBA PARA LAS VISTAS

-- VISTA VENTAS DIARIAS

SELECT fecha, cantidad_ventas, total_diario
FROM vista_ventas_diarias
WHERE MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE())
ORDER BY total_diario DESC
LIMIT 5;

-- VISTA PRODUCTOS MAS VENDIDOS

SELECT producto, cantidad_vendida
FROM vista_productos_mas_vendidos
WHERE cantidad_vendida > (
    SELECT AVG(cantidad_vendida) FROM vista_productos_mas_vendidos
)
ORDER BY cantidad_vendida DESC
LIMIT 3;

-- VISTA VENTAS POR CLIENTE

SELECT cliente, cantidad_compras, monto_total
FROM vista_ventas_por_cliente
WHERE cantidad_compras > 2 AND monto_total > 10000
ORDER BY monto_total DESC;

-- VISTA RESUMEN RESERVAS

SELECT ID_Reserva, Cliente, Fecha, Cantidad_Personas
FROM vista_resumen_reservas
WHERE Fecha BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
  AND Cantidad_Personas > 3
ORDER BY Fecha;

-- VISTA STOCK ACTUAL

SELECT Proveedor, COUNT(*) AS productos_bajo_stock
FROM vista_stock_actual
WHERE Stock < 10
GROUP BY Proveedor
ORDER BY productos_bajo_stock DESC;

-- VISTA METODOS DE PAGO

SELECT Metodo_Pago, COUNT(*) AS cantidad_ventas, SUM(Total) AS total_recaudado
FROM vista_ventas_con_metodo_pago
WHERE Fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY Metodo_Pago
ORDER BY total_recaudado DESC;

-- CONSULTAS DE PRUEBA PARA LAS FUNCIONES

-- FUNCION CALCULAR SUBTOTAL

SELECT 
  dv.ID_Venta,
  p.Nombre AS producto,
  dv.Cantidad,
  p.Precio,
  calcular_subtotal(dv.Cantidad, p.Precio) AS subtotal_calculado
FROM Detalle_Ventas dv
JOIN Productos p ON dv.ID_Producto = p.ID_Producto
WHERE dv.ID_Venta = (
  SELECT MAX(ID_Venta) FROM Ventas
);

-- FUNCION OBTENER TOTAL VENTA

SELECT 
  v.ID_Venta,
  v.Total AS total_registrado,
  obtener_total_venta(v.ID_Venta) AS total_funcion,
  (v.Total - obtener_total_venta(v.ID_Venta)) AS diferencia
FROM Ventas v
ORDER BY v.Fecha DESC
LIMIT 5;

-- FUNCION STOCK ACTUAL PRODUCTO

SELECT 
  p.ID_Producto,
  p.Nombre,
  stock_actual_producto(p.ID_Producto) AS stock_actual
FROM Productos p
WHERE stock_actual_producto(p.ID_Producto) < 10
ORDER BY stock_actual ASC;

-- CONSULTAS DE PRUEBA PARA LOS STORED PROCEDURE

-- RESGISTRAR VENTA

-- 1. Declarar variable para capturar el ID de la nueva venta
SET @nuevo_id_venta = 0;

-- 2. Ejecutar el procedimiento
CALL registrar_venta(NOW(), 1, 2, @nuevo_id_venta);

-- 3. Verificar que la venta fue registrada
SELECT * FROM Ventas WHERE ID_Venta = @nuevo_id_venta;

-- AGREGAR PRODUCTO A VENTA

-- 1. Ver stock antes de agregar
SELECT Nombre, Stock FROM Productos WHERE ID_Producto = 3;

-- 2. Agregar producto a la venta recientemente creada
CALL agregar_producto_a_venta(@nuevo_id_venta, 3, 2);

-- 3. Verificar detalle de la venta
SELECT * FROM Detalle_Ventas WHERE ID_Venta = @nuevo_id_venta;

-- 4. Verificar que se actualizó el total en la tabla Ventas
SELECT Total FROM Ventas WHERE ID_Venta = @nuevo_id_venta;

-- 5. Verificar que se descontó el stock del producto
SELECT Nombre, Stock FROM Productos WHERE ID_Producto = 3;

-- REPONER STOCK

-- 1. Verificar stock antes de reponer
SELECT Nombre, Stock FROM Productos WHERE ID_Producto = 3;

-- 2. Ejecutar la reposición
CALL reponer_stock(3, 10);

-- 3. Verificar stock actualizado
SELECT Nombre, Stock FROM Productos WHERE ID_Producto = 3;

