USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Module]	@Id bigint = NULL,
										@ModuleName varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM Modules WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

	ELSE IF @ModuleName IS NOT NULL
		SET @sql = @sql + ' AND ModuleName = @ModuleName';


IF NOT(@Id IS NULL AND @ModuleName IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@ModuleName varchar(50)',
			@Id, @ModuleName;