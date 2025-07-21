-- Triggers (Gatilhos)
-- Criar uma função que irá executar uma tarefa, porém não precisam de uma chamada para serem executas, elas funcionam automaticamente
-- Exemplos: Quando um registro é adicionado, uma função (trigger) é executada ou Quando um registro é excluído, uma função (trigger) pode ser executada

CREATE TABLE BAIRRO_AUDITORIA (
	IDBAIRRO INTEGER NOT NULL,
	DATA_CRIACAO TIMESTAMP -- TIMESTAMP ARMAZENA A DATA COM A HORA,
);

-- Toda vez que um novo bairro for inserido, vamos adicionar a data de criação na tabela bairro_auditoria automaticamente.

-- 1° criar uma função
CREATE OR REPLACE FUNCTION BAIRRO_LOG() RETURNS TRIGGER LANGUAGE PLPGSQL AS
$$ 
BEGIN
	-- NEW: NOVO VALOR INSERIDO NA TABELA | OLD: ANTIGO VALOR INSERIDO NA TABELA (OLD 4 -> NEW 6)
	INSERT INTO BAIRRO_AUDITORIA (IDBAIRRO, DATA_CRIACAO) VALUES (NEW.IDBAIRRO, CURRENT_TIMESTAMP);
	RETURN NEW;
END; 
$$;

/*
EVENTOS ASSOCIADOS

- AFTER/BEFORE/INSTEAD OF INSERT
- AFTER/BEFORE/INSTEAD OF DELETE
- AFTER/BEFORE/INSTEAD OF UPDATE
*/

CREATE OR REPLACE TRIGGER LOG_BAIRRO_TRIGGER AFTER INSERT ON BAIRRO FOR EACH ROW EXECUTE PROCEDURE BAIRRO_LOG();

call INSERE_BAIRRO('teste 1');
call INSERE_BAIRRO('teste 2');
call INSERE_BAIRRO('teste 3');

select * from bairro;
select * from bairro_auditoria;

-- Exercício Triggers

-- 1. Crie uma tabela chamada PEDIDOS_APAGADOS
CREATE TABLE PEDIDOS_APAGADOS (
	IDPEDIDO INTEGER NOT NULL,
	IDCLIENTE INTEGER NOT NULL,
	IDTRANSPORTADORA INTEGER,
	IDVENDEDOR INTEGER NOT NULL,
	DATA_PEDIDO DATE DEFAULT CURRENT_DATE,
	VALOR FLOAT DEFAULT 0,
	DATA_REMOCAO TIMESTAMP
);

-- 2. Faça uma trigger que quando um pedido for apagado, todos os seus dados devem ser copiados para a tabela PEDIDOS_APAGADOS
CREATE OR REPLACE FUNCTION PEDIDO_LOG() RETURNS TRIGGER LANGUAGE PLPGSQL AS
$$
BEGIN
	INSERT INTO PEDIDOS_APAGADOS (IDPEDIDO, IDCLIENTE, IDTRANSPORTADORA, IDVENDEDOR, DATA_PEDIDO, VALOR, DATA_REMOCAO) 
	VALUES (OLD.IDPEDIDO, OLD.IDCLIENTE, OLD.IDTRANSPORTADORA, OLD.IDVENDEDOR, OLD.DATA_PEDIDO, OLD.VALOR, CURRENT_TIMESTAMP);

	RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER LOG_PEDIDO_TRIGGER BEFORE DELETE ON PEDIDO FOR EACH ROW EXECUTE PROCEDURE PEDIDO_LOG(); 

SELECT IDPEDIDO FROM PEDIDO WHERE IDPEDIDO NOT IN (SELECT IDPEDIDO FROM PEDIDO_PRODUTO);

-- pedidos não relacionados a tabela pedido_produto
delete from pedido where idpedido = 16;
delete from pedido where idpedido = 17;
delete from pedido where idpedido = 18;

select * from pedidos_apagados;


