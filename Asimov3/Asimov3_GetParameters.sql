USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[ASIMOV3_GetParameters]    Script Date: 27/2/2019 18:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ASIMOV3_GetParameters] @ProcName varchar(50) AS

SELECT  
	'ParameterName' = name,  
	'Type'   = type_name(user_type_id),  
	'Length'   = max_length

FROM sys.parameters WHERE object_id = object_id(@ProcName)