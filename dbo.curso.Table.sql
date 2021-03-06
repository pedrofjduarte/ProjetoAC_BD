USE [Proj_AC]
GO
/****** Object:  Table [dbo].[curso]    Script Date: 13/08/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso](
	[codCurso] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[cargaHoraria] [int] NOT NULL,
	[status] [char](1) NOT NULL,
 CONSTRAINT [PK_curso] PRIMARY KEY CLUSTERED 
(
	[codCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
