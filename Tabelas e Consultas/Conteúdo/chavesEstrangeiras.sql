UPDATE e DELETE são para modificar os DADOS
-- Comando usado para modificar a estrutura da tabela
ALTER TABLE cliente RENAME COLUMN profissao TO idprofissao;

-- Alterando o formato de string para integer
ALTER TABLE cliente ALTER COLUMN idprofissao TYPE integer;



-- Criando novamente coluna profissao mas com a relação com a tabela profissao criada e uma chave estrangeira.
Estudante: 1, 9, 10, 12, 15, 17
Engenheiro: 2
Pedreiro: 3
Jornalista: 4, 5
Professor: 7, 8, 13
Null: 11, 14


-- DROP: excluí uma coluna existente a uma tabela
-- Add: Adiciona uma novas funções a tabela (colunas, constraints e etc...)
Alter table cliente drop idprofissao;
ALter table cliente add idprofissao integer; -- Adicionado uma nova coluna na tabela cliente
Alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao (idprofissao); -- adiciona uma nova condição de chave estrangeira

-- Atualizando os dados da coluna idprofissao aos ID dos clientes.
-- IN: Operador para especificar vários valores em uma cláusula WHERE
Update cliente set idprofissao = 1 where idcliente in (1, 9, 10, 12, 15, 17);
Update cliente set idprofissao = 2 where idcliente = 2;
Update cliente set idprofissao = 3 where idcliente = 3;
Update cliente set idprofissao = 4 where idcliente in (4, 5);
Update cliente set idprofissao = 5 where idcliente in (6, 7, 8, 13);

-- Tentando excluir a profissao Estudante
delete from profissao where idprofissao = 1; -- Só será possível excluir um dado de uma coluna que possuí uma foreign key referenciada é LIMPANDO todas as referências existentes naquela tabela, e assim podendo excluir o que for necessário.


-- Inserindo e removendo um dado não referenciado na tabela cliente só para testar a exclusão
insert into profissao (idprofissao, nome) values (10, 'Teste');
delete from profissao where idprofissao = 10; -- Aceita com sucesso!


-- Coluna Nacionalidade


-- Condições de Nacionalidade
--     Brasileira: 1, 2, 3, 4, 10, 11, 14, 17
--     Italiana: 5, 7
--     Norte-Americana: 8
--     Alemã: 9, 13

-- Modificando a tabela cliente
alter table cliente drop idnacionalidade;
alter table cliente add idnacionalidade integer;

-- Adiciona uma Chave estrangeira que referencia a tabela nacionalidade
alter table cliente add constraint fk_ncn_idnacionalidade foreign key (idnacionalidade) references nacionalidade (idnacionalidade);

-- Atualizando os dados da coluna criada
update cliente set idnacionalidade = 1 WHERE idcliente in (1, 2, 3, 4, 10, 11, 14, 17);
update cliente set idnacionalidade = 2 WHERE idcliente in (5, 7);
update cliente set idnacionalidade = 3 WHERE idcliente = 8;
UPDATE cliente set idnacionalidade = 4 WHERE idcliente in (9, 13);

-- Modificando a tabela complemento

-- Casa: 1, 4, 9, 13
-- Apartamento: 2, 3, 7, 17

-- Modificando coluna complemento
alter table cliente drop complemento;
alter table cliente add idcomplemento integer;
alter table cliente add constraint fk_cpl_idcomplemento foreign key (idcomplemento) references complemento (idcomplemento);

update cliente set idcomplemento = 1 where idcliente in (1, 4, 9, 13);
update cliente set idcomplemento = 2 where idcliente in (2, 3, 7, 17);

select idcliente, nome, idcomplemento from cliente order by idcomplemento;


-- Modificando tabela Bairro

-- Cidade Nova: 1, 12, 13
-- Centro: 2, 3, 6, 8, 9, 17
-- São Pedro: 4, 5
-- Santa Rosa: 7

alter table cliente drop bairro;
alter table cliente add idbairro integer;
alter table cliente add constraint fk_brr_idbairro foreign key (idbairro) references bairro (idbairro);

update cliente set idbairro = 1 where idcliente in (1, 12, 13);
update cliente set idbairro = 2 where idcliente in (2, 3, 6, 8, 9, 17);
update cliente set idbairro = 3 where idcliente in (4, 5);
update cliente set idbairro = 4 where idcliente = 7;

-- Tabela De municipio e UF

-- Excluindo tabelas municipio e uf
alter table cliente drop municipio;
alter table cliente drop uf;

-- Adicionando a tabela idmunicipio e relacionando com sua chave estrangeira
alter table cliente add idmunicipio integer;
alter table cliente add constraint fk_mnc_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

-- Adicionando os dados
update cliente set idmunicipio = 1 where idcliente in (1, 2, 10, 11);
update cliente set idmunicipio = 2 where idcliente in (3, 12);
update cliente set idmunicipio = 3 where idcliente = 4;
UPDATE cliente set idmunicipio = 4 WHERE idcliente = 5;
UPDATE cliente set idmunicipio = 5 where idcliente in (5, 13);
UPDATE cliente set idmunicipio = 6 where idcliente = 7;
update cliente set idmunicipio = 7 where idcliente = 8;
update cliente set idmunicipio = 8 where idcliente = 9;
update cliente set idmunicipio = 9 where idcliente in (14, 15);
