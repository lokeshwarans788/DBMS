CREATE DATABASE CustomerDB;

USE CustomerDB;

CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Membership VARCHAR(20),
    Frequency INT,
    Recency INT,
    T INT,
    AvgOrderValue DECIMAL(10,2),
    TotalSpent DECIMAL(10,2)
);

INSERT INTO Customers
(CustomerID, Age, Gender, Membership, Frequency, Recency, T, AvgOrderValue, TotalSpent)
VALUES
('C001', 22, 'Male', 'Free', 2, 30, 180, 899.00, 1798.00),
('C002', 28, 'Female', 'Premium', 8, 12, 365, 1499.00, 11992.00),
('C003', 35, 'Male', 'Basic', 4, 45, 250, 999.00, 3996.00),
('C004', 24, 'Female', 'Premium', 10, 5, 400, 1999.00, 19990.00),
('C005', 31, 'Male', 'Basic', 5, 60, 300, 1299.00, 6495.00),
('C006', 27, 'Female', 'Free', 1, 120, 200, 799.00, 799.00),
('C007', 29, 'Male', 'Premium', 12, 3, 450, 1599.00, 19188.00),
('C008', 40, 'Female', 'Basic', 6, 40, 350, 999.00, 5994.00),
('C009', 21, 'Male', 'Free', 2, 80, 210, 699.00, 1398.00),
('C010', 33, 'Female', 'Premium', 9, 15, 390, 1799.00, 16191.00);

SELECT * FROM Customers;


