use Isa_soltuions

DECLARE @CFac INT = 10 --CANTIDAD DE ARTICULOS POR FACTURA

DECLARE @Counter INT = 1
DECLARE @No INT
SELECT @No = (COUNT(Id)+1) FROM FACTURAS;
DECLARE @NoFac NVARCHAR(10) = 'FAC' + RIGHT(CAST(@No AS NVARCHAR(6)), 6)
PRINT @NoFac;
INSERT INTO FACTURAS (NoFactura, Total_art, Total_efectivo) 
	VALUES (@NoFac, 0, 0);

WHILE @Counter <= @CFac 
BEGIN
	
	DECLARE @AC VARCHAR(20)
	DECLARE @PRICE FLOAT
	DECLARE @CANT INT
	DECLARE @TOT FLOAT
	SELECT TOP 1 @AC = Codigo FROM ARTICULOS ORDER BY NEWID();
	SELECT TOP 1 @PRICE = Precio FROM ARTICULOS WHERE Codigo = @AC;
	SET @CANT = ROUND(RAND() * (50.0 - 10.0) + 10.0, 2);
	SET @TOT = @CANT *@PRICE; 

    INSERT INTO detalle_articulos_factura (CdArticulos, Precio, Cantidad, Total, NoFactura) 
		VALUES (@AC, @PRICE, @CANT, @TOT, @NoFac);

	SET @Counter = @Counter + 1
END

DECLARE @TotArt INT;
DECLARE @TotEfec FLOAT;
SELECT @TotArt = COUNT(Id) FROM detalle_articulos_factura WHERE NoFactura = @NoFac;
SELECT @TotEfec = SUM(Total) FROM detalle_articulos_factura WHERE NoFactura = @NoFac;

UPDATE FACTURAS SET Total_art = @TotArt, Total_efectivo = @TotEfec WHERE NoFactura = @NoFac;

DECLARE @CdCli VARCHAR(15)
SELECT TOP 1 @CdCli = Codigo FROM CLIENTES ORDER BY NEWID();
INSERT INTO factura_clientes(NoFactura, CdClientes) VALUES (@NoFac, @CdCli)