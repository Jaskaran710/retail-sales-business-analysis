-- ==========================================================
-- Retail Sales Business Analysis
-- Business Analysis Queries
-- ==========================================================

USE RetailSalesDB;
GO
-- ==========================================================
-- Q1. Total Sales, Total Profit and Total Orders
-- ==========================================================

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM RetailSales;
-- ==========================================================
-- Q2. Total Unique Customers
-- ==========================================================

SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM RetailSales;
-- ==========================================================
-- Q3. Sales by Category
-- ==========================================================

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Category
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q4. Profit by Category
-- ==========================================================

SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY Category
ORDER BY Total_Profit DESC;
-- ==========================================================
-- Q5. Sales by Region
-- ==========================================================

SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Region
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q6. Top 10 Products by Sales
-- ==========================================================

SELECT TOP 10
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Product_Name
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q7. Top 10 Customers by Sales
-- ==========================================================

SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q8. Sales by Customer Segment
-- ==========================================================

SELECT
    Segment,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Segment
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q9. Sales by Ship Mode
-- ==========================================================

SELECT
    Ship_Mode,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q10. Monthly Sales Trend
-- ==========================================================

SELECT
    YEAR(Order_Date) AS Sales_Year,
    MONTH(Order_Date) AS Sales_Month,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Sales_Year, Sales_Month;
-- ==========================================================
-- Q11. Top 10 Most Profitable Products
-- ==========================================================

SELECT TOP 10
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY Product_Name
ORDER BY Total_Profit DESC;
-- ==========================================================
-- Q12. Top 10 Loss-Making Products
-- ==========================================================

SELECT TOP 10
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY Product_Name
ORDER BY Total_Profit ASC;
-- ==========================================================
-- Q13. Average Discount by Category
-- ==========================================================

SELECT
    Category,
    AVG(Discount) AS Average_Discount
FROM RetailSales
GROUP BY Category
ORDER BY Average_Discount DESC;
-- ==========================================================
-- Q14. Rank Products by Sales
-- ==========================================================

SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER(ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM RetailSales
GROUP BY Product_Name;
-- ==========================================================
-- Q15. Top Customer in Each Region
-- ==========================================================

WITH CustomerSales AS
(
    SELECT
        Region,
        Customer_Name,
        SUM(Sales) AS Total_Sales,
        RANK() OVER(
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS Sales_Rank
    FROM RetailSales
    GROUP BY Region, Customer_Name
)

SELECT *
FROM CustomerSales
WHERE Sales_Rank = 1;
-- ==========================================================
-- Q16. Sales by State
-- ==========================================================

SELECT
    State,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY State
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q17. Profit by State
-- ==========================================================

SELECT
    State,
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY State
ORDER BY Total_Profit DESC;
-- ==========================================================
-- Q18. Sales by Sub-Category
-- ==========================================================

SELECT
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q19. Profit by Sub-Category
-- ==========================================================

SELECT
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;
-- ==========================================================
-- Q20. Average Order Value
-- ==========================================================

SELECT
    AVG(Sales) AS Average_Order_Value
FROM RetailSales;
-- ==========================================================
-- Q21. Total Sales by Year
-- ==========================================================

SELECT
    [Year],
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY [Year]
ORDER BY [Year];
-- ==========================================================
-- Q22. Total Profit by Year
-- ==========================================================

SELECT
    [Year],
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY [Year]
ORDER BY [Year];
-- ==========================================================
-- Q23. Top 5 Cities by Sales
-- ==========================================================

SELECT TOP 5
    City,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY City
ORDER BY Total_Sales DESC;
-- ==========================================================
-- Q24. Top 5 Cities by Profit
-- ==========================================================

SELECT TOP 5
    City,
    SUM(Profit) AS Total_Profit
FROM RetailSales
GROUP BY City
ORDER BY Total_Profit DESC;
-- ==========================================================
-- Q25. Discount Impact on Profit
-- ==========================================================

SELECT
    Discount,
    AVG(Profit) AS Average_Profit,
    SUM(Sales) AS Total_Sales
FROM RetailSales
GROUP BY Discount
ORDER BY Discount;
