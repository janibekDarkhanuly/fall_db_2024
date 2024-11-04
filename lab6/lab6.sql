create database lab6;

Create table locations(
    location_id SERIAL PRIMARY KEY,
    street_adress VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(12),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    deparment_name VARCHAR(50) UNIQUE,
    budget integer,
    location_id integer references locations
);

INSERT INTO departments(deparment_name, budget, location_id) Values ('nypd',2000,1);
INSERT INTO departments(department_id,deparment_name, budget, location_id) Values (80,'lapd',2000,1);
INSERT INTO departments(department_id,deparment_name, budget, location_id) Values (40,'mypd',2000,1);

CREATE table employees(
                          employee_id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50),
                          last_name VARCHAR(50),
                          email VARCHAR(50),
                          phone_number VARCHAR(20),
                          salary integer,
                          department_id integer references departments
);
INSERT INTO locations(street_adress, postal_code, city, state_province) VALUES('asldal','123','5000','12313');

INSERT INTO employees(first_name, last_name, email, phone_number, salary, department_id) VALUES('jade','robinson','zzz@rk.kz','123123',500,1);
INSERT INTO employees(first_name, last_name, email, phone_number, salary, department_id) VALUES('Sam','Lake','zzz@rk.asdz','1231231233123',5010,1);
INSERT INTO employees(first_name, last_name, email, phone_number, salary, department_id) VALUES('Sam','Lake','zzz@rk.asdz','1231231233123',5010,40);
INSERT INTO employees(first_name, last_name, email, phone_number, salary) VALUES('Sasha','Yasha','zzz@rkasdasddz','123127773123',123123);

Select e.first_name,e.last_name,e.department_id,d.deparment_name from employees e
JOIN departments d on d.department_id = e.department_id;


Select e.first_name,e.last_name,e.department_id,d.deparment_name from employees e
JOIN departments d on d.department_id = e.department_id
WHERE e.department_id = 80 or e.department_id = 40;

SELECT e.first_name,e.last_name,e.department_id,l.city,l.state_province from employees e
JOIN departments d on d.department_id = e.department_id
Join locations l on l.location_id = d.location_id;

Select * from departments
Left join employees e on departments.department_id = e.department_id;


Select e.first_name,e.last_name,e.department_id,d.deparment_name from employees e
 LEft JOIN departments d on d.department_id = e.department_id




