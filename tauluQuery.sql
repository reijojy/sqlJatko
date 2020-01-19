--select name as TaulunNimi from TilausDB.sys.tables
DECLARE @Suorita varchar(60);
DECLARE @TaulunNimi varchar(20)
DECLARE Taulukursori CURSOR

FOR SELECT name FROM TilausDB.sys.tables
OPEN Taulukursori
FETCH NEXT from Taulukursori INTO @TaulunNimi
WHILE @@FETCH_STATUS = 0
BEGIN
	
	SET @Suorita = CONCAT('select count(*) as riviLkm from ', @TaulunNimi) 
	print @Suorita
	EXEC(@Suorita)
--Seuraavan rivin haku kursorista
FETCH NEXT FROM Taulukursori INTO @TaulunNimi
END
CLOSE Taulukursori
DEALLOCATE Taulukursori
