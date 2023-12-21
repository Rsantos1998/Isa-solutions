USE Isa_soltuions;
GO

-- CREAR VISTA DE CONSULTA

CREATE VIEW VistaConsultaFacturas AS
SELECT
    C.Nombre AS NombreCliente,
    F.NoFactura,
    F.Fecha,
    F.Total_art + F.Total_efectivo AS Total
FROM
    FACTURAS F
    JOIN factura_clientes FC ON F.NoFactura = FC.NoFactura
    JOIN CLIENTES C ON FC.CdClientes = C.Codigo;



GO
-- CONSULTA FACTURAS
SELECT * FROM VistaConsultaFacturas;
