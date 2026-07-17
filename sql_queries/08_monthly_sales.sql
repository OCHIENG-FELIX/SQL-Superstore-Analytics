/*
==========================================================
Project : Superstore Sales Analytics
File    : 08_monthly_sales.sql

Description:
Analyzes monthly business performance by calculating
sales, profit, and total orders for each month.

Business Questions:
1. How do sales change from month to month?
2. Which months generate the highest sales?
3. Which months perform poorly?
4. How does monthly business performance fluctuate?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

SELECT
strftime('%Y', o.Order_Date) AS Year,
strftime('%m', o.Order_Date) AS Month,
ROUND(SUM(od.Sales), 2) AS Total_Sales,
ROUND(SUM(od.Profit), 2) AS Total_Profit,
COUNT(DISTINCT o.Order_ID) AS Total_Orders
FROM Orders o
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY Year, Month
ORDER BY Year , Month;
