-- Proceduuri joka päivittää henkilölle sähköpostiosoitteen
CREATE PROCEDURE dbo.uspWrtHloSpos (@id int, @email varchar(100))
AS

update TilausDB.dbo.Henkilot set Sahkoposti = @email where Henkilo_Id = @id

GO