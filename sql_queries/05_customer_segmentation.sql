/*
==========================================================
Project : Superstore Sales Analytics
File    : 05_customer_segmentation.sql

Description:
Segments customers into business-defined groups
using profitability metrics and NTILE().

Business Questions:
1. Which customers should be classified as VIP?
2. Which customers belong to the Regular segment?
3. Which customers require marketing attention?
4. How should customer loyalty programs be designed?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

WITH CustomerMetrics AS (
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        COUNT(DISTINCT o.Order_ID) AS Total_Orders,
        ROUND(SUM(od.Sales), 2) AS Total_Sales,
        ROUND(SUM(od.Profit), 2) AS Total_Profit,
        ROUND(
            SUM(od.Sales) /
            COUNT(DISTINCT o.Order_ID),
            2
        ) AS Average_Order_Value
    FROM Customers c
    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID
    JOIN Order_Details od
        ON o.Order_ID = od.Order_ID
    GROUP BY
        c.Customer_ID,
        c.Customer_Name
),

RankedCustomers AS (
    SELECT
        *,
        NTILE(10) OVER (
            ORDER BY Total_Profit DESC
        ) AS Profit_Decile
    FROM CustomerMetrics
)

SELECT
    Customer_Name,
    Total_Orders,
    Total_Sales,
    Total_Profit,
    CASE
        WHEN Profit_Decile <= 2 THEN 'VIP'
        WHEN Profit_Decile <= 7 THEN 'Regular'
        ELSE 'Low Value'
    END AS Customer_Segment
FROM RankedCustomers
ORDER BY Total_Profit DESC;
