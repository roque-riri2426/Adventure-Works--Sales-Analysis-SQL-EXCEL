/*
==================================================================
   AdventureWorks Sales Data - SQL Exploratory Data Analysis
   Author      : Riel Pascual Roque
   Tables Included:
       - AW_Sales_Order_Data : Order header & line references
       - AW_Sales_Data       : Fact table for sales transactions
       - AW_Reseller         : Reseller dimension data
       - AW_Product          : Product dimension data
       - AW_Customers        : Customer dimension data
       - AW_Date             : Date dimension data

   Queries Provided:
       - Preview Sales Data
       - Total Sales & Gross Profit
       - Total Customers
       - Total Orders
       - Average Order Value
       - Yearly Sales
       - Top 10 Customers by Sales
       - Sales by Month
       - Sales by Channel
       - Gross Profit by Year
       - Average Order Value by Year
*/
-- =========================
-- Sales Order Data
-- =========================
CREATE TABLE AW_Sales_Order_Data (
  Channel VARCHAR(100),
  SalesOrderLineKey INT,
  Sales_Order VARCHAR(100),
  Sales_Order_Line VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AW_Sales_Order_Data.csv'
INTO TABLE AW_Sales_Order_Data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =========================
-- Sales Data
-- =========================
CREATE TABLE AW_Sales_Data (
  SalesOrderLineKey INT,
  ResellerKey INT,
  CustomerKey INT,
  ProductKey INT,
  OrderDateKey INT,
  DueDateKey INT,
  ShipDateKey INT,
  SalesTerritoryKey INT,
  Order_Quantity INT,
  Unit_Price DECIMAL(10,2),
  Extended_Amount DECIMAL(10,2),
  Unit_Price_Discount_Pct INT,
  Product_Standard_Cost DECIMAL(10,2),
  Total_Product_Cost DECIMAL(10,2),
  Sales_Amount DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AW_Sales_Data.csv'
INTO TABLE AW_Sales_Data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================
-- Reseller Data
-- =========================
CREATE TABLE AW_Reseller (
  ResellerKey INT,
  Reseller_ID VARCHAR(100),
  Business_Type VARCHAR(100),
  Reseller_Name VARCHAR(100),
  City VARCHAR(100),
  State_Province VARCHAR(100),
  Country_Region VARCHAR(100),
  Postal_Code VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AW_Reseller.csv'
INTO TABLE AW_Reseller
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================
-- Product Data
-- =========================
CREATE TABLE AW_Product (
  ProductKey INT,
  SKU VARCHAR(100),
  Product_Name VARCHAR(100),
  Standard_Cost DECIMAL(10,2),
  Color VARCHAR(100),
  List_Price DECIMAL(10,2),
  Model VARCHAR(100),
  Subcategory VARCHAR(100),
  Category VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AW_Product.csv'
INTO TABLE AW_Product
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================
-- Customers
-- =========================
CREATE TABLE AW_Customers (
  CustomerKey INT,
  Customer_ID VARCHAR(100),
  Customer_Name VARCHAR(100),
  City VARCHAR(100),
  State_Province VARCHAR(100),
  Country_Region VARCHAR(100),
  Postal_Code VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AW_Customer.csv'
INTO TABLE AW_Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================
-- Date Dimension
-- =========================
CREATE TABLE AW_Date (
  DateKey INT,
  Date DATE,
  Fiscal_Year VARCHAR(100),
  Fiscal_Quarter VARCHAR(100),
  Month VARCHAR(100),
  Full_Date VARCHAR(100),
  MonthKey INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/date.csv'
INTO TABLE AW_Date
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================
-- ANALYSIS QUERIES
-- =========================

-- Preview sales data
SELECT * FROM AW_Sales_Data LIMIT 10;

-- Total Sales & Gross Profit
SELECT 
  SUM(Sales_Amount) AS Total_Sales, 
  SUM(Sales_Amount - Total_Product_Cost) AS Gross_Profit
FROM AW_Sales_Data;

-- Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM AW_Customers;

-- Total Orders
SELECT COUNT(DISTINCT Sales_Order) AS Total_Orders
FROM AW_Sales_Order_Data;

-- Average Order Value
WITH Totals AS (
  SELECT 
    (SELECT SUM(Sales_Amount) FROM AW_Sales_Data) AS Total_Sales,
    (SELECT COUNT(DISTINCT Sales_Order) FROM AW_Sales_Order_Data) AS Total_Orders
)
SELECT 
  (Total_Sales / Total_Orders) AS Average_Order_Value
FROM Totals;

-- Yearly Sales
WITH date_year AS (
  SELECT 
    DateKey, 
    CAST(SUBSTRING_INDEX(Month, ' ', 1) AS UNSIGNED) AS Year
  FROM AW_Date
)
SELECT 
  dy.Year,
  SUM(sd.Sales_Amount) AS Total_Sales
FROM AW_Sales_Data sd
INNER JOIN date_year dy ON sd.OrderDateKey = dy.DateKey
GROUP BY dy.Year;

-- Top 10 Customers by Sales
SELECT 
  c.Customer_Name, 
  SUM(sd.Sales_Amount) AS Total_Sales
FROM AW_Sales_Data sd
INNER JOIN AW_Customers c ON sd.CustomerKey = c.CustomerKey
WHERE c.Customer_Name <> '[Not Applicable]'
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Sales by Month
SELECT 
  d.Month, 
  SUM(sd.Sales_Amount) AS Total_Sales
FROM AW_Sales_Data sd
INNER JOIN AW_Date d ON sd.OrderDateKey = d.DateKey
GROUP BY d.Month
ORDER BY Total_Sales DESC;

-- Sales by Channel
SELECT 
  so.Channel, 
  SUM(sd.Sales_Amount) AS Total_Sales
FROM AW_Sales_Data sd
INNER JOIN AW_Sales_Order_Data so ON sd.SalesOrderLineKey = so.SalesOrderLineKey
GROUP BY so.Channel
ORDER BY Total_Sales DESC;

-- Gross Profit by Year
WITH gross_year AS (
  SELECT 
    DateKey, 
    CAST(SUBSTRING_INDEX(Month, ' ', 1) AS UNSIGNED) AS Year
  FROM AW_Date
)
SELECT 
  gy.Year,
  SUM(sd.Sales_Amount - sd.Total_Product_Cost) AS Gross_Profit
FROM AW_Sales_Data sd
INNER JOIN gross_year gy ON sd.OrderDateKey = gy.DateKey
GROUP BY gy.Year;

-- Average Order Value by Year
WITH date_year AS (
  SELECT 
    DateKey,
    CAST(SUBSTRING_INDEX(Month, ' ', 1) AS UNSIGNED) AS Year
  FROM AW_Date
)
SELECT 
  dy.Year,
  ROUND(SUM(sd.Sales_Amount) / COUNT(DISTINCT so.Sales_Order)) AS Avg_Order_Value
FROM AW_Sales_Data sd
JOIN AW_Sales_Order_Data so ON sd.SalesOrderLineKey = so.SalesOrderLineKey
JOIN date_year dy ON sd.OrderDateKey = dy.DateKey
GROUP BY dy.Year;
