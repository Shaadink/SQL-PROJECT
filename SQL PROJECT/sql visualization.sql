SELECT SUM(TotalPrice) AS total_revenue
FROM order_items4;


SELECT COUNT(*) AS total_orders
FROM orders4;

SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM customers4;

SELECT p.Product, SUM(oi.Quantity) AS total_units_sold
FROM order_items4 oi
JOIN products4 p ON oi.ProductID = p.ProductID
GROUP BY p.Product
ORDER BY total_units_sold DESC
LIMIT 5;

SELECT p.Product, SUM(oi.TotalPrice) AS revenue
FROM order_items4 oi
JOIN products4 p ON oi.ProductID = p.ProductID
GROUP BY p.Product
ORDER BY revenue DESC
LIMIT 5;


SELECT c.Name, SUM(oi.TotalPrice) AS total_spent
FROM customers4 c
JOIN orders4 o ON c.CustomerID = o.CustomerID
JOIN order_items4 oi ON o.OrderID = oi.OrderID
GROUP BY c.Name
ORDER BY total_spent DESC
LIMIT 5;



SELECT c.Country, SUM(oi.TotalPrice) AS revenue
FROM customers4 c
JOIN orders4 o ON c.CustomerID = o.CustomerID
JOIN order_items4 oi ON o.OrderID = oi.OrderID
GROUP BY c.Country
ORDER BY revenue DESC;


SELECT c.Gender, SUM(oi.TotalPrice) AS revenue
FROM customers4 c
JOIN orders4 o ON c.CustomerID = o.CustomerID
JOIN order_items4 oi ON o.OrderID = oi.OrderID
GROUP BY c.Gender;



SELECT o.PaymentMethod, SUM(oi.TotalPrice) AS revenue
FROM orders4 o
JOIN order_items4 oi ON o.OrderID = oi.OrderID
GROUP BY o.PaymentMethod
ORDER BY revenue DESC;



SELECT o.CampaignSource, SUM(oi.TotalPrice) AS revenue
FROM orders4 o
JOIN order_items4 oi ON o.OrderID = oi.OrderID
GROUP BY o.CampaignSource
ORDER BY revenue DESC;


SELECT DATE_TRUNC('month', o.OrderDate) AS month, 
       SUM(oi.TotalPrice) AS revenue
FROM orders4 o
JOIN order_items4 oi ON o.OrderID = oi.OrderID
GROUP BY month
ORDER BY month;



SELECT o.OrderDate, COUNT(*) AS total_orders
FROM orders4 o
GROUP BY o.OrderDate
ORDER BY o.OrderDate;

SELECT DISTINCT
  paymentmethod,
  ROUND(AVG(discount) OVER (PARTITION BY paymentmethod), 2) AS avg_discount
FROM orders4 o
JOIN order_items4 oi ON o.orderid = oi.orderid;




CREATE OR REPLACE VIEW v_monthly_growth AS
WITH monthly_revenue AS (
  SELECT 
    DATE_TRUNC('month', o.orderdate) AS month,
    SUM(oi.totalprice) AS revenue
  FROM orders4 o
  JOIN order_items4 oi ON o.orderid = oi.orderid
  GROUP BY month
)
SELECT 
  month,
  revenue,
  LAG(revenue) OVER (ORDER BY month) AS prev_month,
  ROUND(((revenue - LAG(revenue) OVER (ORDER BY month)) / 
         NULLIF(LAG(revenue) OVER (ORDER BY month), 0)) * 100, 2) AS growth_percent
FROM monthly_revenue;


select*from v_monthly_growth;





create or replace view time_btw_orders as
WITH customer_orders AS (
  SELECT 
    customerid,
    orderdate,
    LAG(orderdate) OVER (PARTITION BY customerid ORDER BY orderdate) AS previous_order
  FROM orders4
),
order_gaps AS (
  SELECT orderdate - previous_order AS days_between
  FROM customer_orders
  WHERE previous_order IS NOT NULL
)
SELECT ROUND(AVG(days_between), 2) AS overall_avg_days_between_orders
FROM order_gaps;


select* from time_btw_orders;






CREATE OR REPLACE VIEW v_orders_by_country AS
SELECT 
  c.country,
  COUNT(DISTINCT o.orderid) AS total_orders
FROM customers4 c
JOIN orders4 o ON c.customerid = o.customerid
GROUP BY c.country;

select * from v_orders_by_country;














