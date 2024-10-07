create database lab4;

create table Warehouses(
    code SERIAL primary key ,
    location VARCHAR(255),
    capacity integer
);

create table Boxes(
    code CHAR(4),
    contents VARCHAR(255),
    value real,
    warehouse integer
);


INSERT INTO Warehouses(location, capacity) VALUES ('Chicago',3);
INSERT INTO Warehouses(location, capacity) VALUES ('Chicago',4);
INSERT INTO Warehouses(location, capacity) VALUES ('New York',7);
INSERT INTO Warehouses(location, capacity) VALUES ('Los Angeles',2);
INSERT INTO Warehouses(location, capacity) VALUES ('San Francisco',8);


Insert Into Boxes(code,contents,value,warehouse) VALUES ('0MN7','Rocks',180,3);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('4H8P','Rocks',250,1);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('4RT3','Scissors',190,4);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('7G3H','Rocks',200,1);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('8JN6','Papers',75,1);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('8Y6U','Papers',50,3);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('9J6F','Papers',175,2);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('LL08','Rocks',140,4);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('P0H6','Scissors',125,1);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('P2T6','Scissors',150,2);
Insert Into Boxes(code,contents,value,warehouse) VALUES ('TU55','Papers',90,5);



Select * from Warehouses;


Select * from Boxes WHERE value > 150;


SELECT DISTINCT contents from Boxes;


SELECT w.code, COUNT(b.warehouse)
FROM Warehouses w
JOIN Boxes b ON w.code = b.warehouse
GROUP BY w.code;

SELECT w.code, COUNT(b.warehouse)
FROM Warehouses w
JOIN Boxes b ON w.code = b.warehouse
GROUP BY w.code
HAVING COUNT(b.warehouse) > 2;


INSERT INTO warehouses(location, capacity) VALUES ('New York',3);

UPDATE Boxes
SET value = value * 0.75
WHERE code = (
    SElect code from Boxes
    ORDER BY value DESC limit 1 offset 3
    );



Delete from boxes
Where warehouse IN (
    SELECT code
    from warehouses
    Where location = 'New York'
    )
RETURNING *;





