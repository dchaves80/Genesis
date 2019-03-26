USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_User]	@UserName varchar(50),
										@Email varchar(50),
										@Password varchar(40)
AS

INSERT INTO Users VALUES(@UserName, @Email, @Password);
SELECT TOP 1 Id FROM Users ORDER BY Id DESC