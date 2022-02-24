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