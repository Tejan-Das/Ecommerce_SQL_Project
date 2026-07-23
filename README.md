# 🛒 Ecommerce SQL Project

An end-to-end SQL project built as part of my **Artificial Intelligence learning journey**. This project simulates a real-world e-commerce database and demonstrates SQL concepts ranging from database design to advanced querying techniques.

---

## 📌 Project Overview

This project models a simple e-commerce system consisting of **Customers**, **Products**, and **Orders**. It includes database creation, sample data, and 56 SQL queries that solve real-world business problems using MySQL.

The project helped me strengthen my SQL skills, which are essential for **Data Analysis, Machine Learning, and AI Engineering**.

---

## 🛠 Technologies Used

- MySQL
- MySQL Workbench
- Git
- GitHub

---

## 📂 Project Structure

```
Ecommerce_SQL_Project/
│── Database.sql      # Database creation and sample data
│── Queries.sql       # 56 SQL queries
│── README.md
```

---

## 🗄 Database Schema

The project contains three tables:

### Customers
Stores customer information.

**Columns**
- CustomerID
- Name
- Email
- City

### Products
Stores product details.

**Columns**
- ProductID
- ProductName
- Category
- Price
- Stock

### Orders
Stores customer orders.

**Columns**
- OrderID
- CustomerID
- ProductID
- Quantity
- OrderDate

---

## 📚 SQL Concepts Covered

- Database Creation
- Primary Keys
- Foreign Keys
- Constraints
- INSERT Statements
- SELECT
- WHERE
- ORDER BY
- LIMIT
- Aggregate Functions
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- SELF JOIN
- UNION
- UNION ALL
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
  - ROW_NUMBER()
  - RANK()
  - DENSE_RANK()

---

## 📊 Business Questions Solved

This project includes **56 SQL queries**, such as:

- Retrieve customer and product information
- Filter records using WHERE conditions
- Calculate total inventory value
- Find products above the average price
- Display customers who placed orders
- Identify customers who never placed an order
- Generate customer purchase history
- Find top-selling products
- Analyze category-wise inventory
- Rank products by price
- Retrieve the top 3 most expensive products
- Solve business problems using CTEs and Window Functions

---

## 🎯 Learning Outcomes

Through this project, I learned how to:

- Design a relational database
- Work with multiple related tables
- Write efficient SQL queries
- Perform data analysis using SQL
- Use JOINs to combine data
- Solve real-world business questions
- Apply advanced SQL concepts like CTEs and Window Functions

---

## 🚀 How to Run the Project

1. Clone this repository.

```bash
git clone https://github.com/Tejan-Das/Ecommerce_SQL_Project.git
```

2. Open MySQL Workbench.

3. Create a database.

```sql
CREATE DATABASE EcommerceDB;
USE EcommerceDB;
```

4. Execute `Database.sql`.

5. Open `Queries.sql` and run any query.

---

## 👨‍💻 Author

**Tejan Das**

BS Artificial Intelligence Student | Aspiring AI Engineer

GitHub: https://github.com/Tejan-Das

---

⭐ If you found this project helpful, feel free to give it a star!
