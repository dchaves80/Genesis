USE [Genesis]
GO

ALTER PROCEDURE [dbo].[Insert_DynamicField](@Name varchar(100))
as
begin
INSERT INTO DynamicFields(Name) values(@Name)
select top 1 * from DynamicFields order by Id Desc
END

GO


