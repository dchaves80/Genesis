/*	Code generated via CodeReplicator v1.2c by Ramiro Suriano & Luciano Lapenna, for Olympus Software.	*/
/*	Date of this code: 1/7/2019																		*/

USE [GenesisDispensario]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Patients]
	@Id bigint = NULL,
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL,
	@DNI varchar(9) = NULL,
	@Address varchar(50) = NULL,
	@Town varchar(50) = NULL,
	@DateOfBirth varchar(50) = NULL,
	@Phone bigint = NULL,
	@IdObraSocial bigint = NULL,
	@HealthCareId bigint = NULL,
	@Sex varchar(50) = NULL,
	@Gender varchar(50) = NULL,
	@ValidateData bit = NULL,
	@Response bigint = 0
AS

DECLARE @sql nvarchar(max);
SET @sql = 'SELECT';

IF @Response != 0
	SET @sql = @sql + ' TOP (@Response)';

SET @sql = @sql + ' * FROM [Patients] WHERE 1=1 ';

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @FirstName IS NOT NULL
	SET @sql = @sql + ' AND FirstName like @FirstName';
IF @LastName IS NOT NULL
	SET @sql = @sql + ' AND LastName like @LastName';
IF @DNI IS NOT NULL
	SET @sql = @sql + ' AND DNI like @DNI';
IF @Address IS NOT NULL
	SET @sql = @sql + ' AND Address like @Address';
IF @Town IS NOT NULL
	SET @sql = @sql + ' AND Town like @Town';
IF @DateOfBirth IS NOT NULL
	SET @sql = @sql + ' AND DateOfBirth = convert(datetime,@DateOfBirth,120)';
IF @Phone IS NOT NULL
	SET @sql = @sql + ' AND Phone like @Phone';
IF @IdObraSocial IS NOT NULL
	SET @sql = @sql + ' AND IdObraSocial like @IdObraSocial';
IF @HealthCareId IS NOT NULL
	SET @sql = @sql + ' AND HealthCareId like @HealthCareId';
IF @Sex IS NOT NULL
	SET @sql = @sql + ' AND Sex like @Sex';
IF @Gender IS NOT NULL
	SET @sql = @sql + ' AND Gender like @Gender';
IF @ValidateData IS NOT NULL
	SET @sql = @sql + ' AND ValidateData like @ValidateData';

EXEC sp_executesql @sql, N'
		@Id bigint,
		@FirstName varchar(50),
		@LastName varchar(50),
		@DNI varchar(9),
		@Address varchar(50),
		@Town varchar(50),
		@DateOfBirth varchar(50),
		@Phone bigint,
		@IdObraSocial bigint,
		@HealthCareId bigint,
		@Sex varchar(50),
		@Gender varchar(50),
		@ValidateData bit,
		@Response bigint',
		@Id, @FirstName, @LastName, @DNI, @Address, @Town, @DateOfBirth, @Phone, @IdObraSocial, @HealthCareId, @Sex, @Gender, @ValidateData, @Response;


GO


CREATE PROCEDURE [dbo].[Insert_Patients]
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL,
	@DNI varchar(9) = NULL,
	@Address varchar(50) = NULL,
	@Town varchar(50) = NULL,
	@DateOfBirth varchar(50) = NULL,
	@Phone bigint = NULL,
	@IdObraSocial bigint = NULL,
	@HealthCareId bigint = NULL,
	@Sex varchar(50) = NULL,
	@Gender varchar(50) = NULL,
	@ValidateData bit = NULL
AS

INSERT INTO Patients VALUES(@FirstName, @LastName, @DNI, @Address, @Town, convert(datetime, @DateOfBirth, 120), @Phone, @IdObraSocial, @HealthCareId, @Sex, @Gender, @ValidateData);
SELECT TOP 1 Id FROM Patients ORDER BY Id DESC


GO


CREATE PROCEDURE [dbo].[Delete_Patients]
	@Id bigint = NULL,
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL,
	@DNI varchar(9) = NULL,
	@Address varchar(50) = NULL,
	@Town varchar(50) = NULL,
	@DateOfBirth varchar(50) = NULL,
	@Phone bigint = NULL,
	@IdObraSocial bigint = NULL,
	@HealthCareId bigint = NULL,
	@Sex varchar(50) = NULL,
	@Gender varchar(50) = NULL,
	@ValidateData bit = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM Patients WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

	ELSE IF @FirstName IS NOT NULL
	SET @sql = @sql + ' AND FirstName = @FirstName';

	ELSE IF @LastName IS NOT NULL
	SET @sql = @sql + ' AND LastName = @LastName';

	ELSE IF @DNI IS NOT NULL
	SET @sql = @sql + ' AND DNI = @DNI';

	ELSE IF @Address IS NOT NULL
	SET @sql = @sql + ' AND Address = @Address';

	ELSE IF @Town IS NOT NULL
	SET @sql = @sql + ' AND Town = @Town';

	ELSE IF @DateOfBirth IS NOT NULL
	SET @sql = @sql + ' AND DateOfBirth = @DateOfBirth';

	ELSE IF @Phone IS NOT NULL
	SET @sql = @sql + ' AND Phone = @Phone';

	ELSE IF @IdObraSocial IS NOT NULL
	SET @sql = @sql + ' AND IdObraSocial = @IdObraSocial';

	ELSE IF @HealthCareId IS NOT NULL
	SET @sql = @sql + ' AND HealthCareId = @HealthCareId';

	ELSE IF @Sex IS NOT NULL
	SET @sql = @sql + ' AND Sex = @Sex';

	ELSE IF @Gender IS NOT NULL
	SET @sql = @sql + ' AND Gender = @Gender';

	ELSE IF @ValidateData IS NOT NULL
	SET @sql = @sql + ' AND ValidateData = @ValidateData';

IF NOT (@Id IS NULL AND @FirstName IS NULL AND @LastName IS NULL AND @DNI IS NULL AND @Address IS NULL AND @Town IS NULL AND @DateOfBirth IS NULL AND @Phone IS NULL AND @IdObraSocial IS NULL AND @HealthCareId IS NULL AND @Sex IS NULL AND @Gender IS NULL AND @ValidateData IS NULL)
	EXEC sp_executesql @sql, N'
		@Id bigint,
		@FirstName varchar(50),
		@LastName varchar(50),
		@DNI varchar(9),
		@Address varchar(50),
		@Town varchar(50),
		@DateOfBirth varchar(50),
		@Phone bigint,
		@IdObraSocial bigint,
		@HealthCareId bigint,
		@Sex varchar(50),
		@Gender varchar(50),
		@ValidateData ',
		@Id, @FirstName, @LastName, @DNI, @Address, @Town, @DateOfBirth, @Phone, @IdObraSocial, @HealthCareId, @Sex, @Gender, @ValidateData;


GO


CREATE PROCEDURE [dbo].[Update_Patients]
	@Id bigint = NULL,
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL,
	@DNI varchar(9) = NULL,
	@Address varchar(50) = NULL,
	@Town varchar(50) = NULL,
	@DateOfBirth varchar(50) = NULL,
	@Phone bigint = NULL,
	@IdObraSocial bigint = NULL,
	@HealthCareId bigint = NULL,
	@Sex varchar(50) = NULL,
	@Gender varchar(50) = NULL,
	@ValidateData bit = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'UPDATE Patients SET'

IF @FirstName IS NOT NULL
	SET @sql = @sql + ' FirstName = @FirstName,';
IF @LastName IS NOT NULL
	SET @sql = @sql + ' LastName = @LastName,';
IF @DNI IS NOT NULL
	SET @sql = @sql + ' DNI = @DNI,';
IF @Address IS NOT NULL
	SET @sql = @sql + ' Address = @Address,';
IF @Town IS NOT NULL
	SET @sql = @sql + ' Town = @Town,';
IF @DateOfBirth IS NOT NULL
	SET @sql = @sql + ' DateOfBirth = convert(datetime, @DateOfBirth, 120),';
IF @Phone IS NOT NULL
	SET @sql = @sql + ' Phone = @Phone,';
IF @IdObraSocial IS NOT NULL
	SET @sql = @sql + ' IdObraSocial = @IdObraSocial,';
IF @HealthCareId IS NOT NULL
	SET @sql = @sql + ' HealthCareId = @HealthCareId,';
IF @Sex IS NOT NULL
	SET @sql = @sql + ' Sex = @Sex,';
IF @Gender IS NOT NULL
	SET @sql = @sql + ' Gender = @Gender,';
IF @ValidateData IS NOT NULL
	SET @sql = @sql + ' ValidateData = @ValidateData,';

SET @sql = SUBSTRING(@sql, 1, (LEN(@sql) - 1))
SET @sql = @sql + ' WHERE Id = @Id';

IF NOT(@FirstName IS NULL AND @LastName IS NULL AND @DNI IS NULL AND @Address IS NULL AND @Town IS NULL AND @DateOfBirth IS NULL AND @Phone IS NULL AND @IdObraSocial IS NULL AND @HealthCareId IS NULL AND @Sex IS NULL AND @Gender IS NULL AND @ValidateData IS NULL)
	EXEC sp_executesql @sql, N'
		@Id bigint,
		@FirstName varchar(50),
		@LastName varchar(50),
		@DNI varchar(9),
		@Address varchar(50),
		@Town varchar(50),
		@DateOfBirth varchar(50),
		@Phone bigint,
		@IdObraSocial bigint,
		@HealthCareId bigint,
		@Sex varchar(50),
		@Gender varchar(50),
		@ValidateData bit',
		@Id, @FirstName, @LastName, @DNI, @Address, @Town, @DateOfBirth, @Phone, @IdObraSocial, @HealthCareId, @Sex, @Gender, @ValidateData;


GO


