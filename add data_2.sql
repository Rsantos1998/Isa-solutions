USE Isa_soltuions

GO

-- Insertar 15 clientes
INSERT INTO CLIENTES (Codigo, Nombre, Direccion, Telefono)
VALUES
('C001', 'Cliente 1', 'Dirección 1', '123-456-7890'),
('C002', 'Cliente 2', 'Dirección 2', '987-654-3210'),
('C003', 'Cliente 3', 'Dirección 3', '555-123-4567'),
('C004', 'Cliente 4', 'Dirección 4', '111-222-3333'),
('C005', 'Cliente 5', 'Dirección 5', '444-555-6666'),
('C006', 'Cliente 6', 'Dirección 6', '777-888-9999'),
('C007', 'Cliente 7', 'Dirección 7', '333-666-9999'),
('C008', 'Cliente 8', 'Dirección 8', '999-888-7777'),
('C009', 'Cliente 9', 'Dirección 9', '444-333-2222'),
('C010', 'Cliente 10', 'Dirección 10', '111-000-9999'),
('C011', 'Cliente 11', 'Dirección 11', '555-444-3333'),
('C012', 'Cliente 12', 'Dirección 12', '999-000-1111'),
('C013', 'Cliente 13', 'Dirección 13', '222-333-4444'),
('C014', 'Cliente 14', 'Dirección 14', '888-777-6666'),
('C015', 'Cliente 15', 'Dirección 15', '333-222-1111');

GO

-- Insertar 15 categorías
INSERT INTO CATEGORIAS (Codigo, Descripcion) VALUES
(1, 'Electrónicos'),
(2, 'Ropa'),
(3, 'Hogar'),
(4, 'Juguetes'),
(5, 'Deportes'),
(6, 'Libros'),
(7, 'Joyería'),
(8, 'Electrodomésticos'),
(9, 'Instrumentos Musicales'),
(10, 'Muebles'),
(11, 'Automóviles'),
(12, 'Salud y Belleza'),
(13, 'Alimentos'),
(14, 'Computadoras'),
(15, 'Calzado');
GO

-- INERTAR SUPLIDORES
DECLARE @Counter INT = 1

WHILE @Counter <= 5
BEGIN
    DECLARE @RNC INT = CAST(RAND() * (999999999 - 100000000) + 100000000 AS INT)
    DECLARE @Nombre NVARCHAR(255) = 'Suplidor ' + CAST(@Counter AS NVARCHAR(3))
    DECLARE @Direccion NVARCHAR(255) = 'Dirección ' + CAST(@Counter AS NVARCHAR(3))
    DECLARE @Email NVARCHAR(255) = 'email' + CAST(@Counter AS NVARCHAR(3)) + '@example.com'

    INSERT INTO SUPLIDORES (RNC, Nombre, Direccion, Email)
    VALUES (@RNC, @Nombre, @Direccion, @Email)

    SET @Counter = @Counter + 1
END

GO

--AGREGAR ARTICULOS RAMDOM, LUEGO DE HABER CREADO CATEGORIAS Y SUPLIDORES
DECLARE @Counter INT = 1

WHILE @Counter <= 30
BEGIN
    DECLARE @Code NVARCHAR(10) = 'A' + RIGHT(CAST(@Counter AS NVARCHAR(3)), 3)
    DECLARE @Description NVARCHAR(255) = 'Articulo ' + CAST(@Counter AS NVARCHAR(3))
    DECLARE @Cat INT 
    DECLARE @Sup INT 
    DECLARE @Price DECIMAL(10, 2) = ROUND(RAND() * (50.0 - 10.0) + 10.0, 2)
	
	SELECT TOP 1 @Cat = Codigo FROM CATEGORIAS ORDER BY NEWID();
	SELECT TOP 1 @Sup = RNC FROM SUPLIDORES ORDER BY NEWID();

    INSERT INTO ARTICULOS (Codigo, Descripcion, Categoria, Suplidor, Precio)
    VALUES (@Code, @Description, @Cat, @Sup, @Price)

    SET @Counter = @Counter + 1
END

--SELECT * FROM ARTICULOS

GO

--CREAR FACTURA RAMDOM FACTURA



--USE master