use [#_Koporushkin]
go

declare @m int, @y int
set @m = 1
set @y = 1998

select a.Категория, convert(money,sum(c.Количество*c.Цена*(1-c.Скидка))) [Итог]
from [dbo].[Типы] a,[dbo].[Товары] b,[dbo].[Заказано] c,[dbo].[Заказы] d
where a.КодТипа = b.КодТипа and 
		b.КодТовара = c.КодТовара and
		c.КодЗаказа = d.КодЗаказа and
		d.ДатаИсполнения is not null and
		MONTH(d.ДатаИсполнения) = @m and
		YEAR(d.ДатаИсполнения) = @y
group by a.Категория
order by 2 desc
