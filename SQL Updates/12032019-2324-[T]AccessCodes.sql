USE [Genesis]
GO

/****** Object:  Table [dbo].[AccessCodes]    Script Date: 12/03/2019 23:23:55 ******/
DROP TABLE [dbo].[AccessCodes]
GO

/****** Object:  Table [dbo].[AccessCodes]    Script Date: 12/03/2019 23:23:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AccessCodes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccessCode] [varchar](50) NOT NULL,
	[IdUser] [bigint] NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[AlreadyUsed] [bit] NOT NULL,
 CONSTRAINT [PK_AccessCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


