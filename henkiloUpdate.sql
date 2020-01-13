ALTER TRIGGER Tr_Henkilomuutokset ON Henkilot 
FOR UPDATE 
AS

		
	DECLARE @Etunimi varchar(50), @Sukunimi varchar(50);
	DECLARE @Osoite varchar(100), @Postinumero varchar(5);
	DECLARE @Esimies int, @Henkilo_id int;
	DECLARE @Postitoimipaikka varchar(100);
	DECLARE @Rivimaara Int;

	DECLARE @Etunimi_old varchar(50), @Sukunimi_old varchar(50);
	DECLARE @Osoite_old varchar(100), @Postinumero_old varchar(5);
	DECLARE @Esimies_old int;
	select @Etunimi = Etunimi, @Sukunimi = Sukunimi, @Osoite = Osoite, @Esimies = Esimies, @Postinumero = Postinumero from inserted;
	select @Etunimi_old = Etunimi, @Sukunimi_old = Sukunimi, @Osoite_old = Osoite, @Esimies_old = Esimies, @Postinumero_old = Postinumero from deleted;
	
	IF @Etunimi <> @Etunimi_old
		BEGIN
			insert into Lokitaulu 
				values('Henkilot', 'Etunimi', @Etunimi_old, @Etunimi, GETDATE(), 'Triggeri')
		END
	IF @Sukunimi <> @Sukunimi_old
		BEGIN
			insert into Lokitaulu 
				values('Henkilot', 'Sukunimi', @Sukunimi_old, @Sukunimi, GETDATE(), 'Triggeri')
		END
	IF @Osoite <> @Osoite_old
		BEGIN
			insert into Lokitaulu 
				values('Henkilot', 'Osoite', @Osoite_old, @Osoite, GETDATE(), 'Triggeri')
		END
	IF @Postinumero <> @Postinumero_old
		BEGIN
			insert into Lokitaulu 
				values('Henkilot', 'Postinumero', @Postinumero_old, @Postinumero, GETDATE(), 'Triggeri')
		END
	 

PRINT 'Triggeri Tr_Henkilomuutokset ajettu'