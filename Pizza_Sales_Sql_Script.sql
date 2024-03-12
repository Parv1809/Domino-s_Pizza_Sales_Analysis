-- Total_Revenue  : 
SELECT round(sum(total_price),2) AS Total_Revenue FROM ps
-- output : '817860.05'


-- Average_Order_Value : 
SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id),2) AS average FROM ps 
-- Output : '38.31'


-- Total_Pizza_sold
SELECT SUM(quantity) AS Total_pizza_sold FROM ps
-- Output : '49574'


-- Total_orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM ps 
-- Output : '21350'

   
-- Avearage_pizza_order
SELECT CAST(SUM(quantity)/Count(DISTINCT order_id) AS DECIMAL(10,2)) AS Average_pizza_order FROM ps   
-- Output : '2.32'
   

-- Chart Requirement

-- daily trend for total orders
SELECT DATENAME(DW,order_date) as order_day ,COUNT(DISTINCT order_id) as total_orders FROM PS
GROUP BY  DATENAME(DW,order_date)


-- Monthly trend for total orders
SELECT DATENAME(MONTH,order_date) as Month_name ,COUNT(DISTINCT order_id) as total_orders FROM PS
GROUP BY  DATENAME(MONTH,order_date)


-- Percentage of sales by pizza category
SELECT pizza_category,ROUND(SUM(total_price)/(SELECT SUM(total_price) FROM ps),2)*100 as PCT_of_sale FROM ps
GROUP BY pizza_category


-- Percentage of sales by pizza size
SELECT pizza_size,ROUND(SUM(total_price)/(SELECT SUM(total_price) FROM ps),2)*100 as PCT_of_sale FROM ps
GROUP BY pizza_size


-- Total pizza sales by pizza category 
SELECT pizza_category,sum(quantity) AS Total_sales_pizza FROM pS 
GROUP BY pizza_category
ORDER BY Total_sales_pizza desc


-- Top 5 pizza based on total_sales_price
SELECT  pizza_name_id, ROUND(SUM(Total_price),2) AS Total_Price FROM ps
GROUP BY pizza_name_id 
ORDER bY Total_Price desc
LIMIT 5


-- Bottom 5 pizza based on total_sales_price
SELECT  pizza_name_id, ROUND(SUM(Total_price),2) AS Total_Price FROM ps
GROUP BY pizza_name_id 
ORDER bY Total_Price 
LIMIT 5


-- Top 5 pizza based on total_sales_qty
SELECT  pizza_name_id, SUM(quantity) AS Total_sales_qty FROM ps
GROUP BY pizza_name_id 
ORDER bY Total_sales_qty desc
LIMIT 5


-- Bottom 5 pizza based on total_sales_qty
SELECT  pizza_name_id, SUM(quantity) AS Total_sales_qty FROM ps
GROUP BY pizza_name_id 
ORDER bY Total_sales_qty 
LIMIT 5


-- Top 5 pizza based on total_sales_orders
SELECT  pizza_name_id, COUNT(DISTINCT order_id) AS Total_sales_order FROM ps
GROUP BY pizza_name_id 
ORDER bY Total_sales_order desc
LIMIT 5


-- Bottom 5 pizza based on total_sales_orders
SELECT  pizza_name_id, COUNT(DISTINCT order_id) AS Total_sales_order FROM ps
GROUP BY pizza_name_id 
ORDER bY Total_sales_order 
LIMIT 5


SELECT * FROM PS




