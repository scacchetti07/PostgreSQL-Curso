-- Usuários e Permissões

-- Criando Cargos/Papeis
CREATE ROLE GERENTE;
CREATE ROLE ESTAGIARIO;

-- Permissões do gerente
grant select, insert, delete, update
on  bairro, 
	cliente, 
	complemento, 
	fornecedor, 
	municipio, 
	nacionalidade, 
	pedido, 
	pedido_produto, 
	produto, 
	profissao, 
	transportadora, 
	uf, 
	vendedor 
to gerente with grant option; -- 'with grant option' permite que o cargo gerente conceda acesso a outros cargos no futuro.

grant all on all tables in schema public to gerente;

-- Permissões do estagiario
grant select on cliente_infos, pedido_infos to estagiario;

-- Criando Usuários
CREATE ROLE MARIA login password '123' in role gerente; -- maria faz login na senha e está relacionada ao cargo gerente;
CREATE ROLE PEDRO LOGIN PASSWORD '321' IN ROLE estagiario; -- Pedro faz login na senha e está relacionada ao cargo estagiário;

-- Atualizando uma permissão
grant all on all sequences in schema public to gerente;

-- Removendo permissões: revoke



-- Exercícios
-- 1. Crie um novo papel chamado “atendente”
CREATE ROLE ATENDENTE;

-- 2. Defina somente permissões para o novo papel poder selecionar e incluir novos pedidos (tabelas pedido e pedido_produto). O restante do acesso deve estar bloqueado
GRANT SELECT, INSERT ON PEDIDO, PEDIDO_PRODUTO, PEDIDO_INFOS, PEDIDO_VALORES TO ATENDENTE;
GRANT ALL ON PEDIDO_ID_SEQ, PRODUTO_ID_SEQ TO ATENDENTE;

-- REVOKE ALL ON PRODUTO_ID_SEQ FROM ATENDENTE; -- Removendo o acesso a sequência produto_id_seq do atendente.

-- 3. Crie um novo usuário associado ao novo papel
CREATE ROLE LUIS LOGIN PASSWORD '2007' IN ROLE ATENDENTE;

-- 4. Realize testes para verificar se as permissões foram aplicadas corretamente