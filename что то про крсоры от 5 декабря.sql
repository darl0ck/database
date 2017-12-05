---страна
---категория
---год
---месяц
---сумма
create view dcur
as
select k.Страна,t.КодТипа,year(z.ДатаИсполнения)[Год],
month(z.ДатаИсполнения)[Месяц],sum(n.Количество *n.Цена*(1-n.Скидка))[Сумма]
from [dbo].[Заказы] z inner join [dbo].[Заказано] n
on z.КодЗаказа=n.КодЗаказа
inner join [dbo].[Клиенты] k
on k.КодКлиента=z.КодКлиента
inner join [dbo].[Товары] t
on t.КодТовара=n.КодТовара
and z.ДатаИсполнения is not null
group by k.Страна,t.КодТипа,year(z.ДатаИсполнения),MONTH(z.ДатаИсполнения)
go
declare c1 cursor for 
select * from dcur
open c1
declare @x1 nvarchar(50),@x2 int,@x3 int,@x4 int,@x5 money
fetch next from c1