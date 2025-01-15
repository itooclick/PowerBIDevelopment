CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_sales_report_monthly`(c_name Varchar(20))
BEGIN
SELECT  date as Date ,ROUND(SUM((gp.gross_price*fs.sold_quantity))) As Gross_Price FROM 
fact_sales_monthly fs  JOIN gdb056.gross_price gp
ON gp.product_code=fs.product_code
AND gp.fiscal_year=gdb041.get_fiscal_year(date)
where fs.customer_name like c_name
Group by date order by fs.date ;
END