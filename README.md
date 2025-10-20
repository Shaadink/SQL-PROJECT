# E-commerce Customer Sales Analysis: Data Governance & BI

🎯 Project Goal

The primary goal of this project was to implement a complete data pipeline using SQL. This process started with transforming a large, messy e-commerce dataset into a highly structured, scalable data model, followed by performing deep analytical queries to generate actionable business insights for marketing, inventory, and strategic decision-making.

💾 About the Dataset

Source: E-commerce Customer Sales Data

Size: Approximately 30,000 Rows, 15 Columns

Key Fields: OrderID, CustomerID, Product, Category, TotalPrice, OrderDate, PaymentMethod, CampaignSource.

Initial State: The dataset contained common data quality issues, including missing values, format inconsistencies, and redundant data structures, requiring significant data governance efforts.

🧹 Data Cleaning & Normalization (3NF)

This section demonstrates core Data Governance skills, ensuring the resulting data model is reliable for Business Intelligence (BI) reporting.

Data Cleaning: Handled missing values (e.g., gender, prices), removed duplicates, and standardized categorical data formats (e.g., gender: 'f' to 'F').

Normalization (3NF): The flat, messy sales data was broken down and normalized into four distinct, related tables (Customers, Products, Orders, Order Items) to eliminate redundancy and protect data integrity.

ER Diagram: The Entity-Relationship (ER) Diagram within the project documentation (ECOMMERCE CUSTOMER...docx) visually confirms the structured Third Normal Form (3NF) relationships.

📈 SQL Visualization & Analysis

The sql visualization.sql file contains advanced analytical queries (designed to feed a BI tool like Power BI/Tableau) covering key business areas:

Overall Business Metrics: Total Revenue, Total Orders, Total Customers.

Product Performance: Top 5 Best-Selling Products by Quantity and Revenue (using JOINs).

Customer Behavior: Top 5 Customers by Spending and Average Days Between Orders (using advanced Window Functions like LAG()).

Marketing & Finance: Revenue by Payment Method, Campaign Performance, and Month-over-Month (MoM) Revenue Growth %.

💡 Key Insights & Recommendations

The analysis yielded the following strategic conclusions and recommendations for the business:

Customer Loyalty: Customers average a new order every 14.32 days.

Recommendation: Use this metric to optimize campaign timing, sending targeted offers 2-3 days prior to the expected repurchase window to boost customer retention.

Revenue Drivers: Fashion and Electronics are the highest-contributing categories.

Recommendation: Focus inventory and marketing efforts on these high-margin categories and explore upselling opportunities (e.g., offering phone cases with mobile phones).

Sales Trends: Sales show regular month-to-month volatility with strong growth in certain months (e.g., April 2025, Jan 2025).

Recommendation: Investigate the success factors of high-growth months and launch focused campaigns in historically slower months to stabilize the revenue stream.

View the full data cleaning steps, ER Diagram, and detailed recommendations in the accompanying document: ECOMMERCE CUSTOMER SALES ANALYSIS updated12 (1).docx
