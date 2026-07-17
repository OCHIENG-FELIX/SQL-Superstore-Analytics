/*
==========================================================
Project : Superstore Sales Analytics
File    : 02_regional_analysis.sql

Description:
Analyzes business performance across different
geographical regions.

Business Questions:
1. Which region generates the highest sales?
2. Which region is the most profitable?
3. Which region has the highest profit margin?
4. Which region requires management attention?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

SELECT
    l.Region,
    ROUND(SUM(od.Sales), 2) AS Total_Sales,
    ROUND(SUM(od.Profit), 2) AS Total_Profit,
    SUM(od.Quantity) AS Total_Quantity,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    ROUND((SUM(od.Profit) / SUM(od.Sales)) * 100, 2) AS Profit_Margin
FROM Order_Details od
JOIN Orders o
    ON od.Order_ID = o.Order_ID
JOIN Locations l
    ON o.Location_Key = l.Location_Key
GROUP BY l.Region
ORDER BY Total_Sales DESC;

