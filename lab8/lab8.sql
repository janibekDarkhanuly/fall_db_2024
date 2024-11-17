create database lab8;


CREATE table salesman(
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission decimal(3,2)
);


INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Rome', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);



CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);


CREATE ROLE junior_dev LOGIN;

CREATE VIEW NYC as
    SELECT * from salesman WHERE city = 'New York';

SELECT * from NYC;


CREATE VIEW ORDER_INFO AS
SELECT
    s.name AS salesman_name,
    c.cust_name AS customer_name,
    o.ord_no AS order_number
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
JOIN
    salesman s ON o.salesman_id = s.salesman_id;

GRANT ALL PRIVILEGES ON ORDER_INFO to junior_dev;

SELECT * from customers ORDER BY grade DESC LIMIT 1

CREATE VIEW highest_grade as
    SELECT * from customers where grade = (Select MAX(grade) from customers);

GRANT SELECT on highest_grade to junior_dev;

CREATE view number_of_salesmen as
    SELECT city,COUNT(salesman_id) from salesman
GROUP BY city;


CREATE VIEW good_salesmen AS
SELECT
    s.salesman_id,
    s.name AS salesman_name,
    COUNT(c.customer_id) AS customer_count
FROM
    salesman s
JOIN
    customers c ON s.salesman_id = c.salesman_id
GROUP BY
    s.salesman_id, s.name
HAVING
    COUNT(c.customer_id) > 1;


CREATE role intern;


GRANT junior_dev to intern;





