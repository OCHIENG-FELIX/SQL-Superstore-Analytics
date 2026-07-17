/*
==========================================================
Project : Superstore Sales Analytics
File    : 03_product_analysis.sql

Description:
Evaluates product performance by measuring sales,
profitability, and quantity sold across different
product categories.

Business Questions:
1. Which products generate the highest sales?
2. Which products generate the highest profit?
3. Which categories perform best?
4. Which products contribute most to company revenue?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

SELECT
    p.Product_Name,
    p.Category,
    ROUND(SUM(od.Sales),2) AS Total_Sales,
    ROUND(SUM(od.Profit),2) AS Total_Profit,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM Products p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_Name,
    p.Category
ORDER BY Total_Sales DESC
LIMIT 10;

/*
==========================================================
Business Insight

Technology products generated the highest profit,
while Office Supplies achieved the highest profit
margin. Furniture generated substantial sales but
relatively low profitability.

Recommendation

Increase investment in high-performing product
categories while reviewing pricing and discount
strategies for low-profit products.
==========================================================
*/
