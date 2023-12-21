USE Isa_soltuions

GO

DECLARE @FacturaAEliminar NVARCHAR(10) = 'FAC3'; -- LA FACTURA QUE QUIERES BORRAR

DELETE daf
FROM detalle_articulos_factura daf
INNER JOIN FACTURAS f ON daf.NoFactura = f.NoFactura
WHERE f.NoFactura = @FacturaAEliminar;

DELETE fc
FROM factura_clientes fc
INNER JOIN FACTURAS f ON fc.NoFactura = f.NoFactura
WHERE f.NoFactura = @FacturaAEliminar;

DELETE FROM FACTURAS
WHERE NoFactura = @FacturaAEliminar;

-- SE DEBE ELIMINAR EN ESE ORDEN POR LAS KEY's