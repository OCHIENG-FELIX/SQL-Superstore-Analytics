/*
==========================================================
Project : Superstore Sales Analytics
File    : 09_yoy_growth.sql

Description:
Measures Year-over-Year (YoY) sales growth to evaluate
long-term business performance.

Business Questions:
1. How has the business grown each year?
2. Which year experienced the highest growth?
3. Which year recorded declining sales?
4. Is the business improving over time?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

WITH YearlySales AS (
SELECT
strftime('%Y', o.Order_Date) AS Year,
ROUND(SUM(od.Sales), 2) AS Total_Sales,
ROUND(SUM(od.Profit), 2) AS Total_Profit,
COUNT(DISTINCT o.Order_ID) AS Total_Orders
FROM Orders o
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY Year
ORDER BY Year
),
YearlyMetrics AS (
SELECT *,
LAG(Total_Sales) OVER (ORDER BY Year) AS Previous_Year_Sales
FROM YearlySales
)
SELECT *,
ROUND(
    (Total_Sales - Previous_Year_Sales) * 100.0 /
    NULLIF(Previous_Year_Sales, 0),
    2
) AS YoY_Sales_Growth_Percent
FROM YearlyMetrics
ORDER BY Year;

