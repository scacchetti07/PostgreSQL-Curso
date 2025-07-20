CREATE TABLE Fornecedor (
    idFornecedor integer not null,
    nome varchar(50) not null,

    constraint pk_frn_idfornecedor primary key (idFornecedor),
    constraint un_frn_nome unique (nome)
);

INSERT INTO Fornecedor (idFornecedor, nome) values (1, 'Cap. Computadores');
INSERT INTO Fornecedor (idFornecedor, nome) values (2, 'AA. Computadores');
INSERT INTO Fornecedor (idFornecedor, nome) values (3, 'BB. Máquinas');

CREATE TABLE Vendedor (
    idVendedor integer not null,
    nome varchar(50) not null,

    constraint pk_vnd_idvendedor primary key (idVendedor),
    constraint un_vnd_nome unique (nome)
);

INSERT INTO Vendedor (idVendedor, nome) values (1, 'André');
INSERT INTO Vendedor (idVendedor, nome) values (2, 'Alisson');
INSERT INTO Vendedor (idVendedor, nome) values (3, 'José');
INSERT INTO Vendedor (idVendedor, nome) values (4, 'Ailton');
INSERT INTO Vendedor (idVendedor, nome) values (5, 'Maria');
INSERT INTO Vendedor (idVendedor, nome) values (6, 'Suelem');
INSERT INTO Vendedor (idVendedor, nome) values (7, 'Aline');
INSERT INTO Vendedor (idVendedor, nome) values (8, 'Silvana');

CREATE TABLE Transportadora (
    idTransportadora integer not null,
    idMunicipio integer not null,
    nome varchar(50) not null,
    logradouro varchar(50),
    numero varchar(10),

    constraint pk_trn_idtransportadora primary key (idTransportadora),
    constraint fk_trn_idmunicipio foreign key (idMunicipio) references municipio (idMunicipio),
    constraint un_trn_nome unique (nome)
);

INSERT INTO Transportadora (idTransportadora, idMunicipio, nome, logradouro, numero) values (1, 9, 'BS. Transportes', 'Rua das Limas', '01');
INSERT INTO Transportadora (idTransportadora, idMunicipio, nome) values (2, 5, 'União Transportes');

CREATE TABLE Produto (
    idProduto integer not null,
    idFornecedor integer not null,
    nome varchar(50) not null,
    valor float not null,

    constraint pk_prd_idproduto primary key (idProduto),
    constraint fk_prd_idfornecedor foreign key (idFornecedor) references Fornecedor (idFornecedor)
);

INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (1, 1, 'Microcomputador', 800);
INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (2, 1, 'Monitor', 500);
INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (3, 2, 'Placa mãe', 200);
INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (4, 2, 'HD', 150);
INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (5, 2, 'Placa de vídeo', 200);
INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (6, 3, 'Memória RAM', 100);
INSERT INTO Produto (idProduto, idFornecedor, nome, valor) values (7, 1, 'Gabinete', 35);
