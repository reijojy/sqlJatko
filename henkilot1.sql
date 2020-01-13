/*select count(*) from henkilot where Postinumero='00200';
select * from Henkilot
insert into Henkilot (Etunimi, Sukunimi, Osoite, Postinumero) values('Eva', 'Biaudet', 'Heikkiläntie 1', '00200')*/
/* Luodaan funktio joka hakee postinumerolla henkilöiden määrän */ 
CREATE FUNCTION F_CountPostinumerot (@Postinumero varchar(5))
RETURNS int
AS
BEGIN
DECLARE @Quantity int
SELECT @Quantity = count(*) from Henkilot where Postinumero = @Postinumero
return @Quantity
END