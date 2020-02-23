Create table Employees
(
     ID int primary key identity,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
GO

Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)



select top 1 salary from
(Select distinct top 3  Salary From Employees order by Salary DESC) result
order by salary
		

SELECT salary FROM Employees e1 WHERE 3 = 
(SELECT COUNT(DISTINCT salary) FROM Employees e2 WHERE e2.salary > e1.salary)




Create table Employees 
(
     EmployeeID int primary key identity,
     EmployeeName nvarchar(50),
     ManagerID int foreign key references Employees(EmployeeID)
)
GO

Insert into Employees values ('John', NULL)
Insert into Employees values ('Mark', NULL)
Insert into Employees values ('Steve', NULL)
Insert into Employees values ('Tom', NULL)
Insert into Employees values ('Lara', NULL)
Insert into Employees values ('Simon', NULL)
Insert into Employees values ('David', NULL)
Insert into Employees values ('Ben', NULL)
Insert into Employees values ('Stacy', NULL)
Insert into Employees values ('Sam', NULL)
GO

Update Employees Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
Update Employees Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
Update Employees Set ManagerID = 3 Where EmployeeName IN ('Tom')
Update Employees Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
Update Employees Set ManagerID = 4 Where EmployeeName IN ('David')

Select * from Employees

select E1.EmployeeName, E2.EmployeeName as ManagerName 
		From Employees E1  Left Join Employees E2
		On E1.ManagerId=E2.EmployeeID



WITH EmployeeCTE AS
(
     Select EmployeeId, EmployeeName, ManagerID
     From Employees
     Where EmployeeId = 7
    
     UNION ALL
    
     Select Employees.EmployeeId , Employees.EmployeeName,
             Employees.ManagerID
     From Employees
     JOIN EmployeeCTE
     ON Employees.EmployeeId = EmployeeCTE.ManagerID
)

Select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
From EmployeeCTE E1
LEFT Join EmployeeCTE E2
ON E1.ManagerID = E2.EmployeeId

Create table RAM
(
     
     Name_1 nvarchar(50),
     Name_2 nvarchar(50)
)
iNSERT INTO RAM values ('A', 'B')
iNSERT INTO RAM values ('B', 'C')
iNSERT INTO RAM values ('C', 'D')
iNSERT INTO RAM values ('B', 'A')
iNSERT INTO RAM values ('C', 'B')
iNSERT INTO RAM values ('E', 'F')

SELECT  NAME_1, NAME_2 FROM(
SELECT NAME_1,NAME_2, DISTINCT( RANK() OVER (ORDER BY NAME_1,NAME_2) )R  FROM 
(SELECT *,RANK() OVER (ORDER BY NAME_1,NAME_2) R FROM RAM TEM1 
UNION ALL
SELECT NAME_2,NAME_1, RANK() OVER (ORDER BY NAME_2,NAME_1)FROM RAM ) A
WHERE R/2!=0) B
