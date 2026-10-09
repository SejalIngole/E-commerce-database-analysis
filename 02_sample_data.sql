-- Sample data for E-Commerce Database Analysis
USE ecommerce_db;

INSERT INTO customers (customer_id, first_name, last_name, email, phone, city, created_at) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9000000001', 'Pune', '2025-01-10'),
(2, 'Priya', 'Patil', 'priya.patil@example.com', '9000000002', 'Mumbai', '2025-01-15'),
(3, 'Rahul', 'Verma', 'rahul.verma@example.com', '9000000003', 'Pune', '2025-02-02'),
(4, 'Sneha', 'Joshi', 'sneha.joshi@example.com', '9000000004', 'Nagpur', '2025-02-18'),
(5, 'Neha', 'Kulkarni', 'neha.kulkarni@example.com', '9000000005', 'Nashik', '2025-03-01'),
(6, 'Kabir', 'Deshmukh', 'kabir.deshmukh@example.com', '9000000006', 'Mumbai', '2025-03-10'),
(7, 'Isha', 'Rao', 'isha.rao@example.com', '9000000007', 'Aurangabad', '2025-04-05'),
(8, 'Rohan', 'Mehta', 'rohan.mehta@example.com', '9000000008', 'Pune', '2025-04-20');

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Home & Kitchen'),
(3, 'Books'),
(4, 'Fashion'),
(5, 'Sports');

INSERT INTO products (product_id, product_name, category_id, price, stock, created_at) VALUES
(1, 'Wireless Mouse', 1, 799.00, 45, '2025-01-01'),
(2, 'Bluetooth Headphones', 1, 2499.00, 20, '2025-01-03'),
(3, 'USB-C Charger', 1, 999.00, 60, '2025-01-05'),
(4, 'Coffee Maker', 2, 3499.00, 12, '2025-01-08'),
(5, 'Water Bottle', 2, 499.00, 80, '2025-01-10'),
(6, 'SQL for Beginners', 3, 599.00, 35, '2025-01-12'),
(7, 'Clean Code', 3, 899.00, 25, '2025-01-14'),
(8, 'Casual T-Shirt', 4, 699.00, 50, '2025-01-16'),
(9, 'Running Shoes', 4, 2999.00, 18, '2025-01-18'),
(10, 'Yoga Mat', 5, 1199.00, 30, '2025-01-20'),
(11, 'Football', 5, 899.00, 22, '2025-01-22'),
(12, 'Desk Lamp', 2, 1299.00, 15, '2025-01-24'),
(13, 'Laptop Stand', 1, 1599.00, 17, '2025-01-26'),
(14, 'Travel Backpack', 4, 1899.00, 14, '2025-01-28'),
(15, 'Resistance Bands', 5, 499.00, 40, '2025-01-30');

INSERT INTO orders (order_id, customer_id, order_date, total_amount, order_status) VALUES
(1001, 1, '2025-02-01', 3298.00, 'Delivered'),
(1002, 2, '2025-02-04', 3499.00, 'Delivered'),
(1003, 1, '2025-02-15', 1598.00, 'Delivered'),
(1004, 3, '2025-03-02', 2999.00, 'Shipped'),
(1005, 4, '2025-03-10', 2097.00, 'Delivered'),
(1006, 5, '2025-03-18', 1199.00, 'Placed'),
(1007, 2, '2025-04-01', 3898.00, 'Delivered'),
(1008, 6, '2025-04-12', 1798.00, 'Shipped'),
(1009, 3, '2025-04-20', 2499.00, 'Delivered'),
(1010, 8, '2025-05-02', 1899.00, 'Placed'),
(1011, 1, '2025-05-10', 899.00, 'Delivered'),
(1012, 7, '2025-05-19', 1498.00, 'Cancelled');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 1001, 1, 1, 799.00),
(2, 1001, 2, 1, 2499.00),
(3, 1002, 4, 1, 3499.00),
(4, 1003, 1, 2, 799.00),
(5, 1004, 9, 1, 2999.00),
(6, 1005, 8, 3, 699.00),
(7, 1006, 10, 1, 1199.00),
(8, 1007, 4, 1, 3499.00),
(9, 1007, 5, 1, 399.00),
(10, 1008, 6, 2, 599.00),
(11, 1008, 11, 1, 600.00),
(12, 1009, 2, 1, 2499.00),
(13, 1010, 14, 1, 1899.00),
(14, 1011, 7, 1, 899.00),
(15, 1012, 3, 1, 999.00),
(16, 1012, 15, 1, 499.00);

INSERT INTO payments (payment_id, order_id, payment_method, payment_status, payment_date, amount) VALUES
(1, 1001, 'UPI', 'Paid', '2025-02-01', 3298.00),
(2, 1002, 'Card', 'Paid', '2025-02-04', 3499.00),
(3, 1003, 'UPI', 'Paid', '2025-02-15', 1598.00),
(4, 1004, 'Card', 'Paid', '2025-03-02', 2999.00),
(5, 1005, 'Cash on Delivery', 'Paid', '2025-03-10', 2097.00),
(6, 1006, 'UPI', 'Pending', '2025-03-18', 1199.00),
(7, 1007, 'Card', 'Paid', '2025-04-01', 3898.00),
(8, 1008, 'UPI', 'Paid', '2025-04-12', 1798.00),
(9, 1009, 'Net Banking', 'Paid', '2025-04-20', 2499.00),
(10, 1010, 'Card', 'Pending', '2025-05-02', 1899.00),
(11, 1011, 'UPI', 'Paid', '2025-05-10', 899.00),
(12, 1012, 'UPI', 'Refunded', '2025-05-19', 1498.00);

INSERT INTO shipping (shipping_id, order_id, shipping_status, shipping_date, delivered_date, tracking_number) VALUES
(1, 1001, 'Delivered', '2025-02-02', '2025-02-05', 'TRK1001'),
(2, 1002, 'Delivered', '2025-02-05', '2025-02-08', 'TRK1002'),
(3, 1003, 'Delivered', '2025-02-16', '2025-02-20', 'TRK1003'),
(4, 1004, 'Shipped', '2025-03-03', NULL, 'TRK1004'),
(5, 1005, 'Delivered', '2025-03-11', '2025-03-14', 'TRK1005'),
(6, 1006, 'Processing', NULL, NULL, 'TRK1006'),
(7, 1007, 'Delivered', '2025-04-02', '2025-04-06', 'TRK1007'),
(8, 1008, 'Shipped', '2025-04-13', NULL, 'TRK1008'),
(9, 1009, 'Delivered', '2025-04-21', '2025-04-24', 'TRK1009'),
(10, 1010, 'Processing', NULL, NULL, 'TRK1010'),
(11, 1011, 'Delivered', '2025-05-11', '2025-05-13', 'TRK1011'),
(12, 1012, 'Cancelled', NULL, NULL, 'TRK1012');
