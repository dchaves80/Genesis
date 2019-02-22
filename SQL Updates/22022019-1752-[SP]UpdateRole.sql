USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_Role]	@Id bigint, @Role varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'UPDATE Roles SET'

IF @Role IS NOT NULL
	SET @sql = @sql + ' Role = @Role,';


SET @sql = SUBSTRING(@sql, 1, (LEN(@sql) - 1))
SET @sql = @sql + ' WHERE Id = @Id';

IF NOT(@Role IS NULL)
	EXEC sp_executesql @sql, N'
							@Id bigint,
							@Role varchar(50)',
							@Id, @Role;