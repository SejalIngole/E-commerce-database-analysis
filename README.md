# E-Commerce Database Analysis (MySQL)

A beginner-friendly SQL portfolio project that models a small e-commerce business and answers common operational and business questions.

## Project goals

- Design a relational database with primary and foreign keys.
- Practice SQL filtering, sorting, aggregation, joins, subqueries, and CTEs.
- Use window functions to rank customers and products.
- Create views, stored procedures, a trigger, and indexes.
- Write business analysis queries for orders, customers, products, payments, and shipping.

## Tech stack

- MySQL 8.0+
- MySQL Workbench
- SQL

## Database schema

The database is named `ecommerce_db` and contains seven tables:

| Table | Purpose |
|---|---|
| `customers` | Customer profile and city |
| `categories` | Product category lookup |
| `products` | Product catalogue, price, and stock |
| `orders` | Customer orders and order totals |
| `order_items` | Products and quantities within each order |
| `payments` | Payment method, status, and amount |
| `shipping` | Shipping and delivery tracking |

### Relationships

- One customer can place many orders.
- One category can contain many products.
- One order can contain many order items.
- One product can appear in many order items.
- Orders can have payment records.
- Each order can have one shipping record in this sample schema.

## How to run in MySQL Workbench

1. Install MySQL Server and MySQL Workbench.
2. Open `01_database_creation.sql` and execute the entire script.
3. Open and execute `02_sample_data.sql`.
4. Run the remaining scripts individually as needed, in numerical order.
5. Refresh the Schemas panel and select `ecommerce_db`.

**Important:** `01_database_creation.sql` drops and recreates the project tables. Do not rerun it if you need to preserve your own data.

## SQL concepts demonstrated

- `SELECT`, `WHERE`, comparison and logical operators
- `LIKE`, `IN`, `BETWEEN`, `DISTINCT`, `ORDER BY`, `LIMIT`
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY` and `HAVING`
- `INNER JOIN` and `LEFT JOIN`
- Subqueries, correlated subqueries, `EXISTS`/`NOT EXISTS`, CTEs
- Window functions: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `PARTITION BY`
- Views and stored procedures
- Trigger basics
- Indexes and `EXPLAIN`
- Transactions, `COMMIT`, `ROLLBACK`, and `SAVEPOINT`
- Business analysis queries

## Example business questions

1. What is the average order value?
2. Which customers have the highest total order value?
3. Which products sell the most units?
4. Which products have never been sold?
5. Which categories generate the most item revenue?
6. Which customers have never placed an order?
7. What is the distribution of orders by status?
8. Which payment methods are used most often?
9. What is the monthly order value?
10. Which products rank highest within each category?

## Notes and limitations

- The dataset is synthetic and created for learning; it is not real customer data.
- The sample trigger decrements product stock after an `order_items` insert. It is intentionally a simple demonstration, not production-ready inventory logic.
- For accurate financial reporting, cancelled orders, refunds, discounts, taxes, and payment reconciliation need explicit business rules.
- The `orders.total_amount` values are sample data and are not guaranteed to reconcile with every order-item line total.
- Window functions require MySQL 8.0 or later.

## Suggested GitHub repository description

**SQL portfolio project using MySQL to analyze e-commerce customers, orders, products, payments, and shipping with joins, CTEs, window functions, views, stored procedures, indexes, and business queries.**

## Suggested resume bullet

**E-Commerce Database Analysis | MySQL**
- Designed a relational e-commerce database with seven related tables and implemented primary/foreign keys and data constraints.
- Analyzed customer spending, product sales, category revenue, order statuses, and payment trends using joins, aggregate functions, subqueries, CTEs, and window functions.
- Practiced database objects and performance concepts using views, stored procedures, triggers, indexes, and `EXPLAIN`.
