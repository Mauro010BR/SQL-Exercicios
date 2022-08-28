-- Exerc�cios feito no BD AdventureWorks2017, Northwind

--Exerc�cio 01

--A equipe de marketing precisa de fazer uma pesquisa sonbre nomes mais comuns de seus clientes e precisa do nome e sobrenome de todos os clientes que est�o cadastrados no sistema.

SELECT FirstName,LastName
FROM person.Person

--Exerc�cio 02

--Quantos nomes sobrenomes �nicos temos em nossa tabela person.person ?

SELECT DISTINCT FirstName, LastName
FROM Person.Person

--Exerc�cio 03

--A equipe de produ��o de produtos precisa do nome de todas as pe�as que pesam mais de 500KG mas n�o mais que 700KG para inspe��o

SELECT Name
FROM Production.Product
WHERE weight > 500 and Weight < 700

--Exerc�cio 04

--Foi pedido pelo marketing um rela��o de todos os empregados que s�o casados e s�o asalariados

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1

--Exerc�cio 05

--Um usu�rio chamado Peter Krebs est� devendo um pagamento, consiga o email dele para que possamos enviar uma cobran�a !

SELECT BusinessEntityID
FROM Person.Person
WHERE FirstName = 'Peter' and LastName = 'Krebs'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26

--Outro m�todo a ser utilizado (Mais simples)

SELECT A.BusinessEntityID,FirstName,A.LastName,B.EmailAddress
FROM Person.Person A
INNER JOIN person.EmailAddress B ON A.BusinessEntityID = B.BusinessEntityID and FirstName = 'Peter' and LastName = 'Krebs'

--Exerc�cio 06

--Eu quero saber quantos produtos temos cadastrados em nossa tabela de produtos

SELECT COUNT(*) as "Quantidade de Produtos"
FROM Production.Product

--Exerc�cio 07

--Eu quero saber quantos tamanhos de produtos temos cadastrados em nossa tabela

SELECT COUNT(Size) as "Quantidade de Tamanhos"
FROM Production.Product

--Exerc�cio 08

--Exiba apenas 100 Produtos da tabela

SELECT TOP 100 *
FROM Production.Product

--Exerc�cio 09

--Obter o ProductID dos 10 produtos mais caros cadastrados no sistema, listando do mais caro ao mais barato
	
SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY listPrice DESC

--Exerc�cio 10

--Obter o nome e o n�mero do produto que tem o ProductID entre 1~4

SELECT TOP 4 Name,ProductNumber
FROM Production.Product
ORDER BY ProductID ASC

--Exerc�cio 11

--Quantos produtos temos cadastrados no sistema que custam mais de 1500 d�lares?

SELECT COUNT(*) as "Contagem"
FROM Production.Product
WHERE listPrice > 1500

--Exerc�cio 12

--Quantas pessoas temos com o sobrenome que inicia com a letra P ?

SELECT COUNT (LastName) as "Contagem"
FROM Person.person
WHERE LastName LIKE 'P%'

--Exerc�cio 13

--Em quantas cidades �nicas est�o cadastrados nosso clientes ?

SELECT COUNT (DISTINCT(City)) as "Contagem cidades �nicas"
FROM person.Address


--Exerc�cio 14

--Quais s�o as cidades �nicas que temos em nosso Sistema ?

SELECT DISTINCT(City)
FROM person.Address

--Exerc�cio 15

--Quantos produtos vermelhos tem o pre�o entre 500 a 1000 d�lares ?

SELECT COUNT(*) as "Contagem de Produtos"
FROM Production.Product
WHERE color = 'Red' and Listprice between 500 and 1000

--Exerc�cio 16

--Quantos produtos cadastrados tem a palavra 'road' no nome deles ?

SELECT COUNT (*) as "Contagem"
FROM Production.Product
WHERE Name LIKE '%Road%'

--Exerc�cio 17

--Eu preciso saber quantas pessoas tem o mesmo MiddleName agrupadas pelo MiddleName

SELECT MiddleName, COUNT(MiddleName) as "Contagem"
FROM Person.Person
GROUP BY MiddleName

--Exerc�cio 18

--Eu preciso saber em m�dia qual � a quantidade que cada produto � vendido na loja.

SELECT ProductID, AVG(OrderQty) as "M�dia"
FROM sales.SalesOrderDetail
GROUP BY ProductID

--Exerc�cio 19

--Eu quero saber qual foram as 10 vendas que no total tiveram os maiores valor de venda por produto do maior ao menor

SELECT TOP 10 ProductID, SUM(linetotal) as "Soma"
FROM sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY soma DESC

--Exerc�cio 20

--Eu preciso saber quantos produtos e qual quantidade media dos produtos temos cadastrados nas nossas ordem de servi�o, agrupadas por ProdutctId

SELECT ProductID, COUNT(ProductID) as "Quantidade", AVG(OrderQty) as "M�dia"
FROM Production.WorkOrder
GROUP BY ProductID	

--Exerc�cio 21

--Estamos querendo identificar as provincias com o maior numero de cadastrados em nosso sistema, ent�o � preciso encontrar quais prov�ncias est�o registradas no Banco de dados mais de 1000 vezes

SELECT StateProvinceID ,COUNT(StateProvinceID) as "Contagem"
FROM Person.address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

--Exerc�cio 22

--Sendo que se trata de uma multinacional os gerentes querem saber quais produtos n�o est�o trazendo em m�dia 1 milh�o em total de vendas 

SELECT ProductID, AVG(Linetotal) as "Soma Total"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(Linetotal) < 1000000
ORDER BY [Soma Total] DESC


--Exerc�cio 23

--Encontrar o FirstName e LastName 

SELECT FirstName as "Nome", LastName as "Sobrenome"
FROM person.Person


--Exerc�cio 24

--Product Number da tabela "Numero do produto"

SELECT ProductNumber as "N�mero do produto"
FROM Production.Product

--Exerc�cio 25

--Unit price "Pre�o unit�rio"

SELECT UnitPrice as "Pre�o unit�rio"
FROM sales.SalesOrderDetail

--Exerc�cio 26

--INNER JOIN

SELECT B.BusinessEntityID,A.Name,A.PhoneNumberTypeID,B.PhoneNumber
FROM person.PhoneNumberType A
INNER JOIN Person.PersonPhone B ON A.PhoneNumberTypeID = B.PhoneNumberTypeID

--Exerc�cio 27

--INNER JOIN

SELECT B.AddressID,B.City,A.StateProvinceID,A.Name
FROM person.StateProvince A
INNER JOIN Person.Address B ON A.StateProvinceID = B.StateProvinceID

--Exerc�cio 28

--Eu quero saber na tabela detalhe do pedido quais tem o mesmo porcentual de desconto

SELECT A.ProductID,A.Discount,B.ProductID,B.Discount
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount

--Exerc�cio 29

--Encontre para mim todos endere�os que est�o no estado de 'Alberta', pode trazer rodas informa��es

SELECT AddressLine1
FROM person.Address 
WHERE StateProvinceID IN (SELECT StateProvinceID
FROM person.StateProvince
WHERE Name = 'Alberta')

