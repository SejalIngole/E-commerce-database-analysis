-- Stored procedures
USE ecommerce_db;

DROP PROCEDURE IF EXISTS get_customer_spending;
DELIMITER //
CREATE PROCEDURE get_customer_spending()
BEGIN
    SELECT c.customer_id, c.first_name, c.last_name,
           SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
    ORDER BY total_spent DESC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_products_below_price;
DELIMITER //
CREATE PROCEDURE get_products_below_price(IN max_price DECIMAL(10,2))
BEGIN
    SELECT product_id, product_name, price
    FROM products
    WHERE price < max_price
    ORDER BY price;
END //
DELIMITER ;

-- Examples
CALL get_customer_spending();
CALL get_products_below_price(1000);
