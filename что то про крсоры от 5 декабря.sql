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
fetch next from c1 into @x1,@x2,@x3,@x4,@x5
while @@FETCH_STATUS=0
	begin
		if @x4=8 and @x3=1996
			print cast(@x1 as char(20))+cast(@x2 as char(3))
					+cast(@x3 as char(5))+cast(@x4 as char(3)) + cast(@x5 as char(15))
		fetch next from c1 into @x1,@x2,@x3,@x4,@x5
	end
	close c1
	deallocate c1