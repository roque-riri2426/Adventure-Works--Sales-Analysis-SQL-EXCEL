/*
AdventureWorks Sales Analysis Insights
--------------------------------------
1. Monthly Sales Trend:
   Sales show noticeable peaks around February, May, August, September, and November,
   possibly linked to seasonal buying patterns or promotional campaigns.

2. Top 5 Customers:
   The top customers each contributed relatively small amounts compared to the total
   $109.8M in sales over four years. This suggests no single retail customer dominates
   revenue, aligning with the reseller-focused model where bulk sales are concentrated
   among business accounts.

3. Top 5 Models:
   The top bike models dominate sales, highlighting a strong product concentration in
   the high-end and mid-range categories. This reinforces the company's position as a
   premium bike brand, with these models driving much of the revenue.
*/

-- Example SQL to retrieve total sales
SELECT 
    ROUND(SUM(LineTotal), 2) AS Total_Sales
FROM AW_Sales_Data;

-- Example SQL to retrieve monthly sales trend
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    ROUND(SUM(LineTotal), 2) AS Monthly_Sales
FROM AW_Sales_Data
GROUP BY Month
ORDER BY Month;

-- Example SQL to retrieve top 5 customers by sales
SELECT 
    c.CustomerID,
    c.CustomerName,
    ROUND(SUM(s.LineTotal), 2) AS Total_Sales
FROM AW_Sales_Data s
JOIN AW_Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY Total_Sales DESC
LIMIT 5;

-- Example SQL to retrieve top 5 models by sales
SELECT 
    p.ProductID,
    p.ProductName,
    ROUND(SUM(s.LineTotal), 2) AS Total_Sales
FROM AW_Sales_Data s
JOIN AW_Product p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Sales DESC
LIMIT 5;
