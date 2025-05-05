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

-- CREAR TABLA PRODUCTOS

CREATE TABLE Productos (
ID_Producto int NOT NULL auto_increment primary key,
Nombre varchar(100) NOT NULL,
Precio decimal NOT NULL,
Stock int NOT NULL,
ID_Proveedor int NOT NULL,
FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor));

-- CREAR TABLA EMPLEADOS

CREATE TABLE Empleados (
ID_Empleado int NOT NULL auto_increment primary key,
Apellido varchar(100) NOT NULL,
Nombre varchar(100) NOT NULL,
Cargo varchar(50) NOT NULL);

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

DROP TABLE if exists Detalle_Ventas;
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;

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