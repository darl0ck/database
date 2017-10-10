create database #_Koporushkin
go
use [#_Koporushkin]
alter table [dbo].[Доставка]
add constraint pk_d
primary key([КодДоставки])
go
alter table [dbo].[Типы]
add constraint pk_ty
primary key([КодТипа])
go
alter table [dbo].[Поставщики]
add constraint pk_po
primary key([КодПоставщика])
go
alter table [dbo].[Клиенты]
add constraint uk_po
unique ([КодКлиента])
go
alter table [dbo].[Сотрудники]
add constraint pk_s
primary key([КодСотрудника])
go
alter table [dbo].[Сотрудники]
add constraint fk_s_s
foreign key([Подчиняется])
references [dbo].[Сотрудники]([КодСотрудника])
go
alter table [dbo].[Товары]
add constraint pk_to
primary key([КодТовара])
go
alter table [dbo].[Товары]
add constraint fk_to_po
foreign key([КодПоставщика])
references [dbo].[Поставщики]([КодПостовщика])
go
alter table [dbo].[Товары]
add constraint fk_to_ty
foreign key([КодТипа])
references [dbo].[Типы]([КодТипа])
go
alter table [dbo].[Заказы]
add constraint pk_za
primary key([КодЗаказа])
go
alter table [dbo].[Заказы]
add constraint fk_za_kl
foreign key([КодКлиента])
references [dbo].[Клиенты]([КодКлиента])
go
alter table [dbo].[Заказы]
add constraint fk_za_so
foreign key([КодСотрудника])
references [dbo].[Сотрудники]([КодСотрудника])
go
alter table [dbo].[Заказы]
add constraint fk_za_d
foreign key([Доставка])
references [dbo].[Доставка]([КодДоставки])
go
alter table [dbo].[Заказано]
add [НомерЗаписи] int identity(1,1)
primary key
go
alter table [dbo].[Заказано]
add constraint pk_zn
primary key([НомерЗаписи])
go
alter table [dbo].[Заказано]
add constraint fk_zn_za
foreign key([КодЗаказа])
references [dbo].[Заказы]([КодЗаказа])
go
alter table [dbo].[Заказано]
add constraint fk_zn_to
foreign key([КодТовара])
references [dbo].[Товары]([КодТовара])
go