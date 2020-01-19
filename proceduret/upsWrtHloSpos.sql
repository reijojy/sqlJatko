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
-- Create date: 19/01/2020
-- Description:	Henkilön sähköposti osoitteen päivitys
-- =============================================
ALTER PROCEDURE dbo.uspWrtHloSpos 
	-- Add the parameters for the stored procedure here
	@id int = 0, 
	@email varchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

	update Henkilot set Sahkoposti = @email where Henkilo_Id = @id
END
GO
