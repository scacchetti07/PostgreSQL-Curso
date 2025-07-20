CREATE TABLE profissao (
    idprofissao integer not null,
    nome varchar(30) not null,

    constraint pk_prf_idprofissao primary key (idprofissao), -- chave primária
    constraint un_prf_nome unique (nome) -- Indica que o campo nome deve ser único e não deve ser repetido
);

INSERT INTO profissao (idprofissao, nome) values (1, 'Estudante');
INSERT INTO profissao (idprofissao, nome) values (2, 'Engenheiro');
INSERT INTO profissao (idprofissao, nome) values (3, 'Pedreiro');
INSERT INTO profissao (idprofissao, nome) values (4, 'Jornalista');
INSERT INTO profissao (idprofissao, nome) values (5, 'Professor');


CREATE TABLE nacionalidade (
    idnacionalidade integer not null,
    nome varchar(30) not null,

    constraint pk_ncn_idnacionalidade primary key (idnacionalidade),
    constraint un_ncn_nome unique (nome)
);


INSERT INTO nacionalidade (idnacionalidade, nome) values (1, 'Brasileira');
INSERT INTO nacionalidade (idnacionalidade, nome) values (2, 'Italiana');
INSERT INTO nacionalidade (idnacionalidade, nome) values (3, 'Norte-Americana');
INSERT INTO nacionalidade (idnacionalidade, nome) values (4, 'Alemã');

CREATE TABLE complemento (
    idcomplemento integer not null,
    nome varchar(30) not null,

    constraint pk_cpl_idcomplemento primary key (idcomplemento),
    constraint un_cpl_nome unique (nome)
);

INSERT INTO complemento (idcomplemento, nome) values (1, 'Casa');
INSERT INTO complemento (idcomplemento, nome) values (2, 'Apartamento');


CREATE TABLE bairro (
    idbairro integer not null,
    nome varchar(30) not null,

    constraint pk_brr_idbairro primary key (idbairro),
    constraint un_brr_nome unique (nome)
);

INSERT INTO bairro (idbairro, nome) values (1, 'Cidade Nova');
INSERT INTO bairro (idbairro, nome) values (2, 'Centro');
INSERT INTO bairro (idbairro, nome) values (3, 'São Pedro');
INSERT INTO bairro (idbairro, nome) values (4, 'Santa Rosa');

CREATE TABLE uf (
    iduf integer not null,
    nome varchar(30) not null,
    sigla char(2) not null,

    constraint pk_ufd_idunidade_federecao primary key (iduf),
    constraint un_ufd_nome unique (nome),
    constraint un_ufd_sigla unique (sigla)
);

INSERT INTO uf (iduf, nome, sigla) values (1, 'Santa Catarina', 'SC');
INSERT INTO uf (iduf, nome, sigla) values (2, 'Paraná', 'PR');
INSERT INTO uf (iduf, nome, sigla) values (3, 'São Paulo', 'SP');
INSERT INTO uf (iduf, nome, sigla) values (4, 'Minas Gerais', 'MG');
INSERT INTO uf (iduf, nome, sigla) values (5, 'Rio Grande do Sul', 'RS');
INSERT INTO uf (iduf, nome, sigla) values (6, 'Rio de Janeiro', 'RJ');

CREATE TABLE municipio (
    idmunicipio integer not null,
    nome varchar(30) not null,
    iduf integer not null,

    constraint pk_mnc_idmunicipio primary key (idmunicipio),
    constraint un_mnc_nome unique (nome), -- Importante verificar se essa condição é necessária dependendo do caso e situação
    constraint fk_mnc_idunidade_federacao foreign key (iduf) references uf (iduf)
);

INSERT INTO municipio (idmunicipio, nome, iduf) values (1, 'Porto União', 1);
INSERT INTO municipio (idmunicipio, nome, iduf) values (2, 'Canoinhas', 1);
INSERT INTO municipio (idmunicipio, nome, iduf) values (3, 'Porto Vitória', 2);
INSERT INTO municipio (idmunicipio, nome, iduf) values (4, 'General Carneiro', 2);
INSERT INTO municipio (idmunicipio, nome, iduf) values (5, 'São Paulo', 3);
INSERT INTO municipio (idmunicipio, nome, iduf) values (6, 'Rio de Janeiro', 6);
INSERT INTO municipio (idmunicipio, nome, iduf) values (7, 'Uberlândia', 4);
INSERT INTO municipio (idmunicipio, nome, iduf) values (8, 'Porto Alegre', 5);
INSERT INTO municipio (idmunicipio, nome, iduf) values (9, 'União Vitória', 2);
