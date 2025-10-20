#  E-commerce Customer Sales Analysis: Data Governance & BI

---

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
- `Order_Items`

- -- STEP 1: Create Normalized Tables

-- Customers Table
CREATE TABLE customers4 (
    CustomerID VARCHAR PRIMARY KEY,
    Name VARCHAR,
    Gender VARCHAR,
    Email VARCHAR,
    Country VARCHAR
);

-- Products Table
CREATE TABLE products4 (
    ProductID SERIAL PRIMARY KEY,
    Product VARCHAR,
    Category VARCHAR,
    UnitPrice DECIMAL(10, 2),
    UNIQUE(Product, Category, UnitPrice)
);

-- Orders Table
CREATE TABLE orders4 (
    OrderID VARCHAR PRIMARY KEY,
    CustomerID VARCHAR REFERENCES customers4(CustomerID),
    OrderDate DATE,
    PaymentMethod VARCHAR,
    CampaignSource VARCHAR
);

-- Order Items Table
CREATE TABLE order_items4 (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID VARCHAR REFERENCES orders4(OrderID),
    ProductID INT REFERENCES products4(ProductID),
    Quantity INT,
    Discount DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2)
);

-- STEP 2: Insert Unique Data into Tables

-- Insert into Customers Table (latest entry per CustomerID)
INSERT INTO customers4 (CustomerID, Name, Gender, Email, Country)
SELECT DISTINCT ON (CustomerID)
    CustomerID, Name, Gender, Email, Country
FROM raw_sales
ORDER BY CustomerID, OrderDate DESC;

-- Insert into Products Table
INSERT INTO products4 (Product, Category, UnitPrice)
SELECT DISTINCT ON (Product, Category, UnitPrice)
    Product, Category, UnitPrice
FROM raw_sales
ORDER BY Product, Category, UnitPrice;

-- Insert into Orders Table (only those whose CustomerID exists)
INSERT INTO orders4 (OrderID, CustomerID, OrderDate, PaymentMethod, CampaignSource)
SELECT DISTINCT OrderID, CustomerID, OrderDate, PaymentMethod, CampaignSource
FROM raw_sales
WHERE CustomerID IN (SELECT CustomerID FROM customers4)
  AND OrderID NOT IN (SELECT OrderID FROM orders4);

-- Insert into Order Items Table using JOIN with products
INSERT INTO order_items4 (OrderID, ProductID, Quantity, Discount, TotalPrice)
SELECT 
    r.OrderID,
    p.ProductID,
    r.Quantity,
    r.Discount,
    r.TotalPrice
FROM raw_sales r
JOIN products4 p
  ON r.Product = p.Product
  AND r.Category = p.Category
  AND r.UnitPrice = p.UnitPrice;



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




