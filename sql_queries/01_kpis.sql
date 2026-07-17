/*
==========================================================
Project : Superstore Sales Analytics
File    : 01_kpis.sql

Description:
Calculates executive-level Key Performance Indicators
(KPIs) that summarize the company's overall business
performance.

Business Questions:
1. What is the company's total sales revenue?
2. What is the total profit generated?
3. How many products were sold?
4. How many unique orders were placed?
5. What is the company's overall profit margin?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM Order_Details;

