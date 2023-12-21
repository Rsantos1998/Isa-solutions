
--USE master
--DROP DATABASE Isa_soltuions
GO

CREATE DATABASE Isa_soltuions
GO

USE Isa_soltuions
GO

-- Crear la tabla ARTICULOS
CREATE TABLE ARTICULOS (
    Id INT IDENTITY(1,1) ,
    Codigo VARCHAR(20) NOT NULL PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL DEFAULT '-',
    Precio FLOAT NOT NULL DEFAULT 0,
	Categoria INT NOT NULL DEFAULT 0,
	Suplidor INT NOT NULL DEFAULT 0
	);

-- Crear la tabla CATEGORIAS
CREATE TABLE CATEGORIAS (
    Id INT IDENTITY(1,1) ,
	Codigo INT NOT NULL PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL DEFAULT '-'
	);

-- Crear la tabla SUPLIDORES
CREATE TABLE SUPLIDORES (
    Id INT IDENTITY(1,1) ,
    RNC INT DEFAULT 0 PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL DEFAULT '-',
    Direccion VARCHAR(50) NOT NULL DEFAULT '-',
    Email VARCHAR(50) NOT NULL DEFAULT '-'
	);

-- Crear la tabla CLIENTES
CREATE TABLE CLIENTES (
    Id INT IDENTITY(1,1) ,
    Codigo VARCHAR(15) NOT NULL DEFAULT '-' PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL DEFAULT '-',
    Direccion VARCHAR(50) NOT NULL DEFAULT '-',
    Telefono VARCHAR(15) NOT NULL DEFAULT '-'
	);

-- Crear la tabla FACTURAS
CREATE TABLE FACTURAS (
    Id INT IDENTITY(1,1) ,
    NoFactura VARCHAR(10)  NOT NULL PRIMARY KEY,
    Fecha TIMESTAMP,
    Total_art INT NOT NULL,
    Total_efectivo FLOAT NOT NULL
	);

CREATE TABLE factura_clientes (
    Id INT IDENTITY(1,1),
    NoFactura VARCHAR(10) NOT NULL PRIMARY KEY,
    CdClientes VARCHAR(15) NOT NULL    
	);
		
CREATE TABLE detalle_articulos_factura (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CdArticulos VARCHAR(20) NOT NULL,
    Precio FLOAT NOT NULL,
    Cantidad FLOAT NOT NULL,
	Total FLOAT NOT NULL,
    NoFactura VARCHAR(10) NOT NULL
	);
	

ALTER TABLE ARTICULOS
	ADD
		FOREIGN KEY (Categoria) REFERENCES CATEGORIAS(Codigo),
		FOREIGN KEY (Suplidor) REFERENCES SUPLIDORES(RNC);
		
ALTER TABLE detalle_articulos_factura
	ADD
		FOREIGN KEY (CdArticulos) REFERENCES ARTICULOS(Codigo),
		FOREIGN KEY (NoFactura) REFERENCES FACTURAS(NoFactura);

ALTER TABLE factura_clientes 
	ADD
		FOREIGN KEY (NoFactura) REFERENCES FACTURAS(NoFactura),
		FOREIGN KEY (CdClientes) REFERENCES CLIENTES(Codigo);


