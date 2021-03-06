USE [Proj_AC]
GO
/****** Object:  StoredProcedure [dbo].[sp_processarExclusaoCurso]    Script Date: 15/08/2021 13:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_processarExclusaoCurso] (@CODIGOCURSO INT) AS 

DECLARE @CURSOEXISTE INT
DECLARE @NOME VARCHAR(50)
DECLARE @CURSOSEMALUNO INT 

SET @CURSOEXISTE = (SELECT codCurso FROM curso WHERE codCurso = @CODIGOCURSO)
SET @NOME = (SELECT nome FROM curso WHERE codCurso = @CODIGOCURSO)
SET @CURSOSEMALUNO = (SELECT COUNT(*) FROM aluno WHERE codCurso = @CODIGOCURSO)

IF(@CURSOEXISTE = @CODIGOCURSO)
BEGIN
IF(@CURSOSEMALUNO = 0)
BEGIN
	DELETE FROM curso WHERE codCurso = @CODIGOCURSO
	PRINT 'O curso ' + @NOME + ' foi excluído com sucesso!'
END
ELSE
BEGIN
	PRINT 'O curso ' + @NOME + ' existe aluno associado e não pode ser excluído!'
END
END
ELSE
BEGIN
	PRINT 'O Curso não existe!'
END
GO
