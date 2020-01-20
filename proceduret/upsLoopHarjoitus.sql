-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jyrki Reijonen
-- Create date: 20.1.2020
-- Description:	Cursor loopissa p‰ivitet‰‰n tunteja
-- =============================================
ALTER PROCEDURE uspLoopHarjoitus 
	-- Add the parameters for the stored procedure here
	@from_IN datetime, 
	@till_IN datetime
AS
BEGIN
SET NOCOUNT ON;
DECLARE @Hlo int
DECLARE @Proj int
DECLARE @HloString varchar(16)
DECLARE @ProjString varchar(19)
DECLARE hloKursori CURSOR
for select Henkilo_id from TilausDB.dbo.Henkilot
open hloKursori
DECLARE projKursori CURSOR
for select Projekti_id from TilausDB.dbo.Projektit

--Henkilolooppi
FETCH NEXT from hloKursori into @Hlo
WHILE @@FETCH_STATUS = 0
	BEGIN
		
		--Haetaanpa projektit
		open projKursori
		FETCH NEXT from projKursori into @Proj
		WHILE @@FETCH_STATUS = 0
		BEGIN
			
			exec [dbo].[uspLisaaTunnit] @date_from = @from_IN, @date_till = @till_IN, 
					@Henkilo = @Hlo, @Projekti = @proj
			FETCH NEXT from projKursori into @Proj
		END 
		CLOSE projKursori
		FETCH NEXT from hloKursori into @Hlo
	END

DEALLOCATE projKursori
CLOSE hloKursori
DEALLOCATE hloKursori
END
GO
