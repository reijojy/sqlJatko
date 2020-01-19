CREATE FUNCTION F_PostiNumeroita (@Postinumero varchar(5))
RETURNS int
AS
BEGIN
	DECLARE @Henkiloita int
 	SELECT @Henkiloita = count(*)FROM Henkilot WHERE Postinumero = @Postinumero
	RETURN @Henkiloita
END