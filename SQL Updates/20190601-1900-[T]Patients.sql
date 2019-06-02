Use [GenesisDispensario]
GO

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Patients
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	DNI varchar(9) NOT NULL,
	Address varchar(50) NOT NULL,
	Town varchar(50) NOT NULL,
	DateOfBirth datetime NOT NULL,
	Phone bigint NOT NULL,
	IdObraSocial bigint NOT NULL,
	HealthCareId bigint NOT NULL,
	Sex varchar(50) NOT NULL,
	Gender varchar(50) NOT NULL,
	ValidateData bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Patients ADD CONSTRAINT
	PK_Patients PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
