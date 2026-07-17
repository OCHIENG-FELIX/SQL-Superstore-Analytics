/*
==========================================================
Project : Superstore Sales Analytics
File    : 06_discount_analysis.sql

Description:
Analyzes how discount levels influence company
sales and profitability.

Business Questions:
1. How do discounts affect profit?
2. Which discount levels remain profitable?
3. At what discount level does the company begin
   losing money?
4. Should current discount policies be reviewed?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

SELECT
    Discount,
    COUNT(Order_Detail_ID) AS Number_of_Order_Lines,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / COUNT(Order_Detail_ID), 2) AS Average_Profit_Per_Order_Line,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM Order_Details
GROUP BY Discount
ORDER BY Discount DESC;
