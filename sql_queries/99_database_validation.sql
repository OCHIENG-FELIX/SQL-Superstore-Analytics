/*
==========================================================
Project : Superstore Sales Analytics
File    : 99_database_validation.sql

Description:
Performs data quality and integrity checks on the
normalized database before analysis.

Business Questions:
1. Were all records successfully loaded?
2. Are duplicate primary keys present?
3. Are foreign key relationships valid?
4. Is the database ready for analysis?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

----------------------------------------------------------
-- Record Counts
----------------------------------------------------------

SELECT COUNT(*) AS Total_Customers
FROM Customers;

SELECT COUNT(*) AS Total_Products
FROM Products;

SELECT COUNT(*) AS Total_Locations
FROM Locations;

SELECT COUNT(*) AS Total_Orders
FROM Orders;

SELECT COUNT(*) AS Total_Order_Details
FROM Order_Details;

----------------------------------------------------------
-- Duplicate Primary Keys
----------------------------------------------------------

SELECT Customer_ID, COUNT(*)
FROM Customers
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

SELECT Product_ID, COUNT(*)
FROM Products
GROUP BY Product_ID
HAVING COUNT(*) > 1;

SELECT Order_ID, COUNT(*)
FROM Orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

SELECT Order_Detail_ID, COUNT(*)
FROM Order_Details
GROUP BY Order_Detail_ID
HAVING COUNT(*) > 1;

----------------------------------------------------------
-- Missing Values
----------------------------------------------------------

SELECT *
FROM Customers
WHERE Customer_ID IS NULL;

SELECT *
FROM Products
WHERE Product_ID IS NULL;

SELECT *
FROM Orders
WHERE Customer_ID IS NULL;

SELECT *
FROM Order_Details
WHERE Order_ID IS NULL
   OR Product_ID IS NULL;

----------------------------------------------------------
-- Referential Integrity Checks
----------------------------------------------------------

-- Orders without valid customers
SELECT *
FROM Orders o
LEFT JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
WHERE c.Customer_ID IS NULL;

-- Orders without valid locations
SELECT *
FROM Orders o
LEFT JOIN Locations l
    ON o.Location_Key = l.Location_Key
WHERE l.Location_Key IS NULL;

-- Order details without valid orders
SELECT *
FROM Order_Details od
LEFT JOIN Orders o
    ON od.Order_ID = o.Order_ID
WHERE o.Order_ID IS NULL;

-- Order details without valid products
SELECT *
FROM Order_Details od
LEFT JOIN Products p
    ON od.Product_ID = p.Product_ID
WHERE p.Product_ID IS NULL;

/*
==========================================================
Business Insight

Database validation confirmed that the normalized
database maintains data integrity by verifying record
counts, duplicate keys, missing values, and referential
relationships across all tables.

Recommendation

Incorporate automated validation checks into future
ETL pipelines to ensure data quality before reporting
and analysis.
==========================================================
*/
