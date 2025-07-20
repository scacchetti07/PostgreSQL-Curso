create table pedido (
    idpedido integer not null,
    idcliente integer not null,
    idtransportadora integer, -- Pode ser nulo pela opção de retirar na loja
    idvendedor integer not null,
    date_pedido date not null,
    valor float not null,

    constraint pk_pdd_idpedido primary key (idpedido),
    constraint fk_pdd_idcliente foreign key (idcliente) references cliente (idcliente),
    constraint fk_pdd_idtransportadora foreign key (idtransportadora) references Transportadora (idtransportadora),
    constraint fk_pdd_idvendedor foreign key (idvendedor) references Vendedor (idvendedor)
);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (1, '2008-04-01', 1300, 1, 1, 1);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (2, '2008-04-01', 500, 1, 1, 1);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (3, '2008-04-02', 300, 11, 2, 5);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (4, '2008-04-05', 1000, 8, 1, 7);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (5, '2008-04-06', 200, 9, 2, 6);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (6, '2008-04-06', 1985, 10, 1, 6);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (7, '2008-04-06', 800, 3, 1, 7);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idvendedor) values (8, '2008-04-06', 175, 3, 7);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idvendedor) values (9, '2008-04-07', 1300, 12, 8);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (10, '2008-04-10', 200, 6, 1, 8);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (11, '2008-04-15', 300, 15, 2, 1);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (12, '2008-04-20', 500, 15, 2, 5);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (13, '2008-04-20', 350, 9, 1, 7);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idtransportadora, idvendedor) values (14, '2008-04-23', 300, 2, 1, 5);

INSERT INTO pedido (idpedido, date_pedido, valor, idcliente, idvendedor) values (15, '2008-04-25', 200, 11, 5);

-- Tabela de Produtos que será relacionada com a tabela de pedidas
-- Com a função de mostrar quais produtos foram comprados em cada um dos pedidos

create table pedido_produto (
    idpedido integer not null,
    idproduto integer not null,
    quantidade integer not null,
    valor_unitario float not null,

    -- Criando uma chave primária composta por dois elementos
    constraint pk_pdp_idpedidoproduto primary key (idpedido, idproduto), -- chave primária composta (composta por dois elementos)
    constraint fk_pdp_idpedido foreign key (idpedido) references pedido (idpedido),
    constraint fk_pdp_idproduto foreign key (idproduto) references produto (idproduto)
);


INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (1, 1, 1, 800);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (1, 2, 1, 500);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (2, 2, 1, 500);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (3, 4, 2, 150);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (4, 1, 1, 800);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (4, 3, 1, 200);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (5, 3, 1, 200);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (6, 1, 2, 800);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (6, 7, 1, 35);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (6, 5, 1, 200);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (6, 4, 1, 150);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (7, 1, 1, 800);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (8, 7, 5, 35);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (9, 1, 1, 800);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (9, 2, 1, 500);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (10, 5, 1, 200);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (11, 5, 1, 200);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (11, 6, 1, 100);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (12, 2, 1, 500);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (13, 3, 1, 200);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (13, 4, 1, 150);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (14, 6, 3, 100);
INSERT INTO pedido_produto (idpedido, idproduto, quantidade, valor_unitario) values (15, 3, 1, 200);

select * from pedido_produto;
