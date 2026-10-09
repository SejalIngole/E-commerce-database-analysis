-- Views
USE ecommerce_db;

CREATE OR REPLACE VIEW customer_spending AS
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

CREATE OR REPLACE VIEW product_sales AS
SELECT p.product_id, p.product_name,
       SUM(oi.quantity) AS total_quantity_sold,
       SUM(oi.quantity * oi.price) AS item_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Query the views
SELECT * FROM customer_spending ORDER BY total_spent DESC;
SELECT * FROM product_sales ORDER BY item_revenue DESC;
