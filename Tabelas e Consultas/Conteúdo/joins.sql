-- Relacionamento com joins: A sua ideia é para fazer a junção entre as tabelas
-- Tipos de Join e suas aliases: https://stackoverflow.com/questions/406294/left-join-vs-left-outer-join-in-sql-server

-- Exemplo: Vamos exibir o nome do cliente e o nome de sua profissão invés do ID

-- Left Join: cliente -> profissao
-- Retorna todos os clientes tendo profissão ou não
Select 
	cln.nome as Cliente, 
	prf.nome as Profissao
From 
	cliente as cln
Left outer join -- Leva a tabela da esquerda como a principal e da direita como complementar, logo retorna tudo que tem na direita e o que é relacionado com ele da esquerda
	profissao as prf on cln.idprofissao = prf.idprofissao

-- Inner Join: cliente -> <- profissao
-- Retorna 
Select 
	cln.nome as Cliente, 
	prf.nome as Profissao
From 
	cliente as cln
Inner join -- Leva o que tem entre as duas tabelas como prioridade e força o relacionamento entre elas (anulando valores nulos)
	profissao as prf on cln.idprofissao = prf.idprofissao

-- Right Join: cliente <- profissao
-- Retorna somente os clientes que possuêm profissões
Select 
	cln.nome as Cliente, 
	prf.nome as Profissao
From 
	cliente as cln
Right outer join -- Leva a tabela da direita como a principal e da esquerda como complementar, logo retorna tudo que tem na esquerda e o que é relacionado com ele da direita
	profissao as prf on cln.idprofissao = prf.idprofissao


-- Exercícios

-- 1. O nome do cliente, a profissão, a nacionalidade, o logradouro, o número, o complemento, o bairro, o município e a unidade de federação.
Select
	cln.nome as Cliente,
	prf.nome as Profissao,
	cln.logradouro as Logradouro,
	cln.numero as Numero,
	cpl.nome as Complemento,
	ncn.nome as Nacionalidade,
	brr.nome as Bairro,
	mcp.nome as Municipio,
	uf.sigla as UF
From
	cliente as cln
Left outer join
	profissao as prf on cln.idprofissao = prf.idprofissao
Left outer join
	complemento as cpl on cln.idcomplemento = cpl.idcomplemento
Left outer join
	nacionalidade as ncn on cln.idnacionalidade = ncn.idnacionalidade
Left outer join
	bairro as brr on cln.idbairro = brr.idbairro
Left outer join
	municipio as mcp on cln.idmunicipio = mcp.idmunicipio
Left outer join
	uf on mcp.iduf = uf.iduf;

-- 2. O nome do produto, o valor e o nome do fornecedor.
SELECT
	PRD.NOME AS PRODUTO,
	PRD.VALOR AS VALOR,
	FRN.NOME AS FORNECEDOR
FROM
	PRODUTO AS PRD
LEFT JOIN 
	FORNECEDOR AS FRN ON PRD.IDFORNECEDOR = FRN.IDFORNECEDOR;

-- 3. O nome da transportadora e o município.
SELECT
	TRN.NOME AS TRANSPORTADORA,
	MCP.NOME AS MUNICIPIO
FROM
	TRANSPORTADORA AS TRN
LEFT JOIN 
	MUNICIPIO AS MCP ON TRN.IDMUNICIPIO = MCP.IDMUNICIPIO;

-- 4. A data do pedido, o valor, o nome do cliente, o nome da transportadora e o nome do vendedor.
SELECT
	PDD.DATA_PEDIDO AS "Data Pedido",
	CLN.NOME AS CLIENTE,
	TRN.NOME AS TRANSPORTADORA,
	VDD.NOME AS VENDEDOR
FROM
	PEDIDO AS PDD
LEFT OUTER JOIN
	CLIENTE AS CLN ON PDD.IDCLIENTE = CLN.IDCLIENTE
LEFT OUTER JOIN
	TRANSPORTADORA AS TRN ON PDD.IDTRANSPORTADORA = TRN.IDTRANSPORTADORA
LEFT OUTER JOIN
	VENDEDOR AS VDD ON PDD.IDVENDEDOR = VDD.IDVENDEDOR;
-- 5. O nome do produto, a quantidade e o valor unitário dos produtos do pedido.
SELECT
	PRD.NOME AS PRODUTO,
	PDP.QUANTIDADE,
	PDP.VALOR_UNITARIO
FROM
	PEDIDO_PRODUTO AS PDP
LEFT OUTER JOIN -- INNER JOIN
	PRODUTO AS PRD ON PDP.IDPRODUTO = PRD.IDPRODUTO; 

-- 6. O nome dos clientes e a data do pedido dos clientes que fizeram algum pedido (ordenado pelo nome do cliente).
SELECT 
	CLN.NOME AS CLIENTE,
	PDD.DATA_PEDIDO
FROM 
	PEDIDO AS PDD
INNER JOIN
	CLIENTE AS CLN ON PDD.IDCLIENTE = CLN.IDCLIENTE
ORDER BY
	CLN.NOME;

