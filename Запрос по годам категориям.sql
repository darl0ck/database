use [#_Koporushkin]
go

declare @m int, @y int
set @m = 1
set @y = 1998

select a.���������, convert(money,sum(c.����������*c.����*(1-c.������))) [����]
from [dbo].[����] a,[dbo].[������] b,[dbo].[��������] c,[dbo].[������] d
where a.������� = b.������� and 
		b.��������� = c.��������� and
		c.��������� = d.��������� and
		d.�������������� is not null and
		MONTH(d.��������������) = @m and
		YEAR(d.��������������) = @y
group by a.���������
order by 2 desc
