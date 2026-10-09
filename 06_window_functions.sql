-- Window functions: MySQL 8.0+
USE ecommerce_db;

-- 1. Rank customers by spending
WITH customer_spending AS (
    SELECT c.customer_id, c.first_name, c.last_name,
           SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT customer_id, first_name, last_name, total_spent,
       ROW_NUMBER() OVER (ORDER BY total_spent DESC, customer_id) AS row_num,
       RANK() OVER (ORDER BY total_spent DESC) AS spending_rank,
       DENSE_RANK() OVER (ORDER BY total_spent DESC) AS dense_spending_rank
FROM customer_spending
ORDER BY total_spent DESC;

-- 2. Rank products by units sold within each category
WITH product_sales AS (
    SELECT p.product_id, p.product_name, c.category_id, c.category_name,
           SUM(oi.quantity) AS units_sold
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name, c.category_id, c.category_name
)
SELECT category_name, product_name, units_sold,
       DENSE_RANK() OVER (
           PARTITION BY category_id
           ORDER BY units_sold DESC
       ) AS product_rank
FROM product_sales
ORDER BY category_name, product_rank, product_name;

-- 3. Top 3 ranked products per category
WITH product_sales AS (
    SELECT p.product_id, p.product_name, c.category_id, c.category_name,
           SUM(oi.quantity) AS units_sold,
           DENSE_RANK() OVER (
               PARTITION BY c.category_id
               ORDER BY SUM(oi.quantity) DESC
           ) AS product_rank
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name, c.category_id, c.category_name
)
SELECT category_name, product_name, units_sold, product_rank
FROM product_sales
WHERE product_rank <= 3
ORDER BY category_name, product_rank;

-- Note: DENSE_RANK gives tied values the same rank. ROW_NUMBER can be used for
-- unique row positions; add a deterministic tie-breaker such as product_id.
