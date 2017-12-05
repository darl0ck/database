use [#_Koporushkin]
go
alter table [dbo].[����������]
add [������] nvarchar(1) default(null)
go
use [#_Koporushkin]
go
alter trigger D_Sot on [dbo].[����������]
instead of delete 
as
begin

if (exists(select * 
from deleted d 
where d.[�������������] in (select [�������������] from
 [dbo].[������] z where [��������������] is null)
 )
)
   raiserror ('� ���������� �� ��������� ������',11,1)
	else begin update s
	set s.[������] = 'a'
	from [dbo].[����������] s inner join deleted v
	on v.[�������������] = s.[�������������]
	end
end
go
delete from [dbo].[����������]
where [�������������] = 10