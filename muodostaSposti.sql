--Funktio sähköpostiosoitteewn muodostamiselle
CREATE FUNCTION dbo.F_SPostiOsoite(@Etunimi varchar(50), @Sukunimi varchar(50),
			@Domaini varchar(50))
returns varchar(100)
AS
BEGIN

DECLARE @piste varchar(1),@domainerotin varchar(1),
        @Sposti varchar(100), @Paluuarvo varchar(100)

SET @piste = '.'
SET @domainerotin = CHAR(64)
SET @Sposti= LOWER(@Etunimi) + @piste +
LOWER(@Sukunimi) + @domainerotin + LOWER(@Domaini)
SET @paluuarvo = REPLACE(@Sposti,' ',
'') COLLATE
SQL_Latin1_General_CP1253_CI_AI
RETURN ISNULL(@paluuarvo,'virhe osoitteen käsittelyssä')

END