USE [Proj_AC]
GO
/****** Object:  StoredProcedure [dbo].[sp_processarAlteracaoStatusAluno]    Script Date: 14/08/2021 22:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_processarAlteracaoStatusAluno] (@CODIGOALUNOSOLICITADO INT, @STATUSSOLICITADO CHAR(1)) AS

DECLARE @ALUNOEXISTE INT
DECLARE @STATUSATUAL CHAR(1)
DECLARE @STATUSCURSOALUNO CHAR(1)
DECLARE @NOME VARCHAR(50)

SET @ALUNOEXISTE = (SELECT codAluno FROM aluno WHERE codAluno = @CODIGOALUNOSOLICITADO)
SET @STATUSATUAL = (SELECT status FROM aluno WHERE codAluno = @CODIGOALUNOSOLICITADO)
SET @STATUSCURSOALUNO = (SELECT status FROM curso WHERE codCurso = (SELECT codCurso FROM aluno WHERE codAluno = @CODIGOALUNOSOLICITADO))
SET @NOME = (SELECT nome FROM aluno WHERE codAluno = @CODIGOALUNOSOLICITADO)

IF(@ALUNOEXISTE = @CODIGOALUNOSOLICITADO)
BEGIN
IF(@STATUSSOLICITADO NOT IN ('T','F'))
BEGIN
	PRINT 'O Status solicitado não é reconhecido!'
END
IF(@STATUSCURSOALUNO = 'F' AND @STATUSSOLICITADO = 'T')
BEGIN
	PRINT 'O aluno ' + @NOME + ' não pode ter seu status ativado, pois o curso do mesmo está com status desativado!'
END
ELSE IF(@STATUSATUAL = 'F' AND @STATUSSOLICITADO = 'F')
BEGIN
	PRINT 'O aluno ' + @NOME + ' já está com status desativado!'
END
ELSE IF(@STATUSATUAL = 'T' AND @STATUSSOLICITADO = 'T')
BEGIN
	PRINT 'O aluno ' + @NOME + ' já está com status ativado!'
END
ELSE IF(@STATUSATUAL = 'T' AND @STATUSSOLICITADO = 'F')
BEGIN
	UPDATE aluno SET status = @STATUSSOLICITADO WHERE codAluno = @CODIGOALUNOSOLICITADO
	PRINT 'Status do aluno ' + @NOME + ' desativado com sucesso!'
END
ELSE IF(@STATUSATUAL = 'F' AND @STATUSSOLICITADO = 'T')
BEGIN
	UPDATE aluno SET status = @STATUSSOLICITADO WHERE codAluno = @CODIGOALUNOSOLICITADO
	PRINT 'Status do aluno ' + @NOME + ' ativado com sucesso!'
END
END
ELSE
BEGIN
	PRINT 'O Aluno não existe!'
END

GO
