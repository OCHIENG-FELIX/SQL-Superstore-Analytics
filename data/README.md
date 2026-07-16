# Data Folder

## Overview

This folder contains the dataset used in the **Superstore Sales Analytics Using SQL** project.

The dataset represents transactional sales records from a retail business and serves as the primary data source for database design, SQL analysis, and business intelligence reporting.

---

## Dataset Information

| Attribute    | Value                                 |
| ------------ | ------------------------------------- |
| Dataset Name | Sample Superstore                     |
| Records      | 9,994                                 |
| Columns      | 21                                    |
| Format       | CSV                                   |
| Encoding     | UTF-8 / Latin-1 (depending on source) |

---

## Dataset Description

The dataset contains historical sales transactions including:

* Order information
* Customer information
* Product information
* Sales revenue
* Quantity sold
* Discounts
* Profit
* Shipping information
* Geographic locations

---

## Purpose

This dataset is used to demonstrate an end-to-end SQL analytics workflow, including:

* Data profiling
* Database normalization (3NF)
* Relational database design
* SQL querying
* Customer segmentation
* Profitability analysis
* Time-series analysis
* Executive KPI reporting

---

## Data Preparation

Before loading the dataset into SQLite, the following preprocessing steps were performed:

* Converted **Order Date** to datetime format.
* Converted **Ship Date** to datetime format.
* Removed duplicate records while creating dimension tables.
* Normalized the transactional dataset into five relational tables:

  * Customers
  * Products
  * Locations
  * Orders
  * Order_Details

---

## Notes

The original dataset remains unchanged in this folder. All transformations and analysis are performed within the project workflow to preserve the raw data.

> **Note:** This dataset is intended for educational and portfolio purposes.
