CREATE DATABASE order_management_db;
USE order_management_db;

CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE ORDER_DETAILS (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
    REFERENCES ORDERS(order_id)
);

SHOW TABLES;

INSERT INTO ORDERS
(order_id, customer_id, order_date, total_amount)
VALUES
(201, 11, '2026-01-10', 750.00),
(202, 12, '2026-02-15', 1200.00),
(203, 13, '2026-03-20', 450.00),
(204, 14, '2026-04-05', 1800.00),
(205, 15, '2026-05-12', 950.00);

INSERT INTO ORDER_DETAILS
(order_details_id, order_id, quantity, price, total_amount)
VALUES
(11, 201, 3, 250.00, 750.00),
(12, 202, 4, 300.00, 1200.00),
(13, 203, 2, 225.00, 450.00),
(14, 204, 3, 600.00, 1800.00),
(15, 205, 5, 190.00, 950.00);

SELECT * FROM ORDERS;

SELECT * FROM ORDER_DETAILS;

DESC ORDERS;
DESC ORDER_DETAILS;

INSERT INTO ORDERS
(order_id, customer_id, order_date, total_amount)
VALUES
(206, 16, '2026-06-18', 1350.00);


INSERT INTO ORDER_DETAILS
(order_details_id, order_id, quantity, price, total_amount)
VALUES
(16, 206, 3, 450.00, 1350.00);

UPDATE ORDERS
SET total_amount = 850.00
WHERE order_id = 201;

UPDATE ORDER_DETAILS
SET quantity = 4,
    total_amount = 1000.00
WHERE order_details_id = 11;

UPDATE ORDERS
SET order_date = '2026-01-20'
WHERE order_id = 201;

SELECT *
FROM ORDERS
WHERE customer_id = 11;

SELECT *
FROM ORDERS
WHERE total_amount > 900;

SELECT *
FROM ORDERS
WHERE order_date
BETWEEN '2026-01-01' AND '2026-12-31';

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.quantity,
    od.price,
    od.total_amount
FROM ORDERS o
JOIN ORDER_DETAILS od
ON o.order_id = od.order_id
ORDER BY o.customer_id;

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount AS order_total,
    od.order_details_id,
    od.quantity,
    od.price,
    od.total_amount AS detail_total
FROM ORDERS o
INNER JOIN ORDER_DETAILS od
ON o.order_id = od.order_id;

SELECT SUM(total_amount) AS total_order_amount
FROM ORDERS;
SELECT AVG(total_amount) AS average_order_amount
FROM ORDERS;
SELECT MAX(total_amount) AS highest_order_amount
FROM ORDERS;
SELECT MIN(total_amount) AS lowest_order_amount
FROM ORDERS;
SELECT COUNT(*) AS total_orders
FROM ORDERS;
SELECT
    customer_id,
    COUNT(order_id) AS number_of_orders,
    SUM(total_amount) AS total_amount
FROM ORDERS
GROUP BY customer_id;
DELETE FROM ORDER_DETAILS
WHERE order_id = 206;
DELETE FROM ORDERS
WHERE order_id = 206;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAILS;
SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.quantity,
    od.price,
    od.total_amount
FROM ORDERS o
INNER JOIN ORDER_DETAILS od
ON o.order_id = od.order_id
ORDER BY o.customer_id;
