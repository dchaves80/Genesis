USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_RolesPermissions]	@RoleId bigint,
													@ModuleId bigint
AS

INSERT INTO UsersRoles VALUES(@RoleId, @ModuleId);
SELECT TOP 1 Id FROM RolesPermissions ORDER BY Id DESC