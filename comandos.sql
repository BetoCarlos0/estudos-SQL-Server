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

--SELF JOIN--
SELECT A.Discount FROM DBO.[Order Details] A, DBO.[Order Details] B
WHERE A.Discount = B.Discount
--não é self join--
SELECT A.Discount FROM DBO.[Order Details] A
INNER JOIN DBO.[Order Details] B ON A.Discount = B.Discount

--TIPOS DE DADOS--
--BOLEANOS, CARACTERES, NÚMEROS, TEMPORAIS
--## CARACTERES
tamanho fixo - CHAR // permite inserir até uma quantiudade fixa de cartacteres s sempre ocupa todo o espaço reservado 10/50

tamanhgo variado - VARCHAR ou NVARCHAR // permite inserir até uma quantidade que for definida, porem só usa o espaço que for preenchido 10/50

--## NÚMEROS
--### VALORES EXATOS

1 - TINYINT // não tem parte valor fracionado (ex. 1.43, 24.23) somente 1,123126, 324246, 313123 etc...
2 - SMALLINT // mesma coisa porem limite maior
3 - INT // mesma coisa porem limite maior
4 - BIGINT // mesma coisa porem limite maior
5 - NUMERIC ou DECIMAL // valores exatos, porem permite ter parte fracionados, que também pode ser especificado a precisão e escala (escala ou número de digitos na parte fracional) -ex: numeric (5, 2) 112.44

--## VALORES APROXIMADOS
1 - REAL // tem precisão aproximado de até 15 dígitos
2 - FLOAT // mesmo conceito de real

--## TEMPORÁRIOS
DATE - armazena data no formato aaaa/mm/dd
DATETIME - armazena data e horas no formato aaaa/mm/dd:hh:mm:ss
DATETIME2 - data e horascom adição de milissegundos no formato aaaa/mm/dd:hh:mm:sssssss
SMALLDETETIME - data e horas nos respeitando o limite entre '1900-01-01:00:)0:00' até '2079-06-06:23:59:59'.
TIME - horas, minutos, segundos e milissegundos respeitando o limite de '00:00:00.0000000' até '23:59:59.99999999'
DATETIMEOFFSET - permite armazenar informações de data e horas incluindo o fuso horário

--CREATE--
CREATE TABLE Canal(
	CanalId INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	CountagemInsc INT DEFAULT 0,
	DataCriacao DATETIME NOT NULL
)

CREATE TABLE Video (
	VideoId INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	Visualizacao INT DEFAULT 0,
	Likes INT DEFAULT 0,
	Deslikes INT DEFAULT 0,
	Duracao INT NOT NULL,
	CanalId INT FOREIGN KEY REFERENCES Canal(CanalId)
)

CREATE TABLE Likes(
	LikeId int primary key identity,
	Quantidade int default 0,
	VideoId INT FOREIGN KEY REFERENCES Video(VideoId)
	ON DELETE CASCADE ON UPDATE CASCADE
)

--INSERT--
INSERT INTO Canal(CanalId, Nome, DataCriacao)
values (1, 'canal teste', CURRENT_TIMESTAMP)

INSERT INTO Video(VideoId, Nome, Duracao, CanalId)
VALUES(1, 'VIDEOS DE TESTE', 120, 1)

--UPDATE--
UPDATE Video
SET Nome = 'UM VIDEO', Duracao = 195
WHERE VideoId = 1

--DELETE--
DELETE FROM Video
WHERE VideoId = 1

--ALTER ADD COLUMN--
ALTER TABLE Video
ADD Ativo bit
--ALTER TYPE--
ALTER TABLE VIDEO
ALTER COLUMN ATIVO SMALLINT
--ALTER COLUMN--
EXEC sp_rename 'Video.ativo', 'ativado', 'COLUMN';
--ALTER TABLE--
EXEC sp_rename 'Youtube', 'Youtube2';

--ALTER TABLE, SET PRIMARY KEY--
ALTER TABLE Video
ADD CONSTRAINT PK_VIDEO PRIMARY KEY(VideoId)

