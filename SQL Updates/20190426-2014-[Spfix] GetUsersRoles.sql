USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Get_UsersRoles]    Script Date: 4/26/2019 7:32:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_UsersRoles]	@Id bigint = NULL, 
										@UserId bigint = NULL, 
										@RoleId bigint = NULL
AS

DECLARE @sql nvarchar(max);
SET @sql = 'SELECT';

SET @sql = @sql + ' * FROM [UsersRoles] WHERE 1=1 ';

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