USE [Genesis]
GO

/****** Object:  StoredProcedure [dbo].[Get_Modules]    Script Date: 19/02/2019 18:59:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Get_Module] (	@Id bigint = NULL,
								@NombreModulo varchar(50) = NULL,
								@Ascx varchar(50) = NULL,
								@Dll varchar(50) = NULL)
AS
BEGIN

DECLARE @Sql nvarchar(max)

SET @Sql = 'SELECT * from [Modules] where 1=1';

IF @Id IS NOT NULL
	SET @Sql = @Sql + 'AND Id = @Id';

IF @NombreModulo IS NOT NULL
	SET @Sql = @Sql + 'AND NombreModulo = @NombreModulo';

IF @Ascx IS NOT NULL
	SET @Sql = @Sql + 'AND Ascx = @Ascx';

IF @Dll IS NOT NULL
	SET @Sql = @Sql + 'And Dll = @Dll';


EXEC sp_executesql @sql, N'
		@Id bigint,
		@NombreModulo varchar(50),
		@Ascx varchar(50),
		@Dll varchar(50)',
		@Id, @NombreModulo, @Ascx, @Dll;		

END


GO

USE [Genesis]
GO

/****** Object:  StoredProcedure [dbo].[Insert_Module]    Script Date: 19/02/2019 19:48:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Insert_Module] (	@NombreModulo varchar(50),
									@Ascx varchar(50),
									@Dll varchar(50))
as
begin

insert into [Modules] values (@NombreModulo, @Ascx, @Dll);
select top 1 Id from [Modules] order by Id desc

end								
GO

