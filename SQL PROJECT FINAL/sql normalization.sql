-- STEP 1: Create Normalized Tables

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

















