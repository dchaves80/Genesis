USE [Genesis]
GO

ALTER TABLE [dbo].[UsersRoles] DROP CONSTRAINT [FK_UsersRoles_Users]
GO

ALTER TABLE [dbo].[UsersRoles] DROP CONSTRAINT [FK_UsersRoles_Roles]
GO

/****** Object:  Table [dbo].[UsersRoles]    Script Date: 19/4/2019 04:39:02 ******/
DROP TABLE [dbo].[UsersRoles]
GO

/****** Object:  Table [dbo].[UsersRoles]    Script Date: 19/4/2019 04:39:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UsersRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
	ON UPDATE  NO ACTION 
	ON DELETE  CASCADE 
GO

ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO

ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
	ON UPDATE  NO ACTION 
	ON DELETE  CASCADE 
GO

ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO

