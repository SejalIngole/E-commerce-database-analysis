-- Basic SQL practice: SELECT, WHERE, operators, ORDER BY, DISTINCT, LIMIT
USE ecommerce_db;

-- 1. Display all products
SELECT * FROM products;

-- 2. Display selected columns
SELECT product_name, price FROM products;

-- 3. Products costing more than 1000
SELECT product_name, price
FROM products
WHERE price > 1000;

-- 4. Customers from Pune or Mumbai
SELECT first_name, last_name, city
FROM customers
WHERE city IN ('Pune', 'Mumbai');

-- 5. Products priced between 500 and 2000 (inclusive)
SELECT product_name, price
FROM products
WHERE price BETWEEN 500 AND 2000;

-- 6. Customers whose first name starts with A
SELECT first_name, last_name
FROM customers
WHERE first_name LIKE 'A%';

-- 7. Most expensive 5 products
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;

-- 8. List unique customer cities
SELECT DISTINCT city
FROM customers
WHERE city IS NOT NULL
ORDER BY city;

-- 9. Count products, total stock, average price, max and min price
SELECT
    COUNT(*) AS total_products,
    SUM(stock) AS total_stock,
    ROUND(AVG(price), 2) AS average_price,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM products;
