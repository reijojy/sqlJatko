-- Listaa ASCII:t 
DECLARE @Laskuri int
DECLARE @Merkki varchar(4)
SET @Laskuri = 0

WHILE @Laskuri <= 255
BEGIN
	SET @Merkki = CONCAT(CONVERT(varchar, @Laskuri), ' ',  CHAR(@Laskuri)) 
	Print @Merkki
	SET @Laskuri = @Laskuri + 1
END
