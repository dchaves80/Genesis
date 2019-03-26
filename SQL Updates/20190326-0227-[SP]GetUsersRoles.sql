USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_UsersRoles]	@Id bigint = NULL, 
										@UserId bigint = NULL, 
										@RoleId bigint = NULL
AS

DECLARE @sql nvarchar(max);
SET @sql = 'SELECT';

SET @sql = @sql + ' * FROM [Users] WHERE 1=1 ';

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @UserId IS NOT NULL
	SET @sql = @sql + ' AND UserId like @UserId';
IF @RoleId IS NOT NULL
	SET @sql = @sql + ' AND RoleId like @RoleId';

EXEC sp_executesql @sql, N'
		@Id bigint, 
		@UserId bigint, 
		@RoleId bigint',
		@Id, @UserId, @RoleId;