create database lab2;
Create table countries(
    country_id serial primary key,
    country_name varchar(255),
    region_id integer,
    population integer
);



INSERT INTO countries(country_name, region_id, population)
Values('KAZAKHSTAN',17,20000000);

INSERT INTO countries(country_id,country_name)
Values(22,'France');

INSERT INTO countries (country_name, region_id, population) VALUES ('Kyrgyzstan', NULL, 6500000);

INSERT INTO countries (country_id,country_name, region_id, population)
Values (4,'Argentina', 5, 45195777),
    (5,'India', 3, 1393409038),
    (6,'Australia', 4, 25687041);


ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries(region_id)
values(3);

Insert into countries default values ;


CREATE TABLE countries_new(LIke countries including all);


Insert into countries_new
Select * from countries;



Update countries
set region_id = 1
Where region_id IS NULL;


SELECT country_name,
       population * 1.10 AS "New Population"
FROM countries;



SELECT country_name,
       population * 1.10 AS "New Population"
FROM countries;

Insert into countries(population)
values(150);


delete from countries
where population < 100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;


DELETE from countries
returning *;