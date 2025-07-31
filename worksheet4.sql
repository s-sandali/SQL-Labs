CREATE DATABASE SupplyDB;
USE SupplyDB;
CREATE TABLE S(
sno VARCHAR(10) PRIMARY KEY,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
status INT NOT NULL CHECK (status IN(10,20,30,40,50)),
city VARCHAR(20),
salary INT,
dob DATE NOT NULL,
CONSTRAINT salary_chk  CHECK (salary>=30000),
CONSTRAINT city_chk CHECK (city IN('Colombo','Kandy', 'Jaffna', 'Matara', 'Galle', 'Gampaha'))
);

CREATE TABLE P(
pno VARCHAR(10) PRIMARY KEY,
pname VARCHAR(50) NOT NULL,
price DECIMAL (10,2),
weight INT NOT NULL,
city VARCHAR(20),
colour VARCHAR(20) DEFAULT 'blue',
mdate DATE NOT NULL,
CONSTRAINT price_chk CHECK(price>10.00),
CONSTRAINT city_chk CHECK (city IN('Colombo','Kandy', 'Jaffna', 'Matara', 'Galle', 'Gampaha'))
);


CREATE TABLE J(
jno VARCHAR (10) PRIMARY KEY,
janame VARCHAR(50) UNIQUE NOT NULL,
city VARCHAR(50)NOT NULL,
sdate DATE NOT NULL,
edate DATE
);
CREATE TABLE SPJ(
sno VARCHAR(10),
pno VARCHAR(10),
jno VARCHAR(10),
quantity INT CHECK (quantity>100),
PRIMARY KEY (sno,pno,jno),
FOREIGN KEY (sno) REFERENCES S(sno) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (pno) REFERENCES P(pno) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (jno) REFERENCES J(jno) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO S VALUES('S1', 'SAMAN', 'PERERA', 20, 'COLOMBO', 45000, '1990-12-02'),
('S2', 'JAGATH', 'OPATHA', 10, 'KANDY', 42000, '1991-10-10'),
('S3', 'ANIL', 'SILVA', 30, 'KANDY', 30000, '1989-03-31'),
('S4', 'GAMINI','GAMAGE', 20, 'COLOMBO', 35000 ,'1991-06-25'),
('S5', 'RAVI', 'GUPTHA', 30, 'JAFFNA', 33000, '1995-03-30'),
('S6', 'KAMAL', 'PERERA', 20, 'COLOMBO', 42000, '1995-05-23'),
('S7', 'SAMAN', 'SOMAPALA', 40, 'KANDY', 43000, '1995-05-27');

INSERT INTO P VALUES ('P1', 'NUT', 20.00, 12, 'COLOMBO', 'RED', '2020-10-10'),
('P2', 'BOLT', 14.00, 17, 'KANDY', 'GREEN', '2020-10-05'),
 ('P3', 'SCREW', 14.00, 17, 'MATARA', 'BLUE', '1997-04-25'),
 ('P4', 'SCREW', 11.00, 14, 'COLOMBO', 'RED', '1999-08-15'),
 ('P5', 'CAM', 15.00, 12, 'KANDY', 'BLUE', '2022-10-30'),
 ('P6', 'COG', 12.00, 19, 'GAMPAHA', 'RED', '2023-10-10');
INSERT INTO J VALUES ('J1', 'SORTER', 'LONDON', '2020-01-10', '2025-10-30'),
 ('J2', 'PUNCH', 'PARIS', '1995-03-15', '2023-03-15'),
 ('J3', 'READER', 'MELBOURNE', '2020-01-20', NULL),
 ('J4', 'CONSOLE', 'DUBAI', '2023-06-10', '2026-06-09'),
 ('J5', 'COLLATOR', 'NEW DELHI', '1998-01-20', '2024-03-16'),
 ('J6', 'TERMINAL', 'DHAKA', '2023-05-15', NULL);
INSERT INTO SPJ VALUES ('S1', 'P1', 'J1', 200),
 ('S1', 'P1', 'J4', 700),
 ('S1', 'P4', 'J1', 800),
 ('S2', 'P1', 'J1', 300),
 ('S2', 'P2', 'J4', 700),
 ('S2' ,'P3', 'J1', 400),
 ('S2','P3','J2',200),
 ('S2','P3','J3',200), 
('S2','P4','J1',700), 
('S3', 'P1','J1', 400),
('S3', 'P2','J4', 600),
('S3','P4','J1',600),
('S4','P1','J1',500),
('S4','P4','J1',500),
('S5','P1','J1',450),
('S5','P4','J1',350),
('S6','P1','J1',200),
('S6','P1','J5',750),
('S6','P4','J4',650),
('S7','P1','J1',550),
('S7','P2','J3',550),
('S7','P4','J2',900);

SELECT DISTINCT J.janame
FROM J
JOIN SPJ ON J.jno = SPJ.jno
WHERE SPJ.sno = 'S5';

SELECT DISTINCT janame
FROM J
WHERE jno IN (
    SELECT jno FROM SPJ WHERE sno = 'S5'
);
SELECT DISTINCT SPJ.jno
FROM SPJ
WHERE SPJ.pno IN (
    SELECT pno FROM SPJ WHERE sno = 'S1'
);
SELECT DISTINCT A.jno
FROM SPJ A
JOIN SPJ B ON A.pno = B.pno
WHERE B.sno = 'S1';

SELECT sno
FROM S
WHERE status < (
    SELECT status FROM S WHERE sno = 'S1'
);

SELECT DISTINCT SPJ.pno
FROM SPJ
JOIN S ON SPJ.sno = S.sno
JOIN J ON SPJ.jno = J.jno
WHERE S.city = 'Colombo' AND J.city = 'London';

SELECT DISTINCT SPJ.jno
FROM SPJ
JOIN S ON SPJ.sno = S.sno
JOIN J ON SPJ.jno = J.jno
WHERE S.city <> J.city;

SELECT jno
FROM J
WHERE city = (
    SELECT MIN(city) FROM J
);

SELECT P.*, COALESCE(SUM(SPJ.quantity), 0) AS total_qtty
FROM P
LEFT JOIN SPJ ON P.pno = SPJ.pno
GROUP BY P.pno, P.pname, P.price, P.weight, P.city, P.colour, P.mdate;

SELECT jno
FROM SPJ
WHERE pno = 'P1'
GROUP BY jno
HAVING AVG(quantity) > (
    SELECT MIN(quantity)
    FROM SPJ
    WHERE jno = 'J3'
);

UPDATE SPJ
SET quantity = quantity * 1.10
WHERE sno IN (
    SELECT DISTINCT SPJ.sno
    FROM SPJ
    JOIN P ON SPJ.pno = P.pno
    WHERE P.colour = 'red'
);

UPDATE P
SET colour = 'orange'
WHERE colour = 'red';

DELETE FROM J
WHERE jno NOT IN (
    SELECT DISTINCT jno FROM SPJ
);





