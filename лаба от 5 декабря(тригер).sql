use [#_Koporushkin]
go
alter table [dbo].[Сотрудники]
add [Статус] nvarchar(1) default(null)
go
use [#_Koporushkin]
go
alter trigger D_Sot on [dbo].[Сотрудники]
instead of delete 
as
begin

if (exists(select * 
from deleted d 
where d.[КодСотрудника] in (select [КодСотрудника] from
 [dbo].[Заказы] z where [ДатаИсполнения] is null)
 )
)
   raiserror ('У сотрудника не завершены заказы',11,1)
	else begin update s
	set s.[Статус] = 'a'
	from [dbo].[Сотрудники] s inner join deleted v
	on v.[КодСотрудника] = s.[КодСотрудника]
	end
end
go
delete from [dbo].[Сотрудники]
where [КодСотрудника] = 10