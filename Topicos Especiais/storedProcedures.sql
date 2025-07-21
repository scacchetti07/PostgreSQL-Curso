-- Stored Procedures (procedimentos armazenados)
-- Semelhantes as funções, poré sua forma de chamada é diferente
-- Usando Procedures, não é necessário colocar em uma consulta SELECT no SQL

-- Ideia é criar uam função que irá inserir um novo dado na tabela de bairro
CREATE PROCEDURE INSERE_BAIRRO(NOME_BAIRRO VARCHAR(30)) LANGUAGE SQL AS
$$
	INSERT INTO BAIRRO (NOME) VALUES (NOME_BAIRRO);
$$;

call INSERE_BAIRRO('Teste procedure')

select * from bairro;

-- Exercícios Procedures

-- 1. Crie uma stored procedure que receba como parâmetro o ID do produto e o percentual de aumento, 
-- e reajuste o preço somente deste produto de acordo com o valor passado como parâmetro

CREATE OR REPLACE PROCEDURE REAJUSTE_PRECO_PROD(IDPRD INTEGER, PORCENTAGEM FLOAT) LANGUAGE SQL AS
$$
	UPDATE PRODUTO SET VALOR = VALOR + ((VALOR * PORCENTAGEM) / 100) WHERE IDPRODUTO = IDPRD;
$$;
SELECT IDPRODUTO FROM PRODUTO WHERE VALOR = (SELECT MIN(VALOR) FROM PRODUTO WHERE VALOR > 0); -- = 9

CALL REAJUSTE_PRECO_PROD(7, 10);

SELECT * FROM PRODUTO;

-- 2. Crie uma stored procedure que receba como parâmetro o ID do produto e exclua da base de dados somente o produto com o ID correspondente

CREATE OR REPLACE PROCEDURE REMOVA_PROD(IDPRD INTEGER) LANGUAGE SQL AS
$$
	DELETE FROM PRODUTO WHERE IDPRODUTO = IDPRD;
$$;

-- Para remover, não deve haver referência em outra tabela.
CALL REMOVA_PROD(9);

SELECT * FROM PRODUTO;