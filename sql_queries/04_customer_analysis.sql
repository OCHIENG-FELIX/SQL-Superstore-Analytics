/*
==========================================================
Project : Superstore Sales Analytics
File    : 04_customer_analysis.sql

Description:
Ranks customers based on purchasing behavior and
overall contribution to company profit.

Business Questions:
1. Which customers generate the highest profit?
2. Which customers place the most orders?
3. Which customers have the highest average order value?
4. Who are the company's most valuable customers?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

SELECT c.Customer_Name,
       COUNT(DISTINCT o.Order_ID) AS Total_Orders,
       ROUND(SUM(od.Sales), 2) AS Total_Sales,
       ROUND(SUM(od.Profit), 2) AS Total_Profit,
       ROUND(SUM(od.Sales) / COUNT(DISTINCT o.Order_ID), 2) AS Average_Order_Value,
       RANK() OVER (ORDER BY SUM(od.Profit) DESC) AS Customer_Rank
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_ID,c.Customer_Name
ORDER BY Customer_Rank;