--ALTER TABLE, DROP PRIMARY KEY--
ALTER TABLE Video
DROP CONSTRAINT PK__Video__BAE5126A27A4966B;

--MODELAGEM DE BANCO DE DADOS CONSUMINDO API SWAPI DOS STARS WARS--
CREATE TABLE Planetas(
	PlanetaId int NOT NULL,
	Nome varchar(50) NOT NULL,
	Rotação float NOT NULL,
	Orbita float NOT NULL,
	Diametro float NOT NULL,
	Clima varchar(50) NOT NULL,
	Populacao int  NOT NULL,
	CONSTRAINT PK_PLANETAS PRIMARY KEY (PlanetaId)
)

CREATE TABLE Naves(
	NaveId int NOT NULL,
	Nome varchar(50) NOT NULL,
	Modelo varchar(50) NOT NULL,
	Passageiros int NOT NULL,
	Carga float NOT NULL,
	Classe varchar(50) NOT NULL
	CONSTRAINT PK_NAVES PRIMARY KEY (NaveId)
)

CREATE TABLE Pilotos(
	PilotoId int NOT NULL,
	Nome varchar(100) NOT NULL,
	AnoNascimento varchar(10) NOT NULL,
	PlanetaId int NOT NULL
	CONSTRAINT PK_PILOTOS PRIMARY KEY (PilotoId),
	CONSTRAINT FK_PILOTOS_PLANETAS FOREIGN KEY (PlanetaId) REFERENCES Planetas(PlanetaId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

CREATE TABLE PilotoNave(
	Id int NOT NULL,
	PilotoId int NOT NULL,
	NaveId int NOT NULL,
	CONSTRAINT PK_PILOTONAVE PRIMARY KEY (Id),
	CONSTRAINT FK_PILOTONAVE_PILOTOS FOREIGN KEY (PilotoId) REFERENCES Pilotos(PilotoId),
	CONSTRAINT FK_PILOTONAVE_NAVES FOREIGN KEY (NaveId) REFERENCES Naves(NaveId)
)

ALTER TABLE PILOTONAVE
ADD FlagAutorizado bit NOT NULL

ALTER TABLE PILOTONAVE
ADD CONSTRAINT DF_PILOTONAVE_FLAGAUTORIZADO DEFAULT (1) FOR FlagAutorizado

CREATE TABLE HistoricoViagens(
	HVId int NOT NULL,
	PilotoNaveId int NOT NULL,
	DtSaida datetime NOT NULL,
	DtChegada datetime NULL,
	CONSTRAINT PK_HISTORICOVIAGEN PRIMARY KEY (HVId),
	CONSTRAINT FK_HISTORICOVIAGEM_PILOTONAVE FOREIGN KEY (PilotonaveId) REFERENCES PilotoNave(Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

--Trabalhanbdo com guid em .net--
CREATE TABLE Jogos(
	Id uniqueidentifier default newid(),
	Nome varchar(100) not null,
	Produtora varchar(100) not null,
	Preco float not null,
	CONSTRAINT pk_jogo PRIMARY KEY (Id)
)
insert into Jogos values(default, 'Fifa20', 'EA Games', 200.50),
						(default, 'Fifa19', 'EA Games', 201.50),
						(default, 'Fifa18', 'EA Games', 202.50),
						(default, 'Fifa17', 'EA Games', 205.50),
						(default, 'Fifa16', 'EA Games', 210.50),
						(default, 'Fifa15', 'EA Games', 220.50),
						(default, 'Fifa14', 'EA Games', 180.50)

--inserte em tabela com dados de outras tabelas
INSERT INTO tabela_evento (evento, pessoa_id)
	(SELECT 'EVENTO E', id FROM tabela_pessoa WHERE nome = 'Lisa Romero')

--update em tabelas comd ados de outras tabelas
UPDATE tabela_evento
SET pessoa_id = (SELECT id from tabela_pessoa where nome = 'John Doe')
WHERE evento = 'EVENTO D'

