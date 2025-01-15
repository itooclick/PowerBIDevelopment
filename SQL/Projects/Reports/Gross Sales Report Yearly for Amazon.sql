SELECT  gdb041.get_fiscal_year(date) as Fiscal_Year ,
ROUND(SUM((gp.gross_price*fs.sold_quantity))) As Gross_Price 
FROM 
fact_sales_monthly fs  
JOIN gdb056.gross_price gp
ON gp.product_code=fs.product_code
AND gp.fiscal_year=gdb041.get_fiscal_year(date)
where fs.customer_name like '%Amazon%'
-- and fs.date between '2021-01-01 00:00:00' and '2021-12-31 00:00:00'
Group by year(date) order by fs.date;
