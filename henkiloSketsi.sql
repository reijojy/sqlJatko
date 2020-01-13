SELECT dbo.F_PosTmp('33909')

select dbo.F_CountPostinumerot('00200')

insert into Henkilot (Etunimi, Sukunimi, Osoite, Postinumero) values('Muhammad', 'Zamani', 'Keltinkatu 3', '33530')
/*IF (select dbo.F_CountPostinumerot('33530')) == 0*/
select *, dbo.F_PosTmp(Postinumero) as Potitoimipaikka from Henkilot
select * from Postitoimipaikat where Postinumero = '33530'
insert into Postitoimipaikat values('66666', 'DIABLO')
delete from Postitoimipaikat where Postinumero = '33530'
select * from Lokitaulu;
select * from Henkilot where Henkilo_id = 1001;
update Henkilot set Etunimi = 'Annele', Osoite='Uudenkylänkatu 1' where Henkilo_id = 1001;