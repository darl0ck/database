create database #_Koporushkin
go
use [#_Koporushkin]
alter table [dbo].[��������]
add constraint pk_d
primary key([�����������])
go
alter table [dbo].[����]
add constraint pk_ty
primary key([�������])
go
alter table [dbo].[����������]
add constraint pk_po
primary key([�������������])
go
alter table [dbo].[�������]
add constraint uk_po
unique ([����������])
go
alter table [dbo].[����������]
add constraint pk_s
primary key([�������������])
go
alter table [dbo].[����������]
add constraint fk_s_s
foreign key([�����������])
references [dbo].[����������]([�������������])
go
alter table [dbo].[������]
add constraint pk_to
primary key([���������])
go
alter table [dbo].[������]
add constraint fk_to_po
foreign key([�������������])
references [dbo].[����������]([�������������])
go
alter table [dbo].[������]
add constraint fk_to_ty
foreign key([�������])
references [dbo].[����]([�������])
go
alter table [dbo].[������]
add constraint pk_za
primary key([���������])
go
alter table [dbo].[������]
add constraint fk_za_kl
foreign key([����������])
references [dbo].[�������]([����������])
go
alter table [dbo].[������]
add constraint fk_za_so
foreign key([�������������])
references [dbo].[����������]([�������������])
go
alter table [dbo].[������]
add constraint fk_za_d
foreign key([��������])
references [dbo].[��������]([�����������])
go
alter table [dbo].[��������]
add [�����������] int identity(1,1)
primary key
go
alter table [dbo].[��������]
add constraint pk_zn
primary key([�����������])
go
alter table [dbo].[��������]
add constraint fk_zn_za
foreign key([���������])
references [dbo].[������]([���������])
go
alter table [dbo].[��������]
add constraint fk_zn_to
foreign key([���������])
references [dbo].[������]([���������])
go