USE EcommerceDB;
-- Query 1: Show all customers
SELECT * FROM Customers;

-- Query 2: Show all products
SELECT * FROM Products;

-- Query 3: Show all orders
SELECT * FROM Orders;

-- Query 4: Show only customer name
SELECT NAME FROM Customers;

-- Query 5: Show customer name and city
SELECT NAME,City FROM Customers;

-- Query 6: Show product name and price
SELECT ProductName,Price FROM Products;

-- Query 7: Show order id and quantity
SELECT OrderID,Quantity FROM Orders;

-- Query 8: Display all customers who live in Karachi
SELECT * FROM Customers
WHERE City = "Karachi";

-- Query 9: Show all products whose price is greater than Rs. 50,000
SELECT ProductName,Price FROM Products
WHERE Price > 50000;

-- Query 10: Show all the products whose stock is less than 20
SELECT * FROM Products
WHERE Stock < 20;

-- Query 11: Show orders where quantity is greater than 2
SELECT * FROM Orders
WHERE Quantity > 2;

-- Query 12: Show products which are in electronic category
SELECT * FROM Products
WHERE Category = "Electronics";

-- Query 13: Show customers from karachi and whose name is Tejan Das
SELECT * FROM Customers
WHERE NAME = "Tejan Das" AND City = "Karachi";

-- Query 14: Show customers from karachi or lahore
SELECT * FROM Customers
WHERE City = "karachi" OR City = "lahore";

-- Query 15: Show customers who are not from karachi
SELECT * FROM Customers
WHERE NOT City = "karachi";

-- Query 16: Show products costing more than 30,000 and having stock greater than 10
SELECT * FROM Products
WHERE Price > 30000 AND Stock > 10;

-- Query 17: Show products costing less than 10,000 or stock less than and equal to 5
SELECT * FROM Products
WHERE Price < 10000 OR Stock <= 5;

-- Query 18: Sort customers name (A-Z)
SELECT * FROM Customers
ORDER BY NAME; 

-- Query 19: Sort customers name (Z-A)alter
SELECT * FROM Customers
ORDER BY NAME DESC;

-- Query 20: Show the products with maximum price
SELECT * FROM Products 
ORDER BY Price DESC;

-- Query 21: Show customers from karachi sorted by name 
SELECT * FROM Customers
WHERE CITY = "KARACHI"
ORDER BY NAME;

-- Query 22: Show products costing more tnan 30,000 sorted by price
SELECT * FROM Products
WHERE PRICE > 30000
ORDER BY PRICE DESC;

-- Query 23: Show top 5 most expensive products
SELECT * FROM Products
ORDER BY PRICE DESC
LIMIT 5;

-- Query 24: Show top 5 cheapest products
SELECT * FROM Products
ORDER BY PRICE ASC
LIMIT 3;

-- Query 25: Show the latest 5 orders
SELECT * FROM Orders
ORDER BY OrderDate DESC
LIMIT 5;

-- Query 26: Total customers
SELECT COUNT(*) AS TOTAL_CUSTOMERS
FROM Customers;

-- Query 27: Total orders
SELECT COUNT(*) AS TOTAL_ORDERS
FROM Orders;

-- Query 28: How many products are currently in inventory?
SELECT SUM(STOCK) AS TOTAL_STOCK
FROM Products;

-- Query 29: How many items customers purchased?
SELECT SUM(QUANTITY) AS PURCHASED_ITEMS
FROM Orders;

-- Query 30: What is average price of our products?
SELECT AVG(PRICE) AS AVERAGE_PRICE
FROM Products;

-- Query 31: What is the cheapest product
SELECT MIN(PRICE) AS CHEAPEST_PRODUCT
FROM Products;

-- Query 32: What is the highest stock?
SELECT MAX(STOCK) AS HIGHEST_STOCK
FROM Products;

-- Query 33: Count the number of products in the mobile category
SELECT COUNT(*) FROM Products
WHERE Category = "mobile";

-- Query 34: Find the average price of products costing more than 50,000
SELECT AVG(PRICE) FROM Products
WHERE PRICE > 50000;

-- Query 35: Count the number of orders placed by each customer
SELECT CustomerID, COUNT(*)
FROM Orders
GROUP BY CustomerID;

-- Query 36: Find the total quantity ordered by each customer
SELECT CustomerID, SUM(QUANTITY)
FROM Orders
GROUP BY CustomerID;

-- Query 37: Find the average stock for each product category
SELECT Category, AVG(STOCK) 
FROM Products
GROUP BY Category;

-- Query 38: find the total value of inventory for each category
SELECT Category, SUM(PRICE*STOCK)
FROM Products
GROUP BY Category;

-- Query 39: Show only city having customer more than 2
SELECT CITY, COUNT(*) 
FROM Customers
GROUP BY CITY
HAVING COUNT(*) > 2; 

-- Query 40: Show categories where average price is greater than 50,000
SELECT Category, AVG(PRICE)
FROM Products 
GROUP BY Category
HAVING AVG(PRICE)  > 70000;

