create view SoYeSum
as
select 
c.�������������,c.�������,year(z.[��������������]) [���],
sum(n.����*(1-n.[������])*n.����������) [�����]
from [dbo].���������� c inner join [dbo].������ z
on c.�������������=z.�������������
inner join [dbo].�������� n
on n.���������=z.��������� and z.[��������������] is not null
group by c.�������������,c.�������,year([��������������])
go
select [SoYeSum].*,a.����
from [dbo].[SoYeSum] inner join (
select [���], max([�����]) [����]
from [dbo].SoYeSum
group by [���]) a
on a.���=[dbo].SoYeSum.���
and [SoYeSum].�����=a.����