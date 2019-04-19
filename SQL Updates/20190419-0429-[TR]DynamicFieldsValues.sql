CREATE TABLE [dbo].[DynamicFieldsValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DynamicFieldId] [bigint] NOT NULL,
	[Value] [varchar](255) NOT NULL,
 CONSTRAINT [PK_DynamicFieldsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DynamicFieldsValues]  WITH CHECK ADD  CONSTRAINT [FK_DynamicFieldsValues_DynamicFields] FOREIGN KEY([DynamicFieldId])
REFERENCES [dbo].[DynamicFields] ([Id])
GO

ALTER TABLE [dbo].[DynamicFieldsValues] CHECK CONSTRAINT [FK_DynamicFieldsValues_DynamicFields]
GO


