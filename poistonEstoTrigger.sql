CREATE TRIGGER tr_tarkistaPTDel
ON Postitoimipaikat
FOR DELETE
AS
BEGIN
DECLARE @Quantity int
DECLARE @Postinumero varChar(5)
SELECT @Postinumero = Postinumero from deleted
PRINT 'Poistettava Postinumero on: '
PRINT @Postinumero
SELECT @Quantity = count(*) from Henkilot where Postinumero = @Postinumero
PRINT 'Quantity on: '
PRINT @QUANTITY
END
PRINT 'delete ajettu ' 
