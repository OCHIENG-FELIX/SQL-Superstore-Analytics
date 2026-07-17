/*
==========================================================
Project : Superstore Sales Analytics
File    : 10_moving_average.sql

Description:
Calculates a three-month moving average to smooth
short-term sales fluctuations and identify
long-term sales trends.

Business Questions:
1. What is the three-month moving average?
2. Is the sales trend increasing or decreasing?
3. Are short-term fluctuations hiding the true trend?
4. How can management use moving averages
   for forecasting?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/
WITH MonthlySales AS (
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
ORDER BY Year, Month
),
MonthlyMetrics AS (
SELECT *,
LAG(Total_Sales) OVER (ORDER BY Year, Month) AS Previous_Month_Sales,
AVG(Total_Sales)
OVER (
    ORDER BY Year, Month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS Three_Month_Average_Sales
FROM MonthlySales
)
SELECT*,
ROUND(
    (Total_Sales - Previous_Month_Sales) * 100.0 /
    NULLIF(Previous_Month_Sales,0),
    2
) AS MoM_Sales_Growth_Percent
FROM MonthlyMetrics
ORDER BY Year, Month;
