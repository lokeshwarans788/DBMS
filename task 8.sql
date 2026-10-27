CREATE DATABASE JoinAnalysisDB1;
USE JoinAnalysisDB1;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customer VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Madurai'),
(3, 'Kumar', 'Coimbatore'),
(4, 'Divya', 'Salem');

INSERT INTO Product VALUES
(101, 'Laptop', 50000),
(102, 'Mobile', 20000),
(103, 'Keyboard', 1000),
(104, 'Mouse', 500);

INSERT INTO Orders VALUES
(1001, 1, 101, '2026-10-01', 1),
(1002, 2, 102, '2026-10-02', 2),
(1003, 1, 103, '2026-10-03', 1);

INSERT INTO Payment VALUES
(501, 1001, 50000, 'Paid'),
(502, 1002, 40000, 'Paid');

SELECT
    C.customer_name,
    C.city,
    O.order_id,
    O.order_date,
    P.product_name,
    P.price,
    O.quantity,
    O.quantity * P.price AS total_amount,
    COALESCE(Pay.payment_status, 'Not Paid') AS payment_status
FROM Customer C
INNER JOIN Orders O
    ON C.customer_id = O.customer_id
INNER JOIN Product P
    ON O.product_id = P.product_id
LEFT JOIN Payment Pay
    ON O.order_id = Pay.order_id
ORDER BY O.order_id;