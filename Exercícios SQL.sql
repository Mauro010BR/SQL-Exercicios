-- Exercícios feito no BD AdventureWorks2017, Northwind

--Exercício 01

--A equipe de marketing precisa de fazer uma pesquisa sonbre nomes mais comuns de seus clientes e precisa do nome e sobrenome de todos os clientes que estão cadastrados no sistema.

SELECT FirstName,LastName
FROM person.Person

--Exercício 02

--Quantos nomes sobrenomes únicos temos em nossa tabela person.person ?

SELECT DISTINCT FirstName, LastName
FROM Person.Person

--Exercício 03

--A equipe de produção de produtos precisa do nome de todas as peças que pesam mais de 500KG mas não mais que 700KG para inspeção

SELECT Name
FROM Production.Product
WHERE weight > 500 and Weight < 700

--Exercício 04

--Foi pedido pelo marketing um relação de todos os empregados que são casados e são asalariados

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1

--Exercício 05

--Um usuário chamado Peter Krebs está devendo um pagamento, consiga o email dele para que possamos enviar uma cobrança !

SELECT BusinessEntityID
FROM Person.Person
WHERE FirstName = 'Peter' and LastName = 'Krebs'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26

--Outro método a ser utilizado (Mais simples)

SELECT A.BusinessEntityID,FirstName,A.LastName,B.EmailAddress
FROM Person.Person A
INNER JOIN person.EmailAddress B ON A.BusinessEntityID = B.BusinessEntityID and FirstName = 'Peter' and LastName = 'Krebs'

--Exercício 06

--Eu quero saber quantos produtos temos cadastrados em nossa tabela de produtos

SELECT COUNT(*) as "Quantidade de Produtos"
FROM Production.Product

--Exercício 07

--Eu quero saber quantos tamanhos de produtos temos cadastrados em nossa tabela

SELECT COUNT(Size) as "Quantidade de Tamanhos"
FROM Production.Product

--Exercício 08

--Exiba apenas 100 Produtos da tabela

SELECT TOP 100 *
FROM Production.Product

--Exercício 09

--Obter o ProductID dos 10 produtos mais caros cadastrados no sistema, listando do mais caro ao mais barato
	
SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY listPrice DESC

--Exercício 10

--Obter o nome e o número do produto que tem o ProductID entre 1~4

SELECT TOP 4 Name,ProductNumber
FROM Production.Product
ORDER BY ProductID ASC

--Exercício 11

--Quantos produtos temos cadastrados no sistema que custam mais de 1500 dólares?

SELECT COUNT(*) as "Contagem"
FROM Production.Product
WHERE listPrice > 1500

--Exercício 12

--Quantas pessoas temos com o sobrenome que inicia com a letra P ?

SELECT COUNT (LastName) as "Contagem"
FROM Person.person
WHERE LastName LIKE 'P%'

--Exercício 13

--Em quantas cidades únicas estão cadastrados nosso clientes ?

SELECT COUNT (DISTINCT(City)) as "Contagem cidades únicas"
FROM person.Address


--Exercício 14

--Quais são as cidades únicas que temos em nosso Sistema ?

SELECT DISTINCT(City)
FROM person.Address

--Exercício 15

--Quantos produtos vermelhos tem o preço entre 500 a 1000 dólares ?

SELECT COUNT(*) as "Contagem de Produtos"
FROM Production.Product
WHERE color = 'Red' and Listprice between 500 and 1000

--Exercício 16

--Quantos produtos cadastrados tem a palavra 'road' no nome deles ?

SELECT COUNT (*) as "Contagem"
FROM Production.Product
WHERE Name LIKE '%Road%'

--Exercício 17

--Eu preciso saber quantas pessoas tem o mesmo MiddleName agrupadas pelo MiddleName

SELECT MiddleName, COUNT(MiddleName) as "Contagem"
FROM Person.Person
GROUP BY MiddleName

--Exercício 18

--Eu preciso saber em média qual é a quantidade que cada produto é vendido na loja.

SELECT ProductID, AVG(OrderQty) as "Média"
FROM sales.SalesOrderDetail
GROUP BY ProductID

--Exercício 19

--Eu quero saber qual foram as 10 vendas que no total tiveram os maiores valor de venda por produto do maior ao menor

SELECT TOP 10 ProductID, SUM(linetotal) as "Soma"
FROM sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY soma DESC

--Exercício 20

--Eu preciso saber quantos produtos e qual quantidade media dos produtos temos cadastrados nas nossas ordem de serviço, agrupadas por ProdutctId

SELECT ProductID, COUNT(ProductID) as "Quantidade", AVG(OrderQty) as "Média"
FROM Production.WorkOrder
GROUP BY ProductID	

--Exercício 21

--Estamos querendo identificar as provincias com o maior numero de cadastrados em nosso sistema, então é preciso encontrar quais províncias estão registradas no Banco de dados mais de 1000 vezes

SELECT StateProvinceID ,COUNT(StateProvinceID) as "Contagem"
FROM Person.address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

--Exercício 22

--Sendo que se trata de uma multinacional os gerentes querem saber quais produtos não estão trazendo em média 1 milhão em total de vendas 

SELECT ProductID, AVG(Linetotal) as "Soma Total"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(Linetotal) < 1000000
ORDER BY [Soma Total] DESC


--Exercício 23

--Encontrar o FirstName e LastName 

SELECT FirstName as "Nome", LastName as "Sobrenome"
FROM person.Person


--Exercício 24

--Product Number da tabela "Numero do produto"

SELECT ProductNumber as "Número do produto"
FROM Production.Product

--Exercício 25

--Unit price "Preço unitário"

SELECT UnitPrice as "Preço unitário"
FROM sales.SalesOrderDetail

--Exercício 26

--INNER JOIN

SELECT B.BusinessEntityID,A.Name,A.PhoneNumberTypeID,B.PhoneNumber
FROM person.PhoneNumberType A
INNER JOIN Person.PersonPhone B ON A.PhoneNumberTypeID = B.PhoneNumberTypeID

--Exercício 27

--INNER JOIN

SELECT B.AddressID,B.City,A.StateProvinceID,A.Name
FROM person.StateProvince A
INNER JOIN Person.Address B ON A.StateProvinceID = B.StateProvinceID

--Exercício 28

--Eu quero saber na tabela detalhe do pedido quais tem o mesmo porcentual de desconto

SELECT A.ProductID,A.Discount,B.ProductID,B.Discount
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount

--Exercício 29

--Encontre para mim todos endereços que estão no estado de 'Alberta', pode trazer rodas informações

SELECT AddressLine1
FROM person.Address 
WHERE StateProvinceID IN (SELECT StateProvinceID
FROM person.StateProvince
WHERE Name = 'Alberta')

