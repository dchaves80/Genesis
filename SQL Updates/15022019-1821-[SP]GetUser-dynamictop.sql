USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Get_User]    Script Date: 15/2/2019 18:08:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_User]	@Id bigint = NULL, 
									@UserName varchar(50) = NULL, 
									@Email varchar(50) = NULL, 
									@Password varchar(40) = NULL,
									@Response bigint = 0
AS

DECLARE @sql nvarchar(max);
SET @sql = 'SELECT';

IF @Response != 0
	 SET @sql = @sql + ' TOP (@Response)';

SET @sql = @sql + ' * FROM [Users] WHERE 1=1 ';

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @UserName IS NOT NULL
	SET @sql = @sql + ' AND UserName like @UserName';
IF @Email IS NOT NULL
	SET @sql = @sql + ' AND Email like @Email';
if @Password IS NOT NULL
	SET @sql = @sql + ' AND Password = @Password';

EXEC sp_executesql @sql, N'
		@Id bigint, 
		@UserName varchar(50), 
		@Email varchar(50), 
		@Password varchar(40),
		@Response bigint',
		@Id, @UserName, @Email, @Password, @Response;