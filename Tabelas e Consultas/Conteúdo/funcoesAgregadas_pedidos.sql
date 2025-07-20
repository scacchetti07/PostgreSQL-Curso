-- -- Média dos valores do pedido avg(): Soma todos os campos inteiros e divide pelo total.
-- Select avg(valor) as "Média dos valores" from pedido;

-- -- Contagem de Registros count(): Deve apresentar um campo não nulo (normalmente a chave primária) em seu parâmetro ou colocar o '*', que indica tudo.
-- Select count(idmunicipio) from municipio;
-- Select count(*) from municipio;

-- -- Aplicando filtros individuais
-- Select count(idmunicipio) from municipio where iduf = 2;

-- -- Valor máximo e valor mínimo
-- select min(valor), max(valor) from pedido;

-- -- Somatória de valores
-- select sum(valor) from pedido;

-- -- Agrupamento (GROUP BY): Agrupa campos que normalmente são separados partindo de um campo especificado, sendo necessário o uso de qualquer função agregada.
-- Select idcliente, sum(valor) from pedido group by idcliente;

-- -- Aplicando filtros complexos com Agrupamento (HAVING): Caso algo que foi agrupado precisa ser filtrado, utilze o having
-- SELECT idcliente, SUM(valor) FROM pedido GROUP BY idcliente HAVING SUM(valor) > 500;



-- Exercícios
-- 1. A média dos valores de vendas dos vendedores que venderam mais que R$ 200,00.
Select idvendedor, avg(valor) as "Média das Vendas" from pedido group by idvendedor having avg(valor) > 200 order by idvendedor ;

-- 2. Os vendedores que venderam mais que R$ 1500,00.
Select idvendedor, sum(valor) as "Total de Vendas" from pedido group by idvendedor having sum(valor) > 1500;

-- 3. O somatório das vendas de cada vendedor.
Select idvendedor, sum(valor) as "Somatória de Vendas" from pedido group by idvendedor;

-- 4. A quantidade de municípios.
Select count(*) as "Total de Municípios" from municipio;

-- 5. A quantidade de municípios que são do Paraná ou de Santa Catarina.
Select count(idmunicipio) as "Total de Municipios do PR ou SC" from municipio where iduf in ((Select iduf from uf where sigla = 'PR'),(Select iduf from uf where sigla = 'SC')); -- PR = 2 || SC = 1

-- 6. A quantidade de municípios por estado.
Select iduf, count(idmunicipio) as "Total Municipios" from municipio group by iduf order by iduf; -- (Para exibir o nome eu precisaria de JOIN)

-- 7. A quantidade de clientes que informaram o logradouro.
Select count(logradouro) as "Clientes com Logradouro" from cliente where logradouro is not null;

-- 8. A quantidade de clientes por município.
Select idmunicipio, count(idcliente) as "Total Clientes" from cliente group by idmunicipio;

-- 9. A quantidade de fornecedores.
Select count(*) as "Total Fornecedores" from fornecedor;

-- 10. A quantidade de produtos por fornecedor.
Select idfornecedor, count(idproduto) as "Id Produtos" from produto group by idfornecedor;

-- 11. A média de preços dos produtos do fornecedor Cap. Computadores.
Select idfornecedor as "Fornecedor", avg(valor) as "Média de Preços" from produto where idfornecedor = 1 group by idfornecedor;

-- 12. O somatório dos preços de todos os produtos.
Select sum(valor) as "Soma dos produtos" from produto;

-- 13. O nome do produto e o preço somente do produto mais caro.
Select nome, valor from produto order by valor desc limit 1;

-- 14. O nome do produto e o preço somente do produto mais barato.
Select nome, valor from produto order by valor limit 1;

-- 15. A média de preço de todos os produtos.
Select avg(valor) as "Média de todos Produtos" from produto; 

-- 16. A quantidade de transportadoras.
Select count(*) as "Total de Transportadoras" from transportadora;

-- 17. A média do valor de todos os pedidos.
Select Round(avg(valor)) as "Média de todos Pedidos" from pedido;

