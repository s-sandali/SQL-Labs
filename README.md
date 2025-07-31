# SE2032 - Database Management Systems  
## Laboratory Worksheets Summary

This repository contains SQL scripts and solutions for four laboratory worksheets completed as part of the SE2032 Database Management Systems course. The exercises focus on the design, implementation, querying, and management of a supply chain database comprising suppliers, parts, projects, and shipments.

---

## Overview of Labs

### Lab 1: Table Creation and Data Population
- Created tables: Supplier (S), Part (P), Project (J), Shipment (SPJ).
- Defined appropriate table-level constraints for data integrity.
- Populated tables using `INSERT` statements with given data.
- Displayed table data using `SELECT` queries.
- Tested constraints by attempting invalid inserts and handling resulting errors.

---

### Lab 2: Table Modification and Advanced Queries
- Modified table schema:
  - Renamed columns (`cstatus` to `supstatus`, `pweight` to `partweight`).
  - Changed data types and added constraints (e.g., part weight limits).
- Performed complex queries involving:
  - Data formatting (weights in kg, salary formatting).
  - String manipulation (uppercase full names, custom text formats).
  - Date calculations (project durations, age calculation).
  - Aggregation and conditional filtering.

---

### Lab 3: Data Updates, Deletes, and Aggregations
- Wrote SQL `SELECT` queries to extract detailed project, supplier, and part information using joins and subqueries.
- Examples include:
  - Projects supplied by specific suppliers.
  - Supplier numbers with status comparisons.
  - Part numbers supplied between different cities.
  - Summations of shipment quantities per part.
  - Conditional updates (e.g., increase shipment quantities, change part colors).
- Performed deletes on projects with no shipments to maintain data integrity.

---

### Lab 4: Advanced Join and Subquery Practice
- Developed SQL statements to solve complex business logic problems, including:
  - Retrieving project and supplier relationships.
  - Conditional filtering based on supplier status or shipment details.
  - Multi-level aggregations and comparisons between projects and parts.
  - Updating and deleting data based on join conditions.
- Reinforced knowledge of join operations and subqueries through practical examples.

---

## Key Skills Demonstrated
- Database schema design with constraints and data integrity.
- Data manipulation with `INSERT`, `UPDATE`, and `DELETE`.
- Complex querying using joins, subqueries, aggregations, and string/date functions.
- Handling NULLs and enforcing business rules via constraints.
- Practical understanding of supply chain data relationships.

---

## Repository Contents
- SQL scripts for table creation, data insertion, updates, and advanced queries.
- Example data sets and output snapshots.
- Error logs demonstrating constraint enforcement and handling.

---

## Author
Prepared by Sandali Sandagomi for SE2032 Database Management Systems coursework.

---

## Notes
- This work reflects fundamental and intermediate SQL skills essential for database management.
- Refer to individual SQL scripts for detailed implementation and query syntax.

