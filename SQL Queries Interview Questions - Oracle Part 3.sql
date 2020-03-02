--------------------------------------------------------------------------------------------------------
--Q.Write a query to generate sequence numbers from 1 to the specified number N?
--------------------------------------------------------------------------------------------------------
--1 With CET

With CET as
(
select COUNT=1
union all
select COUNT=COUNT+1
from CET where count<100
)
select count from CET
---------------
--2 Using while loop 

declare @num int
set @num=0
while @num<100
BEGIN
set @num=@num+1
print @num
end

----------------------------------------------------------------------------------------------
--Q.Write a query to display only friday dates from Jan, 2000 to till now?
----------------------------------------------------------------------------------------------

select 

select convert(date, GETDATE()) date

