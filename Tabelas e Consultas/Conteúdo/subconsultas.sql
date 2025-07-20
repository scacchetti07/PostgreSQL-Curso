-- Subconsultas

-- Selecionar a data do pedido e o valor onde o valor seja maior que a média dos valores de todos os pedidos
Select 
	data_pedido,
	valor
from 
	pedido
where
	valor > (select avg(valor) from pedido);

-- Exemplo com count
Select
	pdd.data_pedido,
	pdd.valor,
	(Select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido) as Total
from
	pedido pdd

-- Exemplo com update
select * from pedido;
update pedido set valor = valor + ((valor * 5) / 100) where valor > (select avg(valor) from pedido);

-- Exercícios

-- 1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel.
SELECT
	NOME
FROM
	CLIENTE
WHERE
	IDMUNICIPIO = (
		SELECT
			IDMUNICIPIO
		FROM
			CLIENTE
		WHERE
			NOME = 'Manoel'
	)
	AND NOME <> 'Manoel';
-- 2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.
SELECT
	DATA_PEDIDO,
	VALOR
FROM
	PEDIDO
WHERE
	VALOR < (
		SELECT
			AVG(VALOR)
		FROM
			PEDIDO
	);

-- Não sei se precisa de group by ou não
-- 3. A data,o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
SELECT
	CLN.NOME AS CLIENTE,
	PDD.DATA_PEDIDO,
	PDD.VALOR AS PRECO,
	VDD.NOME AS VENDEDOR
FROM
	PEDIDO PDD
	LEFT JOIN CLIENTE CLN ON CLN.IDCLIENTE = PDD.IDCLIENTE
	LEFT JOIN VENDEDOR VDD ON VDD.IDVENDEDOR = PDD.IDVENDEDOR
WHERE
	(
		SELECT
			SUM(QUANTIDADE)
		FROM
			PEDIDO_PRODUTO PDP
		WHERE
			PDP.IDPEDIDO = PDD.IDPEDIDO
	) >= 2;
-- 4. O nome dos clientes que moram na mesma cidade da transportadora BSTransportes.
SELECT
	NOME
FROM
	CLIENTE
WHERE
	IDMUNICIPIO = (
		SELECT
			IDMUNICIPIO
		FROM
			TRANSPORTADORA
		WHERE
			NOME = 'BS. Transportes'
	);
-- 5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.
SELECT
	CLN.NOME AS CLIENTE,
	MNC.NOME AS MUNICIPIO
FROM
	CLIENTE CLN
	LEFT JOIN MUNICIPIO MNC ON CLN.IDMUNICIPIO = MNC.IDMUNICIPIO
WHERE
	CLN.IDMUNICIPIO IN (
		SELECT
			DISTINCT(IDMUNICIPIO)
		FROM
			TRANSPORTADORA
	);
-- 6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do valor total dos produtos daquele pedido seja maior que a média do valor total 
-- de todos os produtos de todos os pedidos.
UPDATE
	PEDIDO
SET
	VALOR = VALOR + ((VALOR * 5) / 100)
WHERE
	(
		SELECT
			(SUM(PDP.VALOR_UNITARIO))
		FROM
			PEDIDO_PRODUTO PDP
		WHERE
			PEDIDO.IDPEDIDO = PDP.IDPEDIDO
	) > (SELECT
			AVG(VALOR_UNITARIO)
		FROM
			PEDIDO_PRODUTO);

select * from pedido;


-- 7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.
SELECT
	CLN.NOME,
	(
		SELECT
			COUNT(IDPEDIDO)
		FROM
			PEDIDO PDD
		WHERE
			PDD.IDCLIENTE = CLN.IDCLIENTE
	)
FROM
	CLIENTE CLN;
	
-- 8. Para revisar, refaça o exercício anterior (número 07) utilizando group by e mostrando somente os clientes que fizeram pelo menos um pedido.
Select
	cln.nome,
	count(pdd.idpedido)
from
	cliente cln
right join
	pedido pdd on cln.idcliente = pdd.idcliente
group by 
	cln.nome;