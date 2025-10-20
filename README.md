# E-commerce Customer Sales Analysis

## Project Goal

The primary goal of this project was to implement a complete data pipeline using SQL. This process started with transforming a large, messy e-commerce dataset into a highly structured, scalable data model, followed by performing deep analytical queries to generate actionable business insights for marketing, inventory, and strategic decision-making.


## Repository Contents

# 🛒 E-Commerce Customer Analysis Project

## 📂 Project Files Overview

| File Name | Description | Purpose |
|------------|-------------|----------|
| **ECOMMERCE_CUSTOMER_PROJECT.docx** | **Project Documentation:** Contains the problem statement, detailed data cleaning steps, the Entity-Relationship (ER) Diagram, and the final business recommendations. | Showcases documentation and data storytelling skills. |
| **ecommerce_customer_dirty.csv** | **Raw Data:** The initial dataset before any cleaning or transformation. | Demonstrates initial handling of messy data. |
| **sql_normalization.sql** | **Data Governance Code:** SQL script for cleaning the raw data and building the normalized 3NF schema (`Customers`, `Products`, `Orders`, `Order_Items` tables). | Proves competency in scalable data architecture. |
| **sql_visualization.sql** | **Analytical Code:** SQL script containing all complex queries used to generate the final business metrics and insights for BI tool integration. | Proves advanced analytical querying skills. |

---

## 🧠 Project Summary

This project focuses on transforming raw e-commerce customer data into meaningful insights.  
It demonstrates the complete data analysis lifecycle — from **data cleaning** and **database normalization** to **SQL-based analytics** and **business intelligence reporting**.

### Key Highlights
- 📊 **Data Cleaning & Transformation** using SQL.
- 🗄️ **Database Design** following 3NF normalization.
- 📈 **Advanced Analytical Queries** for KPIs and trend analysis.
- 💡 **Actionable Business Recommendations** backed by data.

---

## 🛠️ Tech Stack

- **SQL (MySQL / PostgreSQL)** – Data cleaning, normalization, and analytics  
- **Excel / Power BI** – Visualization and reporting  
- **MS Word / Docs** – Documentation and storytelling

---

## 🚀 How to Use

1. Open `ecommerce_customer_dirty.csv` to explore the raw dataset.  
2. Run `sql_normalization.sql` to create and populate the normalized schema.  
3. Execute queries in `sql_visualization.sql` to generate analytical metrics.  
4. Review `ECOMMERCE_CUSTOMER_PROJECT.docx` for project documentation and insights.

---

## 🏁 Outcome

- Built a **scalable database model** for e-commerce data.  
- Extracted **key business metrics** (customer lifetime value, product performance, repeat rate, etc.).  
- Delivered **data-driven recommendations** to improve customer retention and sales efficiency.

---

📌 *This project demonstrates end-to-end SQL-driven data analysis and documentation for business intelligence.*


## About the Dataset

Source: E-commerce Customer Sales Data

Size: Approximately 30,000 Rows, 15 Columns

Key Fields: OrderID, CustomerID, Product, Category, TotalPrice, OrderDate, PaymentMethod, CampaignSource.

Initial State: The dataset contained common data quality issues, including missing values, format inconsistencies, and redundant data structures, requiring significant data governance efforts.

## Data Cleaning & Normalization (3NF)

This section demonstrates core Data Governance skills, ensuring the resulting data model is reliable for Business Intelligence (BI) reporting.

Data Cleaning: Handled missing values (e.g., gender, prices), removed duplicates, and standardized categorical data formats (e.g., gender: 'f' to 'F').

Normalization (3NF): The flat, messy sales data was broken down and normalized into four distinct, related tables (Customers, Products, Orders, Order Items) to eliminate redundancy and protect data integrity.

ER Diagram: The Entity-Relationship (ER) Diagram within the project documentation (ECOMMERCE CUSTOMER...docx) visually confirms the structured Third Normal Form (3NF) relationships.

## SQL Visualization & Analysis

The sql visualization.sql file contains advanced analytical queries (designed to feed a BI tool like Power BI/Tableau) covering key business areas:

Overall Business Metrics: Total Revenue, Total Orders, Total Customers.

Product Performance: Top 5 Best-Selling Products by Quantity and Revenue (using JOINs).

Customer Behavior: Top 5 Customers by Spending and Average Days Between Orders (using advanced Window Functions like LAG()).

Marketing & Finance: Revenue by Payment Method, Campaign Performance, and Month-over-Month (MoM) Revenue Growth %.

## Key Insights & Recommendations

The analysis yielded the following strategic conclusions and recommendations for the business:

Customer Loyalty: Customers average a new order every 14.32 days.

Recommendation: Use this metric to optimize campaign timing, sending targeted offers 2-3 days prior to the expected repurchase window to boost customer retention.

Revenue Drivers: Fashion and Electronics are the highest-contributing categories.

Recommendation: Focus inventory and marketing efforts on these high-margin categories and explore upselling opportunities (e.g., offering phone cases with mobile phones).

Sales Trends: Sales show regular month-to-month volatility with strong growth in certain months (e.g., April 2025, Jan 2025).

Recommendation: Investigate the success factors of high-growth months and launch focused campaigns in historically slower months to stabilize the revenue stream.

View the full data cleaning steps, ER Diagram, and detailed recommendations in the accompanying document: ECOMMERCE CUSTOMER SALES ANALYSIS updated12 (1).docx
