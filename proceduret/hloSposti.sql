-- Proceduuri joka p�ivitt�� henkil�lle s�hk�postiosoitteen
CREATE PROCEDURE dbo.uspWrtHloSpos (@id int, @email varchar(100))
AS

update TilausDB.dbo.Henkilot set Sahkoposti = @email where Henkilo_Id = @id

GO