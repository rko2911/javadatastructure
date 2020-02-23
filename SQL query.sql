Create Table TB_Emp
(
	Emp_id Int Not NULL  Primary Key,
	Emp_Name nvarchar(20) Not Null,
	Emp_Email nvarchar(50) not null,
	Emp_genderid int
);

Create Table TB_EmpGender
(
	Id int not null Primary Key,
	Value nvarchar(10) not null
	);

Alter Table TB_Emp
	add constraint Emp_gend_Fk 
	Foreign key (Emp_genderid) references TB_EmpGender(Id)

Alter Table TB_Emp
Drop constraint Emp_gend_Fk

Alter Table TB_Emp add constraint EMP_gend_drf Default(3)
for Emp_genderid

Insert into TB_Emp (Emp_id,Emp_Name,Emp_Email) 
values(6,'john','john@gmail.com')


EXEC sp_RENAME 'TB_EmpGender.Value' , 'Gender'; -- to remane column--


Insert into TB_EmpGender values(1,'Male'),(2,'Female'),(3,'Unknown')

-------------------------------------------------
---Add new column to table 

Alter Table TB_Emp Add Emp_Age int  

--Add value to new column
--Update table 

Update TB_Emp set Emp_Age= 20 where Emp_id=4
Update TB_Emp set Emp_Age= 29 where Emp_id=5
c

---Check constraint 

Alter Table TB_Emp add constraint Check_Age Check (Emp_Age>=0 and Emp_Age<=90)

--Add age >90
Update TB_Emp set Emp_Age= 98 where Emp_id=6

--Error: Msg 547, Level 16, State 0, Line 51
--The UPDATE statement conflicted with the CHECK constraint "Check_Age". The conflict occurred in database "DEMO", table "dbo.TB_Emp", column 'Emp_Age'.
--The statement has been terminated.

Update TB_Emp set Emp_Age= 90 where Emp_id=6


--=---------Unique key 

Alter  Table TB_Emp add constraint uni_email Unique( Emp_Email)

Alter table TB_Emp add identity 


create table Contests ( contest_id INT, hacker_id INT, name VARCHAR(200) );

insert into Contests (contest_id, hacker_id, name) values (66406, 17973, 'Rose'), (66556, 79153, 'Angela'), (94828, 80275, 'Frank');

create table Colleges( college_id INT, contest_id INT );

insert into Colleges (college_id, contest_id) values (11219, 66406), (32473, 66556), (56685, 94828);

create table Challenges ( challenge_id INT, college_id INT );

insert into Challenges (challenge_id, college_id) values (18765, 11219), (47127, 11219), (60292, 32473), (72974, 56685);

create table View_Stats ( challenge_id INT, total_views INT, total_unique_views INT );

insert into View_Stats (challenge_id, total_views, total_unique_views) values (47127, 26, 19), (47127, 15, 14), (18765, 43, 10), (18765, 72, 13), (75516, 35, 17), (60292, 11, 10), (72974, 41, 15), (75516, 75, 11);

create table Submission_Stats ( challenge_id INT, total_submissions INT, total_accepted_submissions INT );

insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (75516, 34, 12), (47127, 27, 10), (47127, 56, 18), (75516, 74, 12), (75516, 83, 8), (72974, 68, 24), (72974, 82, 14), (47127, 28, 11);



-----Date and time 
Create Table Employees
(
       ID int identity primary key,
       Name nvarchar(50),
       DateOfBirth DateTime
)

Insert Into Employees Values ('Tom', '2018-11-19 10:36:46.520')
Insert Into Employees Values ('Sara', '2018-11-18 11:36:26.400')
Insert Into Employees Values ('Bob', '2017-12-22 10:40:10.300')
Insert Into Employees Values ('Alex', '2017-12-30 9:30:20.100')
Insert Into Employees Values ('Charlie', '2017-11-25 7:25:14.700')
Insert Into Employees Values ('David', '2017-10-09 8:26:14.800')
Insert Into Employees Values ('Elsa', '2017-10-09 9:40:18.900')
Insert Into Employees Values ('George', '2018-11-15 10:35:17.600')
Insert Into Employees Values ('Mike', '2018-11-16 9:14:17.600')
Insert Into Employees Values ('Nancy', '2018-11-17 11:16:18.600')


select name,DateOfBirth,cast(DateOfBirth as date) from Employees