-- Índices
-- Utilizado para acelerar as pesquisas na base de dados
-- Importante usar os index em campos de datas (são muito utilizados)
-- O banco de dados pode ficar mais pesado ao adicionar muitos index
-- A pesquisa de index é aplicada quando você utiliza no select, o campo o qual foi criado um index para ele (ou seja, automaticamente)
CREATE INDEX IDX_CLN_NOME ON CLIENTE (NOME); -- CRIANDO UM INDEX PARA A COLUNA NOME NA TABELA DE CLIENTE
DROP INDEX IDX_CLN_NOME;

SELECT NOME FROM CLIENTE;

-- O resultado nessa base de dados que criamos no curso é super pequena, mas para bancos de dados maiores e mais estruturados, a velocidade se torna significativa.
-- Com index: 0.047
-- Sem index: 0.055

-- Adicionando Indices nas tabelas (Exercício)

-- 1. Adicione índices nas seguintes tabelas e campos

-- a. Pedido – data do pedido
CREATE INDEX IDX_PDD_DATA ON PEDIDO (DATA_PEDIDO);

-- b. Produto – nome
CREATE INDEX IDX_PRD_NOME ON PRODUTO (NOME);