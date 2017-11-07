use [#_Koporushkin]
go
create view TyToSum
as
select t.КодТипа,t.КодТовара,sum(z.Цена*(1-z.[Скидка])*z.Количество) [Сумма]
from [dbo].[Заказано] z inner join [dbo].[Товары] t
on z.КодТовара=t.КодТовара
group by t.КодТипа,t.КодТовара
go
create view TySred
as
select [КодТипа],AVG([Сумма]) [мсреднее]
from [dbo].[TyToSum]
group by [КодТипа]
go
select t.Марка,tt.Сумма,ts.мсреднее
from [dbo].Товары t inner join [dbo].TyToSum tt
on t.КодТовара=tt.КодТовара
inner join [dbo].TySred ts on ts.КодТипа=t.КодТипа
and tt.Сумма>ts.мсреднее