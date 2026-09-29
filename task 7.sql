CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    available_copies INT
);

INSERT INTO Members VALUES
(1, 'Arun', 'arun@gmail.com', 'Chennai'),
(2, 'Priya', 'priya@gmail.com', 'Madurai'),
(3, 'Karthik', 'karthik@gmail.com', 'Coimbatore'),
(4, 'Divya', 'divya@gmail.com', 'Chennai'),
(5, 'Rahul', 'rahul@gmail.com', 'Salem');

INSERT INTO Books VALUES
(101, 'Java Programming', 'Programming', 650, 5),
(102, 'Python Basics', 'Programming', 550, 8),
(103, 'Data Structures', 'Computer Science', 750, 4),
(104, 'Database Management', 'Database', 600, 0),
(105, 'Artificial Intelligence', 'AI', 900, 6);

SELECT
    b.book_id,
    b.book_name,
    b.category,
    b.price,
    b.available_copies,
    m.member_name,
    m.email,
    m.city
FROM Books b
CROSS JOIN Members m
WHERE b.available_copies > 0
AND b.price < 800
ORDER BY b.price DESC;