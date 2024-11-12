create database lab7;

create table countries(
    id SERIAL PRIMARY KEY,
    name varchar(255)
);

create table employees(
    name varchar(255),
    surname varchar(255),
    salary integer,
    department_id integer references departments
);



create table departments(
    department_id SERIAL PRIMARY KEY,
    city varchar(255),
    budget integer
);


CREATE INDEX idx_countries_name ON countries(name);

CREATE Index idx_employee_name ON employees(name,surname);


CREATE INDEX idx_employees_salary_range ON employees(salary)
WHERE salary < 50000 AND salary > 20000;


CREATE INDEX idx_employee_name_substr ON employees ((substring(name from 1 for 4)));



CREATE INDEX idx_employees_department_salary ON employees(department_id, salary);


CREATE INDEX idx_departments_budget ON departments(budget);












