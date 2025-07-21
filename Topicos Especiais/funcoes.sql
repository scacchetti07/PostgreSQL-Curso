-- Funções

-- Nome de parâmetro deve ser diferente do campo
Select valor, concat('R$ ', round(cast(valor as numeric), 2)) from pedido

create function formata_moeda(valor float) returns varchar(20) language plpgsql as
$$
begin
	return concat('R$ ', round(cast(valor as numeric), 2));
end;
$$;

select formata_moeda(valor) from pedido
select formata_moeda(valor) from produto;

-- Criando outra função 
create function get_nome_by_id(idc integer) returns varchar(50) language plpgsql as
$$
declare r varchar(50);
begin
	select nome into r from cliente where idcliente = idc;
	return r;
end;
$$;

select data_pedido, valor, idcliente, get_nome_by_id(idcliente) from pedido;

-- Exercícios Funções

-- 1. Crie uma função que receba como parâmetro o ID do pedido e retorne o valor total deste pedido
SELECT * FROM PEDIDO;
CREATE FUNCTION get_value_by_id(idp integer) RETURNS VARCHAR(20) LANGUAGE PLPGSQL AS
$$
BEGIN
	RETURN FORMATA_MOEDA(VALOR) FROM PEDIDO WHERE IDPEDIDO = IDP; -- Já vem formatado automaticamente.
END;
$$;

-- DROP FUNCTION get_value_by_id; -- Excluí a função criada

SELECT GET_VALUE_BY_ID(IDPEDIDO) FROM PEDIDO; 

-- 2. Crie uma função chamada “maior”, que quando executada retorne o pedido com o maior valor

CREATE OR REPLACE FUNCTION MAIOR_PEDIDO()  RETURNS INTEGER LANGUAGE PLPGSQL AS
$$
BEGIN
	RETURN (SELECT IDPEDIDO FROM PEDIDO WHERE VALOR = (SELECT MAX(VALOR) FROM PEDIDO));
END;
$$;

DROP FUNCTION MAIOR;

SELECT MAIOR_PEDIDO(); -- Pode ser executado assim tbm para obter um único resultado
SELECT VALOR FROM PEDIDO WHERE IDPEDIDO = MAIOR_PEDIDO();



-- Outros Exemplos só para praticar

create function letra_maiuscula(TXT VARCHAR(50)) returns varchar(50) language plpgsql as
$$
BEGIN
	RETURN UPPER(TXT);
END;
$$;

CREATE FUNCTION NOME_MAIOR_PEDIDO() RETURNS VARCHAR(50) LANGUAGE PLPGSQL AS
$$
DECLARE NOME VARCHAR(50);
BEGIN
	SELECT CLN.NOME INTO NOME AS CLIENTE 
	FROM PEDIDO PDD 
	LEFT JOIN CLIENTE CLN ON PDD.IDCLIENTE = CLN.IDCLIENTE 
	WHERE PDD.VALOR = (SELECT MAX(VALOR) FROM PEDIDO);

	RETURN NOME;
END;
$$;

select NOME_MAIOR_PEDIDO();