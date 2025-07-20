-- -- UPDATE e DELETE

-- -- Update sem Where resulta na alteração na tabela inteira
-- UPDATE cliente set nome = 'Teste' WHERE idcliente = 1;
-- UPDATE cliente set nome = 'Adriano', genero = 'M', numero = '241' WHERE idcliente = 4;

-- INSERT INTO cliente (idcliente, nome) values (16, 'João');
-- Delete sem Where resulta na exclusão de TODOS os valores adicionados na tabela
-- DELETE FROM cliente where idcliente = 16;


-- -- Somente para ficar exibindo a tabela toda vez que algo for modificado
-- SELECT * FROM cliente;



-- Exercício

-- 1. Inserindo dados na tabela cliente
INSERT INTO cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, municipio, uf) values (16, 'Maicon', '12349596421', '1234', '1965-10-10', 'F', 'Empresário', 'Florianópolis', 'PR');

INSERT INTO cliente (idcliente, nome, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf) values (17, 'Getúlio', '4631', 'F', 'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curítiba', 'SC');

INSERT INTO cliente (idcliente, nome, genero, profissao, nacionalidade, numero, complemento) values (18, 'Sandra', 'M', 'Professor', 'Italiana', '12', 'Bloco A');

-- 2. Altere os dados do cliente Maicon
UPDATE cliente set cpf = '45390569432', genero = 'M', nacionalidade = 'Brasileira', uf = 'SC' WHERE idcliente = 16;

-- 3. Altere os dados do cliente Getúlio
UPDATE cliente set data_nascimento = '1978-04-01', genero = 'M' WHERE idcliente = 17;

-- 4. Altere os dados da cliente Sandra
UPDATE cliente set genero = 'F', profissao = 'Professora', numero = '123' WHERE idcliente = 18;

-- 5. Apague o Maicon da tabela
DELETE FROM cliente WHERE idcliente = 16;

-- 6. Apague a Sandra da tabela
DELETE FROM cliente WHERE idcliente = 18;
