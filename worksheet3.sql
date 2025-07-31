USE SupplyDB;
SELECT COUNT(*) AS ColomboSuppliers FROM S WHERE city = 'COLOMBO';

SELECT SUM(quantity) AS TotalP1 FROM SPJ WHERE pno = 'P1';

SELECT COUNT(*) AS totalparts, SUM(price) AS totalprice FROM P WHERE city = 'COLOMBO';

SELECT MAX(quantity) , MIN(quantity)  FROM SPJ;

SELECT AVG(quantity) AS avgother FROM SPJ WHERE pno <> 'P1';

SELECT COUNT(DISTINCT sno) AS supplier FROM SPJ WHERE pno = 'P2';

SELECT jno, SUM(quantity) AS totalqtty, AVG(quantity) AS avgqtty FROM SPJ GROUP BY jno LIMIT 3;

SELECT sno, MAX(quantity) AS maxqtty, MIN(quantity) AS minqtty, AVG(quantity) AS avgqtty FROM SPJ  GROUP BY sno;

SELECT YEAR(sdate) AS year, COUNT(*) AS count FROM J GROUP BY YEAR(sdate) ;

SELECT sno, COUNT(DISTINCT jno) AS count FROM SPJ GROUP BY sno ;

SELECT pno, jno, SUM(quantity) AS totalqtty FROM SPJ GROUP BY pno, jno;

SELECT colour FROM P GROUP BY colour HAVING COUNT(*) > 2;

SELECT jno, pno, AVG(quantity) AS avgqtty FROM SPJ GROUP BY jno, pno HAVING AVG(quantity) > 320;










