# Database

## Overview

This folder contains the SQLite database used throughout the Superstore Sales Analytics project.

The normalized database was designed using Third Normal Form (3NF) principles to improve data integrity, eliminate redundancy, and simplify analytical reporting.

---

## Database Contents

* **superstore.db** – SQLite database
* **data_model.png** – Logical database model

---

## Database Design

The database consists of five related tables:

* Customers
* Products
* Locations
* Orders
* Order_Details

Relationships are enforced using Primary Keys and Foreign Keys to maintain referential integrity.

---

## Purpose

The normalized database supports:

* Executive KPI reporting
* Customer analytics
* Product performance analysis
* Regional sales analysis
* Time-series analysis
* Advanced SQL querying

The database serves as the foundation for all business analysis performed in this project.
