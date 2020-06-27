select * from zipcodes
select * FROM employees
select * from Student

with std1 as (
select stdname,marks,sum(marks)
over(order by marks desc) as cumm,
sum(marks) over() as tot
from Student
--order by marks desc 
)

select *, CAST(cumm/tot AS NUMERIC(10,4)) , 
ROW_NUMBER() over (order by marks desc)
from std1

select b.stdname,b.marks,b.cumm,b.perc
FROM 
(
select a.stdname,a.marks,a.cumm,(a.cumm/a.tot) as perc from
(select stdname,marks,sum(marks)
over(order by marks desc) as cumm,
cast(sum(marks) over() as numeric(10,4)) as tot 
from Student) a
) b
where b.perc <0.7

