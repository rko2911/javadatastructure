---------------------------------------------------------------------------------------------------
--https://www.folkstalk.com/2011/12/sql-queries-interview-questions-oracle.html
--SQL Queries Interview Questions - Oracle Part 2
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
--Q.1. Write a query to find the products whose quantity sold in a year should be greater than
--the average quantity of the product sold across all the years?
---------------------------------------------------------------------------------------------------

--(SELECT AVG(S1.Quantity) 
--		FROM SALES S1) 

SELECT P.PRODUCT_NAME, S.YEAR,S.QUANTITY
		FROM PRODUCTS P
		JOIN SALES S
		ON P.PRODUCT_ID=S.PRODUCT_ID
		WHERE S.Quantity>(SELECT AVG(S1.Quantity) 
		FROM SALES S1);


-------------------------------------------------------------------------------------------
--Q. Write a query to compare the products sales of "IPhone" and "Samsung" in each year? 
--The output should look like as
-------------------------------------------------------------------------------------------
--YEAR IPHONE_QUANT SAM_QUANT IPHONE_PRICE SAM_PRICE
---------------------------------------------------
--2010   10           20       9000         7000
--2011   15           18       9000         7000
--2012   20           20       9000         7000
--------------------------------------------------------------------------------------------

SELECT S_I.YEAR,S_I.Quantity IPHONE_QUANT,S_I.Price IPHONE_PRICE,
		S_S.Quantity SAM_QUANT, S_S.Price SAM_PRICE
	From SALES S_I, PRODUCTS P_I , SALES S_S, PRODUCTS P_S
	Where S_I.PRODUCT_ID=P_I.PRODUCT_ID
	And S_S.PRODUCT_ID=P_S.PRODUCT_ID
	And P_I.PRODUCT_NAME='IPHONE' 
	And P_S.PRODUCT_NAME='Samsung' 
	And S_I.YEAR=S_S.YEAR

SELECT si.YEAR,si.quantity iphone_quant,si.price iphone_price,
ss.YEAR,ss.Quantity sam_quant,ss.PRICE sam_price
from SALES si,Products pi,SALES ss,Products ps
where si.PRODUCT_ID=pi.PRODUCT_ID
and ss.PRODUCT_ID=ps.PRODUCT_ID
and pi.PRODUCT_NAME='iphone'
and ps.PRODUCT_NAME='samsung'
and si.YEAR=ss.YEAR;



--------------------------------------------------------------------------------------------------
--Q.Write a query to find the ratios of the sales of a product?
--------------------------------------------------------------------------------------------------
Select a.PRODUCT_NAME,a.YEAR, a.Total_sales_year/a.total from(
SELECT P.PRODUCT_NAME, S.YEAR, cast(sum(S.PRICE*S.QUANTITY) over (partition by p.product_name,s.year) as float) Total_sales_year, 
							  cast( sum(S.PRICE*S.QUANTITY) over (partition by p.product_name) as float) total
		FROM PRODUCTS P,SALES S
		Where P.PRODUCT_ID=S.PRODUCT_ID ) a
		order by a.PRODUCT_NAME,a.YEAR desc
		

		
select a.product_name,a.year,a.total_sale/a.sale from 
(select p.Product_name, s.YEAR, cast((sum(s.price*s.quantity) over (partition by p.product_name,s.year) ) as float)total_sale,
 cast((sum(quantity*price) over(partition by p.product_name))as float) sale
 from PRODUCTS p,sales s
 where 
 p.PRODUCT_ID=s.PRODUCT_ID) a
 order by a.PRODUCT_NAME,a.YEAR desc
		

---------------------------------------------------------------------------------------------------------
 --In the SALES table quantity of each product is stored in rows for every year. 
 --Now write a query to transpose the quantity for each product and display it in columns? 
 --The output should look like as

--PRODUCT_NAME QUAN_2010 QUAN_2011 QUAN_2012
--------------------------------------------
--IPhone       10        15        20
--Samsung      20        18        20
--Nokia        25        16        8
---------------------------------------------------------------------------------------------------------

select product_name, count(quantity) over(partition by product_name)





----------------------------------------------------------------------------------------------------------
--Write a query to find the number of products sold in each year?
----------------------------------------------------------------------------------------------------------
select YEAR,count(PRODUCT_ID) priduct_count
from SALES
group by YEAR
