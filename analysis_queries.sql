CREATE DATABASE ecommerce_project;
USE ecommerce_project;
SHOW TABLES;
RENAME TABLE cleaned_orders TO orders;

#View Data
SHOW TABLES;
SELECT * FROM orders LIMIT 5;
SELECT * FROM orders;

#Total Sales
SELECT SUM(Total_Sales) AS Total_Revenue
FROM orders;

#Total Orders
SELECT COUNT(Order_ID) AS Total_Orders
FROM orders;

#Top 5 Customers
SELECT Customer_ID, SUM(Total_Sales) AS Total_Spending
FROM orders
GROUP BY Customer_ID
ORDER BY Total_Spending DESC
LIMIT 5;

SHOW TABLES;
RENAME TABLE cleaned_customers TO customers;
RENAME TABLE cleaned_products TO products;
SHOW TABLES;

#Sales by Category
SELECT p.Category, SUM(o.Total_Sales) AS Total_Sales
FROM orders o
JOIN products p 
ON o.Product_ID = p.Product_ID
GROUP BY p.Category;

#Orders by Status
SELECT Order_Status, COUNT(*) AS Total
FROM orders
GROUP BY Order_Status;

#Monthly Sales
SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Total_Sales) AS Revenue
FROM orders
GROUP BY Month
ORDER BY Month;

#Top Products
SELECT Product_ID, SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Product_ID
ORDER BY Total_Quantity DESC
LIMIT 5;

#TOP Customers SPENDING
SELECT c.Customer_Name, SUM(o.Total_Sales) AS Total_Spending
FROM orders o
JOIN customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Spending DESC
LIMIT 5;

#Average Order Value
SELECT AVG(Total_Sales) AS Avg_Order_Value
FROM orders;

#Payment Mode Analysis
SELECT Payment_Mode, COUNT(*) AS Total_Orders
FROM orders
GROUP BY Payment_Mode;
