CREATE DATABASE Sales_Analytics;
USE Sales_Analytics;
SHOW TABLES;
RENAME TABLE `customer data_ sales analytics` TO Customer;
ALTER TABLE `sales data _ sales analytics` RENAME TO Sales;
SHOW TABLES;

SELECT * FROM Customer;
SELECT * FROM sales;

-- Total Sales Per City
SELECT c.City,
SUM(s.Amount) AS TotalSales 
FROM Customer c 
JOIN Sales s 
ON c.CustomerID= s.CustomerID
GROUP BY c.City;

-- Top 3 Customers by Total Sales
SELECT 
c.CustomerID,
c.CustomerName,
SUM(s.Amount) AS TotalSales 
FROM Customer c 
JOIN Sales s 
ON c.CustomerID= s.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSales DESC
LIMIT 3;

ALTER TABLE Sales 
ADD COLUMN SaleMonth VARCHAR(20);

SELECT * FROM Sales;

DESCRIBE Sales;

UPDATE Sales
SET SaleDate = STR_TO_DATE(SaleDate, '%d-%m-%Y');

ALTER TABLE Sales
MODIFY COLUMN SaleDate DATE;

UPDATE Sales
SET SaleMonth = MONTH(SaleDate);

UPDATE Sales
SET SaleMonth = MONTHNAME(SaleDate);

SELECT * FROM Sales;

-- Monthly Sales
SELECT SaleMonth,
SUM(Amount) AS TotalSales
FROM Sales 
GROUP BY 1;

DESCRIBE Customer;


-- Customers who haven't made any purchase
SELECT c.CustomerID,
c.CustomerName,
s.Amount
FROM Customer c 
LEFT JOIN Sales s 
ON c.CustomerID = s.CustomerID
WHERE Amount IS NULL;

-- Average Age of Customers per City
SELECT City,
ROUND(AVG(Age),2) AS AverageAge
FROM Customer
GROUP BY City;



