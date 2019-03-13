create procedure Get_AlreadyUsedByAccessCode (@AccessCode varchar(50))
as
begin
SELECT AlreadyUsed FROM AccessCodes WHERE AccessCode = @AccessCode
end

GO