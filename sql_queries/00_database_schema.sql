/*
==========================================================
Project : Superstore Sales Analytics
File    : 00_database_schema.sql

Description:
Creates the normalized relational database used
throughout this project. The database follows
Third Normal Form (3NF) principles to eliminate
redundancy, improve data integrity, and establish
relationships between business entities.

Business Questions:
1. How should the sales data be structured for efficient analysis?
2. What entities exist within the business?
3. How are Customers, Products, Orders, Locations,
   and Order Details related?
4. Which Primary Keys and Foreign Keys enforce
   data integrity?

Author: Felix Ochieng'
Date: July 2026
==========================================================
*/

-- Customers Table
CREATE TABLE Customers (
    Customer_ID TEXT PRIMARY KEY,
    Customer_Name TEXT,
    Segment TEXT
);

-- Products Table
CREATE TABLE Products (
    Product_ID TEXT PRIMARY KEY,
    Product_Name TEXT,
    Category TEXT,
    Sub_Category TEXT
);

-- Locations Table
CREATE TABLE Locations (
    Location_Key INTEGER PRIMARY KEY,
    Postal_Code INTEGER,
    City TEXT,
    State TEXT,
    Region TEXT,
    Country TEXT
);

-- Orders Table
CREATE TABLE Orders (
    Order_ID TEXT PRIMARY KEY,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode TEXT,
    Customer_ID TEXT,
    Location_Key INTEGER,

    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Location_Key)
        REFERENCES Locations(Location_Key)
);

-- Order Details Table
CREATE TABLE Order_Details (
    Order_Detail_ID INTEGER PRIMARY KEY,
    Order_ID TEXT,
    Product_ID TEXT,
    Quantity INTEGER,
    Sales REAL,
    Discount REAL,
    Profit REAL,

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Products(Product_ID)
);

/*
==========================================================
Business Insight

The transactional dataset was successfully normalized
into Third Normal Form (3NF), reducing data redundancy
while improving consistency and data integrity.

Recommendation

This schema provides a scalable foundation for business
reporting, dashboards, and future analytical projects.
==========================================================
*/
