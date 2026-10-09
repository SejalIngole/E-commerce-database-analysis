-- Transactions: run statements one section at a time.
USE ecommerce_db;

-- Example pattern (safe demonstration using a read-only transaction)
START TRANSACTION;
SELECT * FROM products WHERE product_id = 1;
COMMIT;

-- Example of ROLLBACK pattern. The update is undone.
START TRANSACTION;
UPDATE products
SET stock = stock + 1
WHERE product_id = 1;
ROLLBACK;

-- COMMIT permanently saves transactional changes.
-- ROLLBACK cancels uncommitted transactional changes.
-- SAVEPOINT can mark a point to which you can roll back.
START TRANSACTION;
SAVEPOINT before_update;
UPDATE products SET stock = stock + 1 WHERE product_id = 2;
ROLLBACK TO SAVEPOINT before_update;
ROLLBACK;
