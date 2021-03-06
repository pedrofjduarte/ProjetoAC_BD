USE [Proj_AC]
GO
/****** Object:  Table [dbo].[aluno]    Script Date: 13/08/2021 00:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aluno](
	[codAluno] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[dataNascimento] [date] NOT NULL,
	[status] [char](1) NOT NULL,
	[codCurso] [int] NOT NULL,
 CONSTRAINT [PK_aluno] PRIMARY KEY CLUSTERED 
(
	[codAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aluno]  WITH CHECK ADD  CONSTRAINT [FK_aluno_aluno] FOREIGN KEY([codCurso])
REFERENCES [dbo].[curso] ([codCurso])
GO
ALTER TABLE [dbo].[aluno] CHECK CONSTRAINT [FK_aluno_aluno]
GO
