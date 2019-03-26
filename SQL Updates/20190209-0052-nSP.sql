/* Nuevo SP para recuperar un usuario con el user y pass específicos. */


USE [Genesis]
GO

/****** Object:  StoredProcedure [dbo].[Get_UserByUserNameAndPassword]    Script Date: 09/02/2019 0:51:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Get_UserByUserNameAndPassword] (@UserName varchar(50), @Password varchar(40))
as
begin
select * from Users where UserName = @UserName and Password = @Password
end
GO


