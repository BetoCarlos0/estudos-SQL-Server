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