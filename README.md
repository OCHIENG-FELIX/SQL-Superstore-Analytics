![SQL](https://img.shields.io/badge/SQL-Advanced-blue)

![SQLite](https://img.shields.io/badge/SQLite-Database-green)

![Python](https://img.shields.io/badge/Python-Data%20Analysis-yellow)

![Status](https://img.shields.io/badge/Project-Completed-success)
# 📊 Superstore Sales Analytics Using SQL

> **End-to-End SQL Data Analytics Project | Database Design | Business Intelligence | Executive Reporting**

## 📌 Project Overview

This project demonstrates an end-to-end SQL data analytics workflow using the Superstore sales dataset. The original transactional dataset was transformed into a normalized relational database and analyzed using SQL to generate actionable business insights.

The project showcases practical data analytics skills including relational database design, SQL querying, customer segmentation, profitability analysis, time-series analysis, and executive KPI reporting.

---

# 🎯 Business Problem

Organizations generate thousands of sales transactions every year but often lack clear visibility into their overall business performance.

Without meaningful analysis, management cannot easily answer questions such as:

* Which regions generate the highest profit?
* Which products drive revenue?
* Which customers contribute the most value?
* How do discounts affect profitability?
* How is business performance changing over time?

This project addresses these questions by transforming raw sales transactions into actionable business intelligence.

---

# 🎯 Project Objectives

The objectives of this project were to:

* Design a normalized relational database (3NF)
* Build an SQL database using SQLite
* Analyze overall business performance
* Evaluate regional and product performance
* Segment customers based on profitability
* Perform Pareto Analysis
* Analyze the impact of discounts
* Measure Month-over-Month (MoM) and Year-over-Year (YoY) growth
* Identify seasonal sales patterns
* Produce business recommendations based on analytical findings

---

# 📂 Dataset

**Dataset:** Sample Superstore

**Records:** 9,994

**Columns:** 21

The dataset contains transactional sales information including:

* Orders
* Customers
* Products
* Sales
* Discounts
* Profit
* Geographic locations
* Shipping information

---

# 🗄 Database Design

The original transactional dataset was normalized into **Third Normal Form (3NF)** to eliminate redundancy and improve data integrity.

### Database Tables

| Table         | Description                  |
| ------------- | ---------------------------- |
| Customers     | Customer information         |
| Products      | Product information          |
| Locations     | Geographic information       |
| Orders        | Order-level information      |
| Order_Details | Transaction-level sales data |

### Relationships

* One Customer → Many Orders
* One Location → Many Orders
* One Order → Many Order Details
* One Product → Many Order Details

---

# 🛠 Technologies Used

* SQL
* SQLite
* Python
* Pandas
* Google Colab
* Git & GitHub

---

# 📈 Business Questions Answered

This project answers key business questions including:

* What are the company's key performance indicators (KPIs)?
* Which regions generate the highest sales and profit?
* Which product categories perform best?
* Which customers generate the highest profit?
* How do discounts affect profitability?
* Which customers should receive loyalty rewards?
* How concentrated is company profit (Pareto Analysis)?
* How are sales changing Month-over-Month?
* How are sales changing Year-over-Year?
* What seasonal sales patterns exist?

---

# 📊 SQL Analysis Performed

The project includes analysis of:

* Executive KPIs
* Regional Performance
* Product Performance
* Customer Performance
* Customer Segmentation (NTILE)
* Pareto Analysis (80/20 Rule)
* Discount Analysis
* Profitability Analysis
* Month-over-Month Sales Growth
* Year-over-Year Sales Growth
* Three-Month Moving Average
* Seasonality Analysis

---

# 📌 Key Business Insights

* The **West** region generated the highest sales and profit.
* The **Central** region recorded the lowest profit margin despite substantial sales.
* **Technology** generated the highest total profit.
* **Office Supplies** achieved the highest profit margin.
* **Furniture** recorded high sales but relatively low profitability.
* High discount levels significantly reduced profit margins, with some discount ranges producing negative profits.
* A relatively small percentage of customers generated the majority of company profit, confirming the Pareto Principle.
* Month-over-Month and Year-over-Year analysis revealed changing business performance over time.
* Seasonal trends highlighted opportunities for improved inventory planning and marketing.

---

# 💡 Business Recommendations

Based on the analysis, the following recommendations were made:

* Review pricing strategies in low-profit regions.
* Reassess discount policies to protect profit margins.
* Strengthen loyalty programs for high-value customers.
* Develop targeted campaigns to increase engagement among regular and low-value customers.
* Align inventory planning and marketing activities with seasonal demand.
* Continuously monitor business performance using KPI dashboards and time-series analysis.

---

# 📁 Repository Structure

```text
SQL-Superstore-Analytics/
│
├── data/
│   └── Sample-Superstore.csv
│
├── database/
│   ├── superstore.db
│   ├── create_tables.sql
│   └── insert_data.py
│
├── sql_queries/
│   ├── 01_kpis.sql
│   ├── 02_regional_analysis.sql
│   ├── 03_product_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_customer_segmentation.sql
│   ├── 06_discount_analysis.sql
│   ├── 07_pareto_analysis.sql
│   ├── 08_monthly_sales.sql
│   ├── 09_yoy_growth.sql
│   ├── 10_moving_average.sql
│   └── 11_seasonality.sql
│
├── images/
│   ├── er_diagram.png
│   ├── kpi_results.png
│   ├── regional_analysis.png
│   ├── customer_segmentation.png
│   └── seasonality.png
│
├── report/
│   └── Executive_Summary.pdf
│
└── README.md
```

---

# 🎯 Skills Demonstrated

### SQL

* SELECT
* WHERE
* GROUP BY
* HAVING
* JOINs
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* LAG()
* LEAD()
* NTILE()
* CASE Statements

### Database Design

* Relational Database Modeling
* Primary Keys
* Foreign Keys
* Database Normalization (1NF, 2NF, 3NF)

### Data Analytics

* KPI Reporting
* Customer Segmentation
* Pareto Analysis
* Profitability Analysis
* Time-Series Analysis
* Moving Averages
* Seasonality Analysis
* Business Intelligence
* Executive Reporting

---

# 🚀 Future Improvements

Future enhancements for this project include:

* Interactive Power BI dashboard
* Predictive sales forecasting
* PostgreSQL implementation
* Automated ETL pipeline using Python
* Dashboard deployment using Streamlit

---

# 👨‍💻 Author

**Felix Ochieng'**

Aspiring Data Analyst | Data Scientist

Passionate about transforming raw data into actionable business insights through SQL, Python, and Business Intelligence.
