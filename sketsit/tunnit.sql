/*select * from tunnit
select * from Henkilot
select * from Projektit
select * from Tunnit
insert into Projektit values('Up med Sverige')
insert into Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit) values(1000, 1000, GETDATE(), 8)
insert into Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit) values(1000, 1001, '2019-11-03', 4)
insert into Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit) values(1002, 1004, '2018-01-02', 10)*/


DECLARE @from datetime, @till datetime, @hlo int, @proj int

set @hlo = 1005
set @proj = 1002
set @from = '2019-09-02'
set @till = '2019-09-06'
--exec [dbo].[uspLisaaTunnit] @date_from = @from, @date_till = @till, @henkilo = @hlo, @Projekti = @proj
exec [dbo].[uspLoopHarjoitus] @from_IN = @from, @till_IN = @till

select * from tunnit where pvm between '2019-09-02' and '2019-09-07'
--select * from Projektit




