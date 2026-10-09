-- Subqueries and Common Table Expressions (CTEs)
USE ecommerce_db;

-- 1. Products priced above the overall average
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

-- 2. Products with the highest price (returns ties)
SELECT product_name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- 3. Customers who have placed orders
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- 4. Customers who have never placed orders (NOT EXISTS avoids NOT IN NULL issues)
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- 5. Total spending by customer using a CTE
WITH customer_spending AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_id, c.first_name, c.last_name, cs.total_spent
FROM customer_spending cs
JOIN customers c ON cs.customer_id = c.customer_id
ORDER BY cs.total_spent DESC;

-- 6. Customers whose total order amount is above average customer spending
WITH customer_spending AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
average_spending AS (
    SELECT AVG(total_spent) AS avg_spent
    FROM customer_spending
)
SELECT c.first_name, c.last_name, cs.total_spent
FROM customer_spending cs
JOIN customers c ON c.customer_id = cs.customer_id
WHERE cs.total_spent > (SELECT avg_spent FROM average_spending)
ORDER BY cs.total_spent DESC;

-- 7. Products priced above the average price of their own category (correlated subquery)
SELECT p.product_name, p.category_id, p.price
FROM products p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category_id = p.category_id
);
