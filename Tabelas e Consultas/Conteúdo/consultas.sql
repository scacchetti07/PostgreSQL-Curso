-- -- -- Consultando todos os atributos da tabela clientes criada
-- SELECT * FROM cliente;

-- -- -- Consultando somente os campos 'nome e data_nascimento' em cliente
-- SELECT nome, data_nascimento FROM cliente;

-- -- -- Consulta renomeando o título da tabela refente ao dado com 'as'
-- SELECT nome, data_nascimento as "Data de nascimento" FROM cliente;

-- -- -- Consultas de 1 coluna contendo dois tipos dados diferentes com concatenação
-- SELECT 'CPF: ' || cpf || ' RG: ' || rg as "CPF e RG" FROM cliente;

-- -- -- Consultas especificando limites de quantos atributos serão retornados
-- Select * from cliente limit 3;

-- -- Consultas com condições que retornam registros especificados
-- SELECT nome, data_nascimento from cliente WHERE data_nascimento > '2000-01-01';

-- -- Utilizando LIKE
-- -- Estrutura de filtro em consultas que permite especificarmos um valor referente ao atributo que atender a condição específicada

-- -- Consulta que retorna todos os nomes que iniciam com a letra C.
-- -- o "%" indica 'o resto', quer dizer que deve começar com C e não importa o restante da palavra
-- SELECT nome FROM cliente WHERE nome LIKE 'C%';

-- -- O nome começa com qualquer caractere, e no fim termine com qualquer caractere mas tenha a letra c no meio
-- SELECT nome FROM cliente WHERE nome LIKE '%c%';

-- -- Consulta que filtra a todos os clientes que nasceream entre(between) 01-01-1990 e 01-01-1998
-- SELECT nome, data_nascimento FROM cliente WHERE data_nascimento BETWEEN '1990-01-01' AND '1998-01-01';

-- -- Consulta que filtra todos os clientes que possuêm o RG nulo na base de dados
-- Select nome, rg from cliente where rg IS null;

-- SELECT nome from cliente ORDER BY nome; --Por padrão é ascendente, mas para ser explicíto utilize 'asc'.

-- SELECT nome from cliente ORDER BY nome DESC;


-- Exercício sobre consultas
-- 1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente
SELECT nome as "Nome", genero as "Gênero", profissao as "Profissão" FROM cliente ORDER BY nome DESC;

-- 2. Os clientes que tenham a letra “R” no nome
SELECT nome as "Nome" FROM cliente WHERE nome LIKE '%r%';

-- 3. Os clientes que o nome inicia com a letra “C”
SELECT nome FROM cliente WHERE nome LIKE 'C%';

-- 4. Os clientes que o nome termina com a letra “A”
SELECT nome FROM cliente WHERE nome LIKE '%a';

-- 5. Os clientes que moram no bairro “Centro”
SELECT nome, bairro FROM cliente WHERE bairro = 'Centro' or bairro = 'Cto.' or bairro =  'Ctr.'; -- Comando certo, mas não adequado.

-- 6. Os clientes que moram em complementos que iniciam com a letra “A”
SELECT nome, complemento FROM cliente WHERE complemento LIKE 'A%';

-- 7. Somente os clientes do sexo feminino
SELECT nome, genero FROM cliente WHERE genero LIKE 'F';

-- 8. Os clientes que não informaram o CPF
SELECT nome, cpf FROM cliente WHERE cpf is null;

-- 9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão
SELECT nome, profissao FROM cliente ORDER BY profissao;

-- 10. Os clientes de nacionalidade “Brasileira”
SELECT nome, nacionalidade FROM cliente WHERE nacionalidade LIKE 'Brasil%'; -- ou nacionalidade = 'Brasileira'

-- 11. Os clientes que informaram o número da residência
SELECT nome, numero FROM cliente WHERE numero is not null; -- Consulta que só irá exibir o que a condição nega for verdade.

-- 12. Os clientes que moram em Santa Catarina
SELECT nome, uf FROM cliente WHERE uf = 'SC';

-- 13. Os clientes que nasceram entre 01/01/2000 e 01/01/2002
SELECT nome, data_nascimento as "Data de Nascimento" FROM cliente WHERE data_nascimento BETWEEN '2000-01-01' AND '2002-01-01';

-- 14. O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
SELECT nome || ' - ' || logradouro || ' - ' || numero || ' - ' || complemento || ' - ' || bairro || ' - ' || municipio || ': ' || uf as "Localização do Cliente" FROM cliente;
