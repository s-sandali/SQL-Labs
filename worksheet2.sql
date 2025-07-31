Use SupplyDB;
ALTER TABLE S CHANGE status supstatus INT;
ALTER TABLE P CHANGE weight partweight TINYINT;
SELECT * FROM P; 
ALTER TABLE P ADD CONSTRAINT weightcheck CHECK (partweight BETWEEN 10 AND 100);
Alter table P add age int  after partweight;
Alter table P add constraint check_age check (age>10);
select * from P;
SELECT pno, pname, ROUND(partweight / 1000, 3) AS weightkilo FROM P;
SELECT sno, fname, FORMAT(salary * 12, 2) AS annualsalary FROM S;
SELECT janame, LENGTH(janame) AS namelength FROM J;
SELECT CONCAT(UPPER(fname)," ", UPPER(lname)) AS Full_Name FROM S;

SELECT CONCAT(LEFT(city, 3), pno, ' :Weight:', partweight, ' :Colour:', colour, ' :Price:', price) AS Partdetails FROM P;
SELECT CONCAT(LEFT(fname,1),'.',lname,' Working at: ',city, ': Earns: ',FORMAT(salary,2)) AS supplier_details FROM S;
SELECT sno, lname, dob, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age FROM S;
SELECT pno, YEAR(mdate) AS year, MONTHNAME(mdate) AS month, CONCAT(DAY(mdate), 'th') AS day FROM P;
SELECT jno, DATEDIFF(edate, sdate) AS duration_day FROM J ;
SELECT jno, sdate as start_date, edate as end_date, 
TIMESTAMPDIFF(YEAR, sdate, edate) AS years,
TIMESTAMPDIFF(MONTH, sdate, edate)%12  AS months, 
timestampdiff(DAY, sdate,edate)%30 AS days FROM J WHERE edate is NOT NULL;
SELECT jno, sdate as start_date, edate as end_date, 
       CONCAT(TIMESTAMPDIFF(YEAR, sdate, edate), ' years ', 
           TIMESTAMPDIFF(MONTH, sdate, edate) % 12, ' months ', 
          timestampdiff(DAY, sdate,edate)%30 days
       ) AS duration FROM J WHERE edate IS NOT NULL;


