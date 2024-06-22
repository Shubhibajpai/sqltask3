
use task3;
CREATE TABLE EmployeeData (
    EmployeeID INT,
    SubBand VARCHAR(10)
);


INSERT INTO EmployeeData (EmployeeID, SubBand) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'B1'),
(4, 'B2'),
(5, 'C1'),
(6, 'C2'),
(7, 'A1'),
(8, 'B1'),
(9, 'C2'),
(10, 'C1'),
(11, 'B1'),
(12, 'C1');


SELECT 
    SubBand,
    COUNT(EmployeeID) AS Headcount,
    ROUND(COUNT(EmployeeID) * 100.0 / SUM(COUNT(EmployeeID)) OVER (), 2) AS Percentage
FROM 
    EmployeeData
GROUP BY 
    SubBand
ORDER BY 
    SubBand;
