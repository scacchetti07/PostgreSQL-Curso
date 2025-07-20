-- Consultas Simples --

-- 19. O nome dos autores em ordem alfabética.
SELECT NOME FROM AUTOR ORDER BY NOME;

-- 20. O nome dos alunos que começam com a letra P.
SELECT NOME FROM ALUNO WHERE NOME LIKE 'P%';

-- 21. O nome dos livros da categoria Banco de Dados ou Java.
SELECT NOME FROM LIVRO WHERE IDCATEGORIA IN (1, 3);

-- 22. O nome dos livros da editora Bookman.
SELECT NOME FROM LIVRO WHERE IDEDITORA = (SELECT IDEDITORA FROM EDITORA WHERE NOME = 'Bookman');

-- 23. Os empréstimos realizados entre 05/05/2012 e 10/05/2012.
SELECT * FROM EMPRESTIMO WHERE DATA_EMPRESTIMO BETWEEN '2012-05-05' AND '2012-05-10';

-- 24. Os empréstimos que não foram feitos entre 05/05/2012 e 10/05/2012
SELECT * FROM EMPRESTIMO WHERE DATA_EMPRESTIMO NOT BETWEEN '2012-05-05' AND '2012-05-10';

-- 25. Os empréstimos que os livros já foram devolvidos.
SELECT * FROM EMPRESTIMO WHERE DEVOLVIDO = 'S';

-- Consultas com Agrupamento Simples --

-- 26. A quantidade de livros.
SELECT COUNT(*) AS TOTAL FROM LIVRO;

-- 27. O somatório do valor dos empréstimos.
SELECT 'R$ ' || SUM(VALOR) AS SOMA_EMPRESTIMOS FROM EMPRESTIMO;

-- 28. A média do valor dos empréstimos.
SELECT ROUND(AVG(VALOR), 2) AS MEDIA_EMPRESTIMOS FROM EMPRESTIMO;

-- 29. O maior valor dos empréstimos.
SELECT MAX(VALOR) AS MAIOR_EMPRESTIMO FROM EMPRESTIMO;

-- 30. O menor valor dos empréstimos.
SELECT MIN(VALOR) AS MENOR_eMPRESTIMO FROM EMPRESTIMO;

-- 31. O somatório do valor do empréstimo que estão entre 05/05/2012 e 10/05/2012.
SELECT SUM(VALOR) AS VALOR_TOTAL_EMPRESTIMO FROM EMPRESTIMO WHERE DATA_EMPRESTIMO BETWEEN '2012-05-05' AND '2012-05-10';

-- 32. A quantidade de empréstimos que estão entre 01/05/2012 e 05/05/2012.
SELECT COUNT(*) AS QTD_TOTAL_EMPRESTIMO FROM EMPRESTIMO WHERE DATA_EMPRESTIMO BETWEEN '2012-05-01' AND '2012-05-05';

-- Consultas com JOINS --

-- 33. O nome do livro, a categoria e a editora (LIVRO) – fazer uma view
CREATE VIEW LIVRO_INFOS AS
SELECT
	LIV.NOME AS LIVRO,
	CAT.NOME AS CATEGORIA,
	EDT.NOME AS EDITORA
FROM
	LIVRO LIV
LEFT OUTER JOIN
	CATEGORIA CAT ON LIV.IDCATEGORIA = CAT.IDCATEGORIA
LEFT OUTER JOIN
	EDITORA EDT ON LIV.IDEDITORA = EDT.IDEDITORA;

select * from livro_infos;

-- 34. O nome do livro e o nome do autor (LIVRO_AUTOR) – fazer uma view.
CREATE VIEW LIVRO_AUTOR_INFOS AS
SELECT  
	LIV.NOME AS LIVRO,
	AUT.NOME AS AUTOR
FROM 
	LIVRO_AUTOR LVA
LEFT OUTER JOIN
	LIVRO LIV ON LVA.IDLIVRO = LIV.IDLIVRO
LEFT OUTER JOIN
	AUTOR AUT ON LVA.IDAUTOR = AUT.IDAUTOR;

SELECT * FROM LIVRO_AUTOR_INFOS;

