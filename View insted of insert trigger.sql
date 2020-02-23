--Insted of trigger Insert trigger

--Create table tblEmployee Id,name gender dept id primery

Create table tblEmployee
(
Id int Primary key,
EmpName nvarchar(20),
Gender nvarchar(20),
DepartmentId int
)


-- Create 2nd table tblDepartment DeptID deptname id as primery key

Create table tblDepartment
(
DeptId int Primary key,
DeptName nvarchar(20)
)

--INsert into both tables
--Insert data into tblDepartment table
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

--Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3)

--select data 
select * from dbo.tblDepartment
select * from dbo.tblEmployee

--join both table 

select Id,EmpNAme,Gender,DeptNAme 
from dbo.tblEmployee
join dbo.tblDepartment on DepartmentId=DeptId

---create a view for this 

Create view vWEmployeeDetails
as
select Id,EmpNAme,Gender,DeptNAme 
from dbo.tblEmployee
join dbo.tblDepartment on DepartmentId=DeptId

select * from vWEmployeeDetails

----Insted of trigger to insert data into view
	
	Alter trigger tr_vWEmployeeDetails_insert
	on vWEmployeeDetails
	instead of insert
	as
	begin
	Declare @DeptId int

	select @DeptId= DeptId
	from tblDepartment join inserted on Inserted.DeptName=tblDepartment.DeptName

	---if id is not present or junk values is passed 
	if(@DeptId is null)
	Begin 
	Raiserror('Error junk or null value for deptname',16,1)
	return
	end

	--insert to emp table
	Insert into dbo.tblEmployee (ID,EmpName,Gender,DepartmentId)
	select ID,EmpName,Gender,@DeptId
	from Inserted
	end

	insert into vWEmployeeDetails values (10,'Rajil','male','dfsdfsdfs')
										 