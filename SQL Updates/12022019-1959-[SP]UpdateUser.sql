USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_User]	@Id bigint,
										@UserName varchar(50) = NULL,
										@Email varchar(50) = NULL,
										@Password varchar(40) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'UPDATE Users SET'

IF @UserName IS NOT NULL
	SET @sql = @sql + ' UserName = @Username,';
IF @Email IS NOT NULL
	SET @sql = @sql + ' Email = @Email,';
IF @Password IS NOT NULL
	SET @sql = @sql + ' Password = @Password,';

SET @sql = SUBSTRING(@sql, 1, (LEN(@sql) - 1))
SET @sql = @sql + ' WHERE Id = @Id';

IF NOT(@UserName IS NULL AND @Email IS NULL AND @Password IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@UserName varchar(50), 
			@Email varchar(50), 
			@Password varchar(40)',
			@Id, @UserName, @Email, @Password;