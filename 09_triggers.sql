-- Trigger demonstration
-- Important: This trigger is an educational example. It decrements stock when
-- a new order_items row is inserted. Do not repeatedly insert test rows because
-- stock will be decremented each time. Production systems need validation for
-- insufficient stock, updates, cancellations, and transaction handling.
USE ecommerce_db;

DROP TRIGGER IF EXISTS reduce_stock_after_order_item;
DELIMITER //
CREATE TRIGGER reduce_stock_after_order_item
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- Do not insert an order_item merely to test this trigger on the sample data.
-- Inspect the definition with: SHOW TRIGGERS;
