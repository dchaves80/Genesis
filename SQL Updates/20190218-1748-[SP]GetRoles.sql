USE [Genesis]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Role]	@Id bigint = NULL, 
									@Role varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);
SET @sql = 'SELECT * FROM [Roles] WHERE 1=1 ';

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @Role IS NOT NULL
	SET @sql = @sql + ' AND Role like @Role';

EXEC sp_executesql @sql, N'
		@Id bigint, 
		@Role varchar(50)',
		@Id, @Role;