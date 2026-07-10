-- ==========================================================
-- Retail Sales Business Analysis
-- Database Setup
-- ==========================================================

CREATE DATABASE RetailSalesDB;
GO

USE RetailSalesDB;
GO

CREATE TABLE RetailSales (
    Row_ID INT,
    Order_ID NVARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode NVARCHAR(50),
    Customer_ID NVARCHAR(30),
    Customer_Name NVARCHAR(100),
    Segment NVARCHAR(50),
    Country NVARCHAR(100),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Postal_Code INT,
    Region NVARCHAR(50),
    Product_ID NVARCHAR(50),
    Category NVARCHAR(50),
    Sub_Category NVARCHAR(50),
    Product_Name NVARCHAR(500),
    Sales DECIMAL(18,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(18,2),
    [Year] INT
);
GO