-- Query 41: Show categories where the total stock is greater than 40
SELECT Category, SUM(STOCK)
FROM Products
GROUP BY Category
HAVING SUM(STOCK) > 40
ORDER BY SUM(STOCK) DESC
LIMIT 5;

-- Query 42: Show all orders with customer names
SELECT 
ORDERS.ORDERID,
CUSTOMERS.NAME,
ORDERS.QUANTITY,
ORDERS.ORDERDATE
FROM ORDERS 
INNER JOIN CUSTOMERS
ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID;

-- Query 43: Show product names with orders
SELECT 
ORDERS.ORDERID,
PRODUCTS.PRODUCTNAME,
ORDERS.QUANTITY,
ORDERS.ORDERDATE
FROM ORDERS INNER JOIN PRODUCTS
ON ORDERS.PRODUCTID = PRODUCTS.PRODUCTID;

-- Query 44:  Show every customer's purchase history
SELECT 
ORDERS.ORDERID,
CUSTOMERS.NAME,
PRODUCTS.PRODUCTNAME,
ORDERS.QUANTITY,
ORDERS.ORDERDATE
FROM ORDERS INNER JOIN CUSTOMERS
ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
INNER JOIN PRODUCTS
ON ORDERS.PRODUCTID = PRODUCTS.PRODUCTID;

-- Query 45: How many product did Tejan bought? 
SELECT 
CUSTOMERS.NAME,
SUM(ORDERS.QUANTITY)  AS TOTAL_PRODUCTS
FROM ORDERS 
INNER JOIN CUSTOMERS
ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
WHERE CUSTOMERS.NAME = "TEJAN DAS"
GROUP BY CUSTOMERS.NAME; 

-- Query 46: Which customer ordered on july 10
SELECT 
CUSTOMERS.NAME,
ORDERS.ORDERDATE 
FROM ORDERS INNER JOIN CUSTOMERS
ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
WHERE ORDERS.ORDERDATE = "2026-07-10"; 

-- Query 47: find the customers who never placed an order
SELECT 
CUSTOMERS.NAME,
ORDERS.ORDERID
FROM CUSTOMERS LEFT JOIN ORDERS
ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID
WHERE ORDERS.ORDERID IS NULL;

-- Query 48: Find the customers who bought products costing more than 50000
SELECT 
CUSTOMERS.NAME,
PRODUCTS.PRODUCTNAME,
PRODUCTS.PRICE
FROM ORDERS INNER JOIN CUSTOMERS
ON CUSTOMERS.CUSTOMERID = ORDERS.ORDERID
INNER JOIN PRODUCTS
ON ORDERS.PRODUCTID = PRODUCTS.PRODUCTID
WHERE PRODUCTS.PRICE > 50000;

-- Query 49: Find the customers who never placed an order.
SELECT NAME FROM CUSTOMERS
WHERE CUSTOMERID NOT IN 
(
	SELECT CUSTOMERID
    FROM ORDERS
);
-- WE CAN DO THIS BY LEFT JOIN AS WELL

-- Query 50: Find the products costing more than average price
SELECT PRODUCTNAME,PRICE 
FROM PRODUCTS 
WHERE PRICE > (
	SELECT AVG(PRICE)
    FROM PRODUCTS
);

-- Query 51:Find products priced above the average price (CTE)

WITH AveragePrice AS
(
    SELECT AVG(Price) AS AvgPrice
    FROM Products
)

SELECT ProductName, Price
FROM Products
WHERE Price >
(
    SELECT AvgPrice
    FROM AveragePrice
);

-- Query 52: Find customers from Karachi and their orders (CTE)

WITH KarachiCustomers AS
(
    SELECT CustomerID, Name
    FROM Customers
    WHERE City = 'Karachi'
)

SELECT KarachiCustomers.Name,
       Orders.OrderID,
       Orders.OrderDate,
       Orders.Quantity
FROM KarachiCustomers
INNER JOIN Orders
ON KarachiCustomers.CustomerID = Orders.CustomerID;

-- Query 53: Find customers who bought expensive products (Price > 50000) (CTE)

WITH ExpensiveProducts AS
(
    SELECT ProductID
    FROM Products
    WHERE Price > 50000
)

SELECT DISTINCT Customers.Name
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.ProductID IN
(
    SELECT ProductID
    FROM ExpensiveProducts
);

-- Query 54: Number all products according to price (Window function)

SELECT ProductName,
       Price,
       ROW_NUMBER() OVER (ORDER BY Price DESC) AS RowNumber
FROM Products;

-- Query 55: Rank products by price (Window function)

SELECT ProductName,
       Price,
       RANK() OVER (ORDER BY Price DESC) AS ProductRank
FROM Products;

-- Query 56: Dense Rank products by price (Window function)

SELECT ProductName,
       Price,
       DENSE_RANK() OVER (ORDER BY Price DESC) AS DenseRank
FROM Products;