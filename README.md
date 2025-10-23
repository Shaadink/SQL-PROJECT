#  E-commerce Customer Sales Analysis
<p align="center">
  <h1 align="center"></h1>
  <img src="https://github.com/Shaadink/SQL-PROJECT/blob/main/ecommerce%20background.jpg"/>
</p>

##  Project Goal

The primary goal of this project was to implement a **complete data pipeline using SQL**.  
This process started with transforming a large, messy e-commerce dataset into a **highly structured, scalable data model**, followed by performing **deep analytical queries** to generate actionable business insights for **marketing, inventory, and strategic decision-making**.

---

##  About the Dataset

- **Source:** E-commerce Customer Sales Data  
- **Size:** Approximately 30,000 Rows, 15 Columns  
- **Key Fields:** `OrderID`, `CustomerID`, `Product`, `Category`, `TotalPrice`, `OrderDate`, `PaymentMethod`, `CampaignSource`  
- **Initial State:** The dataset contained common data quality issues, including missing values, format inconsistencies, and redundant structures — requiring significant **data governance** efforts.

---

##  Data Cleaning & Normalization (3NF)

This section demonstrates core **Data Governance** and **Database Design** skills to ensure the resulting data model is reliable for **Business Intelligence (BI)** reporting.

###  Data Cleaning  
- Handled missing values (e.g., gender, prices)  
- Removed duplicates  
- Standardized categorical data formats (e.g., `'f' → 'F'`)  
- Fixed corrupted `TotalPrice` values  

###  Normalization (3NF)
The flat, messy sales data was **normalized into four relational tables** to eliminate redundancy and preserve data integrity:  
- `Customers`  
- `Products`  
- `Orders`  
- `Order_Items

###  ER Diagram  
The **Entity-Relationship (ER) Diagram** (available in `ECOMMERCE CUSTOMER SALES ANALYSIS updated12 (1).docx`) visually confirms the **Third Normal Form (3NF)** relationships between tables.

---

##  SQL Visualization & Analysis

The file **`sql visualization.sql`** contains **advanced analytical SQL queries**, designed to feed a BI tool like **Power BI** or **Tableau**, covering key business areas:

| Analysis Area | KPI Examples | Techniques Used |
|----------------|--------------|-----------------|
| **Overall Business Metrics** | Total Revenue, Total Orders, Total Customers | Aggregate Functions |
| **Product Performance** | Top 5 Best-Selling Products by Quantity and Revenue | JOINs, GROUP BY |
| **Customer Behavior** | Top 5 Customers by Spending, Avg Days Between Orders | Window Functions (`LAG()`, `OVER()`) |
| **Marketing & Finance** | Revenue by Payment Method, Campaign Performance, MoM Revenue Growth % | CTEs, Subqueries |

---

##  Key Insights & Recommendations

###  Customer Loyalty
- **Insight:** Customers place new orders every **14.32 days** on average.  
- **Recommendation:** Use this to optimize campaign timing — send targeted offers **2–3 days before** the expected repurchase window to boost retention.

###  Revenue Drivers
- **Insight:** **Fashion** and **Electronics** are top-contributing categories.  
- **Recommendation:** Focus marketing and inventory on these high-margin areas; introduce **bundled offers** (e.g., phone cases with phones).

###  Sales Trends
- **Insight:** Sales show month-to-month volatility with peaks in **April 2025** and **January 2025**.  
- **Recommendation:** Study success factors from high-growth months and run **targeted promotions** in low-performing periods to stabilize revenue.

---

##  Repository Contents (The Data Pipeline)

| File Name | Description | Purpose |
|------------|-------------|----------|
| **https://github.com/Shaadink/SQL-PROJECT/blob/main/SQL%20PROJECT%20FINAL/ECOMMERCE%20CUSTOMER%20SALES%20ANALYSIS%20updated12.docx** | Project documentation containing the problem statement, detailed cleaning steps, ER Diagram, and business recommendations. | Showcases documentation and storytelling skills. |
| **https://github.com/Shaadink/SQL-PROJECT/blob/main/SQL%20PROJECT%20FINAL/ecommerce_customer_sales_dirty.csv** | Raw dataset before cleaning and transformation. | Demonstrates handling of messy data. |
| **https://github.com/Shaadink/SQL-PROJECT/blob/main/SQL%20PROJECT%20FINAL/sql%20normalization.sql** | SQL script for cleaning raw data and building the **normalized 3NF schema** (`Customers`, `Products`, `Orders`, `Order_Items`). | Proves scalable data architecture design skills. |
| **https://github.com/Shaadink/SQL-PROJECT/blob/main/SQL%20PROJECT%20FINAL/sql%20visualization.sql** | Analytical SQL queries for generating **business metrics and BI insights**. | Demonstrates advanced SQL analytical skills. |

---

##  How to Explore

1. **View Raw Data:** `ecommerce_customer_sales_dirty.csv`  
2. **Run Normalization Script:** Execute `sql normalization.sql` to create database tables.  
3. **Run Analysis Queries:** Execute `sql visualization.sql` for key business metrics.  
4. **Refer to Documentation:** Open `ECOMMERCE CUSTOMER SALES ANALYSIS updated12 (1).docx` for the full explanation, ER diagram, and insights.

---

##  Tech Stack

- **SQL (MySQL / PostgreSQL)** – Data cleaning, normalization, analytics    
- **Excel / Power Query** – Preprocessing and data validation  
- **MS Word / Docs** – Project documentation  




