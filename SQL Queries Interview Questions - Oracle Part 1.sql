---------------------------------------------------------------------------------------------------
--https://www.folkstalk.com/2011/12/sql-queries-interview-questions-oracle.html
--SQL Queries Interview Questions - Oracle Part 1
---------------------------------------------------------------------------------------------------

--Create Table products

Create table Products 
(
       PRODUCT_ID     INTEGER,
       PRODUCT_NAME   nvarchar(30)
);

--Insert data into Products table 

Insert into Products values 
(100, 'Nokia'),
(200, 'IPhone'),
(300, 'Samsung'),
(400, 'LG')

--Select from Products 

select * from Products

--Create table Sales

CREATE TABLE SALES
(
       SALE_ID        INTEGER,
       PRODUCT_ID     INTEGER,
       YEAR           INTEGER,
       Quantity       INTEGER,
       PRICE          INTEGER
); 

--Insert into Sales table 

INSERT INTO SALES VALUES ( 1, 100, 2010, 25, 5000);
INSERT INTO SALES VALUES ( 2, 100, 2011, 16, 5000);
INSERT INTO SALES VALUES ( 3, 100, 2012, 8,  5000);
INSERT INTO SALES VALUES ( 4, 200, 2010, 10, 9000);
INSERT INTO SALES VALUES ( 5, 200, 2011, 15, 9000);
INSERT INTO SALES VALUES ( 6, 200, 2012, 20, 9000);
INSERT INTO SALES VALUES ( 7, 300, 2010, 20, 7000);
INSERT INTO SALES VALUES ( 8, 300, 2011, 18, 7000);
INSERT INTO SALES VALUES ( 9, 300, 2012, 20, 7000);

--Select from sales
Select * from SALES

------------------------------------------------------------------------------------------------
--Q. Write a SQL query to find the products which have continuous increase in sales every year?
------------------------------------------------------------------------------------------------

select PRODUCT_NAME 
from (
		Select p.PRODUCT_NAME,
		s.Quantity-LEAD(s.Quantity,1,0) over (
		partition by p.PRODUCT_ID ORDER BY s.YEAR DESC) Quant_diff
from 
		PRODUCTS p,SALES s
where	p.PRODUCT_ID=s.PRODUCT_ID)a
group by 
		PRODUCT_NAME
having	min(Quant_diff)>=0


------------------------------------------------------------------------------------------------
--Write a SQL query to find the products which does not have sales at all?
------------------------------------------------------------------------------------------------
Select p.PRODUCT_NAME
		from PRODUCTS p
		left outer join SALES s 
		on p.PRODUCT_ID=s.PRODUCT_ID

	where s.Quantity is null;

	select p.PRODUCT_NAME,s.Quantity from PRODUCTS p 
	left outer join SALES s
	on p.PRODUCT_ID=s.PRODUCT_ID where Quantity is null

	select * from SALES where PRODUCT_ID=400


--------------------------------------------------------------------------------------------------
--Q.Write a SQL query to find the products whose sales decreased in 2012 compared to 2011
--------------------------------------------------------------------------------------------------
select PRODUCT_NAME from 
(Select 
		p.PRODUCT_NAME,s.YEAR, s.Quantity,
		LEAD(s.Quantity,1,0) over 
		(Partition by PRODUCT_NAME order by s.YEAR DESC) Quant_prev
		from 
		PRODUCTS p,SALES s
		where 
		p.PRODUCT_ID=s.PRODUCT_ID ) pro
		where YEAR=2012
		and (Quantity-Quant_prev) <0;



--------------------------------------------------------------------------------------------------
--Q. Write a query to select the top product sold in each year?
--------------------------------------------------------------------------------------------------

SELECT PRODUCT_NAME, Quantity, YEAR From (
SELECT p.PRODUCT_NAME,s.Quantity,YEAR,
		RANK() over (PARTITION BY YEAR ORDER BY Quantity DESC) Rank_NO
		from PRODUCTS p, SALES s
		where p.PRODUCT_ID=s.PRODUCT_ID ) a
		where Rank_NO=1;

-------------------------------------------------------------------------------------------------
--Q.Write a query to find the total sales of each product.?
-------------------------------------------------------------------------------------------------
Select p.PRODUCT_NAME,  
(CASE When SUM(s.PRICE*s.Quantity) is NULL then 0 else SUM(s.PRICE*s.Quantity) end) Totl_Sales
		From PRODUCTS p
		Left Outer Join SALES s
		ON p.PRODUCT_ID=s.PRODUCT_ID
		Group by p.PRODUCT_NAME




Select * from PRODUCTS
Select * from SALES
Select p.PRODUCT_NAME, s.SALE_ID,s.YEAR,QUANTITY,s.PRICE
from PRODUCTS p  inner join SALES s 
on p.PRODUCT_ID=s.PRODUCT_ID
