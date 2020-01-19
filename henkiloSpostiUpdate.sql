--select name as TaulunNimi from TilausDB.sys.tables
USE [TilausDB]
DECLARE @Suorita varchar(60);
DECLARE @Henkilo_id int
DECLARE @Etunimi varchar(50)
DECLARE @Sukunimi varchar(50)
DECLARE @hloSpos varchar(100)
DECLARE @UusiSpos varchar(100)
DECLARE	@return_value int

DECLARE Taulukursori CURSOR
FOR SELECT Henkilo_id, Etunimi, Sukunimi, Sahkoposti FROM TilausDB.dbo.Henkilot
OPEN Taulukursori
FETCH NEXT from Taulukursori INTO @Henkilo_id, @Etunimi, @Sukunimi, @hloSpos
WHILE @@FETCH_STATUS = 0
BEGIN
	
	--print CONCAT(@Henkilo_id, ' ', @Etunimi, ' ', @Sukunimi, @hloSpos)
	if (@hloSpos IS NULL)
	BEGIN
		
		print dbo.F_SPostiOsoite(@Etunimi,  @Sukunimi, 'spam.fi')
		SET @UusiSpos = dbo.F_SPostiOsoite(@Etunimi,  @Sukunimi, 'spam.fi')
		exec  [dbo].[uspWrtHloSpos] @id = @Henkilo_id,
				@email = @UusiSpos
	END
	--EXEC(@Suorita)
--Seuraavan rivin haku kursorista
FETCH NEXT FROM Taulukursori INTO @Henkilo_id, @Etunimi, @Sukunimi, @hloSpos
END
CLOSE Taulukursori
DEALLOCATE Taulukursori
