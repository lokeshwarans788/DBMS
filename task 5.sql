CREATE DATABASE PaymentManagementDB; 
USE PaymentManagementDB; 

CREATE TABLE Customer ( 
customer_id INT PRIMARY KEY, 
customer_name VARCHAR(100) NOT NULL, 
email VARCHAR(100), 
phone VARCHAR(15) 
);

CREATE TABLE Payment ( 
payment_id INT PRIMARY KEY, 
customer_id INT, 
order_id INT, 
payment_mode VARCHAR(30) NOT NULL, 
payment_date DATE NOT NULL, 
amount DECIMAL(10,2) NOT NULL, 
payment_status VARCHAR(20) NOT NULL, 
FOREIGN KEY (customer_id) 
REFERENCES Customer(customer_id) 
);

INSERT INTO Customer VALUES 
(1, 'Arun Kumar', 'arun@gmail.com', '9000001001'), 
(2, 'Meena Devi', 'meena@gmail.com', '9000001002'), 
(3, 'Karthik Raj', 'karthik@gmail.com', '9000001003'), 
(4, 'Divya Sri', 'divya@gmail.com', '9000001004'), 
(5, 'Naveen Kumar', 'naveen@gmail.com', '9000001005'); 

INSERT INTO Payment VALUES 
(601, 1, 2001, 'UPI', '2026-08-20', 12500.00, 'Successful'), 
(602, 2, 2002, 'Credit Card', '2026-08-21', 18500.00, 'Successful'), 
(603, 3, 2003, 'Debit Card', '2026-08-22', 4200.00, 'Pending'), 
(604, 4, 2004, 'Net Banking', '2026-08-23', 9600.00, 'Failed'), 
(605, 5, 2005, 'UPI', '2026-08-24', 7200.00, 'Successful'), 
(606, 1, 2006, 'Cash', '2026-08-25', 3000.00, 'Successful'), 
(607, 3, 2007, 'UPI', '2026-08-26', 15500.00, 'Failed'), 
(608, 2, 2008, 'Credit Card', '2026-08-27', 8300.00, 'Successful'); 

SELECT * FROM Customer;

SELECT * FROM Payment;

SELECT * 
FROM Payment 
WHERE payment_status = 'Successful'; 

SELECT * 
FROM Payment 
WHERE payment_status = 'Failed';

SELECT * 
FROM Payment 
WHERE payment_status = 'Pending';

UPDATE Payment 
SET payment_status = 'Successful' 
WHERE payment_id = 603; 

SELECT 
p.payment_id, 
c.customer_name, 
p.order_id, 
p.payment_mode, 
p.payment_date, 
p.amount, 
p.payment_status 
FROM Payment p 
JOIN Customer c 
ON p.customer_id = c.customer_id 
ORDER BY p.payment_date;

SELECT 
payment_mode, 
COUNT(*) AS total_transactions 
FROM Payment 
GROUP BY payment_mode 
ORDER BY total_transactions DESC; 

SELECT 
payment_mode, 
SUM(amount) AS total_amount 
FROM Payment 
WHERE payment_status = 'Successful' 
GROUP BY payment_mode 
ORDER BY total_amount DESC;

SELECT 
payment_status, 
COUNT(*) AS total_transactions 
FROM Payment 
GROUP BY payment_status;

SELECT 
SUM(amount) AS total_successful_amount 
FROM Payment 
WHERE payment_status = 'Successful'; 

SELECT 
SUM(amount) AS total_failed_amount 
FROM Payment 
WHERE payment_status = 'Failed';

SELECT 
payment_id, 
customer_id, 
order_id, 
payment_mode, 
amount, 
payment_status 
FROM Payment 
WHERE amount > 10000 
ORDER BY amount DESC; 

SELECT 
c.customer_id, 
c.customer_name, 
COUNT(p.payment_id) AS total_payments, 
SUM( 
CASE 
WHEN p.payment_status = 'Successful' 
THEN p.amount 
ELSE 0 
END 
) AS successful_amount 
FROM Customer c 
LEFT JOIN Payment p 
ON c.customer_id = p.customer_id 
GROUP BY c.customer_id, c.customer_name 
ORDER BY successful_amount DESC;

SELECT 
payment_date, 
COUNT(*) AS total_transactions, 
SUM(amount) AS total_amount 
FROM Payment 
GROUP BY payment_date 
ORDER BY payment_date;

SELECT 
p.payment_id, 
c.customer_name, 
p.order_id, 
p.payment_mode, 
p.payment_date, 
p.amount, 
p.payment_status 
FROM Payment p 
JOIN Customer c 
ON p.customer_id = c.customer_id 
ORDER BY p.payment_id;