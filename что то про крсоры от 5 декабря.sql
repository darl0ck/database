---������
---���������
---���
---�����
---�����
create view dcur
as
select k.������,t.�������,year(z.��������������)[���],
month(z.��������������)[�����],sum(n.���������� *n.����*(1-n.������))[�����]
from [dbo].[������] z inner join [dbo].[��������] n
on z.���������=n.���������
inner join [dbo].[�������] k
on k.����������=z.����������
inner join [dbo].[������] t
on t.���������=n.���������
and z.�������������� is not null
group by k.������,t.�������,year(z.��������������),MONTH(z.��������������)
go
declare c1 cursor for 
select * from dcur
open c1
declare @x1 nvarchar(50),@x2 int,@x3 int,@x4 int,@x5 money
fetch next from c1