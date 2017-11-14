--пример курсора

select k.Название as НавазниеКлиента, z.КодЗаказа, z.ДатаИсполнения, d.Название as СпособДоставки
from Клиенты k inner join Заказы z 
on k.КодКлиента = z.КодКлиента
inner join Доставка d
on d.КодДоставки = z.Доставка
and z.ДатаИсполнения is not null
order by 1,2,3
go

declare RezKl cursor
for 
select k.Название as НавазниеКлиента, z.КодЗаказа, z.ДатаИсполнения, d.Название as СпособДоставки
from Клиенты k inner join Заказы z 
on k.КодКлиента = z.КодКлиента
inner join Доставка d
on d.КодДоставки = z.Доставка
and z.ДатаИсполнения is not null
order by 1,2,3

open RezKl
declare @r int, @p int, @i int
set @r=0
set @p=0
set @i=0
declare @kl nvarchar(50), @kz int, @disp datetime, @typeD nvarchar(50)

fetch from RezKl into @kl, @kz, @disp, @typeD 
while @@fetch_status=0
	  begin
	  if @typeD='Почта' set @p=@p+1
	  else if @typeD='Ространс' set @r=@r+1
	  else set @i=@i+1 
	  fetch from RezKl into @kl, @kz, @disp, @typeD 
	  end
	  print cast(@r as char(5)) + 'Ространс'
	  print cast(@p as char(5)) + 'Почта'
	  print cast(@i as char(5)) + 'Иное'
close RezKl	  


----пример insert, delete, update

create table #Kl --временная таблица
(id int identity(1,1) not null,
 code_kl varchar(50),
 name_kl varchar(50),
 land varchar(50),
 email varchar(100))
go
insert into #Kl(code.kl,name_kl,land_kl,email.kl)
values('QWER','QwickWear','China','qwickwear@mail.chi')
go
select * from #Kl
go
insert into #Kl(code.kl,name_kl,land_kl,email.kl)
select КодКлиента, Название, Страна, Факс --как почта
from Клиенты
go
insert into #Kl(code.kl,name_kl,land_kl,email.kl)
values('ASDF','AsWear','France','code@mail.chi')
go

delete from #Kl
where id=1
go

insert into Клиенты
values
	('QWERTY',
	 'asdada',
	  null,
	  null,
	  'USA',
	  'Dortmunt',
	  null,
	  null,
	  'USA',
	  '123567',
	  null)
insert into Заказы
values
	(7777777,
	 'QERTY',
	 2,
	 '14/11/2017',
	 '14/11/2017',
	 '14/11/2017',
	 2,
	 100,
	 'QERTY',
	 null,
	 null,
	 null,
	 '12304',
	 'USA')

go
delete from Клиенты
where КодКлиента = 'QWERTY'
--- будет ошибка, так как есть внешние ключи к Заказам
---- нужна сначала удалить все связанные заказы, а  потом уже клиента
---- для этого создадим триггер, который будет работать вместо:
delete from DelKl
where КодКлиента = 'QWERTY'

go
create view DelKL
as select * from Клиенты k
inner join Заказы z on k.КодКлиента=z.КодКлиента 
go
create trigger delKlZak on DelKL
instead of delete
as
begin
	declare @kl nvarchar(50), @kz int
	select @kl=КодКлиента, @kz=КодЗаказа from Deleted
	delete from Заказы 
	where КодЗаказа=@kz
	delete from Клиенты
	where КодКлиента=@kl
end
