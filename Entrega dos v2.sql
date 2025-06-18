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

-- CREAR TABLA PRODUCTOS

CREATE TABLE Productos (
ID_Producto int NOT NULL auto_increment primary key,
Nombre varchar(100) NOT NULL,
Precio decimal NOT NULL,
Stock int NOT NULL,
ID_Proveedor int NOT NULL,
FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor));

-- CREAR TABLA VENTAS

CREATE TABLE Ventas (
ID_Venta int NOT NULL auto_increment primary key,
Fecha datetime NOT NULL,
ID_Cliente int NOT NULL,
ID_Empleado int NOT NULL,
Total decimal NOT NULL,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
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

-- CREAR TABLA CATEGORIAS_PRODUCTOS

CREATE TABLE Categorias_Productos (
ID_Categoria int NOT NULL auto_increment primary key,
Nombre varchar(100) NOT NULL
);

ALTER TABLE Productos
ADD ID_Categoria int,
ADD FOREIGN KEY (ID_Categoria) REFERENCES Categorias_Productos (ID_Categoria);

-- CREAR TABLA METODOS_PAGO
CREATE TABLE Metodos_pago (
ID_Metodo int NOT NULL auto_increment primary key,
Metodo varchar(50) NOT NULL
);

ALTER TABLE Ventas
ADD ID_Metodo int,
ADD FOREIGN KEY (ID_Metodo) REFERENCES Metodos_Pago (ID_Metodo);

-- CREAR TABLA DE RESERVAS

CREATE TABLE Reservas (
ID_Reserva int NOT NULL auto_increment primary key,
ID_Cliente int NOT NULL,
Fecha datetime NOT NULL,
Cantidad_Personas int NOT NULL,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
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
('Torres', 'Valentin', 'valentin.torres@yahoo.com', '1133004455');

SELECT * FROM Clientes;

-- INSERTAR PROVEEDORES

INSERT INTO Proveedores (RazonSocial, Email, Telefono) values
('Distribuidora La Plata', 'contacto@laplatadistribuidora.com', '2214455667'),
('Sabores del Valle', 'ventas@saboresvalle.com.ar', '1133344556'),
('Lácteos del Sur', 'info@lacteossur.com', '2212233445'),
('Café Andino', 'pedidos@cafeandino.com', '1145677788'),
('Delicias Artesanales', 'delicias@gmail.com', '2219876543'),
('Verde Limón', 'contacto@verdelimon.com.ar', '2217654321'),
('Empaquetados LP', 'emp.lp@gmail.com', '2213322110'),
('Granos del Este', 'granoseste@hotmail.com', '1167894321');

SELECT * FROM Proveedores;

-- 	INSERTAR CARGOS
INSERT INTO Cargos (Cargo) VALUES
('Barista'),
('Encargado'),
('Cajero');

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

-- INSERTAR PRODUCTOS

INSERT INTO Productos (Nombre, Precio, Stock, ID_Proveedor) VALUES
('Cappuccino', 2100.00, 25, 1),
('Flat White', 2200.00, 20, 1),
('Té Chai', 1900.00, 15, 2),
('Brownie', 1700.00, 18, 3),
('Medialuna', 800.00, 40, 4),
('Matcha Latte', 2300.00, 10, 1),
('Limonada con menta', 1600.00, 12, 5),
('Muffin de arándanos', 1900.00, 16, 3);

-- INSERTAR VENTAS

INSERT INTO Ventas (Fecha, ID_Cliente, ID_Empleado, Total) VALUES
('2025-06-01 10:30:00',  1,  9, 3200.00),
('2025-06-02 11:15:00',  2,  10, 4000.00),
('2025-06-03 09:45:00',  3,  11, 2500.00),
('2025-06-03 15:20:00',  4,  12, 3800.00),
('2025-06-04 10:00:00',  5,  13, 4100.00),
('2025-06-04 12:30:00',  6,  14, 3000.00),
('2025-06-04 17:15:00',  7,  15, 2950.00),
('2025-06-05 08:50:00',  8,  16, 4200.00),
('2025-06-05 14:00:00',  9,  10, 3300.00),
('2025-06-06 18:10:00',  1,  13, 3650.00),
('2025-06-07 09:05:00',  2,  9, 2900.00),
('2025-06-07 13:15:00',  3,  14, 4400.00),
('2025-06-08 11:30:00',  4,  13, 2850.00),
('2025-06-08 16:00:00',  5,  11, 3700.00),
('2025-06-09 10:20:00',  6,  12, 3100.00),
('2025-06-09 17:35:00',  7,  13, 3990.00),
('2025-06-10 08:00:00',  8,  10, 3120.00),
('2025-06-10 14:45:00',  9,  9, 3450.00);

SELECT * FROM Empleados;

-- INSERTAR DETALLE DE VENTAS

INSERT INTO Detalle_Ventas (ID_Venta, ID_Producto, Cantidad, Subtotal) VALUES
(59, 1, 2, 3000.00),
(60, 3, 1, 1800.00),
(61, 2, 1, 2000.00),
(62, 1, 1, 1500.00),
(63, 3, 1, 1800.00),
(64, 2, 2, 4000.00),
(65, 4, 1, 2100.00),
(66, 5, 1, 2200.00),
(67, 6, 1, 1900.00),
(67, 7, 2, 3400.00),
(68, 1, 1, 1500.00),
(69, 2, 1, 2000.00),
(70, 3, 1, 1800.00),
(71, 4, 1, 2100.00),
(72, 5, 2, 4400.00),
(73, 6, 1, 1900.00),
(74, 7, 2, 3400.00),
(75, 8, 1, 1600.00),
(76, 2, 1, 2000.00);

SELECT * FROM Ventas;

-- INSERTAR CATEGORIA PRODUCTOS

INSERT INTO Categorias_Productos (Nombre) VALUES
('Café calientes'),
('Café frios'),
('Dulce'),
('Salado'),
('Combos'),
('Bebidas Frías');

-- INSERTAR METODO DE PAGO

INSERT INTO Metodos_Pago (Metodo) VALUES
('Efectivo'),
('Débito'),
('QR');

SELECT * FROM Clientes;

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

-- CREAR TABLA LOG MOVIMIENTOS STOCK

CREATE TABLE Log_Movimientos_Stock (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Cantidad INT,
    Motivo VARCHAR(100),
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);

SELECT * FROM Productos;

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
  pr.Nombre AS Proveedor
FROM Productos p
JOIN Categorias_Productos c ON p.ID_Categoria = c.ID_Categoria
JOIN Proveedores pr ON p.ID_Proveedor = pr.ID_Proveedor;

DROP VIEW IF EXISTS vista_stock_actual;

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
  RETURN cantidad * precio;
END$$

DROP FUNCTION IF EXISTS calcular_subtotal;

CREATE FUNCTION calcular_subtotal(cantidad INT, precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN cantidad * precio;
END$$

DROP FUNCTION IF EXISTS calcular_subtotal

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
  DECLARE stock INT;
  SELECT Stock INTO stock FROM Productos WHERE ID_Producto = prod_id;
  RETURN stock;
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
  SET v_subtotal = p_precio * p_cantidad;

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

INSERT INTO Empleados (Apellido, Nombre, ID_Cargo) VALUES
('Mendez', 'Sofia', 1),
('Pereyra', 'Lucas', 2),
('Alvarez', 'Julieta', 3),
('Silva', 'Mateo', 1),
('Navarro', 'Malena', 2),
('Gonzalez', 'Tomas', 3),
('Vega', 'Florencia', 1),
('Moreno', 'Franco', 2),
('Ibarra', 'Cecilia', 3),
('Benitez', 'Maximiliano', 1),
('Reyes', 'Martina', 2),
('Ortega', 'Joaquin', 3),
('Castro', 'Micaela', 1),
('Dominguez', 'Santiago', 2),
('Cabrera', 'Ayelen', 3);

USE FondaCafe;

INSERT INTO Empleados (Apellido, Nombre, ID_Cargo) VALUES
('Mendez', 'Sofia', 1),
('Pereyra', 'Lucas', 2),
('Alvarez', 'Julieta', 3),
('Silva', 'Mateo', 1),
('Navarro', 'Malena', 2),
('Gonzalez', 'Tomas', 3),
('Vega', 'Florencia', 1),
('Moreno', 'Franco', 2),
('Ibarra', 'Cecilia', 3),
('Benitez', 'Maximiliano', 1),
('Reyes', 'Martina', 2),
('Ortega', 'Joaquin', 3),
('Castro', 'Micaela', 1),
('Dominguez', 'Santiago', 2),
('Cabrera', 'Ayelen', 3);

SELECT * FROM Empleados;

-- ID_Venta original 59 -> nuevo 1
UPDATE Detalle_Ventas SET ID_Venta = 1 WHERE ID_Venta = 59 AND ID_Producto = 1 AND Cantidad = 2 AND Subtotal = 3000.00;

-- 60 -> 2
UPDATE Detalle_Ventas SET ID_Venta = 2 WHERE ID_Venta = 60 AND ID_Producto = 3 AND Cantidad = 1 AND Subtotal = 1800.00;

-- 61 -> 3
UPDATE Detalle_Ventas SET ID_Venta = 3 WHERE ID_Venta = 61 AND ID_Producto = 2 AND Cantidad = 1 AND Subtotal = 2000.00;

-- 62 -> 4
UPDATE Detalle_Ventas SET ID_Venta = 4 WHERE ID_Venta = 62 AND ID_Producto = 1 AND Cantidad = 1 AND Subtotal = 1500.00;

-- 63 -> 5
UPDATE Detalle_Ventas SET ID_Venta = 5 WHERE ID_Venta = 63 AND ID_Producto = 3 AND Cantidad = 1 AND Subtotal = 1800.00;

-- 64 -> 6
UPDATE Detalle_Ventas SET ID_Venta = 6 WHERE ID_Venta = 64 AND ID_Producto = 2 AND Cantidad = 2 AND Subtotal = 4000.00;

-- 65 -> 7
UPDATE Detalle_Ventas SET ID_Venta = 7 WHERE ID_Venta = 65 AND ID_Producto = 4 AND Cantidad = 1 AND Subtotal = 2100.00;

-- 66 -> 8
UPDATE Detalle_Ventas SET ID_Venta = 8 WHERE ID_Venta = 66 AND ID_Producto = 5 AND Cantidad = 1 AND Subtotal = 2200.00;

-- 67 -> 9 (dos productos en la misma venta)
UPDATE Detalle_Ventas SET ID_Venta = 9 WHERE ID_Venta = 67 AND ID_Producto = 6 AND Cantidad = 1 AND Subtotal = 1900.00;
UPDATE Detalle_Ventas SET ID_Venta = 9 WHERE ID_Venta = 67 AND ID_Producto = 7 AND Cantidad = 2 AND Subtotal = 3400.00;

-- 68 -> 10
UPDATE Detalle_Ventas SET ID_Venta = 10 WHERE ID_Venta = 68 AND ID_Producto = 1 AND Cantidad = 1 AND Subtotal = 1500.00;

-- 69 -> 11
UPDATE Detalle_Ventas SET ID_Venta = 11 WHERE ID_Venta = 69 AND ID_Producto = 2 AND Cantidad = 1 AND Subtotal = 2000.00;

-- 70 -> 12
UPDATE Detalle_Ventas SET ID_Venta = 12 WHERE ID_Venta = 70 AND ID_Producto = 3 AND Cantidad = 1 AND Subtotal = 1800.00;

-- 71 -> 13
UPDATE Detalle_Ventas SET ID_Venta = 13 WHERE ID_Venta = 71 AND ID_Producto = 4 AND Cantidad = 1 AND Subtotal = 2100.00;

-- 72 -> 14
UPDATE Detalle_Ventas SET ID_Venta = 14 WHERE ID_Venta = 72 AND ID_Producto = 5 AND Cantidad = 2 AND Subtotal = 4400.00;

-- 73 -> 15
UPDATE Detalle_Ventas SET ID_Venta = 15 WHERE ID_Venta = 73 AND ID_Producto = 6 AND Cantidad = 1 AND Subtotal = 1900.00;

-- 74 -> 16
UPDATE Detalle_Ventas SET ID_Venta = 16 WHERE ID_Venta = 74 AND ID_Producto = 7 AND Cantidad = 2 AND Subtotal = 3400.00;

-- 75 -> 17
UPDATE Detalle_Ventas SET ID_Venta = 17 WHERE ID_Venta = 75 AND ID_Producto = 8 AND Cantidad = 1 AND Subtotal = 1600.00;

-- 76 -> 18
UPDATE Detalle_Ventas SET ID_Venta = 18 WHERE ID_Venta = 76 AND ID_Producto = 2 AND Cantidad = 1 AND Subtotal = 2000.00;

SELECT * FROM Ventas;

UPDATE Detalle_Ventas SET ID_Venta = 1059 WHERE ID_Venta = 59;
UPDATE Detalle_Ventas SET ID_Venta = 1060 WHERE ID_Venta = 60;
UPDATE Detalle_Ventas SET ID_Venta = 1061 WHERE ID_Venta = 61;
UPDATE Detalle_Ventas SET ID_Venta = 1062 WHERE ID_Venta = 62;
UPDATE Detalle_Ventas SET ID_Venta = 1063 WHERE ID_Venta = 63;
UPDATE Detalle_Ventas SET ID_Venta = 1064 WHERE ID_Venta = 64;
UPDATE Detalle_Ventas SET ID_Venta = 1065 WHERE ID_Venta = 65;
UPDATE Detalle_Ventas SET ID_Venta = 1066 WHERE ID_Venta = 66;
UPDATE Detalle_Ventas SET ID_Venta = 1067 WHERE ID_Venta = 67;
UPDATE Detalle_Ventas SET ID_Venta = 1068 WHERE ID_Venta = 68;
UPDATE Detalle_Ventas SET ID_Venta = 1069 WHERE ID_Venta = 69;
UPDATE Detalle_Ventas SET ID_Venta = 1070 WHERE ID_Venta = 70;
UPDATE Detalle_Ventas SET ID_Venta = 1071 WHERE ID_Venta = 71;
UPDATE Detalle_Ventas SET ID_Venta = 1072 WHERE ID_Venta = 72;
UPDATE Detalle_Ventas SET ID_Venta = 1073 WHERE ID_Venta = 73;
UPDATE Detalle_Ventas SET ID_Venta = 1074 WHERE ID_Venta = 74;
UPDATE Detalle_Ventas SET ID_Venta = 1075 WHERE ID_Venta = 75;
UPDATE Detalle_Ventas SET ID_Venta = 1076 WHERE ID_Venta = 76;

DELETE FROM Detalle_Ventas
WHERE ID_Venta BETWEEN 59 AND 76;

SELECT * FROM Detalle_Ventas;

INSERT INTO Detalle_Ventas (ID_Venta, ID_Producto, Cantidad, Subtotal) VALUES
(1, 1, 2, 3000.00),
(2, 3, 1, 1800.00),
(3, 2, 1, 2000.00),
(4, 1, 1, 1500.00),
(5, 3, 1, 1800.00),
(6, 2, 2, 4000.00),
(7, 4, 1, 2100.00),
(8, 5, 1, 2200.00),
(9, 6, 1, 1900.00),
(10, 7, 2, 3400.00),
(11, 1, 1, 1500.00),
(12, 2, 1, 2000.00),
(13, 3, 1, 1800.00),
(14, 4, 1, 2100.00),
(15, 5, 2, 4400.00),
(16, 6, 1, 1900.00),
(17, 7, 2, 3400.00),
(18, 2, 1, 2000.00);

SELECT * FROM Ventas;

UPDATE Ventas SET ID_Venta = 1 WHERE ID_Venta = 59;
UPDATE Ventas SET ID_Venta = 2 WHERE ID_Venta = 60;
UPDATE Ventas SET ID_Venta = 3 WHERE ID_Venta = 61;
UPDATE Ventas SET ID_Venta = 4 WHERE ID_Venta = 62;
UPDATE Ventas SET ID_Venta = 5 WHERE ID_Venta = 63;
UPDATE Ventas SET ID_Venta = 6 WHERE ID_Venta = 64;
UPDATE Ventas SET ID_Venta = 7 WHERE ID_Venta = 65;
UPDATE Ventas SET ID_Venta = 8 WHERE ID_Venta = 66;
UPDATE Ventas SET ID_Venta = 9 WHERE ID_Venta = 67;
UPDATE Ventas SET ID_Venta = 10 WHERE ID_Venta = 68;
UPDATE Ventas SET ID_Venta = 11 WHERE ID_Venta = 69;
UPDATE Ventas SET ID_Venta = 12 WHERE ID_Venta = 70;
UPDATE Ventas SET ID_Venta = 13 WHERE ID_Venta = 71;
UPDATE Ventas SET ID_Venta = 14 WHERE ID_Venta = 72;
UPDATE Ventas SET ID_Venta = 15 WHERE ID_Venta = 73;
UPDATE Ventas SET ID_Venta = 16 WHERE ID_Venta = 74;
UPDATE Ventas SET ID_Venta = 17 WHERE ID_Venta = 75;
UPDATE Ventas SET ID_Venta = 18 WHERE ID_Venta = 76;

SELECT * FROM Ventas;

