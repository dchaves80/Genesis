USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_RolesPermissions]	@Id bigint = NULL, 
												@RoleId bigint = NULL, 
												@ModuleId bigint = NULL
AS

DECLARE @sql nvarchar(max);
SET @sql = 'SELECT';

SET @sql = @sql + ' * FROM RolesPermissions WHERE 1=1 ';

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @RoleId IS NOT NULL
	SET @sql = @sql + ' AND RoleId like @RoleId';
IF @ModuleId IS NOT NULL
	SET @sql = @sql + ' AND ModuleId like @ModuleId';

EXEC sp_executesql @sql, N'
		@Id bigint, 
		@RoleId bigint, 
		@ModuleId bigint',
		@Id, @RoleId, @ModuleId;