-- 7. O nome dos clientes e a data do pedido de todos os clientes, independente se tenham feito pedido (ordenado pelo nome do cliente).
SELECT
	CLN.NOME AS CLIENTE,
	PDD.DATA_PEDIDO
FROM 
	PEDIDO AS PDD
FULL OUTER JOIN -- LEFT OUTER JOIN
	CLIENTE AS CLN ON PDD.IDCLIENTE = CLN.IDCLIENTE
ORDER BY 
	CLN.NOME;

-- 8. O nome da cidade e a quantidade de clientes que moram naquela cidade.
SELECT 
	MCP.NOME AS MUNICIPIO,
	COUNT(CLN.IDCLIENTE) AS "total clientes"
FROM 
	CLIENTE CLN
INNER JOIN -- INNER JOIN irá somente aparecer os clientes que possuêm um munícipio registrado.
	MUNICIPIO MCP ON CLN.IDMUNICIPIO = MCP.IDMUNICIPIO
GROUP BY
	MCP.NOME;

-- 9. O nome do fornecedor e a quantidade de produtos de cada fornecedor.
SELECT 
	FRN.NOME AS FORNECEDOR,
	COUNT(PRD.IDFORNECEDOR) AS "quantidade de produtos"
FROM
	FORNECEDOR AS FRN
LEFT JOIN
	PRODUTO AS PRD ON FRN.IDFORNECEDOR = PRD.IDFORNECEDOR
GROUP BY
	FRN.NOME;

-- 10. O nome do cliente e o somatório do valor do pedido (agrupado por cliente).
SELECT
	CLN.NOME AS CLIENTE,
	SUM(PDD.VALOR) AS SOMATORIO
FROM 
	CLIENTE AS CLN
RIGHT JOIN
	PEDIDO AS PDD ON CLN.IDCLIENTE = PDD.IDCLIENTE
GROUP BY 
	CLN.NOME;

-- 11. O nome do vendedor e o somatório do valor do pedido (agrupado por vendedor).
SELECT 
	VDD.NOME AS VENDEDOR,
	SUM(PDD.VALOR) AS "valor total de vendas"
FROM 
	VENDEDOR AS VDD
RIGHT OUTER JOIN
	PEDIDO AS PDD ON VDD.IDVENDEDOR = PDD.IDVENDEDOR
GROUP BY 
	VDD.IDVENDEDOR;


-- 12. O nome da transportadora e o somatório do valor do pedido (agrupado por transportadora).
SELECT 
	TRN.NOME AS TRANSPORTADORA,
	SUM(PDD.VALOR) AS "Valor total de entregas"
FROM 
	TRANSPORTADORA AS TRN
INNER JOIN -- Use RIGHT JOIN para obter o valor total sem a transportadora (null)
	PEDIDO AS PDD ON TRN.IDTRANSPORTADORA = PDD.IDTRANSPORTADORA
GROUP BY
	TRN.IDTRANSPORTADORA;

-- 13. O nome do cliente e a quantidade de pedidos de cada um (agrupado por cliente).
SELECT 
	CLN.NOME AS CLIENTE,
	COUNT(PDD.IDPEDIDO) AS PEDIDOS
FROM
	CLIENTE AS CLN
RIGHT OUTER JOIN -- Usar Right Join nesse caso para que retorne somente os cliente que tenham ao menos 1 pedido efetuado.
	PEDIDO AS PDD ON CLN.IDCLIENTE = PDD.IDCLIENTE
GROUP BY
	CLN.IDCLIENTE;

-- 14. O nome do produto e a quantidade vendida (agrupado por produto).
SELECT
	PRD.NOME AS PRODUTO,
	SUM(PDP.QUANTIDADE) AS "quantidade vendida"
FROM
	PEDIDO_PRODUTO AS PDP
LEFT OUTER JOIN
	PRODUTO AS PRD ON PDP.IDPRODUTO = PRD.IDPRODUTO
GROUP BY
	PRD.IDPRODUTO;

-- 15. A data do pedido e o somatório do valor dos produtos do pedido (agrupado pela data do pedido).
-- Exercício pede para realizar a somatória dos valor unitário dos produtos a partir da data do pedido.
SELECT
	PDD.DATA_PEDIDO,
	SUM(PDP.VALOR_UNITARIO) AS TOTAL
FROM 
	PEDIDO AS PDD
LEFT OUTER JOIN
	PEDIDO_PRODUTO AS PDP ON PDD.IDPEDIDO = PDP.IDPEDIDO
GROUP BY 
	PDD.DATA_PEDIDO;
	
-- 16. A data do pedido e a quantidade de produtos do pedido (agrupado pela data do pedido).
SELECT
	PDD.DATA_PEDIDO,
	SUM(PDP.QUANTIDADE) AS "quantidade de produtos pedido"
FROM 
	PEDIDO AS PDD
INNER JOIN -- LEFT OUTER JOIN (pode ser tbm)
	PEDIDO_PRODUTO AS PDP ON PDD.IDPEDIDO = PDP.IDPEDIDO
GROUP BY
	PDD.DATA_PEDIDO;