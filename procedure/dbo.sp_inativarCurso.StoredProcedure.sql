USE [Proj_AC]
GO
/****** Object:  StoredProcedure [dbo].[sp_inativarCurso]    Script Date: 15/08/2021 13:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_inativarCurso] (@CODIGOCURSO INT) AS 

DECLARE @CURSOEXISTE INT
DECLARE @NOME VARCHAR(50)
DECLARE @STATUSATUAL CHAR(1)

SET @CURSOEXISTE = (SELECT codCurso FROM curso WHERE codCurso = @CODIGOCURSO)
SET @NOME = (SELECT nome FROM curso WHERE codCurso = @CODIGOCURSO)
SET @STATUSATUAL = (SELECT status FROM curso WHERE codCurso = @CODIGOCURSO)

IF(@CURSOEXISTE = @CODIGOCURSO)
BEGIN
IF(@STATUSATUAL = 'T')
BEGIN
	UPDATE aluno SET status = 'F' WHERE codCurso = @CODIGOCURSO
	UPDATE curso SET status = 'F' WHERE codCurso = @CODIGOCURSO
	PRINT 'O curso ' + @NOME + ' teve seu status inativado com sucesso!'
END
ELSE
BEGIN
	PRINT 'O curso ' + @NOME + ' já está com seu status inativado!'
END
END
ELSE
BEGIN
	PRINT 'O Curso não existe!'
END
GO
