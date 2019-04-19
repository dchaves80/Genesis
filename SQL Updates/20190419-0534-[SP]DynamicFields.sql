Use Genesis
Go
CREATE PROCEDURE Insert_DynamicField(@Name varchar(100))
as
begin
INSERT INTO DynamicFields(Name) values(@Name)
END
GO
CREATE PROCEDURE [Get_DynamicField] @Id bigint=NULL,
									@Name varchar(100)=NULL,
									@Response bigint = 0
AS
DECLARE @sql nvarchar(max);
SET @sql = 'SELECT';
IF @Response != 0
	 SET @sql = @sql + ' TOP (@Response)';
SET @sql = @sql + ' * FROM [DynamicFields] WHERE 1=1 ';
IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @Name IS NOT NULL
	SET @sql = @sql + ' AND Name like @Name';
EXEC sp_executesql @sql, N'
		@Id bigint, 
		@Name varchar(100), 
		@Response bigint',
		@Id, @Name, @Response;
GO
CREATE PROCEDURE [Update_DynamicField] @Id bigint, 
									   @Name varchar(100)=NULL
AS
DECLARE @sql nvarchar(max);
SET @sql = 'UPDATE DynamicFields SET'
IF @Name IS NOT NULL
	SET @sql = @sql + ' Name = @Name,';
SET @sql = SUBSTRING(@sql, 1, (LEN(@sql) - 1))
SET @sql = @sql + ' WHERE Id = @Id';
IF NOT(@Name IS NULL)
	EXEC sp_executesql @sql, N'
							@Id bigint,
							@name varchar(50)',
							@Id, @Name;
GO
CREATE PROCEDURE [Delete_DynamicField] @Id bigint,
									   @Name varchar(100)
AS
DECLARE @sql nvarchar(max);
SET @sql = 'DELETE FROM DynamicFields WHERE 1=1'
IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
	ELSE IF @Name IS NOT NULL
		SET @sql = @sql + ' AND Name = @Name';
IF NOT(@Id IS NULL AND @Name IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@Name varchar(100)',
			@Id, @Name;
GO

									 

