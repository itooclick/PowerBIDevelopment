select   get_fiscal_year(fs.date) as Fiscal_year,
monthname(fs.date) as MonthName,date as Date,
Quater(fs.date) as Quater,
fs.Product,fs.Sold_Quantity,
CAST(gp.gross_price AS DECIMAL(10,2)) as GrossPrice,
CAST(fs.sold_quantity*gp.gross_price as DECIMAL(10,2)) as GrossPriceTotal,
dp.variant
from gdb041.fact_sales_monthly fs JOIN gdb056.gross_price gp
on gp.product_code=fs.product_code
JOIN gdb041.dim_product dp
ON fs.product_code=dp.product_code
where customer_name='Amazon' and  
date between '2021-01-01 00:00:00' and '2021-12-31 00:00:00'
group by fs.product, fs.date 
order by fiscal_year
;