-- Comandos Adicionais

-- Extração de Data
select 
	data_pedido, 
	extract(day from data_pedido) as DIA,
	extract(month from data_pedido) as mês,
	extract(year from data_pedido) as ano
from 
	pedido;

-- Fatiamento de String
select 
	nome, 
	substring(nome from 1 for 5), -- Retorna as caracteres da 1° até a 5° caracter
	substring(nome, 2) -- Desconsidera 2 caracteres e começa contar a partir do 3°
from 
	cliente;

-- Alterar tipo da string
Select
	nome,
	upper(nome) -- Deixa toda a string maiuscula
from
	cliente;

-- Campos Nulos personalizados: COALESCE(campo, msg) 
select 
	nome,
	cpf,
	coalesce(cpf, 'Não informado')
from
	cliente;

-- Condicionais com CASE
select
	case sigla 
		when 'PR' then 'Paraná'
		when 'SC' then 'Santa Catarina'
		when 'SP' then 'São Paulo'
	else
		'Outros'
	end as uf
from 
	uf;


-- Exercícios

-- 1. O nome do cliente e somente o mês de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
Select 
	nome,
	COALESCE(
		extract(month from data_nascimento)::Text, -- Valor convertido para texto
		'Não informado'
	) as Mes -- O coalesce no postgre exige que os tipos das colunas sejam respeitados, então integer e strings não podem se misturar
from 
	cliente;

-- 2. O nome do cliente e somente o nome do mês de nascimento (Janeiro, Fevereiro etc). Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
Select 
	nome,
	case extract(month from data_nascimento)
		when 1 then 'Janeiro'
		when 2 then 'Fevereiro'
		when 3 then 'Março'
		when 4 then 'Abril'
		when 5 then 'Maio'
		when 6 then 'Junho'
		when 7 then 'Julho'
		when 8 then 'Agosto'
		when 9 then 'Setembro'
		when 10 then 'Outubro'
		when 11 then 'Novembro'
		when 12 then 'Dezembro'
	else
		'--'
	end as "Mês"
from
	cliente;

-- Select
-- 	nome,
-- 	Coalesce(TO_CHAR(data_nascimento, 'TMMONTH'), 'None')
-- from
-- 	cliente;

-- 3. O nome do cliente e somente o ano de nascimento. Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
Select 
	nome,
	Coalesce(
		extract(year from data_nascimento)::Text,
		'Não informado'
	) as Ano_Nascimento -- O coalesce no postgre exige que os tipos das colunas sejam respeitados, então integer e strings não podem se misturar
from
	cliente;

-- 4. O caractere 5 até o caractere 10 de todos os municípios.
Select 
	substring(nome from 5 for 5) as Municipio_fatiado -- Ele começa contar do 5 e vai + 5 carcteres para frente
from
	municipio;

-- 5. O nome de todos os municípios em letras maiúsculas.
Select
	UPPER(nome) as Municipio
from
	municipio;

-- 6. O nome do cliente e o gênero. Caso seja M mostrar “Masculino”, senão mostrar “Feminino”.
Select
	nome,
	case genero
		when 'M' then 'Masculino'
		when 'F' then 'Feminino'
	end as genero
from
	cliente;

-- 7. O nome do produto e o valor. Caso o valor seja maior do que R$ 500,00 mostrar a mensagem “Acima de 500”, caso contrário, mostrar a mensagem “Abaixo de 500”.
Select
	nome,
	case
		when valor > 500 then 'Acima ou igual a 500'
	else
		'Abaixo de 500'
	end as faixa
from 
	produto;
