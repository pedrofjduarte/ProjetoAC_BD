USE [Proj_AC]
GO
/****** Object:  StoredProcedure [dbo].[sp_processarExclusaoAluno]    Script Date: 15/08/2021 13:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_processarExclusaoAluno] (@CODIGOALUNO INT) AS 

DECLARE @ALUNOEXISTE INT 
DECLARE @NOME VARCHAR(50)

SET @ALUNOEXISTE = (SELECT codAluno FROM aluno WHERE codAluno = @CODIGOALUNO)
SET @NOME =  (SELECT nome FROM aluno WHERE codAluno = @CODIGOALUNO)

IF(@ALUNOEXISTE = @CODIGOALUNO)
BEGIN
	DELETE FROM aluno WHERE codAluno = @CODIGOALUNO
	PRINT 'O aluno ' + @NOME + ' foi excluído com sucesso!'
END
ELSE
BEGIN
	PRINT 'O Aluno não existe!'
END
GO
