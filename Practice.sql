select con.Contest_id, con.hacker_id,con.name,sub.total_sub,sub.total_acc,vs.total_v,vs.total_u_v
		from Contests con
		join colleges col on con.contest_id = col.contest_id 
join challenges cha on  col.college_id = cha.college_id 
left join
(select challenge_id,sum(total_submissions)as total_sub , sum(total_accepted_submissions) as total_acc
from Submission_Stats group by challenge_id) sub on
left join
(select challenge_id, sum(total_views) as total_v, sum(total_unique_views) as total_u_v 
from View_Stats group by challenge_id) vs

select * from dbo.TB_Emp

select sum(Emp_Age),max(Emp_Age) from dbo.TB_Emp
select Emp_Name,sum(max(Emp_Age)) from dbo.TB_Emp group by Emp_Name



select con.contest_id,
        con.hacker_id, 
        con.name, 
        sum(total_submissions), 
        sum(total_accepted_submissions), 
        sum(total_views), sum(total_unique_views)
from contests con 
join colleges col on con.contest_id = col.contest_id 
join challenges cha on  col.college_id = cha.college_id 
left join
(select challenge_id, sum(total_views) as c, sum(total_unique_views) as d
from view_stats group by challenge_id) vs on cha.challenge_id = vs.challenge_id 
left join
(select challenge_id, sum(total_submissions) as a, sum(total_accepted_submissions) as b from submission_stats group by challenge_id) ss on cha.challenge_id = ss.challenge_id
    group by con.contest_id, con.hacker_id, con.name
        having sum(total_submissions)!=0 or 
                sum(total_accepted_submissions)!=0 or
                sum(total_views)!=0 or
                sum(total_unique_views)!=0
            order by contest_id;

			
select concat(number,'&') from 
(select distinct NUMBER as number,'&' from MASTER..SPT_VALUES as a
where NUMBER>=1 and NUMBER<1000
and not exists
(select 1 from MASTER..SPT_VALUES as num where num.number 
> 1 and num.number<a.number
and a.number%num.number=0))


-------------------------------------LEFT, RIGHT, CHARINDEX and SUBSTRING functions--------------------




-----date---

select GETDATE();
select datepart(DAY,GETDATE())






---------------------------------------------------------------------------------------------------------------------------------
select * from Products
select * from SALES

select 

