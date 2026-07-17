/*
==========================================================
Project : Superstore Sales Analytics
File    : 11_seasonality.sql

Description:
Identifies recurring monthly sales patterns to
understand seasonality and support operational planning.

Business Questions:
1. Which months consistently generate the highest sales?
2. Which months consistently underperform?
3. Are there recurring seasonal sales patterns?
4. How should inventory and marketing align
   with seasonal demand?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/
WITH MonthlyData AS (
    SELECT
        strftime('%m', o.Order_Date) AS Month,
        ROUND(SUM(od.Sales), 2) AS Total_Sales,
        ROUND(AVG(od.Sales),2) AS Average_Order_Line_Sales,
        COUNT(DISTINCT o.Order_ID) AS Total_Orders
    FROM Orders o
    JOIN Order_Details od
        ON o.Order_ID = od.Order_ID
    GROUP BY Month
)
SELECT*   
FROM MonthlyData
ORDER BY Month;
