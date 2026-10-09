-- Indexes and basic query-plan inspection
USE ecommerce_db;

CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_products_category_id ON products(category_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

SHOW INDEX FROM customers;

EXPLAIN
SELECT customer_id, first_name, last_name
FROM customers
WHERE city = 'Pune';

-- Indexes can improve filtering/join performance, but they take storage and
-- can make INSERT/UPDATE/DELETE operations more expensive.
