CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY
    AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    City VARCHAR(50),
    Address VARCHAR(200),
    CreatedAt TIMESTAMP DEFAULT
    CURRENT_TIMESTAMP
);
DESCRIBE Customers;
INSERT INTO Customers
(NAME,Email,Phone,City,Address)
VALUES
("TEJAN DAS","tej@gmail.com","03004711601","Karachi","Clifton"),
('Ali Khan', 'ali@gmail.com', '03001111111', 'Karachi', 'Gulshan-e-Iqbal'),
('Sara Ahmed', 'sara@gmail.com', '03002222222', 'Lahore', 'Model Town'),
('Ahmed Raza', 'ahmed@gmail.com', '03003333333', 'Islamabad', 'F-10'),
('Fatima Noor', 'fatima@gmail.com', '03004444444', 'Hyderabad', 'Latifabad'),
('Bilal Hussain', 'bilal@gmail.com', '03005555555', 'Peshawar', 'University Town'),
('Ayesha Malik', 'ayesha@gmail.com', '03006666666', 'Multan', 'Cantt'),
('Usman Ali', 'usman@gmail.com', '03007777777', 'Faisalabad', 'People Colony'),
('Hina Shah', 'hina@gmail.com', '03008888888', 'Quetta', 'Jinnah Town'),
('Zain Iqbal', 'zain@gmail.com', '03009999999', 'Sukkur', 'Military Road'),
('Mariam Khan', 'mariam@gmail.com', '03110000001', 'Karachi', 'North Nazimabad'),
('Hamza Siddiqui', 'hamza@gmail.com', '03110000002', 'Lahore', 'Johar Town'),
('Noor Fatima', 'noor@gmail.com', '03110000003', 'Rawalpindi', 'Satellite Town'),
('Danish Ali', 'danish@gmail.com', '03110000004', 'Sialkot', 'Cantt'),
('Laiba Sheikh', 'laiba@gmail.com', '03110000005', 'Bahawalpur', 'Model Town'),
('Hasan Raza', 'hasan@gmail.com', '03110000006', 'Mirpurkhas', 'Station Road'),
('Iqra Ahmed', 'iqra@gmail.com', '03110000007', 'Larkana', 'VIP Road'),
('Abdullah Khan', 'abdullah@gmail.com', '03110000008', 'Gwadar', 'Marine Drive'),
('Kiran Baloch', 'kiran@gmail.com', '03110000009', 'Nawabshah', 'Airport Road'),
('Saad Hassan', 'saad@gmail.com', '03110000010', 'Mardan', 'College Road');
SELECT * FROM CUSTOMERS;

CREATE TABLE Products (
	ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    PRICE DECIMAL(10,2) NOT NULL,
    STOCK INT NOT NULL
);
INSERT INTO Products 
(ProductName, Category, Price, Stock)
VALUES
('Dell Inspiron 15', 'Laptop', 85000.00, 15),
('HP Pavilion', 'Laptop', 92000.00, 10),
('Lenovo IdeaPad', 'Laptop', 78000.00, 18),
('Apple MacBook Air', 'Laptop', 240000.00, 5),
('Samsung Galaxy S24', 'Mobile', 185000.00, 12),
('iPhone 15', 'Mobile', 265000.00, 8),
('Redmi Note 14', 'Mobile', 65000.00, 25),
('Infinix Zero 30', 'Mobile', 72000.00, 20),
('Sony WH-1000XM5', 'Headphones', 78000.00, 14),
('JBL Tune 770NC', 'Headphones', 28000.00, 30),
('Logitech G502 Mouse', 'Accessories', 12000.00, 35),
('HP Wireless Mouse', 'Accessories', 4500.00, 40),
('Mechanical Keyboard', 'Accessories', 15000.00, 22),
('Samsung 27-inch Monitor', 'Monitor', 55000.00, 9),
('LG UltraWide Monitor', 'Monitor', 89000.00, 7),
('Canon PIXMA Printer', 'Printer', 32000.00, 10),
('Epson EcoTank Printer', 'Printer', 68000.00, 6),
('Seagate 1TB HDD', 'Storage', 9500.00, 28),
('Samsung 1TB SSD', 'Storage', 18000.00, 20),
('SanDisk 64GB USB Drive', 'Storage', 1800.00, 50);
SELECT * FROM Products;


CREATE TABLE Orders (
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    QUANTITY INT NOT NULL,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)   
);
INSERT INTO Orders (CustomerID, ProductID, Quantity, OrderDate)
VALUES
(1, 5, 1, '2026-07-01'),
(2, 1, 1, '2026-07-02'),
(3, 7, 2, '2026-07-02'),
(4, 4, 1, '2026-07-03'),
(5, 10, 2, '2026-07-03'),
(6, 15, 1, '2026-07-04'),
(7, 3, 1, '2026-07-04'),
(8, 18, 3, '2026-07-05'),
(9, 12, 2, '2026-07-05'),
(10, 20, 4, '2026-07-06'),
(11, 6, 1, '2026-07-07'),
(12, 14, 1, '2026-07-08'),
(13, 9, 2, '2026-07-08'),
(14, 2, 1, '2026-07-09'),
(15, 17, 1, '2026-07-10'),
(16, 13, 2, '2026-07-11'),
(17, 8, 1, '2026-07-12'),
(18, 11, 3, '2026-07-13'),
(19, 19, 2, '2026-07-14'),
(20, 16, 1, '2026-07-15');
SELECT * FROM Orders;