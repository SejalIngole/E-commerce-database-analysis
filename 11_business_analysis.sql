-- Business analysis questions
USE ecommerce_db;

-- 1. Order metrics
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS order_value_total,
    ROUND(AVG(total_amount), 2) AS average_order_value,
    MAX(total_amount) AS highest_order_value,
    MIN(total_amount) AS lowest_order_value
FROM orders;

-- 2. Revenue by customer (based on orders.total_amount)
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(o.total_amount) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_order_value DESC;

-- 3. Best-selling products
SELECT p.product_id, p.product_name,
       SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC, p.product_name;

-- 4. Products that have never been sold
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- 5. Orders by status
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 6. Payments by method and status
SELECT payment_method, payment_status, COUNT(*) AS payment_count,
       SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method, payment_status
ORDER BY payment_method, payment_status;

-- 7. Shipping status summary
SELECT shipping_status, COUNT(*) AS shipment_count
FROM shipping
GROUP BY shipping_status
ORDER BY shipment_count DESC;

-- 8. Monthly order value
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
       COUNT(*) AS order_count,
       SUM(total_amount) AS total_order_value
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

-- Note: Order value, payments, and item revenue are separate measures.
-- Cancelled/refunded orders should be treated appropriately for a production
-- financial report. The queries here are for SQL learning and demonstration.
