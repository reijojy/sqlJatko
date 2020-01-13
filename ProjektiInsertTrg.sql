alter TRIGGER [dbo].[TR_ProjektiLisays]
ON [dbo].[Projektit]
FOR INSERT 
AS
DECLARE @Id int
DECLARE @Alku int
DECLARE @Juoksuri int
DECLARE @Tunn varChar(3)
DECLARE @InsertedNimi varChar(100)
select @Id = Projekti_id, @InsertedNimi = Nimi from inserted
PRINT 'Uusi Id:'
PRINT @Id
PRINT 'Insertoitu Nimi:'
PRINT @InsertedNimi
select @Juoksuri = count(*) from Projektit where Nimi like @InsertedNimi + '%' 
				AND Projekti_id <> @Id
PRINT 'Juoksuri:'
PRINT @Juoksuri
SET @Juoksuri = @Juoksuri + 1
SET @Tunn = 
	CASE 
		WHEN @Juoksuri < 10 THEN '00' + CONVERT(varChar, @Juoksuri)
		WHEN @Juoksuri >= 10 AND @Juoksuri < 100 THEN '0' + CONVERT(varChar, @Juoksuri)
		WHEN @Juoksuri >= 100 THEN CONVERT(varChar, @Juoksuri) 
	END
PRINT 'Tunnus:'
PRINT @Tunn
PRINT 'Katsotaan mit‰ jo tietokannassa:'
select * from Projektit where Projekti_id = @Id
PRINT 'Tehd‰‰np‰ update:'
update Projektit set Nimi = @InsertedNimi + ' ' + @Tunn where Projekti_id = @Id
PRINT 'Katsotaan mit‰ jo tietokannassa updaten j‰lkeen:'
select * from Projektit where Projekti_id = @Id




--select @Alku = CHARINDEX('/',Nimi,1) from Projektit 
--select @Pituus = len(Nimi) from Projektit