-- 18. O somatório do valor do pedido agrupado por cliente.
Select idcliente, sum(valor) as "Somatório de Pedidos" from pedido group by idcliente order by idcliente;

-- 19. O somatório do valor do pedido agrupado por vendedor.
Select idvendedor, sum(valor) as "Somatório de Pedidos" from pedido group by idvendedor;

-- 20. O somatório do valor do pedido agrupado por transportadora.
Select idtransportadora, sum(valor) as "Somatório de Pedidos" from pedido group by idtransportadora;

-- 21. O somatório do valor do pedido agrupado pela data.
select data_pedido as "Data", sum(valor) as "Somatória" from pedido group by data_pedido;

-- 22. O somatório do valor do pedido agrupado por cliente, vendedor e transportadora.
select idcliente, idvendedor, idtransportadora, sum(valor) as "Somatória" from pedido group by idcliente, idvendedor, idtransportadora;

-- 23. O somatório do valor dos pedidos que estejam entre 01/04/2008 e 10/12/2009 e que seja maior que R$ 200,00.
Select sum(valor) as "Somatória" from pedido where data_pedido between '2008-04-01' and '2009-12-10' and valor > 200;

-- 24. A média do valor do pedido do vendedor André.
select idvendedor as "Vendedor André", avg(valor) as "Média de Vendas" from pedido where idvendedor = 1 group by idvendedor;

-- 25. A média do valor do pedido da cliente Jéssica.
Select idcliente as "Cliente Jéssica", avg(valor) as "Média de compras" from pedido where idcliente = 15 group by idcliente; 

-- 26. A quantidade de pedidos transportados pela transportadora BS. Transportes.
Select idtransportadora as "Bs. Transportes", count(idtransportadora) as "Total de Transportes" from pedido where idtransportadora = 1 group by idtransportadora;

-- 27. A quantidade de pedidos agrupados por vendedor.
Select idvendedor as "Vendedora", count(idpedido) as "Pedidos" from pedido group by idvendedor; 

-- 28. A quantidade de pedidos agrupados por cliente.
Select idcliente as "Cliente", count(idpedido) as "Pedidos" from pedido group by idcliente order by idcliente;

-- 29. A quantidade de pedidos entre 15/04/2008 e 25/04/2008.
Select count(idpedido) as "Pedidos entre 15/04 e 25/04 de 2008" from pedido where data_pedido between '2008-04-15' and '2008-04-25';

-- 30. A quantidade de pedidos que o valor seja maior que R$ 1.000,00.
Select count(idpedido) as "Pedidos com valor maior que R$ 1.000,00" from pedido where valor > 1000;

-- 31. A quantidade de microcomputadores vendida.
select sum(quantidade) as "Microcomputadores Vendidos" from pedido_produto where idproduto = 1;

-- 32. A quantidade de produtos vendida agrupado por produto.
Select idproduto as "ID Produto", sum(quantidade) as "Total de Produtos Vendidos" from pedido_produto group by idproduto order by idproduto;

-- 33. O somatório do valor dos produtos dos pedidos, agrupado por pedido.
Select idpedido as "ID Pedido", sum(valor_unitario) as "Somatória" from pedido_produto group by idpedido order by idpedido; 

-- 34. A quantidade de produtos agrupados por pedido.
Select idpedido, sum(quantidade) as "Total de Produtos" from pedido_produto group by idpedido order by idpedido;

-- 35. O somatório do valor total de todos os produtos do pedido.
Select sum(valor_unitario) as "Somatória total de pedidos" from pedido_produto;

-- 36. A média dos produtos do pedido 6.
Select avg(valor_unitario) as "Média" from pedido_produto where idpedido = 6;

-- 37. O valor do maior produto do pedido.
Select max(valor_unitario) from pedido_produto;

-- 38. O valor do menor produto do pedido.
Select min(valor_unitario) from pedido_produto;

-- 39. O somatório da quantidade de produtos por pedido.
Select idpedido, sum(quantidade) from pedido_produto group by idpedido;

-- 40. O somatório do valor unitario de todos os produtos do pedido.
Select sum(valor_unitario) from pedido_produto;
-- Select sum(quantidade) from pedido_produto;
