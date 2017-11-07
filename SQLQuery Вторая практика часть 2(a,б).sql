select *
from dbo.r1()
where [месяц]=6 and [год]=1997
/* б */
select *
from dbo.r1()
where [КодПоставщика]=1
order by 2 desc