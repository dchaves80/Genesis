USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_User]	@Id bigint = NULL,
										@UserName varchar(50) = NULL,
										@Email varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM Users WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

	ELSE IF @UserName IS NOT NULL
		SET @sql = @sql + ' AND UserName = @Username';

		ELSE IF @Email IS NOT NULL
			SET @sql = @sql + ' AND Email = @Email';


IF NOT(@Id IS NULL AND @UserName IS NULL AND @Email IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@UserName varchar(50), 
			@Email varchar(50)',
			@Id, @UserName, @Email;