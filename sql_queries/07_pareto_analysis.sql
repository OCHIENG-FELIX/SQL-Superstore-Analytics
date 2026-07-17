/*
==========================================================
Project : Superstore Sales Analytics
File    : 07_pareto_analysis.sql

Description:
Applies the Pareto Principle (80/20 Rule) to determine
whether a small percentage of customers contributes
the majority of company profit.

Business Questions:
1. Which customers generate most company profit?
2. What percentage of customers contributes
   approximately 80% of total profit?
3. Which customers should receive priority
   retention strategies?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

WITH CustomerMetrics AS (
SELECT c.Customer_ID,
       c.Customer_Name,
       ROUND(SUM(od.Profit),2) AS Total_Profit

FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_ID,
         c.Customer_Name
),
ParetoMetrics AS (
SELECT Customer_ID,
       Customer_Name,
       Total_Profit,
       ROUND(
           Total_Profit * 100.0/
           SUM(Total_Profit) OVER (),2) AS Profit_Contribution_Percentage,
       ROUND(
           SUM(Total_Profit) OVER (ORDER BY Total_Profit DESC), 2) AS Running_Profit,
       ROUND(
           SUM(Total_Profit) OVER (ORDER BY Total_Profit DESC) * 100.0/
           SUM(Total_Profit) OVER (), 2) AS Cumulative_Profit_Percent
FROM CustomerMetrics

),
ParetoAnalysis AS (
SELECT *,
       CASE
           WHEN Cumulative_Profit_Percent <= 80 THEN 'Top 80%'
           ELSE 'Remaining'
      END AS Pareto_Group
FROM ParetoMetrics
)
SELECT *
FROM ParetoAnalysis
ORDER BY Total_Profit DESC;
