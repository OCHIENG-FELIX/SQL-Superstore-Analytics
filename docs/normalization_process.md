# Database Normalization Process

## Objective

Transform the original transactional dataset into a normalized relational database.

## Normalization Steps

### First Normal Form (1NF)

* Removed repeating groups.
* Ensured atomic values.

### Second Normal Form (2NF)

* Eliminated partial dependencies.
* Separated Customers, Products, Locations, Orders, and Order Details.

### Third Normal Form (3NF)

* Removed transitive dependencies.
* Introduced surrogate keys where appropriate.
* Created foreign key relationships.

The final database consists of five related tables that minimize redundancy and improve data integrity.
