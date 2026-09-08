CREATE DATABASE seller_inventory_db;

USE seller_inventory_db;

CREATE TABLE Seller ( 
seller_id INT PRIMARY KEY, 
seller_name VARCHAR(50), 
phone VARCHAR(15), 
email VARCHAR(60) 
);

CREATE TABLE Product ( 
product_id INT PRIMARY KEY, 
product_name VARCHAR(50), 
price DECIMAL(10,2), 
seller_id INT, 
FOREIGN KEY (seller_id) REFERENCES Seller(seller_id) 
);

CREATE TABLE Inventory ( 
inventory_id INT PRIMARY KEY, 
product_id INT, 
stock_quantity INT, 
status VARCHAR(20), 
FOREIGN KEY (product_id) REFERENCES Product(product_id) 
);

INSERT INTO Seller VALUES 
(1, 'Arun Electronics', '9845012345', 'arun@shop.com'), 
(2, 'Meena Traders', '9789012345', 'meena@shop.com'), 
(3, 'Sri Tech Mart', '9678012345', 'sritech@shop.com');

INSERT INTO Product VALUES 
(201, 'Printer', 8500.00, 1), 
(202, 'Web Camera', 1800.00, 2), 
(203, 'Headset', 1500.00, 3), 
(204, 'External Hard Disk', 6200.00, 1);

INSERT INTO Inventory VALUES 
(11, 201, 12, 'Available'), 
(12, 202, 8, 'Available'), 
(13, 203, 0, 'Out of Stock'), 
(14, 204, 6, 'Available'); 

SELECT * FROM Seller; 
SELECT * FROM Product;
SELECT * FROM Inventory;

SELECT 
Seller.seller_name, 
Product.product_name, 
Product.price 
FROM Seller 
INNER JOIN Product 
ON Seller.seller_id = Product.seller_id; 

SELECT 
Product.product_name, 
Inventory.stock_quantity 
FROM Product 
INNER JOIN Inventory 
ON Product.product_id = Inventory.product_id 
WHERE Inventory.status = 'Available';

SELECT 
Product.product_name, 
Inventory.stock_quantity 
FROM Product 
INNER JOIN Inventory 
ON Product.product_id = Inventory.product_id 
WHERE Inventory.status = 'Out of Stock';

SELECT 
Product.product_id, 
Product.product_name, 
Inventory.stock_quantity, 
Inventory.status 
FROM Product 
INNER JOIN Inventory 
ON Product.product_id = Inventory.product_id;

UPDATE Inventory 
SET stock_quantity = 20, 
status = 'Available' 
WHERE product_id = 201; 

DELETE FROM Inventory 
WHERE product_id = 204; 
DELETE FROM Product 
WHERE product_id = 204; 

SELECT
    Product.product_name,
    Inventory.stock_quantity,
    Inventory.status
FROM Product
INNER JOIN Inventory
ON Product.product_id = Inventory.product_id;
