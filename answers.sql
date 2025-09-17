
-- Question 1: Achieving 1NF (First Normal Form)
-- =========================================================

SELECT 
    OrderID,
    CustomerName,
    TRIM(product) AS Product
FROM ProductDetail
JOIN JSON_TABLE(
    CONCAT('["', REPLACE(Products, ',', '","'), '"]'),
    "$[*]" COLUMNS(product VARCHAR(100) PATH "$")
) AS p;
-- ✅ This query transforms the data into 1NF:
-- Each (OrderID, CustomerName, Product) is now one row.



-- Question 2: Achieving 2NF (Second Normal Form)
-- =========================================================
-- Step 1: Orders table (OrderID → CustomerName)
-- Each order is stored once, removing redundancy.

SELECT DISTINCT 
    OrderID, 
    CustomerName
FROM OrderDetails_Assignment;


-- Step 2: OrderProducts table (OrderID + Product → Quantity)
-- Each product belonging to an order is stored with its quantity.
SELECT 
    OrderID, 
    Product, 
    Quantity
FROM OrderDetails_Assignment;

-- ✅ Together, these two queries represent the 2NF design:

