use [#_Koporushkin]
go
create view TyToSum
as
select t.�������,t.���������,sum(z.����*(1-z.[������])*z.����������) [�����]
from [dbo].[��������] z inner join [dbo].[������] t
on z.���������=t.���������
group by t.�������,t.���������
go
create view TySred
as
select [�������],AVG([�����]) [��������]
from [dbo].[TyToSum]
group by [�������]
go
select t.�����,tt.�����,ts.��������
from [dbo].������ t inner join [dbo].TyToSum tt
on t.���������=tt.���������
inner join [dbo].TySred ts on ts.�������=t.�������
and tt.�����>ts.��������