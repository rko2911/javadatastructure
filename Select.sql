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


 

select b.stdname,b.marks,b.cumm,b.perc,b.subject
FROM 
(
select a.stdname,a.marks,a.cumm,a.subject,(a.cumm/a.tot) as perc from
(select stdname,subject,marks,sum(marks)
over(partition by subject order by marks desc ) as cumm,
cast(sum(marks) over(partition by subject) as decimal(10,2)) as tot 
from Student) a
) b
where 
b.perc <(case when b.subject=1 then 0.7
else 0.8 end)


select d.stdname,d.marks2,d.cumm,d.perc2
FROM 
(
select c.stdname,c.marks2,c.cumm,(c.cumm/c.tot) as perc2 from
(select stdname,marks2,sum(marks2)
over(order by marks2 desc) as cumm,
cast(sum(marks2) over() as decimal(10,2)) as tot 
from Student) c
) d
where d.perc2 <0.7

