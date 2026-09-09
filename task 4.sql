CREATE DATABASE OrderManagementDB3;
USE OrderManagementDB;
ALTER TABLE Orders
ADD COLUMN order_status VARCHAR(20);
INSERT INTO Orders
(order_id, customer_id, order_date, total_amount, order_status)
VALUES
(106, 1, '2026-08-21', 1300.00, 'Completed'),
(107, 1, '2026-08-22', 1900.00, 'Shipped'),
(108, 1, '2026-08-23', 2100.00, 'Pending');
INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price, subtotal)
VALUES
(9, 106, 206, 1, 1300.00, 1300.00),
(10, 107, 207, 2, 950.00, 1900.00),
(11, 108, 208, 2, 1050.00, 2100.00);
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    o.order_status,
    od.product_id,
    od.quantity,
    od.subtotal
FROM Orders o
JOIN Order_Details od
ON o.order_id = od.order_id
LIMIT 5;
