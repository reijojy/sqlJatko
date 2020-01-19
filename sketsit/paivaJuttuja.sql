USE [TilausDB]
DECLARE @Tunti_X int
DECLARE @PvmEero int
DECLARE @PVM_X datetime
DECLARE @PVM_from datetime
DECLARE @PVM_till datetime
DECLARE @PVM_juoksuri datetime
DECLARE @PVM_ero int
--set @PVM_X = DATEADD(month, -2, GETDATE())
--print @PVM_X
set @PVM_from = '2020-01-02'
set @PVM_till = '2020-01-05'
print @PVM_from 
--set @PVM_ero = DATEDIFF(DAY, @PVM_from,  @PVM_till)
--select @Pvm_ero as [Päivien lkm]
set @PVM_juoksuri = @Pvm_from
select @PVM_juoksuri as [Juoksuri init]
set @PVM_Juoksuri =DATEADD(day, 1, @PVM_Juoksuri)
--Huomaa että tulee messageissa ei resulteissa näkyviin
while @PVM_Juoksuri <= @PVM_till
	begin
	print @PVM_Juoksuri
	set @PVM_Juoksuri =DATEADD(day, 1, @PVM_Juoksuri)
end





