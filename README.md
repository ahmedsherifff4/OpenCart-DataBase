# OpenCart Database Management & Testing Project

This repository contains essential SQL scripts and quality assurance documentation for managing and testing an **OpenCart** database. It includes a comprehensive set of CRUD operations and automated-style test cases to ensure data integrity.

## Project Overview 📋

The project is structured into two main components:

1.  **Database Operations**: A collection of SQL queries for managing customers, groups, and store configurations.
2.  **Quality Assurance**: A detailed test plan covering over 200 database scenarios to verify the system's reliability.

## File Descriptions 📂

* **[opencart.sql](./opencart.sql)**:
    * Contains SQL queries for **CRUD** (Create, Read, Update, Delete) operations.
    * Covers tables such as `oc_customer`, `oc_customer_group`, `oc_address`, and more.
    * Includes scripts for testing integrity across various OpenCart extensions and banners.

* **[opencart_testcase.csv](https://github.com/ahmedsherifff4/OpenCart-DataBase/blob/e1fe12ce36aaa9f90883932ddb4810767bd91a51/opencart_testcase%20(1).xlsx)**:
    * A comprehensive testing suite containing **201 Test Cases**.
    * Includes: Test Case IDs, Objectives, SQL Queries, Expected Results, and Status.
    * Focuses on data validation, null field detection, and schema integrity.

## Quick Links 🔗

* **Official Platform**: [OpenCart Website](https://www.opencart.com/)
* **SQL Scripts**: [View opencart.sql](./opencart.sql)
* **Test Cases**: [View db_test_cases.csv](https://github.com/ahmedsherifff4/OpenCart-DataBase/blob/e1fe12ce36aaa9f90883932ddb4810767bd91a51/opencart_testcase%20(1).xlsx)

## How to Use 🚀

1.  **For Database Management**: Execute the queries in `opencart.sql` within your MySQL environment (e.g., phpMyAdmin) to manage customer data or verify table structures.
2.  **For Testing**: Follow the `opencart_testcase.csv` to run manual or automated checks against your database to ensure everything is functioning as expected.

