CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price DECIMAL NOT NULL
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
	customer_id INTEGER REFERENCES Customers(id),
	product_id INTEGER REFERENCES Products(id),
    order_date DATE NOT NULL,
    quantity INTEGER NOT NULL
);

CREATE TABLE Suppliers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    contact_name TEXT NOT NULL
);

CREATE TABLE ProductSuppliers (
    id SERIAL PRIMARY KEY,
	supplier_id INTEGER REFERENCES Suppliers(id),
	product_id INTEGER REFERENCES Products(id),
    supply_date DATE NOT NULL
);

INSERT INTO Customers (name, email) VALUES
    ('Name1', 'name1@gmail.com'),
    ('Name2', 'name2@example.com'),
    ('Name3', 'name3@example.com'),
	('Name4', 'name4@example.com'),
    ('Name5', 'name5@gmail.com'),
    ('Name6', 'name6@example.com');

INSERT INTO Products (name, price) VALUES
    ('Product1', 150),
    ('Product2', 15),
    ('Product3', 250),
	('Product4', 300),
    ('Product5', 35),
    ('Product6', 40);

INSERT INTO Orders (customer_id, product_id, order_date, quantity) VALUES
    (1, 1, '2024-05-01', 2),
    (2, 2, '2024-05-02', 1),
	(3, 6, '2024-05-04', 2),
    (5, 4, '2024-05-10', 1),
    (6, 5, '2024-05-12', 3);

INSERT INTO Suppliers (name, contact_name) VALUES
    ('Supplier1', 'John'),
    ('Supplier2', 'Alice'),
    ('Supplier3', 'Bob');

INSERT INTO ProductSuppliers (supplier_id, product_id, supply_date) VALUES
    (1, 1, '2024-04-01'),
    (2, 5, '2024-04-02'),
	(1, 2, '2024-04-01'),
    (2, 3, '2024-04-02'),
    (2, 6, '2024-04-03'),
    (3, 4, '2024-04-05');

SELECT * FROM products;
SELECT * FROM customers WHERE email LIKE '%@gmail.com';
SELECT SUM(quantity) AS total_orders FROM orders;
SELECT quantity FROM Orders WHERE customer_id = 6;
SELECT * FROM products WHERE price BETWEEN 10 AND 100;