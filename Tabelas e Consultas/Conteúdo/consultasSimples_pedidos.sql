-- 1. Somente o nome de todos os vendedores em ordem alfabética.
Select nome from vendedor order by nome;

-- 2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
Select nome, valor from produto where valor > 200 order by valor;

-- 3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
Select nome, valor, (valor * 1.1) as valor_modificado from produto order by valor;

-- 4. Os municípios do Rio Grande do Sul.
Select * from municipio where iduf = 5; -- Consulta Simples
-- Select * from municipio where iduf = (Select iduf from uf where sigla = 'RS'); -- Subconsulta

-- 5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenado pelo valor.
Select * from pedido where data_pedido BETWEEN '2008-04-10' and '2008-04-25' order by valor;

-- 6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.
Select * from pedido where valor between 1000 and 1500;

-- 7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.
Select * from pedido where valor not between 100 and 500;

-- 8. Os pedidos do vendedor André ordenado pelo valor em ordem decrescente.
Select * from pedido where idvendedor = 1 order by valor desc;
-- Select * from pedido where idvendedor = (select idvendedor from vendedor where nome = 'André') order by valor desc; -- Subconsulta

-- 9. Os pedidos do cliente Manoel ordenado pelo valor em ordem crescente.
Select * from pedido where idcliente = 1 order by valor;
-- Select * from pedido where idcliente = (select idcliente from cliente where nome = 'Manoel') order by valor; -- Subconsulta

-- 10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André.
Select * from pedido where idcliente = 15 and idvendedor = 1;
-- Select * from pedido where idcliente = (Select idcliente from cliente where nome = 'Jessica') and idvendedor = (Select idvendedor from vendedor where nome = 'André'); -- Subconsulta

-- 11. Os pedidos que foram transportados pela transportadora União Transportes.
Select * from pedido where idtransportadora = 2;
-- Select * from pedido where idtransportadora = (Select idtransportadora from transportadora where nome = 'União Transportes'); -- Subconsulta

-- 12. Os pedidos feitos pela vendedora Maria ou pela vendedora Aline.
Select * from pedido where idvendedor in (5, 7);
-- Select * from pedido where idvendedor = (Select idvendedor from vendedor where nome = 'Maria') or idvendedor = (Select idvendedor from vendedor where nome = 'Aline'); -- Subconsulta

-- 13. Os clientes que moram em União da Vitória ou Porto União.
Select * from cliente where idmunicipio in (9, 1);
-- Select * from cliente where idmunicipio = (Select idmunicipio from municipio where nome = 'União Vitória') or idmunicipio = (Select idmunicipio from municipio where nome = 'Porto União'); -- Subconsulta

-- 14. Os clientes que não moram em União da Vitória e nem em Porto União.
Select * from cliente where not idmunicipio in (9, 1);
-- Select * from cliente where not idmunicipio = (Select idmunicipio from municipio where nome = 'União Vitória') or idmunicipio = (Select idmunicipio from municipio where nome = 'Porto União'); -- Subconsulta

-- 15. Os clientes que não informaram o logradouro.
Select * from cliente where logradouro is null;

-- 16. Os clientes que moram em avenidas.
Select * from cliente where logradouro Like 'Av%';

-- 17. Os vendedores que o nome começa com a letra S.
Select * from vendedor where nome like 'S%';

-- 18. Os vendedores que o nome termina com a letra A.
Select * from vendedor where nome like 'A%';

-- 19. Os vendedores que o nome não começa com a letra A.
Select * from vendedor where nome not like 'A%';

-- 20. Os municípios que começam com a letra P e são de Santa Catarina.
Select * from municipio where nome like 'P%' and iduf = 1;
-- Select * from municipio where nome like 'P%' and iduf = (Select iduf from uf where sigla = 'SC'); -- Subconsulta

-- 21. As transportadoras que informaram o endereço.
Select * from transportadora where logradouro is not null;

-- 22. Os itens do pedido 01.
select * from produto where idproduto in (1,2);
-- select * from pedido_produto where idpedido = 1; -- Solução do vídeo
-- Select * from produto where idproduto in (Select idproduto from pedido_produto where idpedido = 1);

-- 23. Os itens do pedido 06 ou do pedido 10
Select * from produto where idproduto in (Select idproduto from pedido_produto where idpedido in (6,10)) -- Subconsulta
-- select * from produto where idproduto in (1, 7, 5, 4);
