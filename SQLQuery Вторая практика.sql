create view SoYeSum
as
select 
c.КодСотрудника,c.Фамилия,year(z.[ДатаИсполнения]) [год],
sum(n.Цена*(1-n.[Скидка])*n.Количество) [сумма]
from [dbo].Сотрудники c inner join [dbo].Заказы z
on c.КодСотрудника=z.КодСотрудника
inner join [dbo].Заказано n
on n.КодЗаказа=z.КодЗаказа and z.[ДатаИсполнения] is not null
group by c.КодСотрудника,c.Фамилия,year([ДатаИсполнения])
go
select [SoYeSum].*,a.макс
from [dbo].[SoYeSum] inner join (
select [год], max([сумма]) [макс]
from [dbo].SoYeSum
group by [год]) a
on a.год=[dbo].SoYeSum.год
and [SoYeSum].сумма=a.макс