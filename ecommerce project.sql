CREATE DATABASE ecommerce_project;
USE ecommerce_project;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (first_name, last_name, email, city, signup_date)
VALUES
('Emmanuel', 'Okeke', 'emmanuel@mail.com', 'Lagos', '2024-01-10'),
('Grace', 'Adebayo', 'grace@mail.com', 'Abuja', '2024-02-15'),
('John', 'Okafor', 'john@mail.com', 'Port Harcourt', '2024-03-01'),
('Mary', 'Aliyu', 'mary@mail.com', 'Ibadan', '2024-03-12'),
('David', 'Bello', 'david@mail.com', 'Kano', '2024-04-05');

SELECT * FROM customers;

INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 850000),
('Phone', 'Electronics', 450000),
('Headphones', 'Accessories', 50000),
('Chair', 'Furniture', 120000),
('Desk', 'Furniture', 200000);

SELECT * FROM products;

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2024-05-01'),
(2, '2024-05-03'),
(3, '2024-05-05'),
(1, '2024-05-06');

SELECT * FROM orders;

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 5, 1);

SELECT * FROM order_items;

# Which customer placed which orders?”

SELECT customers.first_name, customers.last_name, orders.order_id, orders.order_date
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id;

# Which products were ordered and by whom?

SELECT customers.first_name, products.product_name, order_items.quantity
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
JOIN order_items 
ON orders.order_id = order_items.order_id
JOIN products 
ON order_items.product_id = products.product_id;

# Total revenue generated

SELECT SUM(products.price * order_items.quantity) AS total_revenue
FROM order_items
JOIN products 
ON order_items.product_id = products.product_id;

# topp customers

SELECT customers.first_name, SUM(products.price * order_items.quantity) AS total_spent
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
JOIN order_items 
ON orders.order_id = order_items.order_id
JOIN products 
ON order_items.product_id = products.product_id
GROUP BY customers.first_name
ORDER BY total_spent DESC;

INSERT INTO customers (first_name, last_name, email, city, signup_date)
VALUES
('Emmanuel','Okeke','emmanuel.okeke@mail.com','Lagos','2024-01-10'),
('Chinedu','Eze','chinedu.eze@mail.com','Abuja','2024-01-12'),
('Aisha','Bello','aisha.bello@mail.com','Kano','2024-01-15'),
('Oluwaseun','Adeyemi','seun.adeyemi@mail.com','Ibadan','2024-01-18'),
('Grace','Daniel','grace.daniel@mail.com','Port Harcourt','2024-01-20'),
('Ibrahim','Sani','ibrahim.sani@mail.com','Kano','2024-01-22'),
('Blessing','Okafor','blessing.okafor@mail.com','Lagos','2024-01-25'),
('Samuel','Ogunleye','samuel.ogunleye@mail.com','Ibadan','2024-01-28'),
('Esther','Moses','esther.moses@mail.com','Abuja','2024-02-01'),
('Tunde','Balogun','tunde.balogun@mail.com','Lagos','2024-02-03'),

('Ngozi','Nwankwo','ngozi.nwankwo@mail.com','Port Harcourt','2024-02-05'),
('Sadiq','Abdullahi','sadiq.abdullahi@mail.com','Kano','2024-02-07'),
('Victoria','Ojo','victoria.ojo@mail.com','Ibadan','2024-02-09'),
('Michael','Ade','michael.ade@mail.com','Lagos','2024-02-11'),
('Fatima','Usman','fatima.usman@mail.com','Abuja','2024-02-13'),
('Daniel','Okoro','daniel.okoro@mail.com','Port Harcourt','2024-02-15'),
('Ruth','Ekanem','ruth.ekanem@mail.com','Uyo','2024-02-18'),
('Joseph','Yakubu','joseph.yakubu@mail.com','Abuja','2024-02-20'),
('Peace','Ifeanyi','peace.ifeanyi@mail.com','Enugu','2024-02-22'),
('Abdul','Rahman','abdul.rahman@mail.com','Kano','2024-02-24'),

('Mary','John','mary.john@mail.com','Lagos','2024-02-26'),
('Kingsley','Onyekachi','kingsley.onyekachi@mail.com','Owerri','2024-02-28'),
('Ahmed','Garba','ahmed.garba@mail.com','Kano','2024-03-01'),
('Florence','Okon','florence.okon@mail.com','Calabar','2024-03-03'),
('Peter','Eze','peter.eze@mail.com','Enugu','2024-03-05'),
('Hauwa','Lawal','hauwa.lawal@mail.com','Abuja','2024-03-07'),
('David','Paul','david.paul@mail.com','Lagos','2024-03-09'),
('Janet','Adebayo','janet.adebayo@mail.com','Ibadan','2024-03-11'),
('Solomon','Uche','solomon.uche@mail.com','Port Harcourt','2024-03-13'),
('Patience','Obi','patience.obi@mail.com','Awka','2024-03-15'),

('Sule','Mohammed','sule.mohammed@mail.com','Kano','2024-03-17'),
('Jennifer','Okeke','jennifer.okeke@mail.com','Lagos','2024-03-19'),
('Bright','Osei','bright.osei@mail.com','Abuja','2024-03-21'),
('Gloria','James','gloria.james@mail.com','Port Harcourt','2024-03-23'),
('Isaac','Olawale','isaac.olawale@mail.com','Ibadan','2024-03-25'),
('Rebecca','Nnamdi','rebecca.nnamdi@mail.com','Enugu','2024-03-27'),
('Paul','Okafor','paul.okafor@mail.com','Owerri','2024-03-29'),
('Hassan','Aliyu','hassan.aliyu@mail.com','Kano','2024-03-30'),
('Deborah','Samuel','deborah.samuel@mail.com','Abuja','2024-04-01'),
('Christopher','Etim','christopher.etim@mail.com','Uyo','2024-04-03'),

('Mercy','Adams','mercy.adams@mail.com','Lagos','2024-04-05'),
('Nathan','Okechukwu','nathan.okechukwu@mail.com','Awka','2024-04-07'),
('Zainab','Suleiman','zainab.suleiman@mail.com','Kano','2024-04-09'),
('Andrew','Bassey','andrew.bassey@mail.com','Calabar','2024-04-11'),
('Joy','Ogun','joy.ogun@mail.com','Ibadan','2024-04-13'),
('Francis','Onyema','francis.onyema@mail.com','Enugu','2024-04-15'),
('Amina','Shehu','amina.shehu@mail.com','Abuja','2024-04-17'),
('Henry','Okon','henry.okon@mail.com','Port Harcourt','2024-04-19'),
('Linda','Eze','linda.eze@mail.com','Owerri','2024-04-21'),
('Kelvin','Ojo','kelvin.ojo@mail.com','Lagos','2024-04-23');

SELECT * FROM customers;

UPDATE customers
SET first_name = 'Emeka'
WHERE customer_id = 6;

SELECT * FROM customers;

# Checking Total Customers

SELECT COUNT(*) AS total_customers
FROM customers;

# Customers by City

SELECT city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

# New Total Revenue

SELECT 
SUM(products.price * order_items.quantity) AS total_revenue
FROM order_items
JOIN products 
ON order_items.product_id = products.product_id;

# Monthly Revenue Trend

SELECT 
DATE_FORMAT(orders.order_date, '%Y-%m') AS month,
SUM(products.price * order_items.quantity) AS revenue
FROM orders
JOIN order_items 
ON orders.order_id = order_items.order_id
JOIN products 
ON order_items.product_id = products.product_id
GROUP BY month
ORDER BY month;

# Customer Segmentation

SELECT 
    customers.customer_id,
    customers.first_name,
    SUM(products.price * order_items.quantity) AS total_spent,

    CASE
        WHEN SUM(products.price * order_items.quantity) > 5000 THEN 'High Value'
        WHEN SUM(products.price * order_items.quantity) BETWEEN 2000 AND 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
JOIN order_items 
ON orders.order_id = order_items.order_id
JOIN products 
ON order_items.product_id = products.product_id
GROUP BY customers.customer_id, customers.first_name
ORDER BY total_spent DESC;