-- 35. O nome dos livros do autor Ian Graham (LIVRO_AUTOR).
SELECT  
	LIV.NOME AS LIVRO,
	AUT.NOME AS AUTOR
FROM 
	LIVRO_AUTOR LVA
LEFT OUTER JOIN
	LIVRO LIV ON LVA.IDLIVRO = LIV.IDLIVRO
LEFT OUTER JOIN
	AUTOR AUT ON LVA.IDAUTOR = AUT.IDAUTOR
WHERE 
	AUT.NOME = 'Ian Graham';

-- USANDO A VIEW
SELECT * FROM LIVRO_AUTOR_INFOS WHERE AUTOR = 'Ian Graham';

-- 36. O nome do aluno, a data do empréstimo e a data de devolução (EMPRESTIMO).
SELECT 
	ALN.NOME AS ALUNO,
	EMP.DATA_EMPRESTIMO,
	EMP.DATA_DEVOLUCAO
FROM
	EMPRESTIMO EMP
LEFT JOIN
	ALUNO ALN ON EMP.IDALUNO = ALN.IDALUNO;

-- 37. O nome de todos os livros que foram emprestados (EMPRESTIMO_LIVRO).
SELECT
	EPL.IDEMPRESTIMO,
	LIV.NOME AS LIVRO
FROM 
	EMPRESTIMO_LIVRO EPL
INNER JOIN
	LIVRO LIV ON EPL.IDLIVRO = LIV.IDLIVRO;

-- Consultas com Agrupamento + JOIN --

-- 38. O nome da editora e a quantidade de livros de cada editora (LIVRO).
SELECT 
	EDT.NOME AS EDITORA,
	COUNT(LIV.IDLIVRO) AS TOTAL_LIVROS
FROM 
	LIVRO LIV
LEFT OUTER JOIN
	EDITORA EDT ON LIV.IDEDITORA = EDT.IDEDITORA
GROUP BY
	EDT.NOME;

-- 39. O nome da categoria e a quantidade de livros de cada categoria (LIVRO).
SELECT
	CAT.NOME AS CATEGORIA,
	COUNT(IDLIVRO) AS TOTAL_LIVROS
FROM
	LIVRO LIV
LEFT OUTER JOIN
	CATEGORIA CAT ON LIV.IDCATEGORIA = CAT.IDCATEGORIA
GROUP BY
	CAT.NOME;

-- UTILIZANDO A VIEW
SELECT CATEGORIA, COUNT(LIVRO) AS TOTAL_LIVROS FROM LIVRO_INFOS GROUP BY CATEGORIA;
	
-- 40. O nome do autor e a quantidade de livros de cada autor (LIVRO_AUTOR).
SELECT 
	AUT.NOME AS AUTOR,
	COUNT(IDLIVRO)
FROM 
	LIVRO_AUTOR LVA
LEFT JOIN
	AUTOR AUT ON LVA.IDAUTOR = AUT.IDAUTOR
GROUP BY
	AUT.NOME;

-- UTILIZANDO A VIEW
SELECT AUTOR, COUNT(LIVRO) FROM LIVRO_AUTOR_INFOS GROUP BY (AUTOR);

-- 41. O nome do aluno e a quantidade de empréstimo de cada aluno (EMPRESTIMO_LIVRO).
SELECT 
	ALN.NOME AS ALUNO,
	COUNT(EPL.IDEMPRESTIMO) AS TOTAL_EMPRESTIMOS
FROM 
	EMPRESTIMO_LIVRO EPL
LEFT OUTER JOIN
	EMPRESTIMO EMP ON EPL.IDEMPRESTIMO = EMP.IDEMPRESTIMO
LEFT OUTER JOIN
	ALUNO ALN ON ALN.IDALUNO = EMP.IDALUNO
GROUP BY
	ALN.NOME;
	
-- 42. O nome do aluno e o somatório do valor total dos empréstimos de cada aluno (EMPRESTIMO).
SELECT
	ALN.NOME AS ALUNO,
	SUM(EMP.VALOR) AS VALOR_TOTAL
FROM
	EMPRESTIMO EMP
LEFT JOIN
	ALUNO ALN ON EMP.IDALUNO = ALN.IDALUNO
GROUP BY
	ALN.NOME;

-- 43. O nome do aluno e o somatório do valor total dos empréstimos de cada aluno somente daqueles que o somatório for maior do que 7,00 (EMPRESTIMO).
SELECT
	ALN.NOME AS ALUNO,
	SUM(EMP.VALOR) AS VALOR_TOTAL
FROM
	EMPRESTIMO EMP
LEFT JOIN
	ALUNO ALN ON EMP.IDALUNO = ALN.IDALUNO
GROUP BY 
	ALN.NOME
HAVING
	SUM(EMP.VALOR) > 10; -- Enunciado pede 7, mas não tem nenhum maior que 7. Coloquei 10 para fazer diferença no resultado.


-- Consultas Comandos Diversos --

-- 44. O nome de todos os alunos em ordem decrescente e em letra maiúscula.
SELECT UPPER(NOME) AS ALUNOS FROM ALUNO ORDER BY NOME DESC;

-- 45. Os empréstimos que foram feitos no mês 04 de 2012.
SELECT * FROM EMPRESTIMO WHERE EXTRACT(MONTH FROM DATA_EMPRESTIMO) = 4 AND EXTRACT(YEAR FROM DATA_EMPRESTIMO) = 2012;

-- 46. Todos os campos do empréstimo. Caso já tenha sido devolvido, mostrar a mensagem “Devolução completa”, senão “Em atraso”.
SELECT
	-- *,
	IDEMPRESTIMO,
	CASE
		WHEN DEVOLVIDO = 'S' THEN 'DEVOLUÇÃO COMPLETA'
	ELSE 
		'EM ATRASO' 
	END AS DEVOLUCAO
FROM 
	EMPRESTIMO;

-- 47. Somente o caractere 5 até o caractere 10 do nome dos autores.
SELECT SUBSTRING(NOME FROM 5 FOR 5) AS AUTOR_5_TO_10 FROM AUTOR;

-- 48. O valor do empréstimo e somente o mês da data de empréstimo. Escreva “Janeiro”, “Fevereiro”, etc
SELECT 
	'R$ ' || ROUND(VALOR, 2),
	CASE EXTRACT(MONTH FROM DATA_EMPRESTIMO)
		WHEN 1 THEN 'Janeiro'
		WHEN 2 THEN 'Fevereiro'
		WHEN 3 THEN 'Março'
		WHEN 4 THEN 'Abril'
		WHEN 5 THEN 'Maio'
		WHEN 6 THEN 'Junho'
		WHEN 7 THEN 'Julho'
		WHEN 8 THEN 'Agosto'
		WHEN 9 THEN 'Setembro'
		WHEN 10 THEN 'Outubro'
		WHEN 11 THEN 'Novembro'
		WHEN 12 THEN 'Dezembro'
	END AS MES
FROM 
	EMPRESTIMO;


-- Subconsultas --

-- 49. A data do empréstimo e o valor dos empréstimos que o valor seja maior que a média de todos os empréstimos.
SELECT DATA_EMPRESTIMO, 'R$ ' || ROUND(VALOR, 2) AS VALOR_TOTAL FROM EMPRESTIMO WHERE VALOR > (SELECT AVG(VALOR) FROM EMPRESTIMO);

-- 50. A data do empréstimo e o valor dos empréstimos que possuem mais de um livro.
SELECT DATA_EMPRESTIMO, 'R$ ' || ROUND(VALOR, 2) AS VALOR_TOTAL FROM EMPRESTIMO WHERE IDEMPRESTIMO IN ((SELECT IDEMPRESTIMO FROM EMPRESTIMO_LIVRO));

-- 51. A data do empréstimo e o valor dos empréstimos que o valor seja menor que a soma de todos os empréstimos.
SELECT DATA_EMPRESTIMO, 'R$ ' || ROUND(VALOR, 2) AS VALOR_TOTAL FROM EMPRESTIMO WHERE VALOR  (SELECT SUM(VALOR) FROM EMPRESTIMO);
