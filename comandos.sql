SELECT * FROM Person.Person
SELECT * FROM Person.PersonPhone
SELECT * FROM Person.PhoneNumberType
SELECT * FROM Person.EmailAddress
SELECT * FROM Person.StateProvince
SELECT * FROM Person.Address
SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Production.WorkOrder

insert into Cliente values	(1, 'Ana', 'F'),
							(2, 'Thiago', 'F'),
							(3, 'Maria', 'J'), 
							(4, 'Lucas', 'J'), 
							(5, 'Thiago', 'F')
							
update Cliente 
set Codigo = 7,
	Nome = 'José'
where Codigo = 3

insert pedido values(2, GETDATE(), 0, 22.49, 1)

delete
from Cliente
where codigo = 5

delete
from Cliente
where codigo in(5, 6)

select * from Cliente where Codigo = 4 or nome = 'José'

select * from Cliente

select * from pedido

select *,
		case
			when TipoPessoa = 'J' then 'juridico'
			when TipoPessoa = 'F' then 'fisica'
			else 'pessoa indefinida'
		end
from Cliente

select *, convert(varchar, TipoPessoa) from Cliente

alter table Cliente add constraint pk_cliente primary key (Codigo)

--CURSO DEV APRENDER--
--SELECT, DISTINCT--
SELECT DISTINCT FirstName 
FROM Person.Person

SELECT *
FROM Person.Person

--WHERE--
SELECT Name, Weight
FROM Production.Product
WHERE Weight > 500 and Weight < 700

SELECT JobTitle, MaritalStatus, SalariedFlag
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1

select * 
from Person.Person
where FirstName = 'Peter' and LastName = 'Krebs'

select * from Person.EmailAddress
where BusinessEntityID = '26'
--alternativa
select pp.FirstName, pp.LastName, pe.EmailAddress
from Person.EmailAddress as pe
inner join Person.Person as pp
on (pe.BusinessEntityID = pp.BusinessEntityID)
where FirstName = 'Peter' and LastName = 'Krebs'
--ou sem join
select pp.FirstName, pp.LastName, pe.EmailAddress
from Person.EmailAddress as pe, Person.Person as pp
where pe.BusinessEntityID = pp.BusinessEntityID and 
FirstName = 'Peter' and LastName = 'Krebs'

--COUNT--
SELECT count(*) FROM Production.Product
SELECT count(Size) FROM Production.Product

--TOP--
SELECT TOP 20 *
FROM Person.Person

--ORDER BY--
SELECT FirstName, LastName FROM Person.Person
ORDER BY FirstName, LastName

SELECT TOP 10 ProductID, ListPrice FROM Production.Product
ORDER BY ListPrice desc

SELECT Name, ProductID FROM Production.Product
WHERE ProductID >= 1 AND ProductID <= 4

--BETWEEN--
SELECT * FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 15000

SELECT HireDate FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate

--IN--
SELECT * FROM Person.Person
WHERE BusinessEntityID IN (2, 6, 45)

--LIKE--
SELECT * FROM Person.Person WHERE FirstName LIKE '%RO%'
SELECT * FROM Person.Person WHERE FirstName LIKE '%RO_'

--DESAFIO--
SELECT COUNT(*) FROM Production.Product
WHERE ListPrice > 1500

SELECT COUNT(LastName) FROM Person.Person
WHERE LastName LIKE 'P%'

SELECT DISTINCT City FROM Person.Address

SELECT COUNT(Color) FROM Production.Product
WHERE COLOR = 'RED' AND ListPrice BETWEEN 500 AND 1000

SELECT COUNT(Name) FROM Production.Product
WHERE Name LIKE '%ROAD%'

--MIN MAX SUM AVG--
SELECT SUM(OrderQty) AS "ORDER QTY SUM" FROM Sales.SalesOrderDetail
SELECT MAX(OrderQty) AS "ORDER QTY MAX" FROM Sales.SalesOrderDetail
SELECT MIN(OrderQty) AS "ORDER QTY MIN" FROM Sales.SalesOrderDetail
SELECT AVG(OrderQty) AS "ORDER QTY AVG" FROM Sales.SalesOrderDetail

--GROUP BY--
SELECT ProductID, SUM(LineTotal) FROM Sales.SalesOrderDetail
GROUP BY ProductID ORDER BY ProductID

SELECT ProductID, SUM(OrderQty * UnitPrice) FROM Sales.SalesOrderDetail
GROUP BY ProductID ORDER BY ProductID

SELECT Color, AVG(ListPrice) AS "MEDIA DE PRECO" FROM Production.Product
WHERE COLOR = 'SILVER'
GROUP BY Color

SELECT MiddleName, COUNT(FirstName) FROM Person.Person
GROUP BY MiddleName

SELECT ProductID, AVG(OrderQty) AS "QUANTIDADE VENDIDA" FROM Sales.SalesOrderDetail
GROUP BY ProductID ORDER BY ProductID

SELECT TOP 10 ProductID, SUM(LineTotal) AS "TOTAL" FROM Sales.SalesOrderDetail
GROUP BY ProductID ORDER BY TOTAL DESC

SELECT ProductID, COUNT(ProductID) "Count product", AVG(OrderQty) "Order qty" FROM Production.WorkOrder
GROUP BY ProductID ORDER BY ProductID

--HAVING--
SELECT StateProvinceID, COUNT(StateProvinceID) "Provinces" FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

SELECT ProductID, AVG(LineTotal) FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) <= 1000000

--INNER JOIN--
SELECT PP.BusinessEntityID, FirstName, LastName, PE.EmailAddress
FROM Person.Person PP
INNER JOIN Person.EmailAddress PE
ON(PP.BusinessEntityID = PE.BusinessEntityID)

SELECT PA.AddressID, PA.City, PA.StateProvinceID, PS.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PS
ON PS.StateProvinceID = PA.StateProvinceID

SELECT * FROM Person.Address PA
INNER JOIN Person.StateProvince PS
ON PA.StateProvinceID = PS.StateProvinceID AND PS.Name = 'ALBERTA'

--LEFT JOIN--
SELECT * FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard SP
ON PP.BusinessEntityID = SP.BusinessEntityID
WHERE SP.BusinessEntityID IS NULL

--DATEPART--
SELECT SUM(TotalDue) MEDIA , DATEPART(MONTH, OrderDate) MES 
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY MES

--CONCAT, UPPER, LOWER, LEN, SUBSTRING, REPLACE--
SELECT CONCAT(FirstName,' ', LastName) CONCAT, 
	UPPER(FirstName) UPPER,
	LOWER(FirstName) LOWER,
	LEN(FirstName) LEN,
	SUBSTRING(FirstName, 1, 3) SUBSTRING,
	REPLACE(FirstName, 's', '5') REPLACE
FROM Person.Person

--SUBQUERY--
SELECT * FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)

