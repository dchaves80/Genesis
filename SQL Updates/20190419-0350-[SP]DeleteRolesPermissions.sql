USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_RolesPermissions]	@Id bigint = NULL,
													@RoleId bigint = NULL,
													@ModuleId bigint = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM RolesPermissions WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

	ELSE IF @RoleId IS NOT NULL
		SET @sql = @sql + ' AND RoleId = @RoleId';

		ELSE IF @ModuleId IS NOT NULL
			SET @sql = @sql + ' AND ModuleId = @ModuleId';


IF NOT(@Id IS NULL AND @RoleId IS NULL AND @ModuleId IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@RoleId bigint,
			@ModuleId bigint',
			@Id, @RoleId, @ModuleId;