-- Unlocking Revenue: Identifying Bottlenecks in Regional Sales Pipeline
-- MySQL 8.0. Table: RegionalSales2025. Dataset is generated sample data.
-- Import RegionalSales2025.csv and name the table regional_sales before running.

CREATE DATABASE IF NOT EXISTS regional_sales_db;
USE regional_sales_db;

-- If importing CSV into an existing table, use these column definitions:
CREATE TABLE IF NOT EXISTS regional_sales (
  OrderID VARCHAR(20) PRIMARY KEY,
  `Date` DATE,
  CustomerID VARCHAR(20),
  Region VARCHAR(20),
  ProductName VARCHAR(100),
  Category VARCHAR(100),
  Quantity INT,
  UnitPrice DECIMAL(12,2),
  TotalAmount DECIMAL(12,2),
  OrderStatus ENUM('Completed','Cancelled','Returned'),
  SalesAgent VARCHAR(100)
);

-- 1. Monthly trend of completed sales across all regions
SELECT DATE_FORMAT(`Date`, '%Y-%m') AS SalesMonth,
       SUM(TotalAmount) AS CompletedRevenue
FROM regional_sales
WHERE OrderStatus = 'Completed'
GROUP BY DATE_FORMAT(`Date`, '%Y-%m')
ORDER BY SalesMonth;

-- 2. Percentage of cancelled and returned orders per region
SELECT Region,
       COUNT(*) AS TotalOrders,
       ROUND(100.0 * SUM(OrderStatus='Cancelled') / COUNT(*), 2) AS CancelledPct,
       ROUND(100.0 * SUM(OrderStatus='Returned') / COUNT(*), 2) AS ReturnedPct
FROM regional_sales
GROUP BY Region
ORDER BY Region;

-- 3. Top 3 region/product combinations with most revenue loss
SELECT Region, ProductName, SUM(TotalAmount) AS RevenueLoss
FROM regional_sales
WHERE OrderStatus IN ('Cancelled','Returned')
GROUP BY Region, ProductName
ORDER BY RevenueLoss DESC
LIMIT 3;

-- 4. Average order value by product category
SELECT Category, ROUND(AVG(TotalAmount),2) AS AverageOrderValue
FROM regional_sales
GROUP BY Category
ORDER BY AverageOrderValue DESC;

-- 5. Top 5 sales agents by completed revenue
SELECT SalesAgent, SUM(TotalAmount) AS CompletedRevenue
FROM regional_sales
WHERE OrderStatus='Completed'
GROUP BY SalesAgent
ORDER BY CompletedRevenue DESC
LIMIT 5;

-- 6. Category-wise total sales and contribution to grand total
SELECT Category, SUM(TotalAmount) AS TotalSales,
       ROUND(100.0 * SUM(TotalAmount) / (SELECT SUM(TotalAmount) FROM regional_sales), 2) AS ContributionPct
FROM regional_sales
GROUP BY Category
ORDER BY TotalSales DESC;

-- 7. Customers with 3 or more returned orders
SELECT CustomerID, COUNT(*) AS ReturnCount
FROM regional_sales
WHERE OrderStatus='Returned'
GROUP BY CustomerID
HAVING COUNT(*) >= 3
ORDER BY ReturnCount DESC;

-- Dashboard support: region x category sales heatmap
SELECT Region, Category, SUM(TotalAmount) AS TotalSales
FROM regional_sales GROUP BY Region, Category ORDER BY Region, Category;

-- Dashboard support: order status by region
SELECT Region, OrderStatus, COUNT(*) AS OrderCount
FROM regional_sales GROUP BY Region, OrderStatus ORDER BY Region, OrderStatus;

-- KPI support
SELECT SUM(CASE WHEN OrderStatus='Completed' THEN TotalAmount ELSE 0 END) AS TotalCompletedSales,
       SUM(OrderStatus='Cancelled') AS TotalCancellations,
       AVG(TotalAmount) AS AverageOrderValue
FROM regional_sales;
