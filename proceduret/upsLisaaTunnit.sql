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
-- Create date: 19.01.2020
-- Description:	Lis‰t‰‰n tunteja automaattiseti
-- =============================================
ALTER PROCEDURE uspLisaaTunnit 
	-- Add the parameters for the stored procedure here
	@date_from datetime, 
	@date_till datetime,
	@Henkilo   int,
	@Projekti  int

AS
BEGIN
	DECLARE @Juoksuri datetime	
	set @Juoksuri = @date_from
	SET NOCOUNT ON;
	while @Juoksuri <= @date_till
		begin
			insert into dbo.Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit)
				values(@Projekti, @Henkilo, @Juoksuri, 8)
				
			set @Juoksuri =DATEADD(day, 1, @Juoksuri)
		end
END
GO
