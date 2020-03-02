CREATE PROC SP_Practice
@prod_name nvarchar(10),
@YEAR int
as 
Begin 
select p.PRODUCT_NAME,s.YEAR,s.Quantity,s.PRICE,(s.Quantity*s.PRICE) total_sale
from Products p , SALES s
where p.PRODUCT_ID=s.PRODUCT_ID
and p.PRODUCT_NAME=@prod_name
and s.YEAR=@YEAR
end


SP_Practice 'samsung',2011
select * from SALES