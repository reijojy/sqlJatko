ALTER TRIGGER tr_tarkistaInsteadDel
ON Postitoimipaikat
INSTEAD OF DELETE
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
if @Quantity = 0
BEGIN
PRINT 'Voi poistaa tällä kertaa'
delete from Postitoimipaikat where Postinumero = @Postinumero
END
ELSE
BEGIN
PRINT 'EI voida poistaa'
END
END
PRINT 'instead of delete ajettu